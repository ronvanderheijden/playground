create table `users` (
    `id`    int auto_increment primary key,
    `name`  varchar(255) not null,
    `email` varchar(255) not null
);

insert into `users` 
    (`name`, `email`) 
values 
    ('Foo', 'foo@example.com'), 
    ('Bar', 'bar@example.com');
