# Playground
Just a small application that uses nginx, php and a mysql database.

## copy env file
```shell
cp -n .env{.example,}
```

## start containers
```shell
docker compose up --detach
```

## setup database

### configure database
Add the following variable to `src/.env`:
```
DATABASE_URL="mysql://appuser:fakepassword@127.0.0.1:3306/playground?serverVersion=11.4.2-MariaDB&charset=utf8mb4"
```

### update composer
```shell
docker compose exec php composer update
```
