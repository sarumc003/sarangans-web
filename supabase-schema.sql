-- Production starter schema for the Project / Document Vault.
-- Run in Supabase SQL Editor. Then connect the frontend to Supabase Auth + Storage.

create table if not exists public.documents (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  storage_path text not null,
  mime_type text,
  size_bytes bigint,
  created_at timestamptz not null default now()
);

create table if not exists public.project_notes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null default 'Project note',
  body text not null,
  created_at timestamptz not null default now()
);

alter table public.documents enable row level security;
alter table public.project_notes enable row level security;

create policy "users can read own documents" on public.documents for select using (auth.uid() = user_id);
create policy "users can insert own documents" on public.documents for insert with check (auth.uid() = user_id);
create policy "users can delete own documents" on public.documents for delete using (auth.uid() = user_id);

create policy "users can read own notes" on public.project_notes for select using (auth.uid() = user_id);
create policy "users can insert own notes" on public.project_notes for insert with check (auth.uid() = user_id);
create policy "users can update own notes" on public.project_notes for update using (auth.uid() = user_id);
create policy "users can delete own notes" on public.project_notes for delete using (auth.uid() = user_id);

-- Create a private Storage bucket named: project-vault
-- Then add policies so each user can only access objects under: <auth.uid()>/...
-- Do NOT use a service-role key in the frontend.
