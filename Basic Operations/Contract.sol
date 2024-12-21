// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasicOperations {
    // Basic arithmetic operations
    function arithmetic(uint256 a, uint256 b) public pure returns (uint256, uint256, uint256, uint256) {
        uint256 addResult;
        uint256 subResult;
        uint256 mulResult;
        uint256 divResult;

        assembly {
            addResult := add(a, b)
            subResult := sub(a, b)
            mulResult := mul(a, b)
            divResult := div(a, b)
        }

        return (addResult, subResult, mulResult, divResult);
    }

    // Comparison operations
    function comparison(uint256 a, uint256 b) public pure returns (bool, bool, bool) {
        bool isLess;
        bool isGreater;
        bool isEqual;

        assembly {
            isLess := lt(a, b)
            isGreater := gt(a, b)
            isEqual := eq(a, b)
        }

        return (isLess, isGreater, isEqual);
    }

    // Bitwise operations
    function bitwise(uint256 a, uint256 b) public pure returns (uint256, uint256, uint256) {
        uint256 andResult;
        uint256 orResult;
        uint256 xorResult;

        assembly {
            andResult := and(a, b)
            orResult := or(a, b)
            xorResult := xor(a, b)
        }

        return (andResult, orResult, xorResult);
    }

    // Demonstrates iszero operation
    function isZeroDemo(uint256 value) public pure returns (bool) {
        bool result;
        assembly {
            result := iszero(value)  // returns 1 if value is 0, else returns 0
        }
        return result;
    }

    // Demonstrates if-else condition in Yul
    function ifelseCondition() public pure returns (bool) {
        bool result;
        assembly {
            let value := 0
            if iszero(value) {
                result := 1
            }
            // Yul doesn't have else, so we use another if with inverted condition
            if gt(value, 0) {
                result := 0
            }
        }
        return result;
    }

    // Demonstrates for loop and if-else in Yul
    function controlFlow(uint256 n) public pure returns (uint256) {
        uint256 result;
        
        assembly {
            // Initialize result
            result := 0
            
            // For loop example: sum numbers from 1 to n if they're even
            let i := 1
            for { } lt(i, add(n, 1)) { i := add(i, 1) }
            {
                // If-else example: check if number is even
                if iszero(mod(i, 2)) {
                    result := add(result, i)
                }
            }
        }
        
        return result;
    }
}
