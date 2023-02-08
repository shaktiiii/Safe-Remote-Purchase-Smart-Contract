// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0; 

contract SafeRemotePurchase{

    uint public value;
    address payable public seller;
    address payable public buyer;

    enum STATE {
        CREATED,
        LOCKED,
        RELEASE,
        INACTIVE
    }

    STATE public state;

    constructor () payable{
        seller = payable(msg.sender);
        value = msg.value/2; // while deploying the smart contract seller will put 2x the amount of value of the item 
    }

    /// This funciton cannot be called at the current state.
    error invalidState();

    modifier inState(STATE _state) {
        if (state != _state){
            revert invalidState();
        }
        _;
    }

    modifier onlyBuyer(){
        require (msg.sender == buyer, "ONlY BUYER CAN ACESSES THIS FUNCTION");
        _;
    }

    modifier onlySeller(){
        require (msg.sender == seller, "ONLY SELLER CNA ACESS THIS FUNCTION");
        _;
    }

                                                    // this should be the state when entering the contract 
    function confirmPurchase() payable external inState(STATE.CREATED){
        require (msg.value == (2 * value), " Please give 2x the amount of the purchase value");
        buyer == msg.sender;
        state  = STATE.LOCKED;
    }

    function confirmReceived() onlyBuyer external inState(STATE.LOCKED) {
        state = STATE.RELEASE;
        buyer.transfer(value);

    }

    function paySeller() external  onlySeller  inState(STATE.RELEASE){
        state =STATE.INACTIVE;
        seller.transfer(3* value); 

    }

    function abort() external onlySeller inState(STATE.CREATED){
        state = STATE.INACTIVE;
        seller.transfer(address(this).balance);

    }
}