CREATE TABLE train
(
    id      bigint,
    name    text,
    type    varchar
);

CREATE TABLE train_door
(
    id  bigint,
    train_id    bigint,
    location    text
);