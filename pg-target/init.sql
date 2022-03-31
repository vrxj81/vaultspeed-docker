do $$
  begin
		create type gps as (
			latitude  numeric,
			longitude numeric,
			elevation numeric
		);
	exception when others then
    raise notice 'type gps already exists';
end;
$$;

do $$
  begin
		create extension pgcrypto;
	exception when others then
    raise notice 'extension pgcrypto already loaded';
end;
$$;