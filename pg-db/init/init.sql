--
-- This script helps configure postgresql db
-- For development purposes only
--

SET TIME ZONE 'UTC';

-- UUID extension
-- CREATE EXTENSION IF NOT EXISTS "uuid-ossp"

CREATE SCHEMA dev_schema;

-- Admin user for migrations
CREATE USER "adm_user" WITH LOGIN
  NOSUPERUSER NOCREATEDB NOCREATEROLE PASSWORD 'adm-password';

ALTER SCHEMA dev_schema OWNER to "adm_user";

GRANT ALL PRIVILEGES ON DATABASE postgres to "adm_user";

GRANT ALL PRIVILEGES ON SCHEMA dev_schema to "adm_user";

-- Read/Write user
CREATE USER "rw_user" WITH LOGIN
  NOSUPERUSER NOCREATEDB NOCREATEROLE PASSWORD 'rw-password';

ALTER SCHEMA dev_schema OWNER to "rw_user";

GRANT ALL PRIVILEGES ON DATABASE postgres to "rw_user";

GRANT USAGE ON SCHEMA dev_schema to "rw_user";

GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA dev_schema TO "rw_user";

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA dev_schema to "rw_user";

-- Read Only user
CREATE USER "ro_user" WITH LOGIN
  NOSUPERUSER NOCREATEDB NOCREATEROLE PASSWORD 'ro-password';

ALTER SCHEMA dev_schema OWNER to "ro_user";

GRANT ALL PRIVILEGES ON DATABASE postgres to "ro_user";

GRANT USAGE ON SCHEMA dev_schema to "ro_user";

GRANT SELECT ON ALL TABLES IN SCHEMA dev_schema TO "ro_user";

-- Probably limit to applicable functions
-- GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA dev_schema to "ro_user";