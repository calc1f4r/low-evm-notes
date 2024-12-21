# Storage Operations in Yul

## What is Storage?

Storage in Ethereum is like a persistent database for smart contracts:
- Permanent data storage (persists between function calls)
- Key-value store where both key and value are 32 bytes
- Most expensive operation in terms of gas
- Each contract has its own storage

## Storage Layout

1. **Storage Slots**:
   - Each slot is 32 bytes (256 bits)
   - Slots are numbered from 0 to 2^256-1
   - State variables are assigned slots sequentially
   - Value types (uint, address, bool) use one full slot
   
2. **Variable Packing**:
   - Multiple small variables (<32 bytes) can share one slot
   - Example:
     ```solidity
     uint128 a;  // slot 0, first half
     uint128 b;  // slot 0, second half
     uint256 c;  // slot 1, requires full slot
     ```

## Storage Operations in Yul

1. **Basic Operations**:
   - `sstore(slot, value)`: Write to storage
     ```solidity
     sstore(0, 10)  // Store value 10 at slot 0
     ```
   - `sload(slot)`: Read from storage
     ```solidity
     let value := sload(0)  // Read value from slot 0
     ```

2. **Accessing Variable Slots**:
   - Use `.slot` to get variable's storage position
   - For mappings: `add(keccak256(slot), key)`
   - For arrays: `add(array.slot, index)`

## Gas Costs

1. **Storage Operations**:
   - `sstore` (first time): 20,000 gas
   - `sstore` (modification): 5,000 gas
   - `sload`: 200 gas

2. **Best Practices**:
   - Cache storage reads in memory
   - Batch storage writes
   - Use events for historical data

## Code Example Explanation

```solidity
uint256 x;  // Allocated to slot 0
uint256 y;  // Allocated to slot 1

// Writing to x's slot
sstore(x.slot, 10)

// Writing to y's slot
sstore(y.slot, 20)

// Reading from x or y
result := sload(x.slot)
```

## Example: Variable Packing

```solidity
contract PackedVariables {
    uint128 a; // occupies half of slot 0
    uint128 b; // occupies the remaining half of slot 0
    uint256 c; // stored in slot 1

    function setVals(uint128 _a, uint128 _b, uint256 _c) public {
        a = _a;
        b = _b;
        c = _c;
    }
}
```

