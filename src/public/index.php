<?php

declare(strict_types=1);

if (file_exists($file = '../vendor/autoload.php')) {
    require $file;
}

$dbh = new PDO(sprintf('mysql:dbname=%s;host=mysql', 'playground'), 'appuser', 'fakepassword');

$stmt = $dbh->prepare("SELECT VERSION();");
$stmt->execute();

printf(
    "Current time: %s\nPHP version: %s \nDB version: %s\n",
    date('Y-m-d H:i:s'),
    phpversion(),
    $stmt->fetchColumn()
);
