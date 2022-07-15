CREATE TYPE "gender" AS ENUM (
  'Male',
  'Female',
  'Other'
);

CREATE TYPE "class" AS ENUM (
  'Ecanom',
  'Bussnues',
  'Classic'
);

CREATE TABLE "Employee" (
  "id" SERIAL PRIMARY KEY,
  "salary" decimal,
  "airport_id" int,
  "Employee_about_id" int,
  "Employee_connection_id" int,
  "profession_id" varchar,
  "create_at" datetime,
  "delete_at" datetime
);

CREATE TABLE "Employee_about" (
  "id" SERIAL PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "gender" varchar,
  "birthday" datetime,
  "address_id" int
);

CREATE TABLE "Roule_table" (
  "id" SERIAL PRIMARY KEY,
  "airline_id" int,
  "time" datetime,
  "flight_id" int,
  "remarks" varchar,
  "airport_id" int
);

CREATE TABLE "Employee_connection" (
  "id" SERIAL PRIMARY KEY,
  "email" text,
  "telephone" varchar(10)
);

CREATE TABLE "Profession" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "Flight" (
  "id" SERIAL PRIMARY KEY,
  "departing_gate" varchar,
  "arriving_date" varchar,
  "create_at" datetime,
  "update_at" datetime,
  "airline_id" int,
  "airport_id" int,
  "from_country" varchar,
  "to_country" varchar
);

CREATE TABLE "Address" (
  "id" SERIAL PRIMARY KEY,
  "country" varchar,
  "city" varchar,
  "region" varchar,
  "street" varchar,
  "home_number" varchar
);

CREATE TABLE "Airport" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "address_id" int
);

CREATE TABLE "airline" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "country" varchar,
  "create_at" datetime,
  "delete_at" datetime,
  "airport_id" int
);

CREATE TABLE "Passanger" (
  "id" SERIAL PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "gender" gender,
  "pasport_number" varchar,
  "county_sitizenship" varchar,
  "Contact_passanger_id" int
);

CREATE TABLE "security_check" (
  "id" SERIAL PRIMARY KEY,
  "check_result" varchar,
  "comments" text,
  "create_at" datetime,
  "update_at" datetime,
  "passanger_id" int,
  "airport_id" int
);

CREATE TABLE "Contact_passanger" (
  "id" SERIAL PRIMARY KEY,
  "email" varchar,
  "telephone" varchar
);

CREATE TABLE "booking" (
  "id" SERIAL PRIMARY KEY,
  "passanger_id" int,
  "ticket_id" int,
  "status" varchar,
  "create_at" datetime,
  "update_at" datetime
);

CREATE TABLE "Ticket" (
  "id" SERIAL PRIMARY KEY,
  "flight" varchar,
  "time" timestamp,
  "gate" varchar,
  "seat" varchar,
  "class" class,
  "pay_category_id" int,
  "airport_id" int,
  "airline_id" int,
  "flight_date" datetime
);

CREATE TABLE "Black_list" (
  "id" SERIAL PRIMARY KEY,
  "passanger_id" int,
  "create_at" date,
  "delete_at" date,
  "lifetime" datetime
);

CREATE TABLE "Pay_Category" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "employee" ADD FOREIGN KEY ("Employee_about_id") REFERENCES "Employee_about" ("id");

ALTER TABLE "employee" ADD FOREIGN KEY ("profession_id") REFERENCES "Profession" ("id");

ALTER TABLE "Employee_about" ADD FOREIGN KEY ("address_id") REFERENCES "Address" ("id");

ALTER TABLE "employee" ADD FOREIGN KEY ("airport_id") REFERENCES "Airport" ("id");

ALTER TABLE "employee" ADD FOREIGN KEY ("Employee_connection_id") REFERENCES "Employee_connection" ("id");

ALTER TABLE "airline" ADD FOREIGN KEY ("airport_id") REFERENCES "Airport" ("id");

ALTER TABLE "Passanger" ADD FOREIGN KEY ("Contact_passanger_id") REFERENCES "Contact_passanger" ("id");

ALTER TABLE "booking" ADD FOREIGN KEY ("ticket_id") REFERENCES "Ticket" ("id");

ALTER TABLE "booking" ADD FOREIGN KEY ("passanger_id") REFERENCES "Passanger" ("id");

ALTER TABLE "Ticket" ADD FOREIGN KEY ("airport_id") REFERENCES "Airport" ("id");

ALTER TABLE "Ticket" ADD FOREIGN KEY ("airline_id") REFERENCES "airline" ("id");

ALTER TABLE "Roule_table" ADD FOREIGN KEY ("airline_id") REFERENCES "airline" ("id");

ALTER TABLE "Flight" ADD FOREIGN KEY ("id") REFERENCES "Roule_table" ("flight_id");

ALTER TABLE "Security_check" ADD FOREIGN KEY ("passanger_id") REFERENCES "Passanger" ("id");

ALTER TABLE "airline" ADD FOREIGN KEY ("id") REFERENCES "Flight" ("airline_id");

ALTER TABLE "Flight" ADD FOREIGN KEY ("airport_id") REFERENCES "Airport" ("id");

ALTER TABLE "Security_check" ADD FOREIGN KEY ("airport_id") REFERENCES "Airport" ("id");

ALTER TABLE "Black_list" ADD FOREIGN KEY ("passanger_id") REFERENCES "Passanger" ("id");

ALTER TABLE "Roule_table" ADD FOREIGN KEY ("airport_id") REFERENCES "Airport" ("id");

ALTER TABLE "Pay_Category" ADD FOREIGN KEY ("id") REFERENCES "Ticket" ("pay_category_id");
