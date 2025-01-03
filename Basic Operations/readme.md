# Yul Basic Operations Guide

Yul is Ethereum's intermediate language designed for optimization and lower-level manipulation. This guide covers fundamental operations in Yul assembly.

## Variable Declaration and Assignment

```solidity
let x := 5                // Declare and assign
let y                     // Declaration only
y := add(x, 3)           // Assignment after declaration
```

## Arithmetic Operations

Basic mathematical operations in Yul:

```solidity
let a := add(x, y)       // Addition: x + y
let b := sub(x, y)       // Subtraction: x - y
let c := mul(x, y)       // Multiplication: x * y
let d := div(x, y)       // Division: x / y
let e := mod(x, y)       // Modulo: x % y
let f := exp(x, y)       // Exponentiation: x ** y
let g := addmod(x, y, k) // (x + y) % k with arbitrary precision
let h := mulmod(x, y, k) // (x * y) % k with arbitrary precision
```

## Comparison Operations

All comparisons return 1 (true) or 0 (false):

```solidity
let isLt := lt(x, y)     // Less than: x < y
let isGt := gt(x, y)     // Greater than: x > y
let isEq := eq(x, y)     // Equal to: x == y
let isSlt := slt(x, y)   // Signed less than
let isSgt := sgt(x, y)   // Signed greater than
```

## Bitwise Operations

Low-level bit manipulation:

```solidity
let a := and(x, y)       // Bitwise AND
let b := or(x, y)        // Bitwise OR
let c := xor(x, y)       // Bitwise XOR
let d := not(x)          // Bitwise NOT
let e := shl(x, y)       // Shift left: y << x
let f := shr(x, y)       // Shift right: y >> x
let g := sar(x, y)       // Signed shift right
```

## Control Flow

### If Statements
```solidity
if lt(x, 10) {          // if (x < 10)
    y := 1
}

// If-else pattern
if lt(x, 10) {          // if (x < 10)
    y := 1
}
if iszero(lt(x, 10)) {  // else
    y := 2
}
```

### Loops
```solidity
// For loop structure
for { let i := 0 } lt(i, n) { i := add(i, 1) }
{
    // Loop body
}

// While loop equivalent
let i := 0
for { } lt(i, n) { }
{
    // Loop body
    i := add(i, 1)
}
```

1. **Memory Management**
   - Always initialize variables before use
   - Be mindful of stack depth (limited to 1024)

2. **Gas Optimization**
   - Use bitwise operations instead of arithmetic when possible
   - Minimize storage operations
   - Reuse variables to save stack space

3. **Safety**
   - Check for division by zero
   - Validate array bounds
   - Handle overflow scenarios

## Common Patterns

### Safe Math Operations
```solidity
// Safe addition with overflow check
if lt(add(x, y), x) { revert(0, 0) }

// Safe multiplication
let product := mul(x, y)
if iszero(eq(div(product, x), y)) { revert(0, 0) }
```

### Memory Operations
```solidity
mstore(0x40, 0x80)           // Update free memory pointer
let value := mload(0x40)     // Load from memory
mstore(0x40, value)          // Store to memory
```

## Important Note: The `not` Operator Gotcha

The `not` operator in Yul performs a bitwise negation, which might not behave as expected when used for boolean logic:

```solidity
// WRONG way to negate boolean conditions
if not(lt(x, 10)) {    // DON'T DO THIS
    // This is incorrect for boolean negation
}

// CORRECT way using iszero
if iszero(lt(x, 10)) {  // DO THIS INSTEAD
    // This is correct for boolean negation
}
```

### Why `not` is Problematic for Booleans

1. **Bitwise vs Boolean**: 
   - `not(1)` returns 115792089237316195423570985008687907853269984665640564039457584007913129639934
   - `iszero(1)` returns 0 (false)

2. **Gas Inefficiency**:
   - `not` performs a full 256-bit negation
   - `iszero` is optimized for boolean checks

### Example of Incorrect vs Correct Usage:
```solidity
// INCORRECT
let x := 1              // true
let wrong := not(x)     // This is NOT false!

// CORRECT
let x := 1              // true
let correct := iszero(x) // This is properly false (0)
```

Best Practice: Always use `iszero` for boolean negation and condition checking.

## Further Resources
- [Official Yul Documentation](https://docs.soliditylang.org/en/latest/yul.html)
- [EVM Opcodes Reference](https://www.evm.codes/)
- Complete operations list: https://docs.soliditylang.org/en/latest/yul.html#evm-dialect