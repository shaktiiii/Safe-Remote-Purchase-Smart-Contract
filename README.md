# Safe-Remote-Purchase-Smart-Contract

Safe Remote Purchase Contract is used to ensure that both parties are protected in the event of fraud, misrepresentation, or other issues that may arise in a remote transaction on blockchain.

## Getting Started

To use this smart contract, you will need a platform that supports smart contract deployment and execution, such as Ethereum. You will also need a tool such as Remix or Truffle to deploy and test the contract.







## Contract Methods

```cs
confirmPurchase()
```
This function allows the buyer to confirm the purchase of the item and change the state of the contract to LOCKED.

```cs
confirmReceived()
```
This function let the buyer to confirm the specs of the item and it changes the state of the contract to RECEIVED.

```cs
paySeller()
```
This function can only be called by the seller to receive the payment which is in the contract balance.

```cs
abort()
```
This function let the seller to cancel the deal and withdraw their funds back from the contract.

## Contributing

If you would like to contribute to the development of this contract, please fork the repository and submit a pull request with your changes.
