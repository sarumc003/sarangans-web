# Susitharan Command Center

A Vercel-friendly static portfolio + local project/document vault.

## Included
- Programmer / Full-Stack / Cybersecurity theme
- Two profile photos
- Existing public projects
- Responsive UI and animated particle background
- Demo login using browser localStorage
- Project notes and file metadata vault
- Supabase production schema included separately

## Important: real cloud storage
The current vault is intentionally a **demo/local mode**. It does NOT upload file bytes to a server and should not be used for sensitive documents.

For real login + cloud file storage, create a Supabase project, run `supabase-schema.sql`, and connect the frontend to Supabase Auth + Storage. Use the Supabase anon/publishable key with Row Level Security enabled; never put a service-role key in browser code.

## Vercel
Upload the whole folder as a Vercel project. `index.html` is already at the root.
