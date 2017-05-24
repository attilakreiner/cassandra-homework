-- Fix the following Cassandra DDL, so that all queries from the files below can be executed without changes
 -- 02-upsert-readonly.sql and
 -- 03-query-readonly.sql

-- Create keyspace (press TAB for autocomplete in cqlsh)
CREATE KEYSPACE homework WITH replication = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 } AND durable_writes = true;

-- Use keyspace
USE homework;

-- Fix the following table creation script so that the subsequent queries work as expected
-- The table contains both the invoice header and the invoice detail fields
CREATE table invoice
(
  -- header fields
  invoice_id text,
  invoice_date date static,
  invoice_address text static,
  -- detail fields
  line_id int,
  article_name text,
  article_price decimal,
  PRIMARY KEY (invoice_id, article_name, line_id)
);

CREATE INDEX ON invoice (invoice_date);
