-- =========================================================
-- AI IDEA PITCHING - SECURE RESET FUNCTION
-- Run this ONCE in Supabase SQL Editor
-- IMPORTANT: Change YOUR_RESET_PIN_HERE before Run
-- =========================================================

create extension if not exists pgcrypto;

create table if not exists public.admin_settings (
  id smallint primary key check (id = 1),
  reset_pin_hash text not null
);

alter table public.admin_settings enable row level security;

revoke all on table public.admin_settings from anon, authenticated;

insert into public.admin_settings (id, reset_pin_hash)
values (
  1,
  encode(digest('YOUR_RESET_PIN_HERE', 'sha256'), 'hex')
)
on conflict (id)
do update set
  reset_pin_hash = excluded.reset_pin_hash;


create or replace function public.reset_all_scores(input_pin text)
returns integer
language plpgsql
security definer
set search_path = public, extensions
as $$
declare
  stored_hash text;
  deleted_count integer;
begin

  select reset_pin_hash
  into stored_hash
  from public.admin_settings
  where id = 1;

  if stored_hash is null then
    raise exception 'RESET_PIN_NOT_CONFIGURED';
  end if;

  if encode(digest(coalesce(input_pin, ''), 'sha256'), 'hex') <> stored_hash then
    raise exception 'INVALID_RESET_PIN';
  end if;

  delete from public.scores;

  get diagnostics deleted_count = row_count;

  return deleted_count;
end;
$$;

revoke all on function public.reset_all_scores(text) from public;
grant execute on function public.reset_all_scores(text) to anon, authenticated;

-- Test after setup if needed:
-- select public.reset_all_scores('YOUR_RESET_PIN_HERE');
