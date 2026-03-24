<?php

/**
 * array_filter - Modern PHP 8.3+ Example
 *
 * Demonstrates array_filter with modern PHP features:
 * - Arrow functions (PHP 7.4+)
 * - Named arguments (PHP 8.0+)
 * - Array unpacking (PHP 7.4+)
 */

// Example 1: Basic filtering with arrow function
$numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
$evenNumbers = array_filter($numbers, fn($n) => $n % 2 === 0);

echo "Even numbers: " . implode(', ', $evenNumbers) . "\n";
// Output: Even numbers: 2, 4, 6, 8, 10

// Example 2: Filter with both value and key using named arguments
$users = [
    'john' => ['age' => 25, 'active' => true],
    'jane' => ['age' => 30, 'active' => false],
    'bob' => ['age' => 35, 'active' => true],
];

$activeUsers = array_filter(
    array: $users,
    callback: fn($user) => $user['active'],
    mode: ARRAY_FILTER_USE_BOTH
);

echo "\nActive users:\n";
print_r($activeUsers);

// Example 3: Filter null values (no callback needed)
$data = [1, null, 'hello', false, 0, '', 'world'];
$filtered = array_filter($data);

echo "\nFiltered data (removes falsy values): ";
print_r($filtered);

// Example 4: Using ARRAY_FILTER_USE_KEY
$products = [
    'product_1' => 'Laptop',
    'product_2' => 'Mouse',
    'item_3' => 'Keyboard',
    'product_4' => 'Monitor',
];

$productsOnly = array_filter(
    $products,
    fn($key) => str_starts_with($key, 'product_'),
    ARRAY_FILTER_USE_KEY
);

echo "\nProducts only:\n";
print_r($productsOnly);
