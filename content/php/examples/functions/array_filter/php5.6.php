<?php

/**
 * array_filter - PHP 5.6 Example (EOL)
 *
 * Demonstrates array_filter with PHP 5.6 compatible syntax:
 * - Anonymous functions (closures)
 * - Traditional function syntax
 * - No arrow functions (introduced in 7.4)
 */

// Example 1: Basic filtering with anonymous function
$numbers = array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
$evenNumbers = array_filter($numbers, function($n) {
    return $n % 2 === 0;
});

echo "Even numbers: " . implode(', ', $evenNumbers) . "\n";
// Output: Even numbers: 2, 4, 6, 8, 10

// Example 2: Filter with both value and key
$users = array(
    'john' => array('age' => 25, 'active' => true),
    'jane' => array('age' => 30, 'active' => false),
    'bob' => array('age' => 35, 'active' => true),
);

$activeUsers = array_filter(
    $users,
    function($user) {
        return $user['active'];
    },
    ARRAY_FILTER_USE_BOTH
);

echo "\nActive users:\n";
print_r($activeUsers);

// Example 3: Filter null values (no callback needed)
$data = array(1, null, 'hello', false, 0, '', 'world');
$filtered = array_filter($data);

echo "\nFiltered data (removes falsy values): ";
print_r($filtered);

// Example 4: Using ARRAY_FILTER_USE_KEY
$products = array(
    'product_1' => 'Laptop',
    'product_2' => 'Mouse',
    'item_3' => 'Keyboard',
    'product_4' => 'Monitor',
);

$productsOnly = array_filter(
    $products,
    function($key) {
        return strpos($key, 'product_') === 0;
    },
    ARRAY_FILTER_USE_KEY
);

echo "\nProducts only:\n";
print_r($productsOnly);
