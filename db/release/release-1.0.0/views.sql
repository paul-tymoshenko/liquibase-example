create view prettytrain as
select t.*,
       exists( select from train_door d where d.train_id = t.id and type = 'FRONT') as has_front_door,
       exists( select from train_door d where d.train_id = t.id and type = 'REAR') as has_rear_door
    from train as t;
