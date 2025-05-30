-- Create role and schema
CREATE ROLE astreya LOGIN PASSWORD '<DB_PASSWORD>';
CREATE SCHEMA IF NOT EXISTS astreya AUTHORIZATION astreya;

-- UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Tables
CREATE TABLE astreya.leads (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE astreya.campaigns (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  status TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE astreya.content_items (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  campaign_id INTEGER REFERENCES astreya.campaigns(id),
  text TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
