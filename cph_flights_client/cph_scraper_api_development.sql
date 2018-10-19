--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: akublemiszewski
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO akublemiszewski;

--
-- Name: arrivals; Type: TABLE; Schema: public; Owner: akublemiszewski
--

CREATE TABLE public.arrivals (
    id bigint NOT NULL,
    "time" character varying,
    date date,
    expected character varying,
    airline character varying,
    arriving_from character varying,
    flight_no character varying,
    gate character varying,
    terminal character varying,
    status character varying
);


ALTER TABLE public.arrivals OWNER TO akublemiszewski;

--
-- Name: arrivals_id_seq; Type: SEQUENCE; Schema: public; Owner: akublemiszewski
--

CREATE SEQUENCE public.arrivals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.arrivals_id_seq OWNER TO akublemiszewski;

--
-- Name: arrivals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: akublemiszewski
--

ALTER SEQUENCE public.arrivals_id_seq OWNED BY public.arrivals.id;


--
-- Name: departures; Type: TABLE; Schema: public; Owner: akublemiszewski
--

CREATE TABLE public.departures (
    id bigint NOT NULL,
    "time" character varying,
    date date,
    expected character varying,
    airline character varying,
    destination character varying,
    flight_no character varying,
    gate character varying,
    terminal character varying,
    status character varying
);


ALTER TABLE public.departures OWNER TO akublemiszewski;

--
-- Name: departures_id_seq; Type: SEQUENCE; Schema: public; Owner: akublemiszewski
--

CREATE SEQUENCE public.departures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departures_id_seq OWNER TO akublemiszewski;

--
-- Name: departures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: akublemiszewski
--

ALTER SEQUENCE public.departures_id_seq OWNED BY public.departures.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: akublemiszewski
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO akublemiszewski;

--
-- Name: arrivals id; Type: DEFAULT; Schema: public; Owner: akublemiszewski
--

ALTER TABLE ONLY public.arrivals ALTER COLUMN id SET DEFAULT nextval('public.arrivals_id_seq'::regclass);


--
-- Name: departures id; Type: DEFAULT; Schema: public; Owner: akublemiszewski
--

