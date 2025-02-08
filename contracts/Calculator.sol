// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


contract Calculator {
    event Result(int256 result);

    modifier validateInput(int256 number2) {
        require(number2 != 0, "Cannot divide or perform modulus by zero");
        _;
    }
        
    function add(int256 number1, int256 number2) public pure returns (int256) {
        return number1 + number2;
    }
    
    function subtract(int256 number1, int256 number2) public pure returns (int256) {
        return number1 - number2;
    }
    
    function multiply(int256 number1, int256 number2) public pure returns (int256) {
        return number1 * number2;
    }
    
    function divide(int256 number1, int256 number2) public pure validateInput(number2) returns (int256) {
        return number1 / number2;
    }
    
    function modulus(int256 number1, int256 number2) public pure validateInput(number2) returns (int256) {
        return number1 % number2;
    }

    function _emitResult(int256 result) internal {
        emit Result(result);
    }

    function _compareStrings(string memory a, string memory b) private pure returns (bool) {
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }

    function calculateAndEmit(string memory operation, int256 number1, int256 number2) public {
        int256 result;

        if (_compareStrings(operation, "add")) {
            result = add(number1, number2);
        } else if (_compareStrings(operation, "subtract")) {
            result = subtract(number1, number2);
        } else if (_compareStrings(operation, "multiply")) {
            result = multiply(number1, number2);
        } else if (_compareStrings(operation, "divide")) {
            result = divide(number1, number2);
        } else if (_compareStrings(operation, "modulus")) {
            result = modulus(number1, number2);
        } else {
            revert("Invalid operation");
        }

        _emitResult(result);
    }
}