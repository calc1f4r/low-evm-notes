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

## Best Practices

1. Always initialize variables before use
2. Use clear naming conventions
3. Comment complex operations
4. Be careful with type conversions
