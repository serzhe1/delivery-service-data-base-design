create table if not exists app.dishes
(
    id          bigserial
    primary key,
    amount      integer not null,
    cost        integer not null,
    description varchar(255),
    name        varchar(255)
    );

alter table app.dishes
    owner to postgres;

create table if not exists app.ingredient
(
    id   bigserial
    primary key,
    name varchar(255)
    );

alter table app.ingredient
    owner to postgres;

create table if not exists app.dishes_ingredients
(
    dish_id       bigint not null
    constraint fkfksm3q035x7fdxog1fuwl15pt
    references app.dishes,
    ingredient_id bigint not null
    constraint fksret78s18b6j9ld27x4o7funs
    references app.ingredient,
    primary key (dish_id, ingredient_id)
    );

alter table app.dishes_ingredients
    owner to postgres;

create table if not exists app.statuses
(
    id      bigserial
    primary key,
    caption varchar(255),
    name    varchar(255)
    );

alter table app.statuses
    owner to postgres;

create table if not exists app.users
(
    id       bigserial
    primary key,
    email    varchar(255),
    location varchar(255),
    name     varchar(255),
    password varchar(255)
    );

alter table app.users
    owner to postgres;

create table if not exists app.delivery_costs
(
    id                    bigserial
    primary key,
    cost                  integer not null,
    free_total_order_cost integer not null,
    time                  varchar(255)
    );

alter table app.delivery_costs
    owner to postgres;

create table if not exists app.orders
(
    id               bigserial
    primary key,
    is_completed     boolean not null,
    total_cost       integer not null,
    status_id        bigint
    constraint fksskkpl1vd8t45wcvx150udmvo
    references app.statuses,
    user_id          bigint
    constraint fk32ql8ubntj5uh44ph9659tiih
    references app.users,
    delivery_cost_id bigint
    constraint fk5ae7jwgm2ct84j23c883e9q26
    references app.delivery_costs
);

alter table app.orders
    owner to postgres;

create table if not exists app.roles
(
    id   bigserial
    primary key,
    role varchar(255)
    );

alter table app.roles
    owner to postgres;

create table if not exists app.users_roles
(
    user_id bigint not null
    constraint fk2o0jvgh89lemvvo17cbqvdxaa
    references app.users,
    role_id bigint not null
    constraint fkj6m8fwv7oqv74fcehir1a9ffy
    references app.roles,
    primary key (user_id, role_id)
    );

alter table app.users_roles
    owner to postgres;

create table if not exists app.order_dishes
(
    order_id bigint not null
    constraint fk5p8h5knoot59tkjy4x9eh41dt
    references app.orders,
    dish_id  bigint not null
    constraint fkey1hoe44aqgsnukr2x3x6nxg9
    references app.dishes,
    primary key (order_id, dish_id)
    );

alter table app.order_dishes
    owner to postgres;

-- ---------------------------------------------------------------------------------------------------------------------
CREATE VIEW app.app_view AS
SELECT o.id as order_id, o.is_completed, o.total_cost, o.status_id,
       o.user_id, o.delivery_cost_id, s.caption as status_caption,
       s.name as status_name, u.email as user_email,
       u.name as user_name, u.location as user_location,
       r.role, d.amount, d.cost, d.description, d.name,
       i.name as ingredient_name
FROM app.orders o
         LEFT JOIN app.order_dishes od on od.order_id = o.id
         LEFT JOIN app.dishes d on d.id = od.dish_id
         LEFT JOIN app.dishes_ingredients di on di.dish_id = d.id
         LEFT JOIN app.ingredient i on di.ingredient_id = i.id
         LEFT JOIN app.statuses s on s.id = o.status_id
         LEFT JOIN app.users u on o.user_id = u.id
         LEFT JOIN app.users_roles ur on ur.user_id = u.id
         LEFT JOIN app.roles r on r.id = ur.role_id
         LEFT JOIN app.delivery_costs dc on dc.id = o.delivery_cost_id;

insert into app.users (email, location, name, password)
values ('1@1', '1', '1', '1'), ('2@2', '2', '2', '2'), ('3@3', '3', '3', '3');