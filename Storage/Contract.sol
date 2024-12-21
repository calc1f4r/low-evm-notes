// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    // State variable x is automatically assigned to slot 0
    uint256 x;
    uint256 y;

    function setX() public {
        assembly {
            // sstore(slot, value) - stores value at the given slot
            sstore(x.slot, 10)
        }
    }

    function getX() public view returns (uint256) {
        uint256 result;
        assembly {
            // sload(slot) - loads value from the given slot
            result := sload(x.slot)
        }
        return result;
    }

    function getY() view public returns (uint256) {
        uint256 result;
        assembly {
            result := sload(1) // will return the value of y
        }
        return result;
    }


    // Writing to a custom slot 
    function setY(uint256 slot, uint256 value) public {
        assembly {
            sstore(slot, value) 
        }
    }
}