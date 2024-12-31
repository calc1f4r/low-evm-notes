# Yul Types and Basic Syntax
## Key Points
1. **Assignment Syntax**
   - Yul uses `:=` for assignments
   - Statements are written in assembly blocks
```solidity
assembly {
    let x := 123    // Variable declaration and assignment
    x := 456        // Value reassignment
}
```
2. **Statement Termination**
   - No semicolons required at the end of statements
   - Each statement should be on a new line

3. **Type System**
   - All values are treated as `bytes32` internally
   - Type conversions are required when working with other types
   - Only stack-based operations are allowed

4. **String Handling**
   - Strings cannot be directly assigned in Yul
   - Strings are heap-stored, but Yul works with stack values
   - Must convert strings to bytes32 for storage
   - **Important**: bytes32 can only store up to 32 bytes (32 characters)

### Example: Incorrect String Usage
```solidity
// This won't work - strings are heap-stored
function incorrectStringUsage() public pure returns (string memory) {
    string memory str;
    assembly {  
        str := "Hello World"    // Error: Cannot assign to heap
    }
    return str;
}
```

### Example: Correct String Usage
```solidity
// Correct approach using bytes32
function correctStringUsage() public pure returns (string memory) {
    bytes32 str;
    assembly {
        str := "Hello World"    // Works fine (11 characters)
    }
    return string(abi.encode(str));
}
```

### Example: bytes32 Size Limitation
```solidity
function stringLimitDemo() public pure returns (string memory) {
    bytes32 str;
    assembly {
        // This will truncate the string as it exceeds 32 bytes
        str := "This string is too long and will be truncated"
    }
    return string(abi.encode(str));
}
```

5. **Primitive Type Representations**
   - All primitive types are represented as numbers in Yul
   - Address: Treated as 20-byte (160-bit) numbers
   - Boolean: Represented as 0 (false) or 1 (true)
   - Integers: Stored as their numeric value

### Example: Primitive Types in Yul
```solidity
// Address representation
function addressDemo() public pure returns (address) {
    address addr;
    assembly {
        addr := 0x1234567890123456789012345678901234567890
    }
    return addr;
}

// Boolean representation
function boolDemo() public pure returns (bool) {
    bool value;
    assembly {
        value := 1    // true
    }
    return value;
}
```