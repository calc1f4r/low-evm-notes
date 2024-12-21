# Basic Operations in Yul

Yul is an intermediate language that can be compiled to bytecode for different backends. Here's a guide to basic operations in Yul.

## Arithmetic Operations

In Yul, arithmetic operations are performed using function-like syntax:

```solidity
add(x, y)    // Addition: x + y
sub(x, y)    // Subtraction: x - y
mul(x, y)    // Multiplication: x * y
div(x, y)    // Division: x / y
mod(x, y)    // Modulo: x % y
```

## Comparison Operations

Comparison operators return 1 for true and 0 for false:

```solidity
lt(x, y)     // Less than: x < y
gt(x, y)     // Greater than: x > y
eq(x, y)     // Equal to: x == y
```

## Bitwise Operations

Bitwise operations are commonly used in low-level programming:

```solidity
and(x, y)    // Bitwise AND
or(x, y)     // Bitwise OR
xor(x, y)    // Bitwise XOR
not(x)       // Bitwise NOT
```

## Zero Check Operation

The `iszero` operation returns 1 if the input is 0, and 0 otherwise:

```solidity
iszero(x)    // Returns 1 if x is 0, 0 otherwise
```

## Control Flow Structures

### If-Else Statement
```solidity
if condition { 
    // code for true condition
} 
if iszero(condition) {
    // code for false condition
}
```

### For Loop
```solidity
for { initialization } condition { increment } {
    // loop body
}

// Example:
for { let i := 0 } lt(i, 10) { i := add(i, 1) } {
    // loop body
}
```

Note: Yul doesn't have a native else clause, but we can simulate it using `iszero` with another if statement.



