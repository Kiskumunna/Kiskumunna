-- Sagrajor community schema
create extension if not exists pgcrypto;

create table if not exists public.posts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  user_name text not null default 'समुदाय सदस्य',
  category text not null default 'general' check (category in ('announcement','meeting','general')),
  body text not null check (char_length(body) between 1 and 3000),
  created_at timestamptz not null default now()
);

alter table public.posts enable row level security;

create policy "Anyone can read community posts"
on public.posts for select
to anon, authenticated
using (true);

create policy "Authenticated users can publish posts"
on public.posts for insert
to authenticated
with check (auth.uid() = user_id);

create policy "Authors can delete their own posts"
on public.posts for delete
to authenticated
using (auth.uid() = user_id);

create index if not exists posts_created_at_idx on public.posts (created_at desc);
create index if not exists posts_category_idx on public.posts (category);
