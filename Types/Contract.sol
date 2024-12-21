// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    // Example of basic number handling in Yul
    function getNumber() public pure returns (uint256) {
        uint256 result;
        assembly {
            result := 122
        }
        return result;
    }

    // Example of converting bytes32 to string
    function demonstrateString() public pure returns (string memory) {
        bytes32 value;
        
        assembly {
            value := "Hello World"
        }
        
        return string(abi.encode(value));
    }

    function demonstrateStringMore() public pure returns (string memory) {
        bytes32 value;
        
        assembly {
            value := "Hello World"
        }
        
        return string(abi.encode(value));
    }

    // Demonstrates bytes32 size limitation
    function demonstrateStringLimit() public pure returns (string memory) {
        bytes32 value;
        
        assembly {
            // This will be truncated as it exceeds 32 bytes
            value := "This is a very long string that will be truncated by bytes32"
        }
        
        return string(abi.encode(value));
    }

    // Demonstrates address type in Yul
    function addressRepresentation() public pure returns (address) {
        address value;
        assembly {
            value := 0x1234567890123456789012345678901234567890
        }
        return value;
    }

    // Demonstrates int16 type in Yul
    function int16Representation() public pure returns (int16) {
        int16 value;
        assembly {
            value := 1
        }
        return value;
    }

    // Demonstrates boolean type in Yul
    function booleanRepresentation() public pure returns (bool) {
        bool value;
        assembly {
            value := 1    // 1 for true, 0 for false
        }
        return value;
    }
}