ALTER TABLE ONLY public.departures ALTER COLUMN id SET DEFAULT nextval('public.departures_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: akublemiszewski
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-10-16 19:25:49.725339	2018-10-16 19:25:49.725339
\.


--
-- Data for Name: arrivals; Type: TABLE DATA; Schema: public; Owner: akublemiszewski
--

COPY public.arrivals (id, "time", date, expected, airline, arriving_from, flight_no, gate, terminal, status) FROM stdin;
57860	14:30	2018-10-18	18:18	Norwegian	Malaga, Spain - Malaga Airport	D83673	A8		
57861	17:40	2018-10-18	17:59	Atlantic Airways	Faroe Islands, Faroe Islands - Vagar Airport	RC456	A14		Baggage
57862	17:45	2018-10-18	17:15	Turkish Airlines	Istanbul, Turkey - Istanbul Ataturk Airport	TK1785	C130		Baggage
57863	17:45	2018-10-18	18:05	Norwegian	Edinburgh, United Kingdom of Great Britain and Northern Ireland - Edinburgh Airport	D83503	D103		Landed
57864	17:55	2018-10-18	17:52	SAS	Helsinki, Finland - Helsinki-Vantaa Airport	SK1713	D4		Landed
57865	18:00	2018-10-18	17:52	easyJet	Geneva, Switzerland - Geneve Airport	EZS1469	F7A		Baggage
57866	18:00	2018-10-18	17:51	Icelandair	Reykjavik, Iceland - Keflavik International Airport	FI212	B7		Baggage
57867	18:10	2018-10-18	18:26	Lufthansa	Munich, Germany - Franz Josef Strauss Airport	LH2444	B15		
57868	18:15	2018-10-18	18:16	Lufthansa	Frankfurt, Germany - Frankfurt Airport	LH830	B10		
57869	18:15	2018-10-18	\N	Norwegian	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	D82908	C26		
57870	18:20	2018-10-18	18:29	SAS	Aalborg, Denmark - Aalborg Airport	SK1218	A11		
57871	18:20	2018-10-18	18:06	Norwegian	Lisbon, Portugal - Lisbon Portela Airport	D83617	A18		Landed
57872	18:20	2018-10-18	18:13	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1133	A21		Landed
57873	18:25	2018-10-18	18:26	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1429	B9		
57874	18:25	2018-10-18	18:20	Finnair	Helsinki, Finland - Helsinki-Vantaa Airport	AY959	A17		
57875	18:25	2018-10-18	18:33	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1465	B8		
57876	18:25	2018-10-18	18:28	Norwegian	Las Palmas, Spain - Gran Canaria Airport	D85922	A4		
57877	18:25	2018-10-18	18:32	Danish Air Transport	Bornholm, Denmark - Bornholm Airport	DX049	A7		
57878	18:25	2018-10-18	18:13	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	D8230	A20		Landed
57879	18:30	2018-10-18	18:18	Norwegian	Budapest, Hungary - Budapest Ferenc Liszt International Airport	D83551	A15		
57880	18:30	2018-10-18	18:44	Air France	Paris, France - Charles de Gaulle Airport	AF1050	A12		
57881	18:35	2018-10-18	18:20	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	DY948	A22		
57882	18:35	2018-10-18	18:25	SmartWings / Travel Service	Athens, Greece - Eleftherios Venizelos International Airport	QS4593	A29A		
57883	18:40	2018-10-18	\N	Norwegian	Berlin, Germany - Schonefeld Airport	D83303	A6		
57884	18:45	2018-10-18	18:33	Air India	Delhi, India - Indira Gandhi International Airport	AI157	C133		
57885	18:45	2018-10-18	18:38	SAS	Shanghai, China - Shanghai Pudong International Airport	SK998	C128		
57886	18:45	2018-10-18	18:14	SAS	Beijing, China - Beijing Capital International Airport	SK996	C139		
57887	18:55	2018-10-18	\N	SAS	Aarhus, Denmark - Aarhus Airport	SK1260			Cancelled
57888	19:00	2018-10-18	\N	SAS Ireland	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SZS9161			Cancelled
57889	19:00	2018-10-18	19:07	LOT Polish Airlines	Warsaw, Poland - Frederic Chopin Airport	LO461			
57890	19:00	2018-10-18	19:02	SAS	Brussels, Belgium - Brussels Airport	SK1594			
57891	19:00	2018-10-18	19:09	SAS	Amsterdam, Netherlands - Amsterdam Airport Schiphol	SK1550			
57892	19:00	2018-10-18	18:45	Air Baltic	Riga, Latvia - Riga International Airport	BT139	C9		
57893	19:05	2018-10-18	\N	Czech Airlines	Prague, Czechia - Vaclav Havel Airport Prague	OK508			
57894	19:10	2018-10-18	19:13	Swiss	Zurich, Switzerland - Zurich Airport	LX1272			
57895	19:10	2018-10-18	18:55	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK461	B19		
57896	19:20	2018-10-18	\N	SAS	Gothenburg, Sweden - Goteborg Landvetter Airport	SK449			
57897	19:20	2018-10-18	\N	Austrian Airlines	Vienna, Austria - Vienna International Airport	OS305			
57898	19:20	2018-10-18	19:23	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK409			
57899	19:25	2018-10-18	19:32	Norwegian	Malaga, Spain - Malaga Airport	D85072			
57900	19:25	2018-10-18	19:39	Norwegian	Madrid, Spain - Adolfo Suarez Madrid-Barajas Airport	D86112			
57901	19:25	2018-10-18	19:10	Ryanair	Budapest, Hungary - Budapest Ferenc Liszt International Airport	FR605			
57902	19:25	2018-10-18	19:31	British Airways	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	BA820			
57903	19:25	2018-10-18	19:23	SAS	Warsaw, Poland - Frederic Chopin Airport	SK2752			
57904	19:30	2018-10-18	\N	LOT Polish Airlines	Groningen, Netherlands - Eelde Airport	LO8846			
57905	19:30	2018-10-18	\N	SAS	Bergen, Norway - Bergen Airport	SK2869			
57906	19:30	2018-10-18	\N	SAS	Gdansk, Poland - Gdansk Lech Walesa Airport	SK758			
57907	19:30	2018-10-18	\N	SAS	Stavanger, Norway - Stavanger Airport Sola	SK1879			
57908	19:35	2018-10-18	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83095			
57909	19:35	2018-10-18	\N	Widerøe	Sandefjord, Norway - Torp Sandefjord Airport	WF313			
57910	19:40	2018-10-18	\N	EUROWINGS Luftverkehrs AG	Dusseldorf, Germany - Dusseldorf International Airport	EW9194			
57911	19:45	2018-10-18	\N	Luxair	Luxembourg, Luxembourg - Luxembourg Airport	LG5435			
57912	19:45	2018-10-18	\N	SAS	Billund, Denmark - Billund Airport	SK1288			
57913	19:45	2018-10-18	\N	Norwegian	Palma Mallorca, Spain - Palma de Mallorca Airport	D86672			
57914	19:45	2018-10-18	19:35	Norwegian	Rome, Italy - Leonardo da Vinci-Fiumicino Airport	D81022			
57915	19:50	2018-10-18	\N	Norwegian	Amsterdam, Netherlands - Amsterdam Airport Schiphol	D83541			
57916	19:50	2018-10-18	\N	Norwegian	Barcelona, Spain - Barcelona-El Prat Airport	D85574			
57917	19:50	2018-10-18	\N	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	D83240			
57918	19:55	2018-10-18	\N	SAS	Munich, Germany - Franz Josef Strauss Airport	SK2658			
57919	19:55	2018-10-18	\N	SAS	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SK506			
57920	19:55	2018-10-18	19:45	easyJet	Lyon, France - Lyon Saint-Exupery International Airport	EZY4425			
57921	20:00	2018-10-18	\N	Norwegian	Helsinki, Finland - Helsinki-Vantaa Airport	D8262			
57922	20:00	2018-10-18	\N	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	D83213			
57923	20:00	2018-10-18	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1477			
57924	20:00	2018-10-18	20:32	SAS	Malaga, Spain - Malaga Airport	SK6202			
57925	20:05	2018-10-18	\N	easyJet	Berlin, Germany - Tegel Airport	EZY5687			
57926	20:05	2018-10-18	\N	SAS	Hanover, Germany - Hannover Airport	SK1668			
57927	20:05	2018-10-18	\N	SAS	Dusseldorf, Germany - Dusseldorf International Airport	SK628			
57928	20:05	2018-10-18	21:17	Danish Air Transport	Hurghada, Egypt - Hurghada International Airport	DX622			
57929	20:10	2018-10-18	\N	LOT Polish Airlines	Tallinn, Estonia - Tallinn Airport	LO8145			
57930	20:10	2018-10-18	\N	SAS	Stuttgart, Germany - Stuttgart Airport	SK1656			
57931	20:10	2018-10-18	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1409			
57932	20:15	2018-10-18	\N	SAS	Hamburg, Germany - Hamburg Airport	SK652			
57933	20:20	2018-10-18	\N	Ryanair	Brussels, Belgium - Brussels S. Charleroi Airport	FR301			
57934	20:20	2018-10-18	\N	Widerøe	Kristiansand, Norway - Kristiansand Airport	WF278			
57935	20:20	2018-10-18	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1135			
57936	20:25	2018-10-18	\N	Lufthansa	Munich, Germany - Franz Josef Strauss Airport	LH2438			
57937	20:30	2018-10-18	\N	easyJet	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	EZY8269			
57938	20:30	2018-10-18	\N	Ryanair	Milan, Italy - Orio al Serio International Airport	FR2990			
57939	20:35	2018-10-18	20:58	Thomas Cook Airlines	Hurghada, Egypt - Hurghada International Airport	DK529			
57940	20:40	2018-10-18	\N	Ryanair	Madrid, Spain - Adolfo Suarez Madrid-Barajas Airport	FR607			
57941	20:45	2018-10-18	\N	easyJet	Edinburgh, United Kingdom of Great Britain and Northern Ireland - Edinburgh Airport	EZY6983			
57942	20:45	2018-10-18	21:17	Danish Air Transport	Hurghada, Egypt - Hurghada International Airport	DX379			
57943	20:50	2018-10-18	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83099			
57944	20:50	2018-10-18	\N	Wizz Air	Kiev, Ukraine - Kyiv International Airport	W66223			
57945	20:55	2018-10-18	20:45	Qatar Airways	Doha, Qatar - Hamad International Airport	QR163			
57946	21:05	2018-10-18	\N	easyJet	Berlin, Germany - Schonefeld Airport	EZY4557			
57947	21:05	2018-10-18	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK463			
57948	21:05	2018-10-18	\N	Brussels Airlines	Brussels, Belgium - Brussels Airport	SN2263			
57949	21:10	2018-10-18	\N	Finnair	Helsinki, Finland - Helsinki-Vantaa Airport	AY961			
57950	21:10	2018-10-18	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK411			
57951	21:15	2018-10-18	\N	easyJet	Milan, Italy - Milano Malpensa Airport	EZY2655			
57952	21:20	2018-10-18	\N	Lufthansa	Munich, Germany - Franz Josef Strauss Airport	LH2446			
57953	21:25	2018-10-18	\N	Norwegian	Bergen, Norway - Bergen Airport	DY968			
57954	21:25	2018-10-18	\N	easyJet	Manchester, United Kingdom of Great Britain and Northern Ireland - Manchester Airport	EZY1987			
57955	21:25	2018-10-18	\N	SAS	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SK1516			
57956	21:25	2018-10-18	\N	SAS	Helsinki, Finland - Helsinki-Vantaa Airport	SK1717			
57957	21:30	2018-10-18	\N	SAS	Paris, France - Charles de Gaulle Airport	SK1560			
57958	21:30	2018-10-18	\N	Aeroflot	Moscow, Russian Federation - Sheremetyevo International Airport	SU2496			
57959	21:30	2018-10-18	21:45	Air Greenland	Kangerlussuaq, Greenland - Kangerlussuaq Airport	GL782			
57960	21:35	2018-10-18	\N	Danish Air Transport	Bornholm, Denmark - Bornholm Airport	DX053			
57961	22:15	2018-10-18	\N	Norwegian	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	D82910			
57962	22:30	2018-10-18	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1139			
57963	22:35	2018-10-18	\N	Brussels Airlines	Brussels, Belgium - Brussels Airport	SN2265			
57964	22:40	2018-10-18	\N	Lufthansa	Frankfurt, Germany - Frankfurt Airport	LH832			
57965	22:40	2018-10-18	\N	UKRAINE INTERNATIONAL AIRLINES	Kiev	PS163			
57966	22:40	2018-10-18	\N	SAS	Berlin, Germany - Tegel Airport	SK1678			
57967	22:45	2018-10-18	\N	Norwegian	Prague, Czechia - Vaclav Havel Airport Prague	D83583			
57968	22:50	2018-10-18	\N	Norwegian	Alicante, Spain - Alicante-Elche Airport	D83663			
57969	22:50	2018-10-18	\N	TAP Portugal	Lisbon, Portugal - Lisbon Portela Airport	TP752			
57970	22:55	2018-10-18	\N	Air France	Paris, France - Charles de Gaulle Airport	AF1350			
57971	23:10	2018-10-18	\N	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	D83242			
57972	23:20	2018-10-18	\N	Norwegian	Budapest, Hungary - Budapest Ferenc Liszt International Airport	D83553			
57973	23:20	2018-10-18	\N	SAS	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SK1508			
57974	23:30	2018-10-18	\N	Norwegian	Paris, France - Paris Orly Airport	D83639			
57975	23:35	2018-10-18	\N	Norwegian	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	D82914			
57976	23:35	2018-10-18	\N	Norwegian	Nice, France - Cote D'Azur Airport	D83643			
57977	23:40	2018-10-18	\N	SAS	Munich, Germany - Franz Josef Strauss Airport	SK1660			
57978	23:50	2018-10-18	\N	Norwegian	Krakow, Poland - J. Paul II International Airport Krakow-Balice	D83563			
57979	00:10	2018-10-19	\N	SunExpress	Izmir, Turkey - Izmir Adnan Menderes Airport	XQ926			
57980	00:30	2018-10-19	\N	British Airways	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	BA808			
57981	00:35	2018-10-19	\N	SAS	Manchester, United Kingdom of Great Britain and Northern Ireland - Manchester Airport	SK1546			
57982	01:05	2018-10-19	\N	Pegasus Airlines	Istanbul, Turkey - Sabiha Gokcen International Airport	PC1073			
57983	01:10	2018-10-19	\N	Thomas Cook Airlines	Heraklion, Greece - Heraklion Airport	DK1177			
57984	01:10	2018-10-19	\N	Pegasus Airlines	Konya, Turkey - Konya Airport	PC1771			
57985	01:35	2018-10-19	\N	Danish Air Transport	Heraklion, Greece - Heraklion Airport	DX225			
57986	01:50	2018-10-19	\N	Norwegian	Tel Aviv-Yafo, Israel - Ben Gurion International Airport	D83791			
57987	01:55	2018-10-19	\N	TUIfly	Antalya, Turkey - Antalya Airport	BLX658			
57988	06:25	2018-10-19	\N	Singapore Airlines	Singapore, Singapore - Changi International Airport	SQ352			
57989	06:30	2018-10-19	\N	Cathay Pacific	Hong Kong	CX227			
57990	06:40	2018-10-19	\N	Danish Air Transport	Bornholm, Denmark - Bornholm Airport	DX031			
57991	06:45	2018-10-19	\N	Air China International	Beijing, China - Beijing Capital International Airport	CA877			
57992	06:50	2018-10-19	\N	Ryanair	Kaunas, Lithuania - Kaunas Airport	FR7621			
57993	06:55	2018-10-19	\N	SAS	Boston, United States of America - Logan International Airport	SK928			
57994	07:00	2018-10-19	\N	Qatar Airways	Doha, Qatar - Hamad International Airport	QR161			
57995	07:00	2018-10-19	\N	SAS	Vilnius, Lithuania - Vilnius International Airport	SK743			
57996	07:05	2018-10-19	\N	SAS	Aalborg, Denmark - Aalborg Airport	SK1228			
57997	07:05	2018-10-19	\N	SAS	Gothenburg, Sweden - Goteborg Landvetter Airport	SK1439			
57998	07:05	2018-10-19	\N	SAS	Palanga, Lithuania - Palanga International Airport	SK2749			
57999	07:05	2018-10-19	\N	SAS	Tallinn, Estonia - Tallinn Airport	SK1791			
58000	07:10	2018-10-19	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83079			
58001	07:10	2018-10-19	\N	SAS	Billund, Denmark - Billund Airport	SK1280			
58002	07:10	2018-10-19	\N	SAS	Gdansk, Poland - Gdansk Lech Walesa Airport	SK1758			
58003	07:10	2018-10-19	\N	SAS	Stavanger, Norway - Stavanger Airport Sola	SK1871			
58004	07:15	2018-10-19	\N	easyJet	Berlin, Germany - Tegel Airport	EZY5679			
58005	07:15	2018-10-19	\N	SAS	Newark, United States of America - Newark Liberty International Airport	SK910			
58006	07:15	2018-10-19	\N	SAS	Dulles, United States of America - Washington Dulles International Airport	SK926			
58007	07:15	2018-10-19	\N	Widerøe	Sandefjord, Norway - Torp Sandefjord Airport	WF301			
58008	07:20	2018-10-19	\N	SAS	Aarhus, Denmark - Aarhus Airport	SK1240			
58009	07:20	2018-10-19	\N	SAS	Bergen, Norway - Bergen Airport	SK2861			
58010	07:20	2018-10-19	\N	Widerøe	Kristiansand, Norway - Kristiansand Airport	WF264			
58011	07:25	2018-10-19	\N	SAS	Hanover, Germany - Hannover Airport	SK1672			
58012	07:25	2018-10-19	\N	SAS	Warsaw, Poland - Frederic Chopin Airport	SK2762			
58013	07:25	2018-10-19	\N	SAS	Hamburg, Germany - Hamburg Airport	SK648			
58014	07:30	2018-10-19	\N	LOT Polish Airlines	Groningen, Netherlands - Eelde Airport	LO8842			
58015	07:30	2018-10-19	\N	SAS	Dusseldorf, Germany - Dusseldorf International Airport	SK620			
58016	07:30	2018-10-19	\N	SAS	Stuttgart, Germany - Stuttgart Airport	SK668			
58017	07:35	2018-10-19	\N	LOT Polish Airlines	Tallinn, Estonia - Tallinn Airport	LO8141			
58018	07:35	2018-10-19	\N	SAS	Trondheim, Norway - Trondheim Airport Vaernes	SK2885			
58019	07:40	2018-10-19	\N	Norwegian	Helsinki, Finland - Helsinki-Vantaa Airport	D8260			
58020	07:40	2018-10-19	\N	SAS	Gothenburg, Sweden - Goteborg Landvetter Airport	SK433			
58021	07:40	2018-10-19	\N	Thai Airways	Bangkok, Thailand - Suvarnabhumi Airport	TG950			
58022	07:45	2018-10-19	\N	Air Alsie	Sonderborg, Denmark - Sonderborg Airport	6I101			
58023	07:50	2018-10-19	\N	Danish Air Transport	Karup, Denmark - Midtjyllands Airport	DX073			
58024	07:50	2018-10-19	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1137			
58025	08:00	2018-10-19	\N	SAS	Helsinki, Finland - Helsinki-Vantaa Airport	SK1705			
58026	08:05	2018-10-19	\N	Luxair	Luxembourg, Luxembourg - Luxembourg Airport	LG5433			
58027	08:10	2018-10-19	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83081			
58028	08:10	2018-10-19	\N	easyJet	Berlin, Germany - Schonefeld Airport	EZY4553			
58029	08:10	2018-10-19	\N	Lufthansa	Munich, Germany - Franz Josef Strauss Airport	LH2440			
58030	08:15	2018-10-19	\N	Finnair	Helsinki, Finland - Helsinki-Vantaa Airport	AY951			
58031	08:15	2018-10-19	\N	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	DY4151			
58032	08:15	2018-10-19	\N	Ryanair	Brussels, Belgium - Brussels S. Charleroi Airport	FR201			
58033	08:20	2018-10-19	\N	Transavia Airlines	Eindhoven, Netherlands - Eindhoven Airport	HV5961			
58034	08:20	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1463			
58035	08:25	2018-10-19	\N	Air Baltic	Riga, Latvia - Riga International Airport	BT131			
58036	08:25	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1417			
58037	08:25	2018-10-19	\N	SAS	Amsterdam, Netherlands - Amsterdam Airport Schiphol	SK550			
58038	08:30	2018-10-19	\N	easyJet	Berlin, Germany - Tegel Airport	EZY5681			
58039	08:30	2018-10-19	\N	Czech Airlines	Prague, Czechia - Vaclav Havel Airport Prague	OK504			
58040	08:35	2018-10-19	\N	Ryanair	Milan, Italy - Orio al Serio International Airport	FR2992			
58041	08:50	2018-10-19	\N	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	DY932			
58042	08:50	2018-10-19	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1125			
58043	08:50	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK419			
58044	08:55	2018-10-19	\N	Swiss	Zurich, Switzerland - Zurich Airport	LX1266			
58045	09:00	2018-10-19	\N	Air France	Paris, France - Charles de Gaulle Airport	AF1750			
58046	09:00	2018-10-19	\N	Austrian Airlines	Vienna, Austria - Vienna International Airport	OS301			
58047	09:00	2018-10-19	\N	SAS	Berlin, Germany - Tegel Airport	SK1674			
58048	09:10	2018-10-19	\N	Lufthansa	Frankfurt, Germany - Frankfurt Airport	LH824			
58049	09:15	2018-10-19	\N	Norwegian	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	D82900			
58050	09:15	2018-10-19	\N	easyJet	Milan, Italy - Milano Malpensa Airport	EZY2653			
58051	09:20	2018-10-19	\N	Danish Air Transport	Bornholm, Denmark - Bornholm Airport	DX035			
58052	09:25	2018-10-19	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83083			
58053	09:40	2018-10-19	\N	Norwegian	Rome, Italy - Leonardo da Vinci-Fiumicino Airport	D81020			
58054	09:45	2018-10-19	\N	LOT Polish Airlines	Warsaw, Poland - Frederic Chopin Airport	LO463			
58055	09:45	2018-10-19	\N	SAS	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SK500			
58056	09:45	2018-10-19	\N	Turkish Airlines	Istanbul, Turkey - Istanbul Ataturk Airport	TK1783			
58057	09:50	2018-10-19	\N	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	D83195			
58058	09:50	2018-10-19	\N	Norwegian	Berlin, Germany - Schonefeld Airport	D83301			
58059	09:55	2018-10-19	\N	British Airways	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	BA812			
58060	10:05	2018-10-19	\N	Aegean Airlines	Kalamata, Greece - Kalamata Airport	A3408			
58061	10:10	2018-10-19	\N	SAS	Malaga, Spain - Malaga Airport	SK6204			
58062	10:15	2018-10-19	\N	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	D83222			
58063	10:15	2018-10-19	\N	Norwegian	Riga, Latvia - Riga International Airport	D83321			
58064	10:20	2018-10-19	\N	Air Canada	Toronto, Canada - Pearson International Airport	AC882			
58065	10:20	2018-10-19	\N	easyJet	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	EZY8265			
58066	10:20	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK403			
58067	10:20	2018-10-19	\N	SAS	Gothenburg, Sweden - Goteborg Landvetter Airport	SK443			
58068	10:25	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK455			
58069	10:30	2018-10-19	\N	Croatia Airlines	Zagreb, Croatia - Zagreb International Airport	OU480			
58070	10:30	2018-10-19	\N	SAS	Gdansk, Poland - Gdansk Lech Walesa Airport	SK756			
58071	10:35	2018-10-19	\N	Norwegian	Malaga, Spain - Malaga Airport	D85070			
58072	10:35	2018-10-19	\N	SAS	Hamburg, Germany - Hamburg Airport	SK646			
58073	10:40	2018-10-19	\N	Aegean Airlines	Athens, Greece - Eleftherios Venizelos International Airport	A3750			
58074	10:40	2018-10-19	\N	Vueling	Malaga, Spain - Malaga Airport	VY1876			
58075	10:45	2018-10-19	\N	Norwegian	Palma Mallorca, Spain - Palma de Mallorca Airport	D86670			
58076	10:50	2018-10-19	\N	Danish Air Transport	Karup, Denmark - Midtjyllands Airport	DX077			
58077	10:50	2018-10-19	\N	SAS	Frankfurt, Germany - Frankfurt Airport	SK640			
58078	11:00	2018-10-19	\N	SAS	Stavanger, Norway - Stavanger Airport Sola	SK1875			
58079	11:00	2018-10-19	\N	SAS	Hanover, Germany - Hannover Airport	SK670			
58080	11:05	2018-10-19	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1127			
58081	11:05	2018-10-19	\N	Brussels Airlines	Brussels, Belgium - Brussels Airport	SN2257			
58082	11:10	2018-10-19	\N	SAS	Aalborg, Denmark - Aalborg Airport	SK1208			
58083	11:10	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1419			
58084	11:10	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1455			
58085	11:10	2018-10-19	\N	SAS	Warsaw, Poland - Frederic Chopin Airport	SK752			
58086	11:20	2018-10-19	\N	Lufthansa	Frankfurt, Germany - Frankfurt Airport	LH826			
58087	11:20	2018-10-19	\N	SAS	Bergen, Norway - Bergen Airport	SK2865			
58088	11:20	2018-10-19	\N	SAS	Munich, Germany - Franz Josef Strauss Airport	SK662			
58089	11:25	2018-10-19	\N	Air France	Paris, France - Charles de Gaulle Airport	AF1150			
58090	11:25	2018-10-19	\N	Atlantic Airways	Faroe Islands, Faroe Islands - Vagar Airport	RC450			
58091	11:30	2018-10-19	\N	SAS	Billund, Denmark - Billund Airport	SK1282			
58092	11:30	2018-10-19	\N	SAS	Dusseldorf, Germany - Dusseldorf International Airport	SK1630			
58093	11:35	2018-10-19	\N	Norwegian	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	D82902			
58094	11:35	2018-10-19	\N	SAS	Aarhus, Denmark - Aarhus Airport	SK1246			
58095	11:35	2018-10-19	\N	SAS	Vilnius, Lithuania - Vilnius International Airport	SK745			
58096	11:35	2018-10-19	\N	TAP Portugal	Lisbon, Portugal - Lisbon Portela Airport	TP754			
58097	11:45	2018-10-19	\N	Ryanair	London, United Kingdom of Great Britain and Northern Ireland - Stansted Airport	FR7384			
58098	11:45	2018-10-19	\N	WOW Air	Reykjavik, Iceland - Keflavik International Airport	WW902			
58099	11:50	2018-10-19	\N	easyJet	Geneva, Switzerland - Geneve Airport	EZS1465			
58100	11:50	2018-10-19	\N	SAS	Amsterdam, Netherlands - Amsterdam Airport Schiphol	SK552			
58101	11:55	2018-10-19	\N	easyJet	Berlin, Germany - Tegel Airport	EZY5683			
58102	11:55	2018-10-19	\N	SAS	Helsinki, Finland - Helsinki-Vantaa Airport	SK1709			
58103	12:00	2018-10-19	\N	SAS	Brussels, Belgium - Brussels Airport	SK594			
58104	12:00	2018-10-19	\N	SAS	Zurich, Switzerland - Zurich Airport	SK602			
58105	12:05	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1421			
58106	12:05	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1467			
58107	12:10	2018-10-19	\N	Norwegian	Fort Lauderdale, United States of America - Fort Lauderdale-Hollywood International Airport	DY7042			
58108	12:10	2018-10-19	\N	Ryanair	Alicante, Spain - Alicante-Elche Airport	FR4019			
58109	12:10	2018-10-19	\N	Aeroflot	Moscow, Russian Federation - Sheremetyevo International Airport	SU2658			
58110	12:20	2018-10-19	\N	Lufthansa	Munich, Germany - Franz Josef Strauss Airport	LH2442			
58111	12:35	2018-10-19	\N	SAS	Bologna, Italy - Guglielmo Marconi Airport	SK2684			
58112	12:40	2018-10-19	\N	Finnair	Helsinki, Finland - Helsinki-Vantaa Airport	AY953			
58113	12:40	2018-10-19	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83087			
58114	12:40	2018-10-19	\N	SAS	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SK502			
58115	12:50	2018-10-19	\N	easyJet	Paris, France - Charles de Gaulle Airport	EZY3825			
58116	12:50	2018-10-19	\N	SAS	Birmingham, United Kingdom of Great Britain and Northern Ireland - Birmingham International Airport	SK2534			
58117	12:50	2018-10-19	\N	SAS	Paris, France - Charles de Gaulle Airport	SK566			
58118	12:50	2018-10-19	\N	Vueling	Barcelona, Spain - Barcelona-El Prat Airport	VY1870			
58119	12:55	2018-10-19	\N	British Airways	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	BA814			
58120	12:55	2018-10-19	\N	Icelandair	Reykjavik, Iceland - Keflavik International Airport	FI204			
58121	12:55	2018-10-19	\N	SAS	Palma Mallorca, Spain - Palma de Mallorca Airport	SK2588			
58122	13:00	2018-10-19	\N	UKRAINE INTERNATIONAL AIRLINES	Kiev	PS161			
58123	13:05	2018-10-19	\N	SAS	Geneva, Switzerland - Geneve Airport	SK1610			
58124	13:10	2018-10-19	\N	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	D83197			
58125	13:10	2018-10-19	\N	Norwegian	Budapest, Hungary - Budapest Ferenc Liszt International Airport	D83551			
58126	13:10	2018-10-19	\N	Pegasus Airlines	Istanbul, Turkey - Sabiha Gokcen International Airport	PC1071			
58127	13:10	2018-10-19	\N	SAS	Newark, United States of America - Newark Liberty International Airport	SK902			
58128	13:15	2018-10-19	\N	Norwegian	Nice, France - Cote D'Azur Airport	D83645			
58129	13:15	2018-10-19	\N	Emirates	Dubai, United Arab Emirates - Dubai Airport	EK151			
58130	13:15	2018-10-19	\N	SAS	San Francisco, United States of America - San Francisco International Airport	SK936			
58131	13:20	2018-10-19	\N	Air Baltic	Riga, Latvia - Riga International Airport	BT135			
58132	13:20	2018-10-19	\N	SAS	Chicago, United States of America - O'Hare International Airport	SK944			
58133	13:25	2018-10-19	\N	Norwegian	Barcelona, Spain - Barcelona-El Prat Airport	D83655			
58134	13:25	2018-10-19	\N	SAS	Milan, Italy - Milano Malpensa Airport	SK1686			
58135	13:30	2018-10-19	\N	easyJet	Bristol, United Kingdom of Great Britain and Northern Ireland - Bristol Airport	EZY6135			
58136	13:30	2018-10-19	\N	Qatar Airways	Doha, Qatar - Hamad International Airport	QR159			
58137	13:35	2018-10-19	\N	SAS	Berlin, Germany - Tegel Airport	SK1676			
58138	13:35	2018-10-19	\N	SAS	Dublin, Ireland - Dublin Airport	SK538			
58139	13:45	2018-10-19	\N	Ryanair	Rome, Italy - Ciampino-G. B. Pastine International Airport	FR407			
58140	13:50	2018-10-19	\N	SAS	Kos, Greece - Kos Airport	SK7720			
58141	13:55	2018-10-19	\N	SAS	Aarhus, Denmark - Aarhus Airport	SK1248			
58142	13:55	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK405			
58143	14:00	2018-10-19	\N	Iraqi Airways	Baghdad, Iraq - Baghdad International Airport	IA281			
58144	14:00	2018-10-19	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1129			
58145	14:00	2018-10-19	\N	Wizz Air	Sibiu	W63801			
58146	14:05	2018-10-19	\N	Norwegian	Malaga, Spain - Malaga Airport	D83671			
58147	14:05	2018-10-19	\N	Swiss	Zurich, Switzerland - Zurich Airport	LX1270			
58148	14:05	2018-10-19	\N	SAS	Wroclaw, Poland - Wroclaw Airport	SK764			
58149	14:10	2018-10-19	\N	Lufthansa	Frankfurt, Germany - Frankfurt Airport	LH828			
58150	14:10	2018-10-19	\N	SAS	Hamburg, Germany - Hamburg Airport	SK1648			
58151	14:15	2018-10-19	\N	Air France	Paris, France - Charles de Gaulle Airport	AF1850			
58152	14:15	2018-10-19	\N	Danish Air Transport	Bornholm, Denmark - Bornholm Airport	DX041			
58153	14:20	2018-10-19	\N	Norwegian	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	D82906			
58154	14:30	2018-10-19	\N	Ryanair	London, United Kingdom of Great Britain and Northern Ireland - London Luton Airport	FR7408			
58155	14:35	2018-10-19	\N	Iberia	Madrid, Spain - Adolfo Suarez Madrid-Barajas Airport	IB3730			
58156	14:35	2018-10-19	\N	SAS	Chania, Greece - Chania International Airport	SK7724			
58157	14:40	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1423			
58158	14:45	2018-10-19	\N	Norwegian	Palma Mallorca, Spain - Palma de Mallorca Airport	D83669			
58159	14:45	2018-10-19	\N	Luxair	Luxembourg, Luxembourg - Luxembourg Airport	LG5431			
58160	14:45	2018-10-19	\N	Egyptair	Cairo, Egypt - Cairo International Airport	MS759			
58161	14:45	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1469			
58162	14:45	2018-10-19	\N	SAS	Stavanger, Norway - Stavanger Airport Sola	SK1869			
58163	14:55	2018-10-19	\N	Ryanair	Dublin, Ireland - Dublin Airport	FR632			
58164	14:55	2018-10-19	\N	SAS	Palanga, Lithuania - Palanga International Airport	SK2747			
58165	15:00	2018-10-19	\N	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	DY940			
58166	15:10	2018-10-19	\N	Norwegian	Helsinki, Finland - Helsinki-Vantaa Airport	D8264			
58167	15:15	2018-10-19	\N	SAS	Lisbon, Portugal - Lisbon Portela Airport	SK2802			
58168	15:15	2018-10-19	\N	SAS	Nice, France - Cote D'Azur Airport	SK794			
58169	15:15	2018-10-19	\N	Vueling	Paris, France - Paris Orly Airport	VY8634			
58170	15:25	2018-10-19	\N	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	DY4161			
58171	15:25	2018-10-19	\N	Ryanair	Cologne, Germany - Cologne Bonn Airport	FR409			
58172	15:25	2018-10-19	\N	SAS	Poznan, Poland - Poznan Airport	SK1756			
58173	15:25	2018-10-19	\N	SAS	Manchester, United Kingdom of Great Britain and Northern Ireland - Manchester Airport	SK540			
58174	15:30	2018-10-19	\N	Norwegian	Barcelona, Spain - Barcelona-El Prat Airport	D83657			
58175	15:30	2018-10-19	\N	easyJet	Manchester, United Kingdom of Great Britain and Northern Ireland - Manchester Airport	EZY1985			
58176	15:30	2018-10-19	\N	SAS	Tokyo, Japan - Narita International Airport	SK984			
58177	15:35	2018-10-19	\N	Norwegian	Dublin, Ireland - Dublin Airport	D83607			
58178	15:35	2018-10-19	\N	SAS	Gdansk, Poland - Gdansk Lech Walesa Airport	SK760			
58179	15:40	2018-10-19	\N	British Airways	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	BA816			
58180	15:40	2018-10-19	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1131			
58181	15:45	2018-10-19	\N	Norwegian	Nice, France - Cote D'Azur Airport	D83641			
58182	15:50	2018-10-19	\N	SAS	Athens, Greece - Eleftherios Venizelos International Airport	SK778			
58183	16:05	2018-10-19	\N	Norwegian	Montpellier, France - Montpellier Mediterranee Airport	D83629			
58184	16:05	2018-10-19	\N	SAS	Gothenburg, Sweden - Goteborg Landvetter Airport	SK431			
58185	16:10	2018-10-19	\N	Danish Air Transport	Bornholm, Denmark - Bornholm Airport	DX045			
58186	16:10	2018-10-19	\N	SAS	Brussels, Belgium - Brussels Airport	SK1592			
58187	16:10	2018-10-19	\N	SAS	Faroe Islands, Faroe Islands - Vagar Airport	SK1778			
58188	16:15	2018-10-19	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83089			
58189	16:15	2018-10-19	\N	SAS	Amsterdam, Netherlands - Amsterdam Airport Schiphol	SK548			
58190	16:20	2018-10-19	\N	Finnair	Helsinki, Finland - Helsinki-Vantaa Airport	AY955			
58191	16:20	2018-10-19	\N	easyJet	Berlin, Germany - Schonefeld Airport	EZY4555			
58192	16:20	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1471			
58193	16:20	2018-10-19	\N	Widerøe	Sandefjord, Norway - Torp Sandefjord Airport	WF311			
58194	16:25	2018-10-19	\N	SAS	Venice, Italy - Venice Marco Polo Airport	SK2692			
58195	16:25	2018-10-19	\N	Vueling	Barcelona, Spain - Barcelona-El Prat Airport	VY1872			
58196	16:30	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1407			
58197	16:30	2018-10-19	\N	GERMANIA	Pristina, Kosovo - Pristina International Airport	ST3139			
58198	16:35	2018-10-19	\N	easyJet	Basel, Switzerland/Mulhouse, France - EuroAirport Swiss	EZS1151			
58199	16:35	2018-10-19	\N	SAS	Aarhus, Denmark - Aarhus Airport	SK1258			
58200	16:35	2018-10-19	\N	SAS	Billund, Denmark - Billund Airport	SK1286			
58201	16:35	2018-10-19	\N	SAS	Vilnius, Lithuania - Vilnius International Airport	SK1743			
58202	16:40	2018-10-19	\N	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	D83209			
58203	16:40	2018-10-19	\N	Atlantic Airways	Faroe Islands, Faroe Islands - Vagar Airport	RC454			
58204	16:40	2018-10-19	\N	SAS	Aalborg, Denmark - Aalborg Airport	SK1210			
58205	16:45	2018-10-19	\N	easyJet	Edinburgh, United Kingdom of Great Britain and Northern Ireland - Edinburgh Airport	EZY6983			
58206	16:45	2018-10-19	\N	Ryanair	Bologna, Italy - Guglielmo Marconi Airport	FR2676			
58207	16:55	2018-10-19	\N	easyJet	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	EZY8267			
58208	16:55	2018-10-19	\N	Austrian Airlines	Vienna, Austria - Vienna International Airport	OS303			
58209	16:55	2018-10-19	\N	SAS	Frankfurt, Germany - Frankfurt Airport	SK676			
58210	17:00	2018-10-19	\N	British Airways	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	BA818			
58211	17:00	2018-10-19	\N	SAS	Tallinn, Estonia - Tallinn Airport	SK1787			
58212	17:00	2018-10-19	\N	SAS	Gothenburg, Sweden - Goteborg Landvetter Airport	SK439			
58213	17:00	2018-10-19	\N	SAS	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SK504			
58214	17:00	2018-10-19	\N	SAS	Hamburg, Germany - Hamburg Airport	SK650			
58215	17:05	2018-10-19	\N	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	D83226			
58216	17:05	2018-10-19	\N	SAS	Rome, Italy - Leonardo da Vinci-Fiumicino Airport	SK682			
58217	17:10	2018-10-19	\N	Danish Air Transport	Karup, Denmark - Midtjyllands Airport	DX083			
58218	17:10	2018-10-19	\N	SAS	Stavanger, Norway - Stavanger Airport Sola	SK1877			
58219	17:15	2018-10-19	\N	Air Alsie	Sonderborg, Denmark - Sonderborg Airport	6I107			
58220	17:15	2018-10-19	\N	Royal Air Maroc	Casablanca, Morocco - Mohamed V International Airport	AT222			
58221	17:15	2018-10-19	\N	Ryanair	London, United Kingdom of Great Britain and Northern Ireland - Stansted Airport	FR7382			
58222	17:15	2018-10-19	\N	Widerøe	Kristiansand, Norway - Kristiansand Airport	WF268			
58223	17:15	2018-10-19	\N	WOW Air	Reykjavik, Iceland - Keflavik International Airport	WW904			
58224	17:20	2018-10-19	\N	SAS	Bergen, Norway - Bergen Airport	SK2873			
58225	17:20	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK459			
58226	17:25	2018-10-19	\N	SAS	Dusseldorf, Germany - Dusseldorf International Airport	SK1622			
58227	17:25	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK407			
58228	17:30	2018-10-19	\N	Brussels Airlines	Brussels, Belgium - Brussels Airport	SN2259			
58229	17:40	2018-10-19	\N	Middle East Airlines	Beirut, Lebanon - Beirut-Rafic Hariri International Airport	ME225			
58230	17:40	2018-10-19	\N	Atlantic Airways	Faroe Islands, Faroe Islands - Vagar Airport	RC456			
58231	17:45	2018-10-19	\N	Norwegian	Edinburgh, United Kingdom of Great Britain and Northern Ireland - Edinburgh Airport	D83503			
58232	17:45	2018-10-19	\N	SmartWings / Travel Service	Chania, Greece - Chania International Airport	QS4484			
58233	17:45	2018-10-19	\N	Turkish Airlines	Istanbul, Turkey - Istanbul Ataturk Airport	TK1785			
58234	17:55	2018-10-19	\N	SAS	Helsinki, Finland - Helsinki-Vantaa Airport	SK1713			
58235	18:00	2018-10-19	\N	Icelandair	Reykjavik, Iceland - Keflavik International Airport	FI212			
58236	18:10	2018-10-19	\N	Norwegian	Madrid, Spain - Adolfo Suarez Madrid-Barajas Airport	D86112			
58237	18:10	2018-10-19	\N	Lufthansa	Munich, Germany - Franz Josef Strauss Airport	LH2444			
58238	18:15	2018-10-19	\N	Blue Air	Bucharest, Romania - Bucharest Henri Coanda International Airport	0B153			
58239	18:15	2018-10-19	\N	Air Europa	Palma Mallorca, Spain - Palma de Mallorca Airport	AEA863			
58240	18:15	2018-10-19	\N	Norwegian	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	D82908			
58241	18:15	2018-10-19	\N	Lufthansa	Frankfurt, Germany - Frankfurt Airport	LH830			
58242	18:20	2018-10-19	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1133			
58243	18:20	2018-10-19	\N	SAS	Aalborg, Denmark - Aalborg Airport	SK1218			
58244	18:25	2018-10-19	\N	Finnair	Helsinki, Finland - Helsinki-Vantaa Airport	AY959			
58245	18:25	2018-10-19	\N	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	D8230			
58246	18:25	2018-10-19	\N	Danish Air Transport	Bornholm, Denmark - Bornholm Airport	DX049			
58247	18:25	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1429			
58248	18:25	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1465			
58249	18:30	2018-10-19	\N	Air France	Paris, France - Charles de Gaulle Airport	AF1050			
58250	18:30	2018-10-19	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83093			
58251	18:30	2018-10-19	\N	Ryanair	Malaga, Spain - Malaga Airport	FR4047			
58252	18:35	2018-10-19	\N	Norwegian	Prague, Czechia - Vaclav Havel Airport Prague	D83581			
58253	18:35	2018-10-19	\N	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	DY948			
58254	18:40	2018-10-19	\N	Norwegian	Berlin, Germany - Schonefeld Airport	D83303			
58255	18:40	2018-10-19	\N	Danish Air Transport	Lanzarote, Spain - Lanzarote Airport	DX757			
58256	18:45	2018-10-19	\N	Air India	Delhi, India - Indira Gandhi International Airport	AI157			
58257	18:45	2018-10-19	\N	Pegasus Airlines	Antalya, Turkey - Antalya Airport	PC5507			
58258	18:45	2018-10-19	\N	SAS	Beijing, China - Beijing Capital International Airport	SK996			
58259	18:45	2018-10-19	\N	SAS	Shanghai, China - Shanghai Pudong International Airport	SK998			
58260	18:45	2018-10-19	\N	Wizz Air	Kiev, Ukraine - Kyiv International Airport	W66223			
58261	18:50	2018-10-19	\N	Thomas Cook Airlines	Las Palmas, Spain - Gran Canaria Airport	DK1159			
58262	18:55	2018-10-19	\N	Adria Airways	Ljubljana, Slovenia - Ljubljana Joze Pucnik Airport	JP510			
58263	19:00	2018-10-19	\N	Air Baltic	Riga, Latvia - Riga International Airport	BT139			
58264	19:00	2018-10-19	\N	LOT Polish Airlines	Warsaw, Poland - Frederic Chopin Airport	LO461			
58265	19:00	2018-10-19	\N	SAS	Brussels, Belgium - Brussels Airport	SK1594			
58266	19:05	2018-10-19	\N	LOT Polish Airlines	Tallinn, Estonia - Tallinn Airport	LO8145			
58267	19:05	2018-10-19	\N	Czech Airlines	Prague, Czechia - Vaclav Havel Airport Prague	OK508			
58268	19:10	2018-10-19	\N	EUROWINGS Luftverkehrs AG	Dusseldorf, Germany - Dusseldorf International Airport	EW9194			
58269	19:10	2018-10-19	\N	Swiss	Zurich, Switzerland - Zurich Airport	LX1272			
58270	19:10	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK461			
58271	19:15	2018-10-19	\N	Danish Air Transport	Sharm el Sheikh, Egypt - Sharm El Sheikh Airport	DX319			
58272	19:20	2018-10-19	\N	Austrian Airlines	Vienna, Austria - Vienna International Airport	OS305			
58273	19:20	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK409			
58274	19:20	2018-10-19	\N	SAS	Gothenburg, Sweden - Goteborg Landvetter Airport	SK449			
58275	19:25	2018-10-19	\N	British Airways	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	BA820			
58276	19:25	2018-10-19	\N	Ryanair	Budapest, Hungary - Budapest Ferenc Liszt International Airport	FR605			
58277	19:25	2018-10-19	\N	SAS	Warsaw, Poland - Frederic Chopin Airport	SK2752			
58278	19:30	2018-10-19	\N	LOT Polish Airlines	Groningen, Netherlands - Eelde Airport	LO8846			
58279	19:30	2018-10-19	\N	SAS	Stavanger, Norway - Stavanger Airport Sola	SK1879			
58280	19:30	2018-10-19	\N	SAS	Bergen, Norway - Bergen Airport	SK2869			
58281	19:30	2018-10-19	\N	SAS	Gdansk, Poland - Gdansk Lech Walesa Airport	SK758			
58282	19:35	2018-10-19	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83095			
58283	19:35	2018-10-19	\N	Widerøe	Sandefjord, Norway - Torp Sandefjord Airport	WF313			
58284	19:45	2018-10-19	\N	Norwegian	Rome, Italy - Leonardo da Vinci-Fiumicino Airport	D81022			
58285	19:45	2018-10-19	\N	Norwegian	Palma Mallorca, Spain - Palma de Mallorca Airport	D86672			
58286	19:45	2018-10-19	\N	Ryanair	Madrid, Spain - Adolfo Suarez Madrid-Barajas Airport	FR607			
58287	19:45	2018-10-19	\N	Luxair	Luxembourg, Luxembourg - Luxembourg Airport	LG5435			
58288	19:50	2018-10-19	\N	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	D83240			
58289	19:50	2018-10-19	\N	Norwegian	Amsterdam, Netherlands - Amsterdam Airport Schiphol	D83541			
58290	19:50	2018-10-19	\N	Norwegian	Barcelona, Spain - Barcelona-El Prat Airport	D85574			
58291	19:55	2018-10-19	\N	SAS	Munich, Germany - Franz Josef Strauss Airport	SK2658			
58292	19:55	2018-10-19	\N	SAS	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SK506			
58293	20:00	2018-10-19	\N	Norwegian	Helsinki, Finland - Helsinki-Vantaa Airport	D8262			
58294	20:00	2018-10-19	\N	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	D83213			
58295	20:00	2018-10-19	\N	Norwegian	Alicante, Spain - Alicante-Elche Airport	D85374			
58296	20:00	2018-10-19	\N	Air Greenland	Kangerlussuaq, Greenland - Kangerlussuaq Airport	GL780			
58297	20:00	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1477			
58298	20:00	2018-10-19	\N	SAS	Malaga, Spain - Malaga Airport	SK6202			
58299	20:05	2018-10-19	\N	easyJet	Paris, France - Charles de Gaulle Airport	EZY3827			
58300	20:05	2018-10-19	\N	SAS	Hanover, Germany - Hannover Airport	SK1668			
58301	20:05	2018-10-19	\N	SAS	Dusseldorf, Germany - Dusseldorf International Airport	SK628			
58302	20:10	2018-10-19	\N	Ryanair	Porto, Portugal - Porto Airport	FR8898			
58303	20:10	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1409			
58304	20:10	2018-10-19	\N	SAS	Stuttgart, Germany - Stuttgart Airport	SK1656			
58305	20:15	2018-10-19	\N	Thomas Cook Airlines	Las Palmas, Spain - Gran Canaria Airport	DK1131			
58306	20:15	2018-10-19	\N	Air Serbia	Belgrade, Serbia - Belgrad Nikola Tesla Airport	JU404			
58307	20:15	2018-10-19	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1135			
58308	20:15	2018-10-19	\N	SAS	Hamburg, Germany - Hamburg Airport	SK652			
58309	20:20	2018-10-19	\N	Thomas Cook Airlines	Lanzarote, Spain - Lanzarote Airport	DK1105			
58310	20:20	2018-10-19	\N	easyJet	Geneva, Switzerland - Geneve Airport	EZS1469			
58311	20:20	2018-10-19	\N	Jet Time	Lanzarote, Spain - Lanzarote Airport	JTG218			
58312	20:20	2018-10-19	\N	Widerøe	Kristiansand, Norway - Kristiansand Airport	WF278			
58313	20:25	2018-10-19	\N	Lufthansa	Munich, Germany - Franz Josef Strauss Airport	LH2438			
58314	20:30	2018-10-19	\N	easyJet	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	EZY8269			
58315	20:40	2018-10-19	\N	Ryanair	Milan, Italy - Orio al Serio International Airport	FR2990			
58316	20:50	2018-10-19	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83099			
58317	20:50	2018-10-19	\N	Jet Time	Las Palmas, Spain - Gran Canaria Airport	JTG390			
58318	20:55	2018-10-19	\N	Thomas Cook Airlines	Almeria, Spain - Almeria Airport	DK1145			
58319	20:55	2018-10-19	\N	easyJet	Berlin, Germany - Tegel Airport	EZY5687			
58320	20:55	2018-10-19	\N	Qatar Airways	Doha, Qatar - Hamad International Airport	QR163			
58321	21:05	2018-10-19	\N	easyJet	Berlin, Germany - Schonefeld Airport	EZY4557			
58322	21:05	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK463			
58323	21:05	2018-10-19	\N	Brussels Airlines	Brussels, Belgium - Brussels Airport	SN2263			
58324	21:10	2018-10-19	\N	easyJet	Milan, Italy - Milano Malpensa Airport	EZY2655			
58325	21:10	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK411			
58326	21:15	2018-10-19	\N	Lufthansa	Munich, Germany - Franz Josef Strauss Airport	LH2446			
58327	21:15	2018-10-19	\N	Pegasus Airlines	Antalya, Turkey - Antalya Airport	PC5051			
58328	21:25	2018-10-19	\N	Norwegian	Bergen, Norway - Bergen Airport	DY968			
58329	21:25	2018-10-19	\N	easyJet	Manchester, United Kingdom of Great Britain and Northern Ireland - Manchester Airport	EZY1987			
58330	21:25	2018-10-19	\N	SAS	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SK1516			
58331	21:25	2018-10-19	\N	Aeroflot	Moscow, Russian Federation - Sheremetyevo International Airport	SU2496			
58332	21:30	2018-10-19	\N	SAS	Paris, France - Charles de Gaulle Airport	SK1560			
58333	21:35	2018-10-19	\N	Danish Air Transport	Bornholm, Denmark - Bornholm Airport	DX053			
58334	21:35	2018-10-19	\N	Ryanair	Edinburgh, United Kingdom of Great Britain and Northern Ireland - Edinburgh Airport	FR2674			
58335	21:35	2018-10-19	\N	SAS	Helsinki, Finland - Helsinki-Vantaa Airport	SK1717			
58336	21:50	2018-10-19	\N	Ryanair	London, United Kingdom of Great Britain and Northern Ireland - Stansted Airport	FR7386			
58337	21:55	2018-10-19	\N	British Airways	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	BA822			
58338	21:55	2018-10-19	\N	SAS	Frankfurt, Germany - Frankfurt Airport	SK1636			
58339	22:00	2018-10-19	\N	LOT Polish Airlines	Warsaw, Poland - Frederic Chopin Airport	LO459			
58340	22:00	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1427			
58341	22:00	2018-10-19	\N	SAS	Brussels, Belgium - Brussels Airport	SK2590			
58342	22:00	2018-10-19	\N	Turkish Airlines	Istanbul, Turkey - Istanbul Ataturk Airport	TK1787			
58343	22:05	2018-10-19	\N	Austrian Airlines	Vienna, Austria - Vienna International Airport	OS307			
58344	22:05	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1475			
58345	22:05	2018-10-19	\N	SAS	Aberdeen, United Kingdom of Great Britain and Northern Ireland - Aberdeen International Airport	SK1522			
58346	22:05	2018-10-19	\N	SAS	Bologna, Italy - Guglielmo Marconi Airport	SK2686			
58347	22:05	2018-10-19	\N	SAS	Milan, Italy - Milano Malpensa Airport	SK688			
58348	22:10	2018-10-19	\N	SAS	Birmingham, United Kingdom of Great Britain and Northern Ireland - Birmingham International Airport	SK2536			
58349	22:10	2018-10-19	\N	SAS	Zurich, Switzerland - Zurich Airport	SK610			
58350	22:10	2018-10-19	\N	SAS	Geneva, Switzerland - Geneve Airport	SK618			
58351	22:10	2018-10-19	\N	SAS	Rome, Italy - Leonardo da Vinci-Fiumicino Airport	SK692			
58352	22:20	2018-10-19	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83097			
58353	22:30	2018-10-19	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1139			
58354	22:35	2018-10-19	\N	Brussels Airlines	Brussels, Belgium - Brussels Airport	SN2265			
58355	22:40	2018-10-19	\N	TUIfly	Palma Mallorca, Spain - Palma de Mallorca Airport	BLX162			
58356	22:40	2018-10-19	\N	Lufthansa	Frankfurt, Germany - Frankfurt Airport	LH832			
58357	22:50	2018-10-19	\N	Norwegian	Alicante, Spain - Alicante-Elche Airport	D83663			
58358	22:50	2018-10-19	\N	TAP Portugal	Lisbon, Portugal - Lisbon Portela Airport	TP752			
58359	22:55	2018-10-19	\N	Air France	Paris, France - Charles de Gaulle Airport	AF1350			
58360	23:00	2018-10-19	\N	SAS	Prague, Czechia - Vaclav Havel Airport Prague	SK768			
58361	23:05	2018-10-19	\N	SAS	Amsterdam, Netherlands - Amsterdam Airport Schiphol	SK554			
58362	23:10	2018-10-19	\N	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	D83242			
58363	23:20	2018-10-19	\N	Norwegian	Budapest, Hungary - Budapest Ferenc Liszt International Airport	D83553			
58364	23:20	2018-10-19	\N	SAS	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SK1508			
58365	23:30	2018-10-19	\N	Norwegian	Paris, France - Paris Orly Airport	D83639			
58366	23:35	2018-10-19	\N	Norwegian	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	D82914			
58367	23:35	2018-10-19	\N	Norwegian	Nice, France - Cote D'Azur Airport	D83643			
58368	23:40	2018-10-19	\N	SAS	Munich, Germany - Franz Josef Strauss Airport	SK1660			
58369	23:50	2018-10-19	\N	Norwegian	Krakow, Poland - J. Paul II International Airport Krakow-Balice	D83563			
58370	23:55	2018-10-19	\N	Norwegian	Malta, Malta - Malta International Airport	D83531			
\.


--
-- Data for Name: departures; Type: TABLE DATA; Schema: public; Owner: akublemiszewski
--

COPY public.departures (id, "time", date, expected, airline, destination, flight_no, gate, terminal, status) FROM stdin;
55859	16:40	2018-10-18	18:00	Norwegian	Aalborg, Denmark - Aalborg Airport	D83092			Cancelled
55860	18:15	2018-10-18	\N	SAS	Frankfurt, Germany - Frankfurt Airport	SK1635	B19		Closed
55861	18:15	2018-10-18	\N	SAS	Aberdeen, United Kingdom of Great Britain and Northern Ireland - Aberdeen International Airport	SK1521	C18		Closed
55862	18:15	2018-10-18	\N	Brussels Airlines	Brussels, Belgium - Brussels Airport	SN2260	A4		Closed
55863	18:20	2018-10-18	18:45	Norwegian	Nice, France - Cote D'Azur Airport	D83642	D3		To gate
55864	18:20	2018-10-18	\N	SAS	Brussels, Belgium - Brussels Airport	SK597	A6		Closed
55865	18:30	2018-10-18	\N	easyJet	Geneva, Switzerland - Geneve Airport	EZS1470	F7		Closed
55866	18:30	2018-10-18	\N	SAS	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SK1507	D104		Boarding
55867	18:35	2018-10-18	\N	SAS	Newark, United States of America - Newark Liberty International Airport	SK901	C32		Closing
55868	18:40	2018-10-18	\N	Turkish Airlines	Istanbul, Turkey - Istanbul Ataturk Airport	TK1786	C30		Boarding
55869	18:40	2018-10-18	\N	Atlantic Airways	Faroe Islands, Faroe Islands - Vagar Airport	RC459	A14		To gate
55870	18:40	2018-10-18	\N	SAS	Shanghai, China - Shanghai Pudong International Airport	SK997	C37		Boarding
55871	18:45	2018-10-18	19:05	SAS	Trondheim, Norway - Trondheim Airport Vaernes	SK2880	A11	T3	
55872	18:55	2018-10-18	\N	Norwegian	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	D82909	C26	T2	Boarding
55873	19:00	2018-10-18	\N	Danish Air Transport	Bornholm, Denmark - Bornholm Airport	DX050	A7	T3	
55874	19:00	2018-10-18	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1430	B8	T3	
55875	19:00	2018-10-18	18:50	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	D8231	A20	T2	To gate
55876	19:00	2018-10-18	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83098	A15		To gate
55877	19:05	2018-10-18	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1470	B6	T3	
55878	19:05	2018-10-18	\N	Lufthansa	Munich, Germany - Franz Josef Strauss Airport	LH2445	B15	T3	
55879	19:05	2018-10-18	20:20	Norwegian	Paris, France - Paris Orly Airport	D83638	A4	T2	
55880	19:10	2018-10-18	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1134	A21	T2	
55881	19:10	2018-10-18	\N	Lufthansa	Frankfurt, Germany - Frankfurt Airport	LH831	B10	T3	
55882	19:10	2018-10-18	\N	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	DY949	A22	T2	
55883	19:15	2018-10-18	\N	Norwegian	Las Palmas, Spain - Gran Canaria Airport	D85923	A18	T2	
55884	19:15	2018-10-18	\N	Norwegian	Budapest, Hungary - Budapest Ferenc Liszt International Airport	D83552	A8	T2	
55885	19:15	2018-10-18	19:25	Air France	Paris, France - Charles de Gaulle Airport	AF1051	A12	T2	
55886	19:35	2018-10-18	20:05	Norwegian	Prague, Czechia - Vaclav Havel Airport Prague	D83582		T2	
55887	19:35	2018-10-18	\N	Air Baltic	Riga, Latvia - Riga International Airport	BT140	C4	T3	
55888	19:45	2018-10-18	\N	Icelandair	Reykjavik, Iceland - Keflavik International Airport	FI213	B7	T3	
55889	19:50	2018-10-18	\N	Ryanair	Budapest, Hungary - Budapest Ferenc Liszt International Airport	FR604		T2	
55890	19:50	2018-10-18	\N	Czech Airlines	Prague, Czechia - Vaclav Havel Airport Prague	OK509		T2	
55891	19:50	2018-10-18	\N	LOT Polish Airlines	Warsaw, Poland - Frederic Chopin Airport	LO462		T2	
55892	19:55	2018-10-18	\N	SAS	Munich, Germany - Franz Josef Strauss Airport	SK659		T3	
55893	19:55	2018-10-18	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK414	B9	T3	
55894	20:00	2018-10-18	\N	Swiss	Zurich, Switzerland - Zurich Airport	LX1273		T2	
55895	20:05	2018-10-18	\N	Austrian Airlines	Vienna, Austria - Vienna International Airport	OS306		T2	
55896	20:05	2018-10-18	\N	Norwegian	Malaga, Spain - Malaga Airport	D85073		T2	
55897	20:05	2018-10-18	\N	SAS	Amsterdam, Netherlands - Amsterdam Airport Schiphol	SK549		T3	
55898	20:10	2018-10-18	\N	Norwegian	Madrid, Spain - Adolfo Suarez Madrid-Barajas Airport	D86113		T2	
55899	20:10	2018-10-18	\N	SAS	Manchester, United Kingdom of Great Britain and Northern Ireland - Manchester Airport	SK1545		T3	
55900	20:10	2018-10-18	\N	SAS	Berlin, Germany - Tegel Airport	SK1677	B19	T3	
55901	20:15	2018-10-18	\N	British Airways	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	BA821		T2	
55902	20:20	2018-10-18	\N	EUROWINGS Luftverkehrs AG	Dusseldorf, Germany - Dusseldorf International Airport	EW9195			
55903	20:20	2018-10-18	21:45	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	D83241		T2	
55904	20:20	2018-10-18	\N	Norwegian	Krakow, Poland - J. Paul II International Airport Krakow-Balice	D83562		T2	
55905	20:20	2018-10-18	\N	Finnair	Helsinki, Finland - Helsinki-Vantaa Airport	AY960	A17	T2	
55906	20:25	2018-10-18	\N	easyJet	Lyon, France - Lyon Saint-Exupery International Airport	EZY4426			
55907	20:25	2018-10-18	\N	Luxair	Luxembourg, Luxembourg - Luxembourg Airport	LG5436			
55908	20:30	2018-10-18	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83096			
55909	20:30	2018-10-18	\N	Norwegian	Rome, Italy - Leonardo da Vinci-Fiumicino Airport	D81023		T2	
55910	20:30	2018-10-18	\N	LOT Polish Airlines	Groningen, Netherlands - Eelde Airport	LO8845		T2	
55911	20:30	2018-10-18	\N	Norwegian	Palma Mallorca, Spain - Palma de Mallorca Airport	D86673	A6	T2	
55912	20:35	2018-10-18	\N	easyJet	Berlin, Germany - Tegel Airport	EZY5688			
55913	20:35	2018-10-18	\N	Norwegian	Barcelona, Spain - Barcelona-El Prat Airport	D85575		T2	
55914	20:35	2018-10-18	\N	SAS	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SK1501	C30	T3	
55915	20:40	2018-10-18	\N	Norwegian	Helsinki, Finland - Helsinki-Vantaa Airport	D8269		T2	
55916	20:45	2018-10-18	\N	Ryanair	Brussels, Belgium - Brussels S. Charleroi Airport	FR300			
55917	20:45	2018-10-18	\N	SAS	Stuttgart, Germany - Stuttgart Airport	SK667		T3	
55918	20:45	2018-10-18	\N	SAS	Dusseldorf, Germany - Dusseldorf International Airport	SK629		T3	
55919	20:45	2018-10-18	\N	LOT Polish Airlines	Tallinn, Estonia - Tallinn Airport	LO8146		T2	
55920	20:45	2018-10-18	\N	Air India	Delhi, India - Indira Gandhi International Airport	AI158	C33	T2	
55921	20:50	2018-10-18	\N	SAS	Hanover, Germany - Hannover Airport	SK1669		T3	
55922	20:50	2018-10-18	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1472		T3	
55923	20:50	2018-10-18	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1410		T3	
55924	20:50	2018-10-18	\N	SAS	Malaga, Spain - Malaga Airport	SK6201		T3	
55925	20:55	2018-10-18	\N	Ryanair	Milan, Italy - Orio al Serio International Airport	FR2989			
55926	20:55	2018-10-18	\N	SAS	Aalborg, Denmark - Aalborg Airport	SK1221			
55927	20:55	2018-10-18	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1136		T2	
55928	20:55	2018-10-18	\N	SAS	Gothenburg, Sweden - Goteborg Landvetter Airport	SK446		T3	
55929	20:55	2018-10-18	\N	SAS	Stavanger, Norway - Stavanger Airport Sola	SK1876		T3	
55930	21:00	2018-10-18	\N	easyJet	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	EZY8270			
55931	21:00	2018-10-18	\N	SAS	Billund, Denmark - Billund Airport	SK1289			
55932	21:00	2018-10-18	\N	Lufthansa	Munich, Germany - Franz Josef Strauss Airport	LH2439		T3	
55933	21:00	2018-10-18	\N	SAS	Bergen, Norway - Bergen Airport	SK2870		T3	
55934	21:00	2018-10-18	\N	SAS	Beijing, China - Beijing Capital International Airport	SK995	C28	T3	
55935	21:05	2018-10-18	\N	Ryanair	Madrid, Spain - Adolfo Suarez Madrid-Barajas Airport	FR606			
55936	21:05	2018-10-18	\N	SAS	Vilnius, Lithuania - Vilnius International Airport	SK742		T3	
55937	21:10	2018-10-18	\N	Widerøe	Sandefjord, Norway - Torp Sandefjord Airport	WF316		T3	
55938	21:10	2018-10-18	\N	SAS	Warsaw, Poland - Frederic Chopin Airport	SK2761		T3	
55939	21:15	2018-10-18	\N	easyJet	Edinburgh, United Kingdom of Great Britain and Northern Ireland - Edinburgh Airport	EZY6984			
55940	21:20	2018-10-18	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83090			
55941	21:20	2018-10-18	\N	Wizz Air	Kiev, Ukraine - Kyiv International Airport	W66224			
55942	21:35	2018-10-18	\N	easyJet	Berlin, Germany - Schonefeld Airport	EZY4558			
55943	22:15	2018-10-18	\N	SAS	Helsinki, Finland - Helsinki-Vantaa Airport	SK1720		T3	
55944	22:20	2018-10-18	\N	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	DY4172		T2	
55945	22:35	2018-10-18	\N	Qatar Airways	Doha, Qatar - Hamad International Airport	QR164			
55946	22:50	2018-10-18	\N	SAS	Aarhus, Denmark - Aarhus Airport	SK1273			
55947	22:50	2018-10-18	\N	SAS	Palanga, Lithuania - Palanga International Airport	SK2744		T3	
55948	22:50	2018-10-18	\N	SAS	Tallinn, Estonia - Tallinn Airport	SK1790		T3	
55949	22:55	2018-10-18	\N	SAS	Gothenburg, Sweden - Goteborg Landvetter Airport	SK448		T3	
55950	22:55	2018-10-18	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1474		T3	
55951	22:55	2018-10-18	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1428		T3	
55952	23:00	2018-10-18	\N	SAS	Gdansk, Poland - Gdansk Lech Walesa Airport	SK753		T3	
55953	00:10	2018-10-19	\N	Aeroflot	Moscow, Russian Federation - Sheremetyevo International Airport	SU2497			
55954	01:00	2018-10-19	\N	SunExpress	Izmir, Turkey - Izmir Adnan Menderes Airport	XQ927			
55955	01:50	2018-10-19	\N	Pegasus Airlines	Konya, Turkey - Konya Airport	PC1772			
55956	02:05	2018-10-19	\N	Pegasus Airlines	Istanbul, Turkey - Sabiha Gokcen International Airport	PC1074			
55957	04:55	2018-10-19	\N	UKRAINE INTERNATIONAL AIRLINES	Kiev	PS164			
55958	06:00	2018-10-19	\N	Norwegian	Malaga, Spain - Malaga Airport	D83670			
55959	06:00	2018-10-19	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1124			
55960	06:00	2018-10-19	\N	SAS	Palma Mallorca, Spain - Palma de Mallorca Airport	SK2587			
55961	06:00	2018-10-19	\N	TAP Portugal	Lisbon, Portugal - Lisbon Portela Airport	TP753			
55962	06:05	2018-10-19	\N	Air France	Paris, France - Charles de Gaulle Airport	AF1351			
55963	06:05	2018-10-19	\N	British Airways	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	BA825			
55964	06:15	2018-10-19	\N	Lufthansa	Munich, Germany - Franz Josef Strauss Airport	LH2447			
55965	06:20	2018-10-19	\N	SAS	Berlin, Germany - Tegel Airport	SK1673			
55966	06:35	2018-10-19	\N	Norwegian	Barcelona, Spain - Barcelona-El Prat Airport	D83654			
55967	06:45	2018-10-19	\N	Lufthansa	Frankfurt, Germany - Frankfurt Airport	LH833			
55968	06:50	2018-10-19	\N	Norwegian	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	D82899			
55969	06:50	2018-10-19	\N	SAS	Lisbon, Portugal - Lisbon Portela Airport	SK2801			
55970	06:50	2018-10-19	\N	Brussels Airlines	Brussels, Belgium - Brussels Airport	SN2268		T2	
55971	06:55	2018-10-19	\N	Turkish Airlines	Istanbul, Turkey - Istanbul Ataturk Airport	TK1788			
55972	07:00	2018-10-19	\N	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	D83194			
55973	07:00	2018-10-19	\N	Thomas Cook Airlines	Las Palmas, Spain - Gran Canaria Airport	DK1158			
55974	07:00	2018-10-19	\N	LOT Polish Airlines	Warsaw, Poland - Frederic Chopin Airport	LO460			
55975	07:05	2018-10-19	\N	Norwegian	Riga, Latvia - Riga International Airport	D83320			
55976	07:05	2018-10-19	\N	SAS	Frankfurt, Germany - Frankfurt Airport	SK639			
55977	07:10	2018-10-19	\N	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	D83221			
55978	07:10	2018-10-19	\N	Austrian Airlines	Vienna, Austria - Vienna International Airport	OS308			
55979	07:15	2018-10-19	\N	Ryanair	London, United Kingdom of Great Britain and Northern Ireland - Stansted Airport	FR7383			
55980	07:20	2018-10-19	\N	Finnair	Helsinki, Finland - Helsinki-Vantaa Airport	AY962			
55981	07:20	2018-10-19	\N	Norwegian	Berlin, Germany - Schonefeld Airport	D83300			
55982	07:20	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK402			
55983	07:20	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK454			
55984	07:25	2018-10-19	\N	British Airways	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	BA811			
55985	07:25	2018-10-19	\N	SAS	Munich, Germany - Franz Josef Strauss Airport	SK661	A15		
55986	07:30	2018-10-19	\N	Danish Air Transport	Bornholm, Denmark - Bornholm Airport	DX032	A9		
55987	07:35	2018-10-19	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83082			
55988	07:45	2018-10-19	\N	easyJet	Berlin, Germany - Tegel Airport	EZY5680			
55989	07:50	2018-10-19	\N	SAS	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SK501			
55990	07:50	2018-10-19	\N	Widerøe	Kristiansand, Norway - Kristiansand Airport	WF265			
55991	07:50	2018-10-19	\N	Widerøe	Sandefjord, Norway - Torp Sandefjord Airport	WF302			
55992	07:55	2018-10-19	\N	Norwegian	Nice, France - Cote D'Azur Airport	D83644			
55993	07:55	2018-10-19	\N	Norwegian	Palma Mallorca, Spain - Palma de Mallorca Airport	D83668			
55994	07:55	2018-10-19	\N	SAS	Zurich, Switzerland - Zurich Airport	SK601			
55995	08:00	2018-10-19	\N	Danish Air Transport	Lanzarote, Spain - Lanzarote Airport	DX756			
55996	08:00	2018-10-19	\N	SAS	Bologna, Italy - Guglielmo Marconi Airport	SK2683			
55997	08:00	2018-10-19	\N	SAS	Hanover, Germany - Hannover Airport	SK669			
55998	08:00	2018-10-19	\N	SAS	Warsaw, Poland - Frederic Chopin Airport	SK751			
55999	08:05	2018-10-19	\N	SAS	Dusseldorf, Germany - Dusseldorf International Airport	SK1629			
56000	08:05	2018-10-19	\N	SAS	Stavanger, Norway - Stavanger Airport Sola	SK1870			
56001	08:05	2018-10-19	\N	SAS	Vilnius, Lithuania - Vilnius International Airport	SK744			
56002	08:05	2018-10-19	\N	SAS	Gdansk, Poland - Gdansk Lech Walesa Airport	SK755			
56003	08:05	2018-10-19	\N	SAS	Bergen, Norway - Bergen Airport	SK2862			
56004	08:05	2018-10-19	\N	SAS	Helsinki, Finland - Helsinki-Vantaa Airport	SK1708	C6		New gate
56005	08:10	2018-10-19	\N	Norwegian	Helsinki, Finland - Helsinki-Vantaa Airport	D8261			
56006	08:10	2018-10-19	\N	LOT Polish Airlines	Tallinn, Estonia - Tallinn Airport	LO8142			
56007	08:10	2018-10-19	\N	SAS	Hamburg, Germany - Hamburg Airport	SK1641			
56008	08:15	2018-10-19	\N	Air Alsie	Sonderborg, Denmark - Sonderborg Airport	6I102			
56009	08:15	2018-10-19	\N	Danish Air Transport	Sharm el Sheikh, Egypt - Sharm El Sheikh Airport	DX318			
56010	08:15	2018-10-19	\N	LOT Polish Airlines	Groningen, Netherlands - Eelde Airport	LO8841			
56011	08:15	2018-10-19	\N	SAS	Amsterdam, Netherlands - Amsterdam Airport Schiphol	SK2551			
56012	08:15	2018-10-19	\N	SAS	Brussels, Belgium - Brussels Airport	SK593			
56013	08:20	2018-10-19	\N	SAS	Gothenburg, Sweden - Goteborg Landvetter Airport	SK434			
56014	08:20	2018-10-19	\N	SAS	Geneva, Switzerland - Geneve Airport	SK613			
56015	08:25	2018-10-19	\N	Qatar Airways	Doha, Qatar - Hamad International Airport	QR162			
56016	08:25	2018-10-19	\N	SAS	Milan, Italy - Milano Malpensa Airport	SK1685			
56017	08:25	2018-10-19	\N	SAS	Birmingham, United Kingdom of Great Britain and Northern Ireland - Birmingham International Airport	SK2533			
56018	08:25	2018-10-19	\N	SAS	Paris, France - Charles de Gaulle Airport	SK565			
56019	08:30	2018-10-19	\N	Norwegian	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	D82905			
56020	08:30	2018-10-19	\N	SAS	Dublin, Ireland - Dublin Airport	SK537			
56021	08:30	2018-10-19	\N	Danish Air Transport	Karup, Denmark - Midtjyllands Airport	DX074	A9		
56022	08:35	2018-10-19	\N	Luxair	Luxembourg, Luxembourg - Luxembourg Airport	LG5434			
56023	08:35	2018-10-19	\N	SAS	Athens, Greece - Eleftherios Venizelos International Airport	SK777			
56024	08:40	2018-10-19	\N	easyJet	Berlin, Germany - Schonefeld Airport	EZY4554			
56025	08:40	2018-10-19	\N	Ryanair	Brussels, Belgium - Brussels S. Charleroi Airport	FR200			
56026	08:45	2018-10-19	\N	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	DY4152			
56027	08:45	2018-10-19	\N	Lufthansa	Munich, Germany - Franz Josef Strauss Airport	LH2441			
56028	08:50	2018-10-19	\N	Transavia Airlines	Eindhoven, Netherlands - Eindhoven Airport	HV5962			
56029	08:50	2018-10-19	\N	Jet Time	Lanzarote, Spain - Lanzarote Airport	JTG217			
56030	08:55	2018-10-19	\N	Finnair	Helsinki, Finland - Helsinki-Vantaa Airport	AY952			
56031	08:55	2018-10-19	\N	Norwegian	Barcelona, Spain - Barcelona-El Prat Airport	D83656			
56032	09:00	2018-10-19	\N	Norwegian	Budapest, Hungary - Budapest Ferenc Liszt International Airport	D83550			
56033	09:00	2018-10-19	\N	Thomas Cook Airlines	Lanzarote, Spain - Lanzarote Airport	DK1104			
56034	09:00	2018-10-19	\N	Ryanair	Milan, Italy - Orio al Serio International Airport	FR2991			
56035	09:00	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1418			
56036	09:05	2018-10-19	\N	Air Baltic	Riga, Latvia - Riga International Airport	BT132			
56037	09:10	2018-10-19	\N	easyJet	Berlin, Germany - Tegel Airport	EZY5682			
56038	09:10	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1464			
56039	09:15	2018-10-19	\N	Air Greenland	Kangerlussuaq, Greenland - Kangerlussuaq Airport	GL779			
56040	09:15	2018-10-19	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1138			
56041	09:15	2018-10-19	\N	Czech Airlines	Prague, Czechia - Vaclav Havel Airport Prague	OK505			
56042	09:15	2018-10-19	\N	SAS	Aalborg, Denmark - Aalborg Airport	SK1207			
56043	09:15	2018-10-19	\N	Jet Time	Las Palmas, Spain - Gran Canaria Airport	JTG389	A15		
56044	09:20	2018-10-19	\N	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	DY933			
56045	09:35	2018-10-19	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1126			
56046	09:35	2018-10-19	\N	Swiss	Zurich, Switzerland - Zurich Airport	LX1267			
56047	09:40	2018-10-19	\N	SAS	Nice, France - Cote D'Azur Airport	SK793			
56048	09:40	2018-10-19	\N	SAS	Miami, United States of America - Miami International Airport	SK953			
56049	09:45	2018-10-19	\N	easyJet	Milan, Italy - Milano Malpensa Airport	EZY2654			
56050	09:50	2018-10-19	\N	Air France	Paris, France - Charles de Gaulle Airport	AF1751			
56051	09:50	2018-10-19	\N	Norwegian	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	D82901			
56052	09:50	2018-10-19	\N	SAS	Aarhus, Denmark - Aarhus Airport	SK1245			
56053	09:55	2018-10-19	\N	Lufthansa	Frankfurt, Germany - Frankfurt Airport	LH825			
56054	10:15	2018-10-19	\N	Danish Air Transport	Bornholm, Denmark - Bornholm Airport	DX036			
56055	10:15	2018-10-19	\N	Austrian Airlines	Vienna, Austria - Vienna International Airport	OS302			
56056	10:20	2018-10-19	\N	Norwegian	Rome, Italy - Leonardo da Vinci-Fiumicino Airport	D81021			
56057	10:20	2018-10-19	\N	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	D83196			
56058	10:20	2018-10-19	\N	SAS	Manchester, United Kingdom of Great Britain and Northern Ireland - Manchester Airport	SK539			
56059	10:25	2018-10-19	\N	SAS	Newark, United States of America - Newark Liberty International Airport	SK909			
56060	10:30	2018-10-19	\N	Norwegian	Nice, France - Cote D'Azur Airport	D83640			
56061	10:30	2018-10-19	\N	LOT Polish Airlines	Warsaw, Poland - Frederic Chopin Airport	LO464			
56062	10:40	2018-10-19	\N	Norwegian	Dublin, Ireland - Dublin Airport	D83606			
56063	10:45	2018-10-19	\N	British Airways	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	BA813			
56064	10:45	2018-10-19	\N	SAS	Billund, Denmark - Billund Airport	SK1281			
56065	10:50	2018-10-19	\N	Aegean Airlines	Kalamata, Greece - Kalamata Airport	A3409			
56066	10:50	2018-10-19	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83086			
56067	10:50	2018-10-19	\N	Norwegian	Montpellier, France - Montpellier Mediterranee Airport	D83628			
56068	10:50	2018-10-19	\N	easyJet	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	EZY8266			
56069	11:00	2018-10-19	\N	SAS	Faroe Islands, Faroe Islands - Vagar Airport	SK1777			
56070	11:00	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK404			
56071	11:00	2018-10-19	\N	SAS	Malaga, Spain - Malaga Airport	SK6203			
56072	11:05	2018-10-19	\N	SAS	Berlin, Germany - Tegel Airport	SK1675			
56073	11:05	2018-10-19	\N	SAS	Wroclaw, Poland - Wroclaw Airport	SK763			
56074	11:10	2018-10-19	\N	SAS	Rome, Italy - Leonardo da Vinci-Fiumicino Airport	SK681			
56075	11:15	2018-10-19	\N	Norwegian	Malaga, Spain - Malaga Airport	D85071			
56076	11:15	2018-10-19	\N	Turkish Airlines	Istanbul, Turkey - Istanbul Ataturk Airport	TK1784			
56077	11:20	2018-10-19	\N	Croatia Airlines	Zagreb, Croatia - Zagreb International Airport	OU481			
56078	11:20	2018-10-19	\N	Vueling	Malaga, Spain - Malaga Airport	VY1877			
56079	11:30	2018-10-19	\N	Aegean Airlines	Athens, Greece - Eleftherios Venizelos International Airport	A3751			
56080	11:30	2018-10-19	\N	Atlantic Airways	Faroe Islands, Faroe Islands - Vagar Airport	RC465			
56081	11:35	2018-10-19	\N	Norwegian	Palma Mallorca, Spain - Palma de Mallorca Airport	D86671			
56082	11:40	2018-10-19	\N	SAS	Hamburg, Germany - Hamburg Airport	SK1647			
56083	11:40	2018-10-19	\N	SAS	Venice, Italy - Venice Marco Polo Airport	SK2691			
56084	11:45	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1420			
56085	11:50	2018-10-19	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1128			
56086	11:50	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1458			
56087	11:50	2018-10-19	\N	Brussels Airlines	Brussels, Belgium - Brussels Airport	SN2258			
56088	11:55	2018-10-19	\N	SAS	Stavanger, Norway - Stavanger Airport Sola	SK1868			
56089	12:05	2018-10-19	\N	Lufthansa	Frankfurt, Germany - Frankfurt Airport	LH827			
56090	12:05	2018-10-19	\N	SAS	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SK503			
56091	12:10	2018-10-19	\N	Air France	Paris, France - Charles de Gaulle Airport	AF1151			
56092	12:10	2018-10-19	\N	Norwegian	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	D82903			
56093	12:10	2018-10-19	\N	SAS	Aarhus, Denmark - Aarhus Airport	SK1247			
56094	12:10	2018-10-19	\N	SAS	Palanga, Lithuania - Palanga International Airport	SK2746			
56095	12:15	2018-10-19	\N	Air Canada	Toronto, Canada - Pearson International Airport	AC883			
56096	12:15	2018-10-19	\N	easyJet	Geneva, Switzerland - Geneve Airport	EZS1466			
56097	12:15	2018-10-19	\N	Ryanair	Kaunas, Lithuania - Kaunas Airport	FR7620			
56098	12:20	2018-10-19	\N	SAS	Dulles, United States of America - Washington Dulles International Airport	SK925			
56099	12:20	2018-10-19	\N	Singapore Airlines	Singapore, Singapore - Changi International Airport	SQ351			
56100	12:20	2018-10-19	\N	TAP Portugal	Lisbon, Portugal - Lisbon Portela Airport	TP757			
56101	12:25	2018-10-19	\N	easyJet	Berlin, Germany - Tegel Airport	EZY5684			
56102	12:25	2018-10-19	\N	Atlantic Airways	Faroe Islands, Faroe Islands - Vagar Airport	RC453			
56103	12:25	2018-10-19	\N	SAS	San Francisco, United States of America - San Francisco International Airport	SK935	C32		
56104	12:30	2018-10-19	\N	Danish Air Transport	Bornholm, Denmark - Bornholm Airport	DX040			
56105	12:30	2018-10-19	\N	SAS	Brussels, Belgium - Brussels Airport	SK1591			
56106	12:35	2018-10-19	\N	WOW Air	Reykjavik, Iceland - Keflavik International Airport	WW903			
56107	12:35	2018-10-19	\N	Norwegian	Los Angeles, United States of America - Los Angeles International Airport	DY7091			
56108	12:35	2018-10-19	\N	Ryanair	Alicante, Spain - Alicante-Elche Airport	FR4020			
56109	12:45	2018-10-19	\N	SAS	Poznan, Poland - Poznan Airport	SK1755			
56110	12:50	2018-10-19	\N	SAS	Amsterdam, Netherlands - Amsterdam Airport Schiphol	SK547			
56111	12:55	2018-10-19	\N	Lufthansa	Munich, Germany - Franz Josef Strauss Airport	LH2443			
56112	13:00	2018-10-19	\N	SAS	Gdansk, Poland - Gdansk Lech Walesa Airport	SK759			
56113	13:00	2018-10-19	\N	Aeroflot	Moscow, Russian Federation - Sheremetyevo International Airport	SU2659			
56114	13:05	2018-10-19	\N	SAS	Vilnius, Lithuania - Vilnius International Airport	SK1742			
56115	13:10	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1422			
56116	13:15	2018-10-19	\N	Air China International	Beijing, China - Beijing Capital International Airport	CA878			
56117	13:15	2018-10-19	\N	easyJet	Paris, France - Charles de Gaulle Airport	EZY3826			
56118	13:15	2018-10-19	\N	SAS	Frankfurt, Germany - Frankfurt Airport	SK675			
56119	13:20	2018-10-19	\N	Finnair	Helsinki, Finland - Helsinki-Vantaa Airport	AY954			
56120	13:25	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1456			
56121	13:30	2018-10-19	\N	Vueling	Barcelona, Spain - Barcelona-El Prat Airport	VY1871			
56122	13:30	2018-10-19	\N	SAS	Tallinn, Estonia - Tallinn Airport	SK1786			
56123	13:40	2018-10-19	\N	Norwegian	Edinburgh, United Kingdom of Great Britain and Northern Ireland - Edinburgh Airport	D83502			
56124	13:45	2018-10-19	\N	British Airways	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	BA815			
56125	13:50	2018-10-19	\N	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	D83208			
56126	13:50	2018-10-19	\N	UKRAINE INTERNATIONAL AIRLINES	Kiev	PS162			
56127	14:00	2018-10-19	\N	easyJet	Bristol, United Kingdom of Great Britain and Northern Ireland - Bristol Airport	EZY6136			
56128	14:00	2018-10-19	\N	Icelandair	Reykjavik, Iceland - Keflavik International Airport	FI205			
56129	14:00	2018-10-19	\N	Pegasus Airlines	Istanbul, Turkey - Sabiha Gokcen International Airport	PC1072			
56130	14:05	2018-10-19	\N	SAS	Helsinki, Finland - Helsinki-Vantaa Airport	SK1712			
56131	14:05	2018-10-19	\N	SAS	Stavanger, Norway - Stavanger Airport Sola	SK1872			
56132	14:05	2018-10-19	\N	SAS	Bergen, Norway - Bergen Airport	SK2868			
56133	14:05	2018-10-19	\N	SAS	Gothenburg, Sweden - Goteborg Landvetter Airport	SK430			
56134	14:10	2018-10-19	\N	Cathay Pacific	Hong Kong	CX246			
56135	14:10	2018-10-19	\N	Ryanair	Rome, Italy - Ciampino-G. B. Pastine International Airport	FR406			
56136	14:10	2018-10-19	\N	SAS	Dusseldorf, Germany - Dusseldorf International Airport	SK1621			
56137	14:15	2018-10-19	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83088			
56138	14:15	2018-10-19	\N	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	D83225			
56139	14:25	2018-10-19	\N	SAS	Billund, Denmark - Billund Airport	SK1285			
56140	14:25	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK458			
56141	14:25	2018-10-19	\N	Thai Airways	Bangkok, Thailand - Suvarnabhumi Airport	TG951			
56142	14:30	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK406			
56143	14:30	2018-10-19	\N	Wizz Air	Sibiu	W63802			
56144	14:45	2018-10-19	\N	Air Baltic	Riga, Latvia - Riga International Airport	BT136			
56145	14:45	2018-10-19	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1130			
56146	14:45	2018-10-19	\N	SAS	Gothenburg, Sweden - Goteborg Landvetter Airport	SK438			
56147	14:45	2018-10-19	\N	SAS	Hamburg, Germany - Hamburg Airport	SK649			
56148	14:50	2018-10-19	\N	Swiss	Zurich, Switzerland - Zurich Airport	LX1271			
56149	14:50	2018-10-19	\N	SAS	Aalborg, Denmark - Aalborg Airport	SK1215			
56150	14:50	2018-10-19	\N	SAS	Aarhus, Denmark - Aarhus Airport	SK1257			
56151	14:55	2018-10-19	\N	Ryanair	London, United Kingdom of Great Britain and Northern Ireland - London Luton Airport	FR7407			
56152	15:00	2018-10-19	\N	Danish Air Transport	Karup, Denmark - Midtjyllands Airport	DX080			
56153	15:00	2018-10-19	\N	Iraqi Airways	Baghdad, Iraq - Baghdad International Airport	IA282			
56154	15:00	2018-10-19	\N	Lufthansa	Frankfurt, Germany - Frankfurt Airport	LH829			
56155	15:00	2018-10-19	\N	SAS	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SK505			
56156	15:05	2018-10-19	\N	Air France	Paris, France - Charles de Gaulle Airport	AF1851			
56157	15:15	2018-10-19	\N	Iberia	Madrid, Spain - Adolfo Suarez Madrid-Barajas Airport	IB3731			
56158	15:20	2018-10-19	\N	Ryanair	Dublin, Ireland - Dublin Airport	FR633			
56159	15:20	2018-10-19	\N	Luxair	Luxembourg, Luxembourg - Luxembourg Airport	LG5432			
56160	15:20	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1424			
56161	15:20	2018-10-19	\N	SAS	Brussels, Belgium - Brussels Airport	SK1593			
56162	15:25	2018-10-19	\N	Norwegian	Larnaca, Cyprus - Larnaca International Airport	D83390			
56163	15:25	2018-10-19	\N	Norwegian	Prague, Czechia - Vaclav Havel Airport Prague	D83580			
56164	15:30	2018-10-19	\N	Norwegian	Alicante, Spain - Alicante-Elche Airport	D83662			
56165	15:30	2018-10-19	\N	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	DY941			
56166	15:30	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1460			
56167	15:35	2018-10-19	\N	Emirates	Dubai, United Arab Emirates - Dubai Airport	EK152			
56168	15:40	2018-10-19	\N	Norwegian	Helsinki, Finland - Helsinki-Vantaa Airport	D8265			
56169	15:40	2018-10-19	\N	SAS	Chicago, United States of America - O'Hare International Airport	SK943			
56170	15:45	2018-10-19	\N	Egyptair	Cairo, Egypt - Cairo International Airport	MS760			
56171	15:45	2018-10-19	\N	SAS	Tokyo, Japan - Narita International Airport	SK983			
56172	15:50	2018-10-19	\N	Ryanair	Cologne, Germany - Cologne Bonn Airport	FR408			
56173	15:55	2018-10-19	\N	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	DY4162			
56174	16:00	2018-10-19	\N	easyJet	Manchester, United Kingdom of Great Britain and Northern Ireland - Manchester Airport	EZY1986			
56175	16:00	2018-10-19	\N	SAS	Munich, Germany - Franz Josef Strauss Airport	SK2657			
56176	16:00	2018-10-19	\N	Vueling	Paris, France - Paris Orly Airport	VY8635			
56177	16:10	2018-10-19	\N	Norwegian	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	D82907			
56178	16:10	2018-10-19	\N	Norwegian	Berlin, Germany - Schonefeld Airport	D83302			
56179	16:15	2018-10-19	\N	SAS	Warsaw, Poland - Frederic Chopin Airport	SK2751			
56180	16:15	2018-10-19	\N	SAS	Bergen, Norway - Bergen Airport	SK2872			
56181	16:15	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK408			
56182	16:15	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK460			
56183	16:15	2018-10-19	\N	SAS	Rome, Italy - Leonardo da Vinci-Fiumicino Airport	SK691			
56184	16:25	2018-10-19	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1132			
56185	16:30	2018-10-19	\N	British Airways	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	BA817			
56186	16:30	2018-10-19	\N	SAS	Aalborg, Denmark - Aalborg Airport	SK1217			
56187	16:30	2018-10-19	\N	SAS	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SK1517			
56188	16:35	2018-10-19	\N	SAS	Stuttgart, Germany - Stuttgart Airport	SK1655			
56189	16:35	2018-10-19	\N	Norwegian	Amsterdam, Netherlands - Amsterdam Airport Schiphol	D83540			
56190	16:40	2018-10-19	\N	Danish Air Transport	Bornholm, Denmark - Bornholm Airport	DX046			
56191	16:40	2018-10-19	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83092			
56192	16:40	2018-10-19	\N	SAS	Stavanger, Norway - Stavanger Airport Sola	SK1874			
56193	16:45	2018-10-19	\N	Norwegian	Malta, Malta - Malta International Airport	D83530			
56194	16:50	2018-10-19	\N	easyJet	Berlin, Germany - Schonefeld Airport	EZY4556			
56195	16:50	2018-10-19	\N	SAS	Dusseldorf, Germany - Dusseldorf International Airport	SK627			
56196	16:50	2018-10-19	\N	Widerøe	Sandefjord, Norway - Torp Sandefjord Airport	WF312			
56197	17:00	2018-10-19	\N	Finnair	Helsinki, Finland - Helsinki-Vantaa Airport	AY956			
56198	17:00	2018-10-19	\N	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	D83239			
56199	17:00	2018-10-19	\N	easyJet	Basel, Switzerland/Mulhouse, France - EuroAirport Swiss	EZS1152			
56200	17:05	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1408			
56201	17:05	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1468			
56202	17:05	2018-10-19	\N	SAS	Hanover, Germany - Hannover Airport	SK1667			
56203	17:05	2018-10-19	\N	SAS	Paris, France - Charles de Gaulle Airport	SK559			
56204	17:05	2018-10-19	\N	SAS	Gdansk, Poland - Gdansk Lech Walesa Airport	SK757			
56205	17:10	2018-10-19	\N	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	D83212			
56206	17:10	2018-10-19	\N	Ryanair	Bologna, Italy - Guglielmo Marconi Airport	FR2677			
56207	17:10	2018-10-19	\N	SAS	Gothenburg, Sweden - Goteborg Landvetter Airport	SK1444			
56208	17:10	2018-10-19	\N	SAS	Milan, Italy - Milano Malpensa Airport	SK687			
56209	17:10	2018-10-19	\N	Vueling	Barcelona, Spain - Barcelona-El Prat Airport	VY1873			
56210	17:15	2018-10-19	\N	easyJet	Edinburgh, United Kingdom of Great Britain and Northern Ireland - Edinburgh Airport	EZY6984			
56211	17:15	2018-10-19	\N	GERMANIA	Pristina, Kosovo - Pristina International Airport	ST3138			
56212	17:25	2018-10-19	\N	easyJet	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	EZY8268			
56213	17:30	2018-10-19	\N	SAS	Bologna, Italy - Guglielmo Marconi Airport	SK2685			
56214	17:35	2018-10-19	\N	SAS	Geneva, Switzerland - Geneve Airport	SK617			
56215	17:35	2018-10-19	\N	SAS	Billund, Denmark - Billund Airport	SK1287			
56216	17:40	2018-10-19	\N	Danish Air Transport	Karup, Denmark - Midtjyllands Airport	DX082			
56217	17:40	2018-10-19	\N	Ryanair	London, United Kingdom of Great Britain and Northern Ireland - Stansted Airport	FR7381			
56218	17:40	2018-10-19	\N	Qatar Airways	Doha, Qatar - Hamad International Airport	QR160			
56219	17:45	2018-10-19	\N	Air Alsie	Sonderborg, Denmark - Sonderborg Airport	6I108			
56220	17:45	2018-10-19	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83094			
56221	17:45	2018-10-19	\N	Norwegian	New York, United States of America - John F. Kennedy International Airport	DY7011			
56222	17:45	2018-10-19	\N	Austrian Airlines	Vienna, Austria - Vienna International Airport	OS304			
56223	17:45	2018-10-19	\N	SAS	Helsinki, Finland - Helsinki-Vantaa Airport	SK1716			
56224	17:45	2018-10-19	\N	Widerøe	Kristiansand, Norway - Kristiansand Airport	WF269			
56225	17:50	2018-10-19	\N	SAS	Birmingham, United Kingdom of Great Britain and Northern Ireland - Birmingham International Airport	SK2535			
56226	17:55	2018-10-19	\N	British Airways	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	BA819			
56227	18:00	2018-10-19	\N	SAS	Hamburg, Germany - Hamburg Airport	SK651			
56228	18:05	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK462			
56229	18:05	2018-10-19	\N	SAS	Zurich, Switzerland - Zurich Airport	SK609			
56230	18:05	2018-10-19	\N	WOW Air	Reykjavik, Iceland - Keflavik International Airport	WW905			
56231	18:10	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK410			
56232	18:15	2018-10-19	\N	Royal Air Maroc	Casablanca, Morocco - Mohamed V International Airport	AT223			
56233	18:15	2018-10-19	\N	SAS	Aberdeen, United Kingdom of Great Britain and Northern Ireland - Aberdeen International Airport	SK1521			
56234	18:15	2018-10-19	\N	SAS	Frankfurt, Germany - Frankfurt Airport	SK1635			
56235	18:15	2018-10-19	\N	Brussels Airlines	Brussels, Belgium - Brussels Airport	SN2260			
56236	18:20	2018-10-19	\N	Norwegian	Nice, France - Cote D'Azur Airport	D83642			
56237	18:20	2018-10-19	\N	SAS	Brussels, Belgium - Brussels Airport	SK597			
56238	18:30	2018-10-19	\N	SAS	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SK1507			
56239	18:35	2018-10-19	\N	SAS	Newark, United States of America - Newark Liberty International Airport	SK901			
56240	18:40	2018-10-19	\N	Middle East Airlines	Beirut, Lebanon - Beirut-Rafic Hariri International Airport	ME226			
56241	18:40	2018-10-19	\N	Atlantic Airways	Faroe Islands, Faroe Islands - Vagar Airport	RC459			
56242	18:40	2018-10-19	\N	SAS	Shanghai, China - Shanghai Pudong International Airport	SK997			
56243	18:40	2018-10-19	\N	Turkish Airlines	Istanbul, Turkey - Istanbul Ataturk Airport	TK1786			
56244	18:45	2018-10-19	\N	SAS	Trondheim, Norway - Trondheim Airport Vaernes	SK2880	C5		
56245	18:55	2018-10-19	\N	Norwegian	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	D82909			
56246	18:55	2018-10-19	\N	Norwegian	Madrid, Spain - Adolfo Suarez Madrid-Barajas Airport	D86113			
56247	18:55	2018-10-19	\N	Ryanair	Malaga, Spain - Malaga Airport	FR4048			
56248	19:00	2018-10-19	\N	Blue Air	Bucharest, Romania - Bucharest Henri Coanda International Airport	0B154			
56249	19:00	2018-10-19	\N	Norwegian	Stockholm, Sweden - Stockholm Arlanda Airport	D8231			
56250	19:00	2018-10-19	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83098			
56251	19:00	2018-10-19	\N	Danish Air Transport	Bornholm, Denmark - Bornholm Airport	DX050			
56252	19:00	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1430			
56253	19:05	2018-10-19	\N	Norwegian	Paris, France - Paris Orly Airport	D83638			
56254	19:05	2018-10-19	\N	Lufthansa	Munich, Germany - Franz Josef Strauss Airport	LH2445			
56255	19:05	2018-10-19	\N	Lufthansa	Frankfurt, Germany - Frankfurt Airport	LH831			
56256	19:05	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1470			
56257	19:10	2018-10-19	\N	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	DY949			
56258	19:10	2018-10-19	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1134			
56259	19:15	2018-10-19	\N	Air France	Paris, France - Charles de Gaulle Airport	AF1051			
56260	19:15	2018-10-19	\N	Norwegian	Budapest, Hungary - Budapest Ferenc Liszt International Airport	D83552			
56261	19:15	2018-10-19	\N	Wizz Air	Kiev, Ukraine - Kyiv International Airport	W66224			
56262	19:25	2018-10-19	\N	Pegasus Airlines	Antalya, Turkey - Antalya Airport	PC5508			
56263	19:35	2018-10-19	\N	Air Baltic	Riga, Latvia - Riga International Airport	BT140			
56264	19:40	2018-10-19	\N	LOT Polish Airlines	Tallinn, Estonia - Tallinn Airport	LO8146			
56265	19:40	2018-10-19	\N	SAS	Amsterdam, Netherlands - Amsterdam Airport Schiphol	SK553			
56266	19:45	2018-10-19	\N	Icelandair	Reykjavik, Iceland - Keflavik International Airport	FI213			
56267	19:50	2018-10-19	\N	Ryanair	Budapest, Hungary - Budapest Ferenc Liszt International Airport	FR604			
56268	19:50	2018-10-19	\N	LOT Polish Airlines	Warsaw, Poland - Frederic Chopin Airport	LO462			
56269	19:50	2018-10-19	\N	Czech Airlines	Prague, Czechia - Vaclav Havel Airport Prague	OK509			
56270	19:50	2018-10-19	\N	SAS	Prague, Czechia - Vaclav Havel Airport Prague	SK767			
56271	19:55	2018-10-19	\N	SAS	Munich, Germany - Franz Josef Strauss Airport	SK659			
56272	20:00	2018-10-19	\N	Adria Airways	Ljubljana, Slovenia - Ljubljana Joze Pucnik Airport	JP511			
56273	20:00	2018-10-19	\N	Swiss	Zurich, Switzerland - Zurich Airport	LX1273			
56274	20:05	2018-10-19	\N	Austrian Airlines	Vienna, Austria - Vienna International Airport	OS306			
56275	20:15	2018-10-19	\N	British Airways	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	BA821			
56276	20:15	2018-10-19	\N	Ryanair	Madrid, Spain - Adolfo Suarez Madrid-Barajas Airport	FR606			
56277	20:20	2018-10-19	\N	Finnair	Helsinki, Finland - Helsinki-Vantaa Airport	AY960			
56278	20:20	2018-10-19	\N	Norwegian	Oslo, Norway - Oslo Airport Gardermoen	D83241			
56279	20:20	2018-10-19	\N	Norwegian	Krakow, Poland - J. Paul II International Airport Krakow-Balice	D83562			
56280	20:20	2018-10-19	\N	EUROWINGS Luftverkehrs AG	Dusseldorf, Germany - Dusseldorf International Airport	EW9195			
56281	20:25	2018-10-19	\N	Aegean Airlines	Heraklion, Greece - Heraklion Airport	A34219			
56282	20:25	2018-10-19	\N	Luxair	Luxembourg, Luxembourg - Luxembourg Airport	LG5436			
56283	20:30	2018-10-19	\N	Norwegian	Rome, Italy - Leonardo da Vinci-Fiumicino Airport	D81023			
56284	20:30	2018-10-19	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83096			
56285	20:30	2018-10-19	\N	Norwegian	Palma Mallorca, Spain - Palma de Mallorca Airport	D86673			
56286	20:30	2018-10-19	\N	LOT Polish Airlines	Groningen, Netherlands - Eelde Airport	LO8845			
56287	20:35	2018-10-19	\N	Norwegian	Alicante, Spain - Alicante-Elche Airport	D85375			
56288	20:35	2018-10-19	\N	Norwegian	Barcelona, Spain - Barcelona-El Prat Airport	D85575			
56289	20:35	2018-10-19	\N	easyJet	Paris, France - Charles de Gaulle Airport	EZY3828			
56290	20:35	2018-10-19	\N	Ryanair	Porto, Portugal - Porto Airport	FR8899			
56291	20:35	2018-10-19	\N	SAS	London, United Kingdom of Great Britain and Northern Ireland - London Heathrow Airport	SK1501			
56292	20:40	2018-10-19	\N	Air India	Delhi, India - Indira Gandhi International Airport	AI158			
56293	20:40	2018-10-19	\N	Norwegian	Helsinki, Finland - Helsinki-Vantaa Airport	D8269			
56294	20:45	2018-10-19	\N	SAS	Malaga, Spain - Malaga Airport	SK6201			
56295	20:45	2018-10-19	\N	SAS	Dusseldorf, Germany - Dusseldorf International Airport	SK629			
56296	20:45	2018-10-19	\N	SAS	Hamburg, Germany - Hamburg Airport	SK647			
56297	20:45	2018-10-19	\N	SAS	Stuttgart, Germany - Stuttgart Airport	SK667			
56298	20:50	2018-10-19	\N	easyJet	Geneva, Switzerland - Geneve Airport	EZS1470			
56299	20:50	2018-10-19	\N	KLM	Amsterdam, Netherlands - Amsterdam Airport Schiphol	KL1136			
56300	20:50	2018-10-19	\N	SAS	Aarhus, Denmark - Aarhus Airport	SK1269			
56301	20:50	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1410			
56302	20:50	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1472			
56303	20:50	2018-10-19	\N	SAS	Hanover, Germany - Hannover Airport	SK1669			
56304	20:55	2018-10-19	\N	SAS	Aalborg, Denmark - Aalborg Airport	SK1221			
56305	20:55	2018-10-19	\N	SAS	Helsinki, Finland - Helsinki-Vantaa Airport	SK1720			
56306	20:55	2018-10-19	\N	SAS	Stavanger, Norway - Stavanger Airport Sola	SK1876			
56307	20:55	2018-10-19	\N	SAS	Gothenburg, Sweden - Goteborg Landvetter Airport	SK446			
56308	21:00	2018-10-19	\N	easyJet	London, United Kingdom of Great Britain and Northern Ireland - London Gatwick Airport	EZY8270			
56309	21:00	2018-10-19	\N	Air Serbia	Belgrade, Serbia - Belgrad Nikola Tesla Airport	JU405			
56310	21:00	2018-10-19	\N	Lufthansa	Munich, Germany - Franz Josef Strauss Airport	LH2439			
56311	21:00	2018-10-19	\N	SAS	Bergen, Norway - Bergen Airport	SK2870			
56312	21:00	2018-10-19	\N	SAS	Beijing, China - Beijing Capital International Airport	SK995			
56313	21:05	2018-10-19	\N	Ryanair	Milan, Italy - Orio al Serio International Airport	FR2989			
56314	21:05	2018-10-19	\N	SAS	Vilnius, Lithuania - Vilnius International Airport	SK742			
56315	21:10	2018-10-19	\N	SAS	Warsaw, Poland - Frederic Chopin Airport	SK2761			
56316	21:10	2018-10-19	\N	Widerøe	Sandefjord, Norway - Torp Sandefjord Airport	WF316			
56317	21:20	2018-10-19	\N	Norwegian	Aalborg, Denmark - Aalborg Airport	D83090			
56318	21:20	2018-10-19	\N	easyJet	Berlin, Germany - Tegel Airport	EZY5688			
56319	21:35	2018-10-19	\N	easyJet	Berlin, Germany - Schonefeld Airport	EZY4558			
56320	21:40	2018-10-19	\N	easyJet	Milan, Italy - Milano Malpensa Airport	EZY2656			
56321	21:40	2018-10-19	\N	Brussels Airlines	Brussels, Belgium - Brussels Airport	SN2264			
56322	21:50	2018-10-19	\N	easyJet	Manchester, United Kingdom of Great Britain and Northern Ireland - Manchester Airport	EZY1988			
56323	21:55	2018-10-19	\N	Norwegian	Bergen, Norway - Bergen Airport	DY969			
56324	21:55	2018-10-19	\N	Widerøe	Kristiansand, Norway - Kristiansand Airport	WF279			
56325	22:00	2018-10-19	\N	Ryanair	Edinburgh, United Kingdom of Great Britain and Northern Ireland - Edinburgh Airport	FR2675			
56326	22:05	2018-10-19	\N	Danish Air Transport	Bornholm, Denmark - Bornholm Airport	DX054			
56327	22:15	2018-10-19	\N	Ryanair	London, United Kingdom of Great Britain and Northern Ireland - Stansted Airport	FR7385			
56328	22:35	2018-10-19	\N	Qatar Airways	Doha, Qatar - Hamad International Airport	QR164			
56329	22:45	2018-10-19	\N	Norwegian	Chania, Greece - Chania International Airport	D83352			
56330	22:50	2018-10-19	\N	SAS	Tallinn, Estonia - Tallinn Airport	SK1790			
56331	22:50	2018-10-19	\N	SAS	Palanga, Lithuania - Palanga International Airport	SK2744			
56332	22:55	2018-10-19	\N	SAS	Stockholm, Sweden - Stockholm Arlanda Airport	SK1428			
56333	22:55	2018-10-19	\N	SAS	Oslo, Norway - Oslo Airport Gardermoen	SK1474			
56334	23:00	2018-10-19	\N	SAS	Gdansk, Poland - Gdansk Lech Walesa Airport	SK753			
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: akublemiszewski
--

COPY public.schema_migrations (version) FROM stdin;
20181016192314
20181016192500
20181016193125
20181016193804
20181016193856
\.


--
-- Name: arrivals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: akublemiszewski
--

SELECT pg_catalog.setval('public.arrivals_id_seq', 58370, true);


--
-- Name: departures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: akublemiszewski
--

SELECT pg_catalog.setval('public.departures_id_seq', 56334, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: akublemiszewski
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: arrivals arrivals_pkey; Type: CONSTRAINT; Schema: public; Owner: akublemiszewski
--

ALTER TABLE ONLY public.arrivals
    ADD CONSTRAINT arrivals_pkey PRIMARY KEY (id);


--
-- Name: departures departures_pkey; Type: CONSTRAINT; Schema: public; Owner: akublemiszewski
--

ALTER TABLE ONLY public.departures
    ADD CONSTRAINT departures_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: akublemiszewski
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- PostgreSQL database dump complete
--

