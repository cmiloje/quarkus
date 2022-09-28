-- COUNTRIES
-- public.countries definition

-- Drop table

DROP TABLE public.countries;

CREATE TABLE public.countries (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	name_eng varchar NOT NULL,
	short_name varchar NOT NULL,
	CONSTRAINT countries_pk PRIMARY KEY (id)
);

-- DATA
INSERT INTO public.countries (id,"name",name_eng,short_name) VALUES
	 (1,'Slovenija','Slovenia','SLO'),
	 (2,'Bosna i Hercegovina','Bosnia and Herzegovina','BIH'),
	 (3,'Hrvatska','Croatia','CRO'),
	 (4,'Srbija','Serbia','SRB');
-- END OF CONTRIES
-- CITIES
-- public.cities definition

-- Drop table

DROP TABLE public.cities;

CREATE TABLE public.cities (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	country_id int8 NOT NULL,
	CONSTRAINT cities_pk PRIMARY KEY (id),
	CONSTRAINT cities_fk FOREIGN KEY (country_id) REFERENCES public.countries(id)
);

--DATA
INSERT INTO public.cities (id,"name",country_id) VALUES
	 (1,'Ljubljana',1),
	 (2,'Maribor',1),
	 (3,'Sarajevo',2),
	 (4,'Banja Luka',2),
	 (5,'Zagreb',3),
	 (6,'Split',3),
	 (7,'Beograd',4),
	 (8,'Kragujevac',4);
-- END OF CITIES
-- CAPITAL CITIES
-- public.capital_cities definition

-- Drop table

DROP TABLE public.capital_cities;

CREATE TABLE public.capital_cities (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	country_id int8 NOT NULL,
	city_id int8 NOT NULL,
	CONSTRAINT capital_cities_un UNIQUE (country_id, city_id),
	CONSTRAINT capitals_pk PRIMARY KEY (id),
	CONSTRAINT capitals_fk FOREIGN KEY (country_id) REFERENCES public.countries(id),
	CONSTRAINT capitals_fk_1 FOREIGN KEY (city_id) REFERENCES public.cities(id)
);

--DATA
INSERT INTO public.capital_cities (id,country_id,city_id) VALUES
	 (1,1,1),
	 (3,2,3),
	 (5,3,5),
	 (6,4,7);
-- END OF CAPITAL CITIES