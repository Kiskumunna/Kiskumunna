# Sagrajor Community App

A responsive Hindi-first village community web app for Sagrajor.

## Features
- Email signup/login (Supabase Auth when configured; browser-local demo mode otherwise)
- Community feed with announcements, meeting notices and general posts
- Search posts by text, author or category
- Post creation, local demo likes, and admin moderation UI
- Responsive mobile layout and persistent light/dark theme
- Supabase database integration with SQL schema and Row Level Security

## Run locally
Open `index.html` with a static web server (for example, VS Code Live Server). The Supabase client is loaded from jsDelivr, so an internet connection is needed.

## Enable cloud database and authentication
1. Create a project at https://supabase.com.
2. In Supabase SQL Editor, run `supabase/schema.sql`.
3. Copy the Project URL and anon/public key from Project Settings → API.
4. In `index.html`, set `SUPABASE_URL` and `SUPABASE_ANON_KEY`.
5. Add trusted admin email addresses to `ADMIN_EMAILS`.

Never put a Supabase service-role key in browser code. The SQL enables RLS and limits post creation/deletion to authenticated users and owners. For production admin moderation, use a server-side trusted role/Edge Function and do not rely on the client-side admin email list alone.

## Demo mode
Without Supabase configuration, signup, login, posts, likes and theme are stored in the current browser's localStorage. This is for preview/testing only; it is not shared across devices or users and should not be used for real accounts or private data.
