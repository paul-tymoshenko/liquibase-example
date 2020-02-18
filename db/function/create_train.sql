create or replace function create_train
    (
        p_name text,
        p_type text,
        p_has_rear_door boolean default false,
        p_has_front_door boolean default false,
        OUT _result json
    ) RETURNS json as
$function$
DECLARE
    _train  train;
    _door   train_door;
BEGIN
    _train := (with ins as (INSERT INTO train(name, type) values (p_name, p_type) returning *) select * from ins);

    _result := row_to_json(_train);
END;
$function$ language plpgsql;