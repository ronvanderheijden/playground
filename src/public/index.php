<?php

declare(strict_types=1);

if (file_exists($file = '../vendor/autoload.php')) {
    require $file;
}

$dsn = sprintf('mysql:dbname=%s;host=mysql', 'playground');
$dbh = new PDO($dsn, 'appuser', 'fakepassword');
$stmt = $dbh->prepare("SELECT VERSION();");
$stmt->execute();

printf(
    "Current time: %s\nPHP version: %s \nDB version: %s\n",
    date('Y-m-d H:i:s'),
    phpversion(),
    $stmt->fetchColumn()
);

$users = $dbh
    ->query("SELECT `id`, `name`, `email` FROM `users`")
    ->fetchAll(PDO::FETCH_CLASS, \App\User::class);

print_r($users);
