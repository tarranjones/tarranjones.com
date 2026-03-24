<?php

declare(strict_types=1);

use Rector\Config\RectorConfig;
use Rector\Set\ValueObject\LevelSetList;
use Rector\Set\ValueObject\SetList;

return RectorConfig::configure()
    ->withPaths([
        __DIR__ . '/content/php',
    ])
    ->withSkip([
        __DIR__ . '/content/php/**/php5.6.php',
        __DIR__ . '/content/php/**/php7.*.php',
    ])
    // Uncomment specific sets to downgrade code to specific PHP versions
    // ->withSets([
    //     LevelSetList::DOWN_TO_PHP_74,
    //     LevelSetList::DOWN_TO_PHP_56,
    // ])
    ->withPreparedSets(
        deadCode: true,
        codeQuality: true,
        codingStyle: true,
        typeDeclarations: true,
        privatization: true,
        earlyReturn: true
    );
