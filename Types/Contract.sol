// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    function getNumber() public pure returns (uint256) {

        uint256 b;
        assembly {
            b:=122 
        }
        return b;
    }
}