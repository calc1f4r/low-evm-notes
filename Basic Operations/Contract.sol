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
}
