# Calculator Smart Contract

## Introduction

The **Calculator Smart Contract** is a Solidity-based contract that allows users to perform fundamental arithmetic operations on integers. This contract demonstrates essential **Solidity best practices**, including:
- **Pure functions** for computation
- **Modifiers** for input validation
- **Event-driven architecture** for logging results
- **String-based operation selection** for dynamic execution

## Table of Contents

- [Features](#features)
- [Contract Structure](#contract-structure)
  - [Functions](#functions)
  - [Modifiers](#modifiers)
  - [Helper Functions](#helper-functions)
  - [Events](#events)
- [Usage Guide](#usage-guide)
- [Compilation and Deployment](#compilation-and-deployment)
- [Security Considerations](#security-considerations)
- [License](#license)
- [Conclusion](#conclusion)

## Features

✔️ **Basic Arithmetic:** Addition, subtraction, multiplication, division, and modulus operations.
✔️ **Input Validation:** Prevents division or modulus by zero with a custom modifier.
✔️ **Event-Driven Logging:** Emits a `Result` event containing the computation output.
✔️ **Dynamic Operation Selection:** Users can specify the operation as a string, improving contract usability.
✔️ **Efficient & Modular Code:** Uses helper functions and best Solidity coding practices for maintainability.

## Contract Structure

### Functions

#### `add`
```solidity
function add(int256 number1, int256 number2) public pure returns (int256)
```
**Description:** Adds two integers.
- **Returns:** The sum of `number1` and `number2`.

#### `subtract`
```solidity
function subtract(int256 number1, int256 number2) public pure returns (int256)
```
**Description:** Computes `number1` minus `number2`.
- **Returns:** The result of the subtraction.

#### `multiply`
```solidity
function multiply(int256 number1, int256 number2) public pure returns (int256)
```
**Description:** Multiplies two numbers.
- **Returns:** The product of `number1` and `number2`.

#### `divide`
```solidity
function divide(int256 number1, int256 number2) public pure validateInput(number2) returns (int256)
```
**Description:** Performs integer division.
- **Prevents:** Division by zero using `validateInput` modifier.
- **Returns:** The quotient.

#### `modulus`
```solidity
function modulus(int256 number1, int256 number2) public pure validateInput(number2) returns (int256)
```
**Description:** Computes the remainder of `number1 / number2`.
- **Prevents:** Modulus by zero using `validateInput` modifier.
- **Returns:** The remainder.

#### `calculateAndEmit`
```solidity
function calculateAndEmit(string memory operation, int256 number1, int256 number2) public
```
**Description:** Executes the operation specified by `operation` and emits the result.
- **Valid operations:** `"add"`, `"subtract"`, `"multiply"`, `"divide"`, `"modulus"`.
- **Reverts:** If an invalid operation is provided.

### Modifiers

#### `validateInput`
```solidity
modifier validateInput(int256 number2)
```
**Description:** Ensures `number2` is not zero.
- **Prevents:** Division and modulus operations from encountering a zero divisor.

### Helper Functions

#### `_emitResult`
```solidity
function _emitResult(int256 result) internal
```
**Description:** Emits the `Result` event with the computed value.

#### `_compareStrings`
```solidity
function _compareStrings(string memory a, string memory b) private pure returns (bool)
```
**Description:** Compares two strings for equality using `keccak256`.

### Events

#### `Result`
```solidity
event Result(int256 result);
```
**Description:** Emitted when a calculation is performed.

## Usage Guide

### Direct Function Calls
#### Example - Addition
```solidity
int256 sum = calculator.add(10, 5); // Returns 15
```

#### Example - Division
```solidity
int256 quotient = calculator.divide(20, 4); // Returns 5
```

### Using `calculateAndEmit`
#### Example - Multiplication
```solidity
calculator.calculateAndEmit("multiply", 7, 8);
// Emits `Result(56)`
```

**Invalid Operation Handling:** If an invalid operation is used, the transaction is reverted with "Invalid operation".

## Compilation and Deployment

### Requirements
- **Solidity Version:** ^0.8.24
- **Development Environments:** Remix IDE or other.

### Steps
1. **Compilation**
   - Open the contract in **Remix IDE** or your chosen environment.
   - Ensure Solidity version **0.8.24** is selected.
   - Compile without errors.
2. **Deployment**
   - Go to the Deploy & Run Transactions panel in Remix.
   - In the Environment dropdown, select: Remix VM (Cancún) for a local blockchain simulation or WalletConnect if deploying via MetaMask, or other option.
   - Deploy and interact using the contract’s public functions.

## Security Considerations

✔️ **Prevents division/modulus by zero** using a modifier.
✔️ **Efficient string comparison** for dynamic operations.
✔️ **Follows Solidity best practices** for gas efficiency and readability.
❌ **Does not handle floating-point numbers** (Solidity does not support decimals natively).

## License

This project is licensed under the **MIT License**.

## Conclusion

The **Calculator Smart Contract** is an effective demonstration of Solidity’s capabilities in performing arithmetic operations securely and efficiently. With a focus on modular design and best coding practices.

