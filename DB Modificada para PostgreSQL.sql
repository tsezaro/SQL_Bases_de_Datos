--create wf_currencies table
create table  wf_currencies 
   ("currency_code" varchar(7), 
	"currency_name" varchar(40) constraint "wf_curr_nn" not null  , 
	"comments" varchar(150), 
	constraint "wf_curr_pk" primary key ("currency_code")
   );

-- create wf_languages table
create table  wf_languages
   ("language_id" numeric(4,0), 
	"language_name" varchar(50) constraint "wf_lang_langname_nn" not null  , 
	constraint "wf_lang_pk" primary key ("language_id")
   );

--create wf_world_regions table
create table  wf_world_regions
   ("region_id" numeric(3,0), 
	"region_name" varchar(35) constraint "wf_reg_regname_nn" not null  , 
	constraint "wf_reg_pk" primary key ("region_id")
	 
   );

-- create wf_countries table
create table  wf_countries
   ("country_id" numeric(4,0), 
	"region_id" numeric(3,0) not null  , 
	"country_name" varchar(70) constraint "wf_cname_nn" not null  , 
	"country_translated_name" varchar(40), 
	"location" varchar(90), 
	"capitol" varchar(50), 
	"area" numeric(15,0), 
	"coastline" numeric(8,0), 
	"lowest_elevation" numeric(6,0), 
	"lowest_elev_name" varchar(70), 
	"highest_elevation" numeric(6,0), 
	"highest_elev_name" varchar(50), 
	"date_of_independence" varchar(30), 
	"national_holiday_name" varchar(200), 
	"national_holiday_date" varchar(30), 
	"population" numeric(12,0), 
	"population_growth_rate" varchar(10), 
	"life_expect_at_birth" numeric(6,2), 
	"median_age" numeric(6,2), 
	"airports" numeric(6,0), 
	"climate" varchar(1000), 
	"fips_id" char(2), 
	"internet_extension" varchar(3), 
	"flag" varchar(30), 
	"currency_code" varchar(7) not null  , 
	constraint "wf_crty_pk" primary key ("country_id")
	 
   );
   
-- add fk constraints
alter table  wf_countries add constraint "wf_region_id_fk1" foreign key ("region_id")
	references  wf_world_regions ("region_id")  ;

create index  "wf_ctry_reg_idx" on  wf_countries ("region_id");

alter table  wf_countries add constraint "wf_curr_id_fk2" foreign key ("currency_code")
	references  wf_currencies ("currency_code")  ;

create index  "wf_ctry_curr_idx" on  wf_countries ("currency_code");

-- create wf_spoken_languages table
create table  wf_spoken_languages
   ("country_id" numeric(4,0), 
	"language_id" numeric(4,0), 
	"official" varchar(2), 
	"comments" varchar(512), 
	constraint "wf_spoken_lang_pk" primary key ("country_id", "language_id")
	 
   );
-- add fk constraints
alter table  wf_spoken_languages add constraint "wf_ctry_num_fk1" foreign key ("country_id")
	references  wf_countries ("country_id")  ;

alter table  wf_spoken_languages add constraint "wf_lang_id_fk" foreign key ("language_id")
	references  wf_languages ("language_id")  ;
	
--populate wf_world regions
insert into wf_world_regions (region_id, region_name)
values (14,'eastern africa');
insert into wf_world_regions (region_id, region_name)
values (17,'middle africa');
insert into wf_world_regions (region_id, region_name)
values (15,'northern africa');
insert into wf_world_regions (region_id, region_name)
values (18,'southern africa');
insert into wf_world_regions (region_id, region_name)
values (11,'western africa');
insert into wf_world_regions (region_id, region_name)
values (29,'caribbean');
insert into wf_world_regions (region_id, region_name)
values (13,'central america');
insert into wf_world_regions (region_id, region_name)
values (5,'south america');
insert into wf_world_regions (region_id, region_name)
values (21,'northern america');
insert into wf_world_regions (region_id, region_name)
values (143,'central asia');
insert into wf_world_regions (region_id, region_name)
values (30,'eastern asia');
insert into wf_world_regions (region_id, region_name)
values (34,'southern asia');
insert into wf_world_regions (region_id, region_name)
values (35,'south-eastern asia');
insert into wf_world_regions (region_id, region_name)
values (145,'western asia');
insert into wf_world_regions (region_id, region_name)
values (151,'eastern europe');
insert into wf_world_regions (region_id, region_name)
values (154,'northern europe');
insert into wf_world_regions (region_id, region_name)
values (39,'southern europe');
insert into wf_world_regions (region_id, region_name)
values (155,'western europe');
insert into wf_world_regions (region_id, region_name)
values (9,'oceania');

-- populate wf_currencies
insert into wf_currencies(currency_code, currency_name, comments)
values('aed','emirati dirham','');
insert into wf_currencies(currency_code, currency_name, comments)
values('afa','afghani','');
insert into wf_currencies(currency_code, currency_name, comments)
values('all','lek','');
insert into wf_currencies(currency_code, currency_name, comments)
values('amd','dram','');
insert into wf_currencies(currency_code, currency_name, comments)
values('ang','netherlands antillean guilder','');
insert into wf_currencies(currency_code, currency_name, comments)
values('aoa','kwanza','');
insert into wf_currencies(currency_code, currency_name, comments)
values('ars','argentine peso','');
insert into wf_currencies(currency_code, currency_name, comments)
values('aud','australian dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('awg','aruban guilder','');
insert into wf_currencies(currency_code, currency_name, comments)
values('azm','azerbaijani manat','');
insert into wf_currencies(currency_code, currency_name, comments)
values('bam','marka','');
insert into wf_currencies(currency_code, currency_name, comments)
values('bbd','barbadian dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('bdt','taka','');
insert into wf_currencies(currency_code, currency_name, comments)
values('bgl','lev','');
insert into wf_currencies(currency_code, currency_name, comments)
values('bif','burundi franc','');
insert into wf_currencies(currency_code, currency_name, comments)
values('bmd','bermudian dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('bnd','bruneian dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('bob','boliviano','');
insert into wf_currencies(currency_code, currency_name, comments)
values('brl','real','');
insert into wf_currencies(currency_code, currency_name, comments)
values('bsd','bahamian dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('btn','ngultrum','');
insert into wf_currencies(currency_code, currency_name, comments)
values('bwp','pula','');
insert into wf_currencies(currency_code, currency_name, comments)
values('byb','belarusian ruble','');
insert into wf_currencies(currency_code, currency_name, comments)
values('bzd','belizean dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('cad','canadian dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('cdf','congolese franc','');
insert into wf_currencies(currency_code, currency_name, comments)
values('chf','swiss franc','');
insert into wf_currencies(currency_code, currency_name, comments)
values('clp','chilean peso','');
insert into wf_currencies(currency_code, currency_name, comments)
values('cny','yuan','');
insert into wf_currencies(currency_code, currency_name, comments)
values('cop','colombian peso','');
insert into wf_currencies(currency_code, currency_name, comments)
values('crc','costa rican colon','');
insert into wf_currencies(currency_code, currency_name, comments)
values('cuc','convertible peso','');
insert into wf_currencies(currency_code, currency_name, comments)
values('cup','cuban peso','');
insert into wf_currencies(currency_code, currency_name, comments)
values('cve','cape verdean escudo','');
insert into wf_currencies(currency_code, currency_name, comments)
values('cyp','cypriot pound','');
insert into wf_currencies(currency_code, currency_name, comments)
values('czk','czech koruna','');
insert into wf_currencies(currency_code, currency_name, comments)
values('djf','djiboutian franc','');
insert into wf_currencies(currency_code, currency_name, comments)
values('dkk','danish krone','');
insert into wf_currencies(currency_code, currency_name, comments)
values('dop','dominican peso','');
insert into wf_currencies(currency_code, currency_name, comments)
values('dzd','algerian dinar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('eek','estonian kroon','');
insert into wf_currencies(currency_code, currency_name, comments)
values('egp','egyptian pound','');
insert into wf_currencies(currency_code, currency_name, comments)
values('ern','nakfa','');
insert into wf_currencies(currency_code, currency_name, comments)
values('etb','birr','');
insert into wf_currencies(currency_code, currency_name, comments)
values('eur','euro','');
insert into wf_currencies(currency_code, currency_name, comments)
values('fjd','fijian dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('fkp','falkland pound','');
insert into wf_currencies(currency_code, currency_name, comments)
values('gbp','british pound','');
insert into wf_currencies(currency_code, currency_name, comments)
values('gel','lari','');
insert into wf_currencies(currency_code, currency_name, comments)
values('ghc','cedi','');
insert into wf_currencies(currency_code, currency_name, comments)
values('gip','gibraltar pound','');
insert into wf_currencies(currency_code, currency_name, comments)
values('gmd','dalasi','');
insert into wf_currencies(currency_code, currency_name, comments)
values('gnf','guinean franc','');
insert into wf_currencies(currency_code, currency_name, comments)
values('gtq','quetzal','');
insert into wf_currencies(currency_code, currency_name, comments)
values('gyd','guyanese dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('hkd','hong kong dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('hnl','lempira','');
insert into wf_currencies(currency_code, currency_name, comments)
values('hrk','kuna','');
insert into wf_currencies(currency_code, currency_name, comments)
values('htg','gourde','');
insert into wf_currencies(currency_code, currency_name, comments)
values('huf','forint','');
insert into wf_currencies(currency_code, currency_name, comments)
values('idr','indonesian rupiah','');
insert into wf_currencies(currency_code, currency_name, comments)
values('ils','new israeli shekel','');
insert into wf_currencies(currency_code, currency_name, comments)
values('inr','indian rupee','');
insert into wf_currencies(currency_code, currency_name, comments)
values('irr','iranian rial','');
insert into wf_currencies(currency_code, currency_name, comments)
values('isk','icelandic krona','');
insert into wf_currencies(currency_code, currency_name, comments)
values('jmd','jamaican dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('jod','jordanian dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('jpy','yen','');
insert into wf_currencies(currency_code, currency_name, comments)
values('kd','kuwaiti dinar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('kes','kenyan shilling','');
insert into wf_currencies(currency_code, currency_name, comments)
values('khr','riel','');
insert into wf_currencies(currency_code, currency_name, comments)
values('kmf','comoran franc','');
insert into wf_currencies(currency_code, currency_name, comments)
values('kpw','north korean won','');
insert into wf_currencies(currency_code, currency_name, comments)
values('krw','south korean won','');
insert into wf_currencies(currency_code, currency_name, comments)
values('kyd','caymanian dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('kzt','tenge','');
insert into wf_currencies(currency_code, currency_name, comments)
values('lak','kip','');
insert into wf_currencies(currency_code, currency_name, comments)
values('lbp','lebanese pound','');
insert into wf_currencies(currency_code, currency_name, comments)
values('lkr','sri lankan rupee','');
insert into wf_currencies(currency_code, currency_name, comments)
values('lrd','liberian dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('lsl','loti','');
insert into wf_currencies(currency_code, currency_name, comments)
values('ltl','litas','');
insert into wf_currencies(currency_code, currency_name, comments)
values('lvl','latvian lat','');
insert into wf_currencies(currency_code, currency_name, comments)
values('lyd','libyan dinar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('mad','moroccan dirham','');
insert into wf_currencies(currency_code, currency_name, comments)
values('mdl','moldovan leu','');
insert into wf_currencies(currency_code, currency_name, comments)
values('mga','madagascar ariary','');
insert into wf_currencies(currency_code, currency_name, comments)
values('mkd','macedonian denar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('mmk','kyat','');
insert into wf_currencies(currency_code, currency_name, comments)
values('mnt','togrog/tugrik','');
insert into wf_currencies(currency_code, currency_name, comments)
values('mop','pataca','');
insert into wf_currencies(currency_code, currency_name, comments)
values('mro','ouguiya','');
insert into wf_currencies(currency_code, currency_name, comments)
values('mtl','maltese lira','');
insert into wf_currencies(currency_code, currency_name, comments)
values('mur','mauritian rupee','');
insert into wf_currencies(currency_code, currency_name, comments)
values('mvr','rufiyaa','');
insert into wf_currencies(currency_code, currency_name, comments)
values('mwk','malawian kwacha','');
insert into wf_currencies(currency_code, currency_name, comments)
values('mxn','mexican peso','');
insert into wf_currencies(currency_code, currency_name, comments)
values('myr','ringgit','');
insert into wf_currencies(currency_code, currency_name, comments)
values('mzm','metical','');
insert into wf_currencies(currency_code, currency_name, comments)
values('nad','namibian dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('ngn','naira','');
insert into wf_currencies(currency_code, currency_name, comments)
values('nid','new iraqi dinar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('nok','norwegian krone','');
insert into wf_currencies(currency_code, currency_name, comments)
values('none','no currency used','');
insert into wf_currencies(currency_code, currency_name, comments)
values('npr','nepalese rupee','');
insert into wf_currencies(currency_code, currency_name, comments)
values('nzd','new zealand dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('pab','balboa','');
insert into wf_currencies(currency_code, currency_name, comments)
values('pen','nuevo sol','');
insert into wf_currencies(currency_code, currency_name, comments)
values('pgk','kina','');
insert into wf_currencies(currency_code, currency_name, comments)
values('pkr','pakistani rupee','');
insert into wf_currencies(currency_code, currency_name, comments)
values('pln','zloty','');
insert into wf_currencies(currency_code, currency_name, comments)
values('pyg','guarani','');
insert into wf_currencies(currency_code, currency_name, comments)
values('qar','qatari rial','');
insert into wf_currencies(currency_code, currency_name, comments)
values('rmb','renminbi','');
insert into wf_currencies(currency_code, currency_name, comments)
values('rur','russian ruble','');
insert into wf_currencies(currency_code, currency_name, comments)
values('sar','saudi riyal','');
insert into wf_currencies(currency_code, currency_name, comments)
values('sat','tala','');
insert into wf_currencies(currency_code, currency_name, comments)
values('sbd','solomon islands dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('scr','seychelles rupee','');
insert into wf_currencies(currency_code, currency_name, comments)
values('sek','swedish krona','');
insert into wf_currencies(currency_code, currency_name, comments)
values('sgd','singapore dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('shp','saint helenian pound','');
insert into wf_currencies(currency_code, currency_name, comments)
values('sit','tolar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('sll','leone','');
insert into wf_currencies(currency_code, currency_name, comments)
values('sos','somali shilling','');
insert into wf_currencies(currency_code, currency_name, comments)
values('srd','surinam dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('std','dobra','');
insert into wf_currencies(currency_code, currency_name, comments)
values('szl','lilangeni','');
insert into wf_currencies(currency_code, currency_name, comments)
values('thb','baht','');
insert into wf_currencies(currency_code, currency_name, comments)
values('tmm','turkmen manat','');
insert into wf_currencies(currency_code, currency_name, comments)
values('tnd','tunisian dinar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('ttd','trinidad and tobago dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('twd','new taiwan dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('uah','hryvnia','');
insert into wf_currencies(currency_code, currency_name, comments)
values('ugx','ugandan shilling','');
insert into wf_currencies(currency_code, currency_name, comments)
values('usd','us dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('uyu','uruguayan peso','');
insert into wf_currencies(currency_code, currency_name, comments)
values('uzs','uzbekistani soum','');
insert into wf_currencies(currency_code, currency_name, comments)
values('veb','bolivar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('vnd','dong','');
insert into wf_currencies(currency_code, currency_name, comments)
values('vuv','vatu','');
insert into wf_currencies(currency_code, currency_name, comments)
values('xaf','communaute financiere africaine franc','');
insert into wf_currencies(currency_code, currency_name, comments)
values('xcd','east caribbean dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('xof','communaute financiere africaine franc','');
insert into wf_currencies(currency_code, currency_name, comments)
values('xpf','comptoirs francais du pacifique franc','');
insert into wf_currencies(currency_code, currency_name, comments)
values('yer','yemeni rial','');
insert into wf_currencies(currency_code, currency_name, comments)
values('ytl','turkish lira','');
insert into wf_currencies(currency_code, currency_name, comments)
values('zar','south african rand','');
insert into wf_currencies(currency_code, currency_name, comments)
values('zmk','zambian kwacha','');
insert into wf_currencies(currency_code, currency_name, comments)
values('zwd','zimbabwean dollar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('nio','gold cordoba','');
insert into wf_currencies(currency_code, currency_name, comments)
values('omr','omani rial','');
insert into wf_currencies(currency_code, currency_name, comments)
values('php','philippine peso','');
insert into wf_currencies(currency_code, currency_name, comments)
values('ron','leu','');
insert into wf_currencies(currency_code, currency_name, comments)
values('rwf','rwandan franc','');
insert into wf_currencies(currency_code, currency_name, comments)
values('sdd','sudanese dinar','');
insert into wf_currencies(currency_code, currency_name, comments)
values('skk','slovak koruna','');
insert into wf_currencies(currency_code, currency_name, comments)
values('syp','syrian pound','');
insert into wf_currencies(currency_code, currency_name, comments)
values('top','paanga','');
insert into wf_currencies(currency_code, currency_name, comments)
values('tzs','tanzanian shilling','');
insert into wf_currencies(currency_code, currency_name, comments)
values('tjs','tajikistani somoni','');
insert into wf_currencies(currency_code, currency_name, comments)
values('bhd','bahraini dinar','');

-- populate wf_languages
insert into wf_languages(language_id,language_name)
values(0,'n/a');
insert into wf_languages(language_id,language_name)
values(20,'afar');
insert into wf_languages(language_id,language_name)
values(30,'afrikaans');
insert into wf_languages(language_id,language_name)
values(40,'albanian');
insert into wf_languages(language_id,language_name)
values(50,'amerindian');
insert into wf_languages(language_id,language_name)
values(60,'amharic');
insert into wf_languages(language_id,language_name)
values(70,'angaur');
insert into wf_languages(language_id,language_name)
values(80,'arabic');
insert into wf_languages(language_id,language_name)
values(90,'armenian');
insert into wf_languages(language_id,language_name)
values(100,'assyrian');
insert into wf_languages(language_id,language_name)
values(101,'aymara');
insert into wf_languages(language_id,language_name)
values(102,'azen');
insert into wf_languages(language_id,language_name)
values(103,'azerbaijani');
insert into wf_languages(language_id,language_name)
values(104,'bahasa indonesia');
insert into wf_languages(language_id,language_name)
values(105,'bahasa melayu');
insert into wf_languages(language_id,language_name)
values(106,'balochi');
insert into wf_languages(language_id,language_name)
values(107,'bambara');
insert into wf_languages(language_id,language_name)
values(108,'bandjabi');
insert into wf_languages(language_id,language_name)
values(109,'bangla');
insert into wf_languages(language_id,language_name)
values(110,'bantu');
insert into wf_languages(language_id,language_name)
values(120,'bapounou');
insert into wf_languages(language_id,language_name)
values(130,'belarusian');
insert into wf_languages(language_id,language_name)
values(140,'bhojpuri');
insert into wf_languages(language_id,language_name)
values(150,'bislama');
insert into wf_languages(language_id,language_name)
values(160,'bokmal norwegian');
insert into wf_languages(language_id,language_name)
values(170,'bosnian');
insert into wf_languages(language_id,language_name)
values(180,'bulgarian');
insert into wf_languages(language_id,language_name)
values(190,'burmese');
insert into wf_languages(language_id,language_name)
values(200,'cantonese');
insert into wf_languages(language_id,language_name)
values(210,'castilian');
insert into wf_languages(language_id,language_name)
values(220,'castilian spanish');
insert into wf_languages(language_id,language_name)
values(230,'catalan');
insert into wf_languages(language_id,language_name)
values(240,'chamorro');
insert into wf_languages(language_id,language_name)
values(250,'chichwea');
insert into wf_languages(language_id,language_name)
values(260,'chilomwe');
insert into wf_languages(language_id,language_name)
values(270,'chinese');
insert into wf_languages(language_id,language_name)
values(280,'chinyanja');
insert into wf_languages(language_id,language_name)
values(290,'chisena');
insert into wf_languages(language_id,language_name)
values(300,'chitonga');
insert into wf_languages(language_id,language_name)
values(310,'chitumbuka');
insert into wf_languages(language_id,language_name)
values(320,'chiyao');
insert into wf_languages(language_id,language_name)
values(330,'cisena');
insert into wf_languages(language_id,language_name)
values(340,'creole');
insert into wf_languages(language_id,language_name)
values(350,'crioulo');
insert into wf_languages(language_id,language_name)
values(360,'croatian');
insert into wf_languages(language_id,language_name)
values(370,'czech');
insert into wf_languages(language_id,language_name)
values(380,'dagomba');
insert into wf_languages(language_id,language_name)
values(390,'danish');
insert into wf_languages(language_id,language_name)
values(400,'djerma');
insert into wf_languages(language_id,language_name)
values(410,'dutch');
insert into wf_languages(language_id,language_name)
values(420,'dzongkha');
insert into wf_languages(language_id,language_name)
values(430,'echuwabo');
insert into wf_languages(language_id,language_name)
values(440,'elomwe');
insert into wf_languages(language_id,language_name)
values(450,'emakhuwa');
insert into wf_languages(language_id,language_name)
values(460,'english');
insert into wf_languages(language_id,language_name)
values(470,'estonian');
insert into wf_languages(language_id,language_name)
values(480,'ewe');
insert into wf_languages(language_id,language_name)
values(490,'fang');
insert into wf_languages(language_id,language_name)
values(500,'faroese');
insert into wf_languages(language_id,language_name)
values(510,'farsi');
insert into wf_languages(language_id,language_name)
values(520,'fijian');
insert into wf_languages(language_id,language_name)
values(530,'filipino');
insert into wf_languages(language_id,language_name)
values(540,'finnish');
insert into wf_languages(language_id,language_name)
values(550,'fon and yoruba');
insert into wf_languages(language_id,language_name)
values(560,'french');
insert into wf_languages(language_id,language_name)
values(570,'frisian');
insert into wf_languages(language_id,language_name)
values(580,'fula');
insert into wf_languages(language_id,language_name)
values(590,'futunian');
insert into wf_languages(language_id,language_name)
values(600,'fuzhou');
insert into wf_languages(language_id,language_name)
values(610,'gagauz');
insert into wf_languages(language_id,language_name)
values(620,'galician');
insert into wf_languages(language_id,language_name)
values(630,'gan');
insert into wf_languages(language_id,language_name)
values(640,'garifuna');
insert into wf_languages(language_id,language_name)
values(650,'georgian');
insert into wf_languages(language_id,language_name)
values(660,'german');
insert into wf_languages(language_id,language_name)
values(670,'greek');
insert into wf_languages(language_id,language_name)
values(680,'greenlandic');
insert into wf_languages(language_id,language_name)
values(690,'guaragigna');
insert into wf_languages(language_id,language_name)
values(700,'guavani');
insert into wf_languages(language_id,language_name)
values(710,'hassaniya');
insert into wf_languages(language_id,language_name)
values(720,'hausa');
insert into wf_languages(language_id,language_name)
values(730,'hebrew');
insert into wf_languages(language_id,language_name)
values(740,'hindi');
insert into wf_languages(language_id,language_name)
values(750,'hindustani');
insert into wf_languages(language_id,language_name)
values(760,'hokkien');
insert into wf_languages(language_id,language_name)
values(770,'hungarian');
insert into wf_languages(language_id,language_name)
values(780,'icelandic');
insert into wf_languages(language_id,language_name)
values(790,'igbo');
insert into wf_languages(language_id,language_name)
values(800,'i-kiribati');
insert into wf_languages(language_id,language_name)
values(810,'indonesian');
insert into wf_languages(language_id,language_name)
values(820,'irish');
insert into wf_languages(language_id,language_name)
values(830,'isixhosa');
insert into wf_languages(language_id,language_name)
values(840,'isizulu');
insert into wf_languages(language_id,language_name)
values(850,'italian');
insert into wf_languages(language_id,language_name)
values(860,'japanese');
insert into wf_languages(language_id,language_name)
values(870,'jola');
insert into wf_languages(language_id,language_name)
values(880,'kabye');
insert into wf_languages(language_id,language_name)
values(890,'kalanga');
insert into wf_languages(language_id,language_name)
values(900,'kazakh');
insert into wf_languages(language_id,language_name)
values(910,'khalkha mongol');
insert into wf_languages(language_id,language_name)
values(920,'khmer');
insert into wf_languages(language_id,language_name)
values(930,'kikongo');
insert into wf_languages(language_id,language_name)
values(940,'kingwana');
insert into wf_languages(language_id,language_name)
values(950,'kinyarwanda');
insert into wf_languages(language_id,language_name)
values(960,'kirundi');
insert into wf_languages(language_id,language_name)
values(970,'kiswahili');
insert into wf_languages(language_id,language_name)
values(980,'korean');
insert into wf_languages(language_id,language_name)
values(990,'kunama');
insert into wf_languages(language_id,language_name)
values(1000,'kurdish');
insert into wf_languages(language_id,language_name)
values(1100,'kyrgyz');
insert into wf_languages(language_id,language_name)
values(1110,'lao');
insert into wf_languages(language_id,language_name)
values(1120,'latin');
insert into wf_languages(language_id,language_name)
values(1130,'latvian');
insert into wf_languages(language_id,language_name)
values(1140,'lingala');
insert into wf_languages(language_id,language_name)
values(1150,'lithuanian');
insert into wf_languages(language_id,language_name)
values(1160,'luri');
insert into wf_languages(language_id,language_name)
values(1170,'luxembourgish');
insert into wf_languages(language_id,language_name)
values(1180,'macedonian');
insert into wf_languages(language_id,language_name)
values(1190,'magar');
insert into wf_languages(language_id,language_name)
values(1200,'mahorian');
insert into wf_languages(language_id,language_name)
values(1210,'maithali');
insert into wf_languages(language_id,language_name)
values(1220,'malagasy');
insert into wf_languages(language_id,language_name)
values(1230,'malay');
insert into wf_languages(language_id,language_name)
values(1240,'malayalam');
insert into wf_languages(language_id,language_name)
values(1250,'maldivian');
insert into wf_languages(language_id,language_name)
values(1260,'maltese');
insert into wf_languages(language_id,language_name)
values(1270,'mandarin');
insert into wf_languages(language_id,language_name)
values(1280,'mandarin chinese');
insert into wf_languages(language_id,language_name)
values(1290,'mandinka');
insert into wf_languages(language_id,language_name)
values(1300,'manx gaelic');
insert into wf_languages(language_id,language_name)
values(1310,'maori');
insert into wf_languages(language_id,language_name)
values(1320,'marshallese');
insert into wf_languages(language_id,language_name)
values(1330,'mayan');
insert into wf_languages(language_id,language_name)
values(1340,'melanesian');
insert into wf_languages(language_id,language_name)
values(1350,'mina');
insert into wf_languages(language_id,language_name)
values(1360,'minnan');
insert into wf_languages(language_id,language_name)
values(1370,'mirandese');
insert into wf_languages(language_id,language_name)
values(1390,'monegasque');
insert into wf_languages(language_id,language_name)
values(1400,'motu');
insert into wf_languages(language_id,language_name)
values(1420,'nahua');
insert into wf_languages(language_id,language_name)
values(1440,'nepali');
insert into wf_languages(language_id,language_name)
values(1450,'newar');
insert into wf_languages(language_id,language_name)
values(1470,'nubian');
insert into wf_languages(language_id,language_name)
values(1480,'nynorsk norwegian');
insert into wf_languages(language_id,language_name)
values(1500,'oromigna');
insert into wf_languages(language_id,language_name)
values(1520,'panjabi');
insert into wf_languages(language_id,language_name)
values(1530,'papiamento');
insert into wf_languages(language_id,language_name)
values(1540,'pashtu');
insert into wf_languages(language_id,language_name)
values(1560,'polish');
insert into wf_languages(language_id,language_name)
values(1570,'polynesian');
insert into wf_languages(language_id,language_name)
values(1590,'pulaar');
insert into wf_languages(language_id,language_name)
values(1600,'punjabi');
insert into wf_languages(language_id,language_name)
values(1610,'quechua');
insert into wf_languages(language_id,language_name)
values(1630,'romani');
insert into wf_languages(language_id,language_name)
values(1650,'russian');
insert into wf_languages(language_id,language_name)
values(1660,'samoan');
insert into wf_languages(language_id,language_name)
values(1680,'sara');
insert into wf_languages(language_id,language_name)
values(1690,'sekgalagadi');
insert into wf_languages(language_id,language_name)
values(1710,'serbian');
insert into wf_languages(language_id,language_name)
values(1730,'setswana');
insert into wf_languages(language_id,language_name)
values(1740,'shanghaiese');
insert into wf_languages(language_id,language_name)
values(1760,'sindhi');
insert into wf_languages(language_id,language_name)
values(1770,'sinhala');
insert into wf_languages(language_id,language_name)
values(1780,'siswati');
insert into wf_languages(language_id,language_name)
values(1800,'slovak');
insert into wf_languages(language_id,language_name)
values(1820,'slovenian');
insert into wf_languages(language_id,language_name)
values(1830,'somali');
insert into wf_languages(language_id,language_name)
values(1850,'spanish');
insert into wf_languages(language_id,language_name)
values(1860,'swahili');
insert into wf_languages(language_id,language_name)
values(1880,'taiwanese');
insert into wf_languages(language_id,language_name)
values(1890,'tajik');
insert into wf_languages(language_id,language_name)
values(1910,'tamil');
insert into wf_languages(language_id,language_name)
values(1920,'telugu');
insert into wf_languages(language_id,language_name)
values(1940,'tetum');
insert into wf_languages(language_id,language_name)
values(1950,'thai');
insert into wf_languages(language_id,language_name)
values(1970,'tigre');
insert into wf_languages(language_id,language_name)
values(1990,'tobi');
insert into wf_languages(language_id,language_name)
values(2000,'tokelauan');
insert into wf_languages(language_id,language_name)
values(2150,'tshiluba');
insert into wf_languages(language_id,language_name)
values(2200,'turkic');
insert into wf_languages(language_id,language_name)
values(2300,'turkmen');
insert into wf_languages(language_id,language_name)
values(2350,'ukrainian');
insert into wf_languages(language_id,language_name)
values(2400,'urdu');
insert into wf_languages(language_id,language_name)
values(2450,'uzbek');
insert into wf_languages(language_id,language_name)
values(2500,'vietnamese');
insert into wf_languages(language_id,language_name)
values(2550,'wallisian');
insert into wf_languages(language_id,language_name)
values(2600,'welsh');
insert into wf_languages(language_id,language_name)
values(2650,'wolof');
insert into wf_languages(language_id,language_name)
values(2700,'xhosa');
insert into wf_languages(language_id,language_name)
values(2750,'xiang');
insert into wf_languages(language_id,language_name)
values(2800,'xichangana');
insert into wf_languages(language_id,language_name)
values(2850,'yezidi');
insert into wf_languages(language_id,language_name)
values(2900,'yoruba');
insert into wf_languages(language_id,language_name)
values(3000,'zulu');
insert into wf_languages(language_id,language_name)
values(1380,'moldovan');
insert into wf_languages(language_id,language_name)
values(1410,'myene');
insert into wf_languages(language_id,language_name)
values(1430,'nauruan');
insert into wf_languages(language_id,language_name)
values(1460,'niuean');
insert into wf_languages(language_id,language_name)
values(1490,'nzebi');
insert into wf_languages(language_id,language_name)
values(1510,'palauian');
insert into wf_languages(language_id,language_name)
values(1550,'persian');
insert into wf_languages(language_id,language_name)
values(1580,'portuguese');
insert into wf_languages(language_id,language_name)
values(1620,'roma');
insert into wf_languages(language_id,language_name)
values(1640,'romanian');
insert into wf_languages(language_id,language_name)
values(1670,'sangho');
insert into wf_languages(language_id,language_name)
values(1700,'sepedi');
insert into wf_languages(language_id,language_name)
values(1720,'sesotho');
insert into wf_languages(language_id,language_name)
values(1750,'shikomoro');
insert into wf_languages(language_id,language_name)
values(1790,'slavic');
insert into wf_languages(language_id,language_name)
values(1810,'slovene');
insert into wf_languages(language_id,language_name)
values(1840,'soninke');
insert into wf_languages(language_id,language_name)
values(1870,'swedish');
insert into wf_languages(language_id,language_name)
values(1900,'tamang');
insert into wf_languages(language_id,language_name)
values(1930,'teochew');
insert into wf_languages(language_id,language_name)
values(1960,'tharu');
insert into wf_languages(language_id,language_name)
values(1980,'tigrinya');
insert into wf_languages(language_id,language_name)
values(2100,'tongan');
insert into wf_languages(language_id,language_name)
values(2250,'turkish');

-- populate wf_countries
insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(2,21,'canada','','northern north america','ottawa',9984670,202080,0,'atlantic ocean',5959,'mount logan','1-jul-1867','canada day','1-jul',33098932,0.88,80.22,38.9,1331,'varies from temperate in south to subarctic and arctic in north','ca','.ca','cad');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(506,13,'republic of costa rica','costa rica','central america','san jose',51100,1290,0,'pacific ocean',3810,'cerro chirripo','15-sep-1821','independence day','15-sep',4075261,1.45,77.02,26.4,156,'tropical and subtropical; dry season (december to april); rainy season (may to november); cooler in highlands','cs','.cr','crc');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(238,11,'republic of cape verde','cape verde','western africa','praia',4033,965,0,'atlantic ocean',2829,'mt. fogo','5-jul-1975','independence day','5-jul',420979,0.64,70.73,19.8,7,'temperate; warm, dry summer; precipitation meager and very erratic','cv','.cv','cve');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(299,21,'greenland','','northern north america','nuuk',2166086,44087,0,'atlantic ocean',3700,'gunnbjorn','','longest day','21-jun',56361,-0.03,69.94,34,14,'arctic to subarctic; cool summers, cold winters','gl','.gl','dkk');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1809,29,'dominican republic','the dominican','caribbean','santo domingo',48730,1288,-46,'lago enriquillo',3175,'pico duarte','27-feb-1844','independence day','27-feb',9183984,1.47,71.73,24.1,32,'tropical maritime; little seasonal temperature variation; seasonal variation in rainfall','dr','.do','dop');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(291,14,'state of eritrea','eritrea','eastern africa','asmara',121320,2234,-75,'near kulul within the denakil depression',3018,'soira','24-may-1993','independence day','24-may',4786994,2.47,59.03,17.8,17,'hot, dry desert strip along red sea coast; cooler and wetter in the central highlands (up to 61 cm of rainfall annually, heaviest june to september); semiarid in western hills and lowlands','er','.er','ern');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(251,14,'federal democratic republic of ethiopia','ethiopia','eastern africa','addis ababa',1127127,0,-125,'denakil depression',4620,'ras dejen','','national day','28-may',74777981,2.31,49.03,17.8,82,'tropical monsoon with wide topographic-induced variation','et','.et','etb');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(34,39,'kingdom of spain','spain','southwestern europe','madrid',504782,4964,0,'atlantic ocean',3718,'pico de teide','','national day','12-oct',40397842,0.13,79.65,39.9,157,'temperate; clear, hot summers in interior, more moderate and cloudy along coast; cloudy, cold winters in interior, partly cloudy and cool along coast','sp','.es','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(378,39,'republic of san marino','san marino','southern europe','san marino',61,0,55,'torrente ausa',755,'monte titano','3 september a.d. 301','founding of the republic','3-sep',29251,1.26,81.71,40.6,0,'mediterranean; mild to cool winters; warm, sunny summers','sm','.sm','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(994,145,'republic of azerbaijan','azerbaijan','southwestern asia','baku',86600,0,-28,'caspian sea',4485,'bazarduzu dagi','30-aug-1991','founding of the democratic republic of azerbaijan','28-may',7961619,0.66,63.85,27.7,45,'dry, semiarid steppe','aj','.az','azm');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(423,155,'principality of liechtenstein','liechtenstein','central europe','vaduz',160,0,430,'ruggeller riet',2599,'vorder-grauspitz','12-jul-1806','assumption day','15-aug',33987,0.78,79.68,39.6,0,'continental; cold, cloudy winters with frequent snow or rain; cool to moderately warm, cloudy, humid summers','ls','.li','chf');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(93,34,'islamic republic of afghanistan','afghanistan','southern asia','kabul',647500,0,258,'amu darya',7485,'nowshak','19-aug-1919','independence day','19-aug',31056997,2.67,43.34,17.6,46,'arid to semiarid; cold winters and hot summers','af','.af','afa');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(355,39,'republic of albania','albania','southeastern europe','tirana',28748,362,0,'adriatic sea',2764,'maja e korabit (golem korab)','28-nov-1912','independence day','28-nov',3581655,0.52,77.43,28.9,11,'mild temperate; cool, cloudy, wet winters; hot, clear, dry summers; interior is cooler and wetter','al','.al','all');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(599,29,'netherlands antilles','','caribbean','willemstad',960,364,0,'caribbean sea',862,'mount scenery','','queens day','30-apr',221736,0.79,76.03,32.8,5,'tropical; ameliorated by northeast trade winds','nt','.an','ang');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(54,5,'argentine republic','argentina','southern south america','buenos aires',2766890,4989,-105,'laguna del carbon',6960,'cerro aconcagua','9-jul-1816','revolution day','25-may',39921833,0.96,76.12,29.7,1333,'mostly temperate; arid in southeast; subantarctic in southwest','ar','.ar','ars');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(688,9,'tuvalu','','oceania','funafuti',26,24,0,'pacific ocean',5,'unnamed location','1-oct-1978','independence day','1-oct',11810,1.51,68.32,24.6,1,'tropical; moderated by easterly trade winds (march to november); westerly gales and heavy rain (november to march)','tv','.tv','aud');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(67,35,'territory of cocos (keeling) islands','cocos (keeling) islands','southeastern asia','west island',14,26,0,'indian ocean',5,'unnamed location','','australia day','26-jan',574,0,null,null,1,'tropical with high humidity, moderated by the southeast trade winds for about nine months of the year','ck','.cc','aud');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(61,9,'commonwealth of australia','australia','oceania','canberra',7686850,25760,-15,'lake eyre',2229,'mount kosciuszko','1-jan-1901','australia day','26-jan',20264082,0.85,80.5,36.9,450,'generally arid to semiarid; temperate in south and east; tropical in north','as','.au','aud');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(671,9,'territory of norfolk island','norfolk island','oceania','kingston',35,32,0,'pacific ocean',319,'mount bates','','bounty day','8-jun',1828,-.01,null,null,1,'subtropical; mild, little seasonal temperature variation','nf','.nf','aud');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(618,35,'territory of christmas island','christmas island','southeastern asia','the settlement',135,139,0,'indian ocean',361,'murray hill',null,'australia day','26-jan',1493,0,null,null,1,'tropical with a wet and dry season; heat and humidity moderated by trade winds; wet season (december to april)','kt','.cx','aud');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(686,9,'republic of kiribati','kiribati','oceania','tarawa',811,1143,0,'pacific ocean',81,'unnamed location','12-jul-1979','independence day','12-jul',105432,2.24,62.08,20.2,19,'tropical; marine, hot and humid, moderated by trade winds','kr','.ki','aud');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(357,145,'republic of cyprus','cyprus','middle east','nicosia',9250,648,0,'mediterranean sea',1951,'mount olympus','16-aug-1960','independence day','1-oct',784301,0.53,77.82,34.9,16,'temperate; mediterranean with hot, dry summers and cool winters','cy','.cy','cyp');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(297,29,'aruba','','caribbean','oranjestad',193,69,0,'caribbean sea',188,'mount jamanota',null,'flag day','18-mar',71891,0.44,79.28,38.5,1,'tropical marine','aa','.aw','awg');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(387,39,'bosnia and herzegovina','','southeastern europe','sarajevo',51129,20,0,'adriatic sea',2386,'maglic','1-mar-1992','national day','25-nov',4498976,1.35,78,38.4,27,'hot summers and cold winters; areas of high elevation have short, cool summers and long, severe winters; mild, rainy winters along coast','bk','.ba','bam');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(257,17,'republic of burundi','burundi','central africa','bujumbura',27830,0,772,'lake tanganyika',2670,'heha','1-jul-1962','independence day','1-jul',8090068,3.7,50.81,16.6,8,'equatorial; high plateau with considerable altitude variation','by','.bi','bif');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1441,21,'bermuda','','north america','hamilton',53,103,0,'atlantic ocean',76,'town hill',null,'bermuda day','24-may',65773,0.61,77.96,40.2,1,'subtropical; mild, humid; gales, strong winds common in winter','bd','.bm','bmd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(673,35,'negara brunei darussalam','brunei','southeastern asia, bordering the south china sea and malaysia','bandar seri begawan',5770,161,0,'south china sea',1850,'bukit pagon','1-jan-1984','national day','23-feb',379444,1.87,75.01,27.4,2,'tropical; hot, humid, rainy','bx','.bn','bnd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(591,5,'republic of bolivia','bolivia','south america','la paz',1098580,0,90,'rio paraguay',6542,'nevado sajama','6-aug-1825','independence day','6-aug',8989046,1.45,65.84,21.8,1067,'varies with altitude; humid and tropical to cold and semiarid','bl','.bo','bob');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(55,5,'federative republic of brazil','brazil','eastern south america','brasilia',8511965,7491,0,'atlantic ocean',3014,'pico da neblina','7-sep-1822','independence day','7-sep',188078227,1.04,71.97,28.2,4223,'mostly tropical, but temperate in south','br','.br','brl');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(975,34,'kingdom of bhutan','bhutan','southern asia','thimphu',47000,0,97,'drangme chhu',7553,'kula kangri','8-aug-1949','national day','17-dec',2279723,2.1,54.78,20.4,2,'varies; tropical in southern plains; cool winters and hot summers in central valleys; severe winters and cool summers in himalayas','bt','.bt','btn');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(375,151,'republic of belarus','belarus','eastern europe','minsk',207600,0,90,'nyoman river',346,'dzyarzhynskaya hara','25-aug-1991','independence day','3-jul',10293011,-0.06,69.08,37.2,101,'cold winters, cool and moist summers; transitional between continental and maritime','bo','.by','byb');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(501,13,'belize','','central america','belmopan',22966,386,0,'caribbean sea',1160,'victoria peak','21-sep-1981','independence day','21-sep',287730,2.31,68.3,19.6,43,'tropical; very hot and humid; rainy season (may to november); dry season (february to may)','bh','.bz','bzd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1246,29,'barbados','','caribbean','bridgetown',431,97,0,'atlantic ocean',336,'mount hillaby','30-nov-1966','independence day','30-nov',279912,0.37,72.79,34.6,1,'tropical; rainy season (june to october)','bb','.bb','bbd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(243,17,'democratic republic of the congo','','central africa','kinshasa',2345410,37,0,'atlantic ocean',5110,'pic marguerite on mont ngaliema','30-jun-1960','independence day','30-jun',62660551,3.07,51.46,16.2,232,'tropical; hot and humid in equatorial river basin; cooler and drier in southern highlands','cg','.cd','cdf');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(264,18,'republic of namibia','namibia','southern africa','windhoek',825418,1572,0,'atlantic ocean',2606,'konigstein','21-mar-1990','independence day','21-mar',2044147,0.59,43.39,20,136,'desert; hot, dry; rainfall sparse and erratic','wa','.na','nad');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(280,5,'south georgia and the south sandwich islands','','southern south america',null,3903,null,0,'atlantic ocean',2934,'mount paget',null,null,null,0,null,null,null,0,'variable, with mostly westerly winds throughout the year interspersed with periods of calm; nearly all precipitation falls as snow','sx','.gs','none');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(12,9,'coral sea islands territory','coral sea islands','oceania',null,3,3095,0,'pacific ocean',6,'unnamed location on cato island',null,null,null,null,null,null,null,null,'tropical','cr','','none');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(300,29,'navassa island','','caribbean',null,5,8,0,'caribbean sea',77,'unnamed location on southwest side',null,null,null,0,null,null,null,null,'marine, tropical','bq','','none');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(672,9,'antarctica','','continent mostly south of the antarctic circle',null,14000000000,17968,-2555,'bentley subglacial trench',4897,'vinson massif',null,null,null,0,null,null,null,28,'severe low temperatures vary with latitude, elevation, and distance from the ocean; east antarctica is colder than west antarctica because of its higher elevation; antarctic peninsula has the most moderate climate; higher temperatures occur in january along the coast and average slightly below freezing','ay','.aq','none');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(2000,35,'territory of ashmore and cartier islands','ashmore and cartier islands','southeastern asia',null,5,74,0,'indian ocean',3,'unnamed location',null,null,null,0,null,null,null,null,'tropical','at','','none');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(208,35,'spratly islands','','southeastern asia',null,5,926,0,'south china sea',4,'unnamed location on southwest cay',null,null,null,0,null,null,null,3,'tropical','pg','','none');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(207,35,'paracel islands','','southeastern asia',null,null,518,0,'south china sea',14,'unnamed location',null,null,null,0,null,null,null,0,'tropical','pf','','none');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(996,143,'kyrgyz republic','kyrgyzstan','central asia','bishkek',198500,0,132,'kara-daryya',7439,'jengish chokusu','31-aug-1991','independence day','31-aug',5213898,1.32,68.49,23.6,37,'dry continental to polar in high tien shan; subtropical in southwest (fergana valley); temperate in northern foothill zone','kg','.kg','none');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(204,154,'jan mayen','','northern europe',null,373,124,0,'norwegian sea',2277,'haakon vii toppen',null,null,null,null,null,null,null,1,'arctic maritime with frequent storms and persistent fog','jn','','none');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(500,5,'falkland islands','','falkland islands','stanley',12173,1288,0,'atlantic ocean',705,'mount usborne','','liberation day','14-jun',2967,2.44,null,null,5,'cold marine; strong westerly winds, cloudy, humid; rain occurs on more than half of days in year; average annual rainfall is 24 inches in stanley; occasional snow all year, except in january and february, but does not accumulate','fk','.fk','fkp');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(44,155,'united kingdom of great britain and northern ireland','united kingdom','western europe','london',244820,12429,-4,'the fens',1343,'ben nevis','10th century',null,null,60609153,0.28,78.54,39.3,471,'temperate; moderated by prevailing southwest winds over the north atlantic current; more than one-half of the days are overcast','uk','.uk','gbp');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(203,155,'bailiwick of jersey','jersey','western europe','saint helier',116,70,0,'atlantic ocean',143,'unnamed location','','liberation day','9-may',91084,0.28,79.38,41.4,1,'temperate; mild winters and cool summers','je','.je','gbp');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(202,155,'isle of man','','western europe','douglas',572,160,0,'irish sea',621,'snaefell','','tynwald day','5-jul',75441,0.52,78.49,39.6,1,'temperate; cool summers and mild winters; overcast about one-third of the time','im','.im','gbp');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(350,39,'gibraltar','','southwestern europe','gibraltar',7,12,0,'mediterranean sea',426,'rock of gibraltar','','national day','10-sep',27928,0.14,79.8,39.8,1,'mediterranean with mild winters and warm summers','gi','.gi','gip');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(502,13,'republic of guatemala','guatemala','central america','guatemala',108890,400,0,'pacific ocean',4211,'volcan tajumulco','15-sep-1821','independence day','15-sep',12293545,2.27,69.38,18.9,449,'tropical; hot, humid in lowlands; cooler in highlands','gt','.gt','gtq');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(592,5,'co-operative republic of guyana','guyana','northern south america','georgetown',214970,459,0,'atlantic ocean',2835,'mount roraima','26-may-1966','republic day','23-feb',767245,0.25,65.86,27.4,69,'tropical; hot, humid, moderated by northeast trade winds; two rainy seasons (may to august, november to january)','gy','.gy','gyd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(968,145,'sultanate of oman','oman','middle east','muscat',212460,2092,0,'arabian sea',2980,'jabal shams','7-jul-1904','birthday of sultan qaboos','18-nov',3102229,3.28,73.37,19,137,'dry desert; hot, humid along coast; hot, dry interior; strong southwest summer monsoon (may to september) in far south','mu','.om','omr');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(63,35,'republic of the philippines','philippines','southeastern asia','manila',300000,36289,0,'philippine sea',2954,'mount apo','12-jun-1898','independence day','4-jul',89468677,1.8,70.21,22.5,256,'tropical marine; northeast monsoon (november to april); southwest monsoon (may to october)','rp','.ph','php');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(250,17,'republic of rwanda','rwanda','central africa','kigali',26338,0,950,'rusizi river',4519,'volcan karisimbi','1-jul-1962','independence day','1-jul',8648248,2.43,47.3,18.6,9,'temperate; two rainy seasons (february to april, november to january); mild in mountains with frost and snow possible','rw','.rw','rwf');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(13,9,'cook islands','','oceania','avarua',240,120,0,'pacific ocean',652,'te manga','','constitution day','first monday in august',21388,null,null,null,9,'tropical; moderated by trade winds','cw','.ck','nzd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(683,9,'niue','','oceania','alofi',260,64,0,'pacific ocean',68,'unnamed location','19-oct-1974','waitangi day','6-feb',2166,0.01,null,null,1,'tropical; modified by southeast trade winds','ne','.nu','nzd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(206,9,'pitcairn, henderson, ducie, and oeno islands','pitcairn islands','oceania','adamstown',47,51,0,'pacific ocean',347,'pawala valley ridge','','birthday of queen elizabeth ii','second saturday in june',45,-0.01,null,null,0,'tropical; hot and humid; modified by southeast trade winds; rainy season (november to march)','pc','.pn','nzd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(64,9,'new zealand','','oceania','wellington',268680,15134,0,'pacific ocean',3754,'aoraki-mount cook','26-sep-1907','waitangi day','6-feb',4076140,0.99,78.81,33.9,117,'temperate with sharp regional contrasts','nz','.nz','nzd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(51,5,'republic of peru','peru','western south america','lima',1285220,2414,0,'pacific ocean',6768,'nevado huascaran','28-jul-1821','independence day','28-jul',28302603,1.32,69.84,25.3,246,'varies from tropical in east to dry desert in west; temperate to frigid in andes','pe','.pe','pen');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(675,9,'independent state of papua new guinea','papua new guinea','oceania','port moresby',462840,5152,0,'pacific ocean',4509,'mount wilhelm','16-sep-1975','independence day','16-sep',5670544,2.21,65.28,21.2,572,'tropical; northwest monsoon (december to march), southeast monsoon (may to october); slight seasonal temperature variation','pp','.pg','pgk');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(595,5,'republic of paraguay','paraguay','central south america','asuncion',406750,0,46,'junction of rio paraguay and rio parana',842,'cerro pero','14-may-1811','independence day','15-may',6506464,2.45,75.1,21.3,880,'subtropical to temperate; substantial rainfall in the eastern portions, becoming semiarid in the far west','pa','.py','pyg');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(966,145,'kingdom of saudi arabia','saudi arabia','middle east','riyadh',1960582,2640,0,'persian gulf',3133,'jabal sawda','23-sep-1932','unification of the kingdom','23-sep',27019731,2.18,75.67,21.4,202,'harsh, dry desert with great temperature extremes','sa','.sa','sar');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(677,9,'solomon islands','','oceania','honiara',28450,5313,0,'pacific ocean',2447,'mount makarakomburu','7-jul-1978','independence day','7-jul',552438,2.61,72.91,18.9,34,'tropical monsoon; few extremes of temperature and weather','bp','.sb','sbd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(248,9,'republic of seychelles','seychelles','oceania','victoria',455,491,0,'indian ocean',905,'morne seychellois','29-jun-1976','constitution day','18-jun',81541,0.43,72.08,28.1,15,'tropical marine; humid; cooler season during southeast monsoon (late may to september); warmer season during northwest monsoon (march to may)','se','.sc','scr');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(290,11,'saint helena','','islands in the south atlantic ocean','jamestown',413,60,0,'atlantic ocean',818,'mount actaeon','','birthday of queen elizabeth ii','second saturday in june',7502,0.56,77.93,36,1,'tropical marine; mild, tempered by trade winds','sh','.sh','shp');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(3,143,'republic of kazakhstan','kazakhstan','central asia','astana',2717300,0,-132,'vpadina kaundy',6995,'khan tangiri shyngy','16-dec-1991','independence day','16-dec',15233244,0.33,66.89,28.8,160,'continental, cold winters and hot summers, arid and semiarid','kz','.kz','kzt');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(94,34,'democratic socialist republic of sri lanka','sri lanka','southern asia','colombo',65610,1340,0,'indian ocean',2524,'pidurutalagala','4-feb-1948','independence day','4-feb',20222240,0.78,73.41,29.8,16,'tropical monsoon; northeast monsoon (december to march); southwest monsoon (june to october)','ce','.lk','lkr');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(995,145,'georgia','','southwestern asia','tbilisi',69700,310,0,'black sea',5201,'mt a shkhara','9-apr-1991','independence day','9-apr',4661473,-0.34,76.09,37.7,25,'warm and pleasant; mediterranean-like on black sea coast','gg','.ge','gel');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(266,18,'kingdom of lesotho','lesotho','southern africa','maseru',30355,0,1400,'junction of the orange and makhaleng rivers',3482,'thabana ntlenyana','4-oct-1966','independence day','4-oct',2022331,-0.46,34.4,20.3,28,'temperate; cool to cold, dry winters; hot, wet summers','lt','.ls','lsl');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(283,15,'western sahara','','northern africa','',266000,1110,-55,'sebjet tah',463,'unnamed location',null,null,null,273008,null,null,null,11,'hot, dry desert; rain is rare; cold offshore air currents produce fog and heavy dew','wi','.eh','mad');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(373,151,'republic of moldova','moldova','eastern europe','chisinau',33843,0,2,'dniester river',430,'dealul balanesti','27-aug-1991','independence day','27-aug',4466706,0.28,65.65,32.3,15,'moderate winters, warm summers','md','.md','mdl');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(389,39,'republic of macedonia','macedonia','southeastern europe','skopje',25333,0,50,'vardar river',2764,'golem korab','8-sep-1991','uprising day','2-aug',2050554,0.26,73.97,34.1,17,'warm, dry summers and autumns; relatively cold winters with heavy snowfall','mk','.mk','mkd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(2001,35,'union of burma','burma','southeastern asia','rangoon',678500,1930,0,'andaman sea',5881,'hkakabo razi','4-jan-1948','independence day','4-jan',47382633,0.81,60.97,27,84,'tropical monsoon; cloudy, rainy, hot, humid summers (southwest monsoon, june to september; less cloudy, scant rainfall, mild temperatures, lower humidity during winter (northeast monsoon, december to april)','','.mm','mmk');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(976,30,'mongolia','','northern asia','ulaanbaatar',1564116,0,518,'hoh nuur',4374,'nayramadlin orgil','11-jul-1921','independence day','11-jul',2832224,1.46,64.89,24.6,48,'desert; continental (large daily and seasonal temperature ranges)','mg','.mn','mnt');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(853,30,'macau special administrative region','macau','eastern asia','',28,41,0,'south china sea',172,'coloane alto','','national day','1-oct',453125,0.86,82.19,36.1,1,'subtropical; marine with cool winters, warm summers','mc','.mo','mop');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(356,39,'republic of malta','malta','southern europe','valletta',316,197,0,'mediterranean sea',253,'ta dmejrek','21-sep-1964','independence day','21-sep',400214,0.42,79.01,38.7,1,'mediterranean; mild, rainy winters; hot, dry summers','mt','.mt','mtl');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(265,18,'republic of malawi','malawi','southern africa','lilongwe',118480,0,37,'junction of the shire river and international boundary with mozambique',3002,'sapitwa','6-jul-1964','independence day','6-jul',13013926,2.38,41.7,16.5,42,'sub-tropical; rainy season (november to may); dry season (may to november)','mi','.mw','mwk');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(52,13,'united mexican states','mexico','middle america','mexico',1972550,9330,-10,'laguna salada',5700,'volcan pico de orizaba','16-sep-1810','independence day','16-sep',107449525,1.16,75.41,25.3,1832,'varies from tropical to desert','mx','.mx','mxn');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(60,35,'malaysia','','southeastern asia','kuala lumpur',329750,4675,0,'indian ocean',4100,'gunung kinabalu','31-aug-1957','independence day','31-aug',24385858,1.78,72.5,24.1,117,'tropical; annual southwest (april to october) and northeast (october to february) monsoons','my','.my','myr');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(961,145,'lebanese republic','lebanon','middle east','beirut',10400,225,0,'mediterranean sea',3088,'qurnat as sawda','22-nov-1943','independence day','22-nov',3874050,1.23,72.88,27.8,7,'mediterranean; mild to cool, wet winters with hot, dry summers; lebanon mountains experience heavy winter snows','le','.lb','lbp');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(258,18,'republic of mozambique','mozambique','southeastern africa','maputo',801590,2470,0,'indian ocean',2436,'monte binga','25-jun-1975','independence day','25-jun',19686505,1.38,39.82,18.3,158,'tropical to subtropical','mz','.mz','mzm');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(681,9,'territory of the wallis and futuna islands','wallis and futuna','oceania','mata-utu',274,129,0,'pacific ocean',765,'mont singavi','','bastille day','14-jul',16025,null,null,null,2,'tropical; hot, rainy season (november to april); cool, dry season (may to october); rains 2,500-3,000 mm per year (80% humidity); average temperature 26.6 degrees c','wf','.wf','xpf');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(689,9,'overseas lands of french polynesia','french polynesia','oceania','papeete',4167,2525,0,'pacific ocean',2241,'mont orohena','','bastille day','14-jul',274578,1.48,76.1,27.9,50,'tropical, but moderate','fp','.pf','xpf');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(27,18,'republic of south africa','south africa','southern africa','pretoria',1219912,2798,0,'atlantic ocean',3408,'njesuthi','31-may-1910','freedom day','27-apr',44187637,-0.4,42.73,24.1,728,'mostly semiarid; subtropical along east coast; sunny days, cool nights','sf','.za','zar');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(260,18,'republic of zambia','zambia','southern africa','lusaka',752614,0,329,'zambezi river',2301,'unnamed location in mafinga hills','24-oct-1964','independence day','24-oct',11502010,2.11,40.03,16.5,109,'tropical; modified by altitude; rainy season (october to april)','za','.zm','zmk');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(263,18,'republic of zimbabwe','zimbabwe','southern africa','harare',390580,0,162,'junction of the runde and save rivers',2592,'inyangani','18-apr-1980','independence day','18-apr',12236805,0.62,39.29,19.9,404,'tropical; moderated by altitude; rainy season (november to march)','zi','.zw','zwd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(505,13,'republic of nicaragua','nicaragua','central america','managua',129494,910,0,'pacific ocean',2438,'mogoton','15-sep-1821','independence day','15-sep',5570129,1.89,70.63,20.9,176,'tropical in lowlands, cooler in highlands','nu','.ni','nio');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(977,34,'kingdom of nepal','nepal','southern asia','kathmandu',147181,0,70,'kanchan kalan',8850,'mount everest','2-nov-1904','birthday of king gyanendra','7-jul',28287147,2.17,60.18,20.3,48,'varies from cool summers and severe winters in north to subtropical summers and mild winters in south','np','.np','npr');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(690,9,'tokelau','','oceania','',10,101,0,'pacific ocean',5,'unnamed location','','waitangi day','6-feb',1392,-0.01,null,null,0,'tropical; moderated by trade winds (april to november)','tl','.tk','nzd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1,21,'united states of america','united states','north america','washington, dc',9631420,19924,-86,'death valley',6194,'mount mckinley','4-jul-1776','independence day','4-jul',298444215,0.91,77.85,36.5,14893,'mostly temperate, but tropical in hawaii and florida, arctic in alaska, semiarid in the great plains west of the mississippi river, and arid in the great basin of the southwest; low winter temperatures in the northwest are ameliorated occasionally in january and february by warm chinook winds from the eastern slopes of the rocky mountains','us','.us','usd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(852,30,'hong kong special administrative region','hong kong','eastern asia','',1092,733,0,'south china sea',958,'tai mo shan','','national day','1-oct',6940432,0.59,81.59,40.7,3,'subtropical monsoon; cool and humid in winter, hot and rainy from spring through summer, warm and sunny in fall','hk','.hk','hkd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(15,18,'europa island','','southern africa','',28,22,0,'indian ocean',24,'unnamed location',null,null,null,null,null,null,null,1,'tropical','eu',null,'none');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(92,34,'islamic republic of pakistan','pakistan','southern asia','islamabad',803940,1046,0,'indian ocean',8611,'k2','14-aug-1947','republic day','23-mar',165803560,2.09,63.39,19.8,134,'mostly hot, dry desert; temperate in northwest; arctic in north','pk','.pk','pkr');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(20,15,'arab republic of egypt','egypt','northern africa','cairo',1001450,2450,-133,'qattara depression',2629,'mount catherine','28-feb-1922','revolution day','23-jul',78887007,1.75,71.29,24,87,'desert; hot, dry summers with moderate winters','eg','.eg','egp');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(385,39,'republic of croatia','croatia','southeastern europe','zagreb',56542,5835,0,'adriatic sea',1830,'dinara','25-jun-1991','independence day','8-oct',4494749,-0.03,74.68,40.3,68,'mediterranean and continental; continental climate predominant with hot summers and cold winters; mild winters, dry summers along coast','hr','.hr','hrk');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(509,29,'republic of haiti','haiti','caribbean','port-au-prince',27750,1771,0,'caribbean sea',2680,'chaine de la selle','1-jan-1804','independence day','1-jan',8308504,2.3,53.23,18.2,12,'tropical; semiarid where mountains in east cut off trade winds','ha','.ht','htg');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(91,34,'republic of india','india','southern asia','new delhi',3287590,7000,0,'indian ocean',8598,'kanchenjunga','15-aug-1947','republic day','26-jan',1095351995,1.38,64.71,24.9,334,'varies from tropical monsoon in south to temperate in north','in','.in','inr');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(98,34,'islamic republic of iran','iran','middle east','tehran',2,2440,-28,'caspian sea',5671,'kuh-e damavand','1-apr-1979','republic day','1-apr',68688433,1.1,70.26,24.8,310,'mostly arid or semiarid, subtropical along caspian coast','ir','.ir','irr');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1876,29,'jamaica','','caribbean','kingston',10991,1022,0,'caribbean sea',2256,'blue mountain peak','6-aug-1962','independence day','6-aug',2758124,0.8,73.24,23,35,'tropical; hot, humid; temperate interior','jm','.jm','jmd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(254,14,'republic of kenya','kenya','eastern africa','nairobi',582650,536,0,'indian ocean',5199,'mount kenya','12-dec-1963','independence day','12-dec',34707817,2.57,48.93,18.2,224,'varies from tropical along coast to arid in interior','ke','.ke','kes');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(855,35,'kingdom of cambodia','cambodia','southeastern asia','phnom penh',181040,443,0,'gulf of thailand',1810,'phnum aoral','9-nov-1953','independence day','9-nov',13881427,1.78,59.29,20.6,20,'tropical; rainy, monsoon season (may to november); dry season (december to april); little seasonal temperature variation','cb','.kh','khr');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(269,18,'union of the comoros','comoros','southern africa','moroni',2170,340,0,'indian ocean',2360,'le kartala','6-jul-1975','independence day','6-jul',690948,2.87,62.33,18.6,4,'tropical marine; rainy season (november to may)','cn','.km','kmf');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(82,30,'republic of korea','south korea','eastern asia','seoul',98480,2413,0,'sea of japan',1950,'halla-san','15-aug-1945','liberation day','15-aug',48846823,0.42,77.04,35.2,108,'temperate, with rainfall heavier in summer than winter','ks','.kr','krw');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1345,29,'cayman islands','','caribbean','george town',262,160,0,'caribbean sea',43,'the bluff','','constitution day','first monday in july',45436,2.56,80.07,37.2,3,'tropical marine; warm, rainy summers (may to october) and cool, relatively dry winters (november to april)','cj','.ky','kyd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(850,30,'democratic peoples republic of korea','north korea','eastern asia','pyongyang',120540,2495,0,'sea of japan',2744,'paektu-san','15-aug-1945','founding of the democratic peoples republic of korea','9-sep',23113019,0.84,71.65,32,79,'temperate with rainfall concentrated in summer','kn','.kp','kpw');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(964,145,'republic of iraq','iraq','middle east','baghdad',437072,58,0,'persian gulf',3611,'unnamed peak','28-jun-2004',null,null,26783383,2.66,69.01,19.7,111,'mostly desert; mild to cool winters with dry, hot, cloudless summers; northern mountainous regions along iranian and turkish borders experience cold winters with occasionally heavy snows that melt in early spring, sometimes causing extensive flooding in central and southern iraq','iz','.iq','nid');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(508,21,'territorial collectivity of saint pierre and miquelon','saint pierre and miquelon','northern north america','saint-pierre',242,120,0,'atlantic ocean',240,'morne de la grande montagne','','bastille day','14-jul',7026,0.17,78.61,34.1,2,'cold and wet, with much mist and fog; spring and autumn are windy','sb','.pm','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(262,18,'department of reunion','reunion','southern africa','saint-denis',2517,207,0,'indian ocean',3069,'piton des neiges','','bastille day','14-jul',787584,1.34,74.18,26.9,2,'tropical, but temperature moderates with elevation; cool and dry (may to november), hot and rainy (november to april)','re','.re','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(590,29,'department of guadeloupe','guadeloupe','caribbean','basse-terre',1780,306,0,'caribbean sea',1484,'soufriere','','bastille day','14-jul',452776,0.88,78.06,32.2,9,'subtropical tempered by trade winds; moderately high humidity','gp','.gp','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(376,39,'principality of andorra','andorra','southwestern europe','andorra la vella',468,0,840,'riu runer',2946,'coma pedrosa','1-jul-1903','our lady of meritxell day','8-sep',71201,0.89,83.51,40.9,0,'temperate; snowy, cold winters and warm, dry summers','an','.ad','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(351,39,'portuguese republic','portugal','southwestern europe','lisbon',92391,1793,0,'atlantic ocean',2351,'ponta do pico','5-oct-1910','portugal day','10-jun',10605870,0.36,77.7,38.5,66,'maritime temperate; cool and rainy in north, warmer and drier in south','po','.pt','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(381,39,'republic of montenegro','montenegro','southeastern europe','cetinje',14026,294,0,'adriatic sea',2522,'bobotov kuk','3-jun-2006','national day','13-jul',630548,3.5,null,null,5,'mediterranean climate, hot dry summers and autumns and relatively cold winters with heavy snowfalls inland','mj','','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(270,18,'territorial collectivity of mayotte','mayotte','southern africa','mamoutzou',374,185,0,'indian ocean',660,'benara','','bastille day','14-jul',201234,3.77,61.76,17,1,'tropical; marine; hot, humid, rainy season during northeastern monsoon (november to may); dry season is cooler (may to november)','mf','.yt','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(596,29,'department of martinique','martinique','caribbean','fort-de-france',1100,350,0,'caribbean sea',1397,'montagne pelee','','bastille day','14-jul',436131,0.72,79.18,34.1,2,'tropical; moderated by trade winds; rainy season (june to october); vulnerable to devastating cyclones (hurricanes) every eight years on average; average temperature 17.3 degrees c; humid','mb','.mq','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(679,9,'republic of the fiji islands','fiji','oceania','suva',18270,1129,0,'pacific ocean',1324,'tomanivi','10-oct-1970','independence day','second monday of october',905949,1.4,69.82,24.6,28,'tropical marine; only slight seasonal temperature variation','fj','.fj','fjd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(213,15,'peoples democratic republic of algeria','algeria','northern africa','algiers',2381740,998,-40,'chott melrhir',3003,'tahat','5-jul-1962','revolution day','1-nov',32930091,1.22,73.26,24.9,137,'arid to semiarid','ag','.dz','dzd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(245,11,'republic of guinea-bissau','guinea-bissau','western africa','bissau',36120,350,0,'atlantic ocean',300,'unnamed location','24-sep-1973','independence day','24-sep',1442029,2.07,46.87,19,28,'tropical; generally hot and humid; monsoonal-type rainy season (june to november) with southwesterly winds; dry season (december to may) with northeasterly harmattan winds','pu','.gw','xof');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(676,9,'kingdom of tonga','tonga','oceania','nuku alofa',748,419,0,'pacific ocean',1033,'unnamed location on kao island','4-jun-1970','emancipation day','4-jun',114689,2.01,69.82,20.7,6,'tropical; modified by trade winds; warm season (december to may), cool season (may to december)','tn','.to','top');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(240,11,'republic of equatorial guinea','equatorial guinea','western africa','malabo',28051,296,0,'atlantic ocean',3008,'pico basile','12-oct-1968','independence day','12-oct',540109,2.05,49.54,18.8,4,'tropical; always hot, humid','ek','.gq','xaf');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1784,29,'saint vincent and the grenadines','','caribbean','kingstown',389,84,0,'caribbean sea',1234,'la soufriere','27-oct-1979','independence day','27-oct',117848,0.26,73.85,26.9,6,'tropical; little seasonal temperature variation; rainy season (may to november)','vc','.vc','xcd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1869,29,'federation of saint kitts and nevis','saint kitts and nevis','caribbean','basseterre',261,135,0,'caribbean sea',1156,'mount liamuiga','19-sep-1983','independence day','19-sep',39129,0.5,72.4,27.8,2,'tropical, tempered by constant sea breezes; little seasonal temperature variation; rainy season (may to november)','sc','.kn','xcd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(236,17,'central african republic','','central africa','bangui',622984,0,335,'oubangui river',1420,'mont ngaoui','13-aug-1960','republic day','1-dec',4303356,1.53,43.54,18.4,50,'tropical; hot, dry winters; mild to hot, wet summers','ct','.cf','xaf');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1473,29,'grenada','','caribbean','saint georges',344,121,0,'caribbean sea',840,'mount saint catherine','7-feb-1974','independence day','7-feb',89703,0.26,64.87,21.7,3,'tropical; tempered by northeast trade winds','gj','.gd','xcd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1767,29,'commonwealth of dominica','dominica','caribbean','roseau',754,148,0,'caribbean sea',1447,'morne diablatins','3-nov-1978','independence day','3-nov',68910,-0.08,74.87,30.1,2,'tropical; moderated by northeast trade winds; heavy rainfall','do','.dm','xcd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1264,29,'anguilla','','caribbean','the valley',102,61,0,'caribbean sea',65,'crocus hill','','anguilla day','30-may',13477,1.57,77.28,31.2,3,'tropical; moderated by northeast trade winds','av','.ai','xcd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1268,29,'antigua and barbuda','','caribbean','saint johns',443,153,0,'caribbean sea',402,'boggy peak','1-nov-1981','independence day (national day)','1-nov',69108,0.55,72.16,30,3,'tropical maritime','ac','.ag','xcd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1664,29,'montserrat','','caribbean','plymouth',102,40,0,'caribbean sea',930,'lava dome in englishs crater','','birthday of queen elizabeth ii','second saturday in june',9439,1.05,78.85,28.9,1,'tropical; little daily or seasonal temperature variation','mh','.ms','xcd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(255,14,'united republic of tanzania','tanzania','eastern africa','dar es salaam',945087,1424,0,'indian ocean',5895,'kilimanjaro','26-apr-1964','union day','26-apr',37445392,1.83,45.64,17.7,123,'varies from tropical along coast to temperate in highlands','tz','.tz','tzs');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(386,39,'republic of slovenia','slovenia','central europe','ljubljana',20273,47,0,'adriatic sea',2864,'triglav','25-jun-1991','independence day','25-jun',2010347,-0.05,76.33,40.6,14,'mediterranean climate on the coast, continental climate with mild to hot summers and cold winters in the plateaus and valleys to the east','si','.si','sit');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(268,18,'kingdom of swaziland','swaziland','southern africa','mbabane',17363,0,21,'great usutu river',1862,'emlembe','6-sep-1968','independence day','6-sep',1136334,-0.23,32.62,18.5,18,'varies from tropical to near temperate','wz','.sz','szl');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(993,143,'turkmenistan','','central asia','ashgabat',488100,0,-81,'vpadina akchanaya',3139,'gora ayribaba','27-oct-1991','independence day','27-oct',5042920,1.83,61.83,21.8,39,'subtropical desert','tx','.tm','tmm');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(256,14,'republic of uganda','uganda','eastern africa','kampala',236040,0,621,'lake albert',5110,'margherita peak on mount stanley','9-oct-1962','independence day','9-oct',28195754,3.37,52.67,15,28,'tropical; generally rainy with two dry seasons (december to february, june to august); semiarid in northeast','ug','.ug','ugx');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(31,155,'kingdom of the netherlands','netherlands','western europe','amsterdam',41526,451,-7,'zuidplaspolder',322,'vaalserberg','23-jan-1579','queens day','30-apr',16491461,0.49,78.96,39.4,27,'temperate; marine; cool summers and mild winters','nl','.nl','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(992,143,'republic of tajikistan','tajikistan','central asia','dushanbe',143100,0,300,'syr darya',7495,'qullai ismoili somoni','9-sep-1991','independence day','9-sep',7320815,2.19,64.94,20,45,'midlatitude continental, hot summers, mild winters; semiarid to polar in pamir mountains','ti','.tj','tjs');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1340,29,'united states virgin islands','virgin islands','caribbean','charlotte amalie',1910,188,0,'caribbean sea',475,'crown mountain','','transfer day','27-mar',108605,-0.12,79.05,37.1,2,'subtropical, tempered by easterly trade winds, relatively low humidity, little seasonal temperature variation; rainy season september to november','vq','.vi','usd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1284,29,'british virgin islands','','caribbean','road town',153,80,0,'caribbean sea',521,'mount sage','','territory day','1-jul',23098,1.97,76.68,31.4,3,'subtropical; humid; temperatures moderated by trade winds','vi','.vg','usd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(244,18,'republic of angola','angola','southern africa','luanda',1246700,1600,0,'atlantic ocean',2620,'morro de moco','11-nov-1975','independence day','11-nov',12127071,2.45,38.62,18,243,'semiarid in south and along coast to luanda; north has cool, dry season (may to october) and hot, rainy season (november to april)','ao','.ao','aoa');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1649,29,'turks and caicos islands','','caribbean','grand turk',430,389,0,'caribbean sea',49,'blue hills','','constitution day','30-aug',21152,2.82,74.73,27.5,8,'tropical; marine; moderated by trade winds; sunny and relatively dry','tk','.tc','usd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(692,9,'republic of the marshall islands','marshall islands','oceania','majuro',11854,370,0,'pacific ocean',10,'unnamed location','1-oct-1986','constitution day','1-may',60422,2.25,70.31,20.3,15,'tropical; hot and humid; wet season may to november; islands border typhoon belt','rm','.mh','usd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1671,9,'territory of guam','guam','oceania','hagatna',541,126,0,'pacific ocean',406,'mount lamlam','','discovery day','first monday in march',171019,1.43,78.58,28.6,5,'tropical marine; generally warm and humid, moderated by northeast trade winds; dry season (january to june), rainy season (july to december); little seasonal temperature variation','gq','.gu','usd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(691,9,'federated states of micronesia','','oceania','palikir',702,6112,0,'pacific ocean',791,'dolohmwar','3-nov-1986','constitution day','10-may',108004,-0.11,70.05,20.9,6,'tropical; heavy year-round rainfall, especially in the eastern islands; located on southern edge of the typhoon belt with occasionally severe damage','fm','.fm','usd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(503,13,'republic of el salvador','el salvador','central america','san salvador',21040,307,0,'pacific ocean',2730,'cerro el pital','15-sep-1821','independence day','15-sep',6822378,1.72,71.49,21.8,76,'tropical; rainy season (may to october); dry season (november to april); tropical on coast; temperate in uplands','es','.sv','usd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(593,5,'republic of ecuador','ecuador','western south america','quito',283560,2237,0,'pacific ocean',6267,'chimborazo','24 may 1822','independence day','10-aug',13547510,1.5,76.42,23.6,285,'tropical along coast, becoming cooler inland at higher elevations; tropical in amazonian jungle lowlands','ec','.ec','usd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1670,9,'commonwealth of the northern mariana islands','northern mariana islands','oceania','saipan',477,1482,0,'pacific ocean',965,'unnamed location on agrihan','','commonwealth day','8-jan',82459,2.54,76.09,29.5,5,'tropical marine; moderated by northeast trade winds, little seasonal temperature variation; dry season december to june, rainy season july to october','cq','.mp','usd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(684,9,'territory of american samoa','american samoa','oceania','pago pago',199,116,0,'pacific ocean',964,'lata mountain','','flag day','17-apr',57794,-0.19,76.05,23.2,3,'tropical marine, moderated by southeast trade winds; annual rainfall averages about 3 m; rainy season (november to april), dry season (may to october); little seasonal temperature variation','aq','.as','usd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(239,11,'democratic republic of sao tome and principe','sao tome and principe','western africa','sao tome',1001,209,0,'atlantic ocean',2024,'pico de sao tome','12-jul-1975','independence day','12-jul',193413,3.15,67.31,16.2,2,'tropical; hot, humid; one rainy season (october to may)','tp','.st','std');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(598,5,'oriental republic of uruguay','uruguay','southern south america','montevideo',176220,660,0,'atlantic ocean',514,'cerro catedral','25-aug-1825','independence day','25-aug',3431932,0.46,76.33,32.7,64,'warm temperate; freezing temperatures almost unknown','uy','.uy','uyu');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(998,143,'republic of uzbekistan','uzbekistan','central asia','tashkent',447400,0,-12,'sariqarnish kuli',4301,'adelunga toghi','1-sep-1991','independence day','1-sep',27307134,1.7,64.58,22.7,79,'mostly midlatitude desert, long, hot summers, mild winters; semiarid grassland in east','uz','.uz','uzs');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(58,5,'bolivarian republic of venezuela','venezuela','northern south america','caracas',912050,2800,0,'caribbean sea',5007,'pico bolivar','5-jul-1811','independence day','5-jul',25730435,1.38,74.54,26,370,'tropical; hot, humid; more moderate in highlands','ve','.ve','veb');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(678,9,'republic of vanuatu','vanuatu','oceania','port-vila',12200,2528,0,'pacific ocean',1877,'tabwemasana','30-jul-1980','independence day','30-jul',208869,1.49,62.85,23,31,'tropical; moderated by southeast trade winds from may to october; moderate rainfall from november to april; may be affected by cyclones from december to april','nh','.vu','vuv');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(48,151,'republic of poland','poland','central europe','warsaw',312685,491,-2,'near raczki elblaskie',2499,'rysy','11-nov-1918','constitution day','3-may',38536869,-0.05,74.97,37,123,'temperate with cold, cloudy, moderately severe winters with frequent precipitation; mild summers with frequent showers and thundershowers','pl','.pl','pln');
-- *******************

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(670,35,'democratic republic of timor-leste','east timor','southeastern asia','dili',15007,706,0,'timor sea',2963,'foho tatamailau','28-nov-1975','independence day','28-nov',1062777,2.08,66.26,20.8,8,'tropical; hot, humid; distinct rainy and dry seasons','tt','.tl','usd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(46,154,'kingdom of sweden','sweden','northern europe','stockholm',449964,3218,-2,'reclaimed bay of lake hammarsjon',2111,'kebnekaise','6-jun-1523','flag day','6-jun',9016596,0.16,80.51,40.9,255,'temperate in south with cold, cloudy winters and cool, partly cloudy summers; subarctic in north','sw','.se','sek');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(421,151,'slovak republic','slovakia','central europe','bratislava',48845,0,94,'bodrok river',2655,'gerlachovsky stit','1-jan-1993','constitution day','1-sep',5439448,0.15,74.73,35.8,34,'temperate; cool summers; cold, cloudy, humid winters','lo','.sk','skk');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1758,29,'saint lucia','','caribbean','castries',616,158,0,'caribbean sea',950,'mount gimie','22-feb-1979','independence day','22-feb',168458,1.29,73.84,25.2,2,'tropical, moderated by northeast trade winds; dry season january to april, rainy season may to august','st','.lc','xcd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(205,18,'juan de nova island','','southern africa',null,4,24,0,'indian ocean',10,'unnamed location',null,null,null,null,null,null,null,1,'tropical','ju',null,'none');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(230,18,'republic of mauritius','mauritius','southern africa','port louis',2040,177,0,'indian ocean',828,'mont piton','12-mar-1968','independence day','12-mar',1240827,0.82,72.63,30.8,6,'tropical, modified by southeast trade winds; warm, dry winter (may to november); hot, wet, humid summer (november to may)','mp','.mu','mur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(47,154,'kingdom of norway','norway','northern europe','oslo',324220,25148,0,'norwegian sea',2469,'galdhopiggen','7-jun-1905','constitution day','17-may',4610820,0.38,79.54,38.4,100,'temperate along coast, modified by north atlantic current; colder interior with increased precipitation and colder summers; rainy year-round on west coast','no','.no','nok');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(53,29,'republic of cuba','cuba','caribbean','havana',110860,3735,0,'caribbean sea',2005,'pico turquino','20-may-1902','independence day','20-may',11382820,0.31,77.41,35.9,170,'tropical; moderated by trade winds; dry season (november to april); rainy season (may to october)','cu','.cu','cup');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(56,5,'republic of chile','chile','southern south america','santiago',756950,6435,0,'pacific ocean',6880,'nevado ojos del salado','18-sep-1810','independence day','18-sep',16134219,0.94,76.77,30.4,363,'temperate; desert in north; mediterranean in central region; cool and damp in south','ci','.cl','clp');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(57,5,'republic of colombia','colombia','northern south america','bogota',1138910,3208,0,'pacific ocean',5775,'pico cristobal colon','20-jul-1810','independence day','20-jul',43593035,1.46,71.99,26.3,981,'tropical along coast and eastern plains; cooler in highlands','co','.co','cop');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(62,35,'republic of indonesia','indonesia','southeastern asia','jakarta',1919440,54716,0,'indian ocean',5030,'puncak jaya','17-aug-1945','independence day','17-aug',245452739,1.41,69.87,26.8,668,'tropical; hot, humid; more moderate in highlands','id','.id','idr');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(65,35,'republic of singapore','singapore','southeastern asia','singapore',693,193,0,'singapore strait',166,'bukit timah','9-aug-1965','national day','9-aug',4492150,1.42,81.71,37.3,9,'tropical; hot, humid, rainy; two distinct monsoon seasons - northeastern monsoon (december to march) and southwestern monsoon (june to september); inter-monsoon - frequent afternoon and early evening thunderstorms','sn','.sg','sgd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(39,39,'italian republic','italy','southern europe','rome',301230,7600,0,'mediterranean sea',4748,'mont blanc','17-mar-1861','republic day','2-jun',58133509,0.04,79.81,42.2,135,'predominantly mediterranean; alpine in far north; hot, dry in south','it','.it','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(49,155,'federal republic of germany','germany','central europe','berlin',357021,2389,-4,'neuendorf bei wilster',2963,'zugspitze','15-mar-1991','unity day','3-oct',82422299,-0.02,78.8,42.6,552,'temperate and marine; cool, cloudy, wet winters and summers; occasional warm mountain (foehn) wind','gm','.de','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(36,151,'republic of hungary','hungary','central europe','budapest',93030,0,78,'tisza river',1014,'kekes','27-sep-1902','saint stephens day','20-aug',9981334,-0.25,72.66,38.7,44,'temperate; cold, cloudy, humid winters; warm summers','hu','.hu','huf');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(32,155,'kingdom of belgium','belgium','western europe','brussels',30528,67,0,'north sea',694,'signal de botrange','4-oct-1830','','21-jul',10379067,0.13,78.77,40.9,43,'temperate; mild winters, cool summers; rainy, humid, cloudy','be','.be','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(33,155,'french republic','france','western europe','paris',547030,3427,-2,'rhone river delta',4807,'mont blanc','','bastille day','14-jul',60876136,0.35,79.73,39.1,479,'generally cool winters and mild summers, but mild winters and hot summers along the mediterranean; occasional strong, cold, dry, north-to-northwesterly wind known as mistral','fr','.fr','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(7,151,'russian federation','russia','northern asia','moscow',17075200,37653,-28,'caspian sea',5633,'gora el brus','24-aug-1991','russia day','12-jun',142893540,-0.37,67.08,38.4,1730,'ranges from steppes in the south through humid continental in much of european russia; subarctic in siberia to tundra climate in the polar north; winters vary from cool along black sea coast to frigid in siberia; summers vary from warm in the steppes to cool along arctic coast','rs','.ru','rur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(45,154,'kingdom of denmark','denmark','northern europe','copenhagen',43094,7314,-7,'lammefjord',173,'yding skovhoej','','constitution day','5-jun',5450661,0.33,77.79,39.8,97,'temperate; humid and overcast; mild, windy winters and cool summers','da','.dk','dkk');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(41,155,'swiss confederation','switzerland','central europe','bern',41290,0,195,'lake maggiore',4634,'dufourspitze','1-aug-1291','founding of the swiss confederation','1-aug',7523934,0.43,80.51,40.1,65,'temperate, but varies with altitude; cold, cloudy, rainy/snowy winters; cool to warm, cloudy, humid summers with occasional showers','sz','.ch','chf');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(43,155,'republic of austria','austria','central europe','vienna',83870,0,115,'neusiedler see',3798,'grossglockner','17-sep-1156','national day','26-oct',8192880,0.09,79.07,40.9,55,'temperate; continental, cloudy; cold winters with frequent rain and some snow in lowlands and snow in mountains; moderate summers with occasional showers','au','.at','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(209,154,'svalbard','','northern europe','longyearbyen',62049,3587,0,'arctic ocean',1717,'newtontoppen',null,null,null,2701,-0.02,null,null,4,'arctic, tempered by warm north atlantic current; cool summers, cold winters; north atlantic current flows along west and north coasts of spitsbergen, keeping water open and navigable most of the year','sv','.sj','nok');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(81,30,'japan','','eastern asia','tokyo',377835,29751,-4,'hachiro-gata',3776,'mount fuji','660 b.c.','birthday of emperor akihito','23-dec',127463611,0.02,81.25,42.9,173,'varies from tropical in south to cool temperate in north','ja','.jp','jpy');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(84,35,'socialist republic of vietnam','vietnam','southeastern asia','hanoi',329560,3444,0,'south china sea',3144,'fan si pan','2-sep-1945','independence day','2-sep',84402966,1.02,70.85,25.9,28,'tropical in south; monsoonal in north with hot, rainy season (may to september) and warm, dry season (october to march)','vm','.vn','vnd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(86,30,'peoples republic of china','china','eastern asia','beijing',9596960,14500,-154,'turpan pendi',8850,'mount everest','1-oct-1949','anniversary of the founding of the peoples republic of china','1-oct',1313973713,0.59,72.58,32.7,489,'extremely diverse; tropical in south to subarctic in north','ch','.cn','cny');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(90,151,'republic of turkey','turkey','southeastern europe','ankara',780580,7200,0,'mediterranean sea',5166,'mount ararat','29-oct-1923','republic day','29-oct',70413958,1.06,72.62,28.1,120,'temperate; hot, dry summers with mild, wet winters; harsher in interior','tu','.tr','ytl');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(298,154,'faroe islands','','northern europe','torshavn',1399,1117,0,'atlantic ocean',882,'slaettaratindur','','olaifest','29-jul',47246,0.58,79.35,35,1,'mild winters, cool summers; usually overcast; foggy, windy','fo','.fo','dkk');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(22,155,'bailiwick of guernsey','guernsey','western europe','saint peter port',78,50,0,'atlantic ocean',114,'unnamed location','','liberation day','9-may',65409,0.26,80.42,41.3,2,'temperate with mild winters and cool summers; about 50% of days are overcast','gk','.gg','gbp');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(30,39,'hellenic republic','greece','southern europe','athens',131940,13676,0,'mediterranean sea',2917,'mount olympus','2-jan-1905','independence day','25-mar',10688058,0.18,79.24,40.8,82,'temperate; mild, wet winters; hot, dry summers','gr','.gr','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(228,11,'togolese republic','togo','western africa','lome',56785,56,0,'atlantic ocean',986,'mont agou','27-apr-1960','independence day','27-apr',5548702,2.72,57.42,18.3,9,'tropical; hot, humid in south; semiarid in north','to','.tg','xof');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(229,11,'republic of benin','benin','western africa','porto-novo',112620,121,0,'atlantic ocean',658,'mont sokbaro','1-aug-1960','national day','1-aug',7862944,2.73,53.04,17.6,5,'tropical; hot, humid in south; semiarid in north','bn','.bj','xof');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(267,18,'republic of botswana','botswana','southern africa','gaborone',600370,0,513,'junction of the limpopo and shashe rivers',1489,'tsodilo hills','30-sep-1966','independence day','30-sep',1639833,-0.04,33.74,19.4,85,'semiarid; warm winters and hot summers','bc','.bw','bwp');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(66,35,'kingdom of thailand','thailand','southeastern asia','bangkok',514000,3219,0,'gulf of thailand',2576,'doi inthanon','22-may-1903','birthday of king phumiphon','5-dec',64631595,0.68,72.25,31.9,108,'tropical; rainy, warm, cloudy southwest monsoon (mid-may to september); dry, cool northeast monsoon (november to mid-march); southern isthmus always hot and humid','th','.th','thb');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(253,14,'republic of djibouti','djibouti','eastern africa','djibouti',23000,314,-155,'lac assal',2028,'moussa ali','27-jun-1977','independence day','27-jun',486530,2.02,43.17,18.2,13,'desert; torrid, dry','dj','.dj','djf');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(218,15,'great socialist peoples libyan arab jamahiriya','libya','northern africa','tripoli',1759540,1770,-47,'sabkhat ghuzayyil',2267,'bikku bitti','24-dec-1951','revolution day','1-sep',5900754,2.3,76.69,23,139,'mediterranean along coast; dry, extreme desert interior','ly','.ly','lyd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(40,151,'romania','','southeastern europe','bucharest',237500,225,0,'black sea',2544,'moldoveanu','30-dec-1947','unification day','1-dec',22303552,-0.12,71.63,36.6,61,'temperate; cold, cloudy winters with frequent snow and fog; sunny summers with frequent showers and thunderstorms','ro','.ro','ron');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(222,15,'islamic republic of mauritania','mauritania','northern africa','nouakchott',1030700,754,-5,'sebkhet te-n-dghamcha',915,'kediet ijill','28-nov-1960','independence day','28-nov',3177388,2.88,53.12,17,24,'desert; constantly hot, dry, dusty','mr','.mr','mro');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(226,11,'burkina faso','','western africa','ouagadougou',274200,0,200,'mouhoun river',749,'tena kourou','5-aug-1960','republic day','11-dec',13902972,3,48.85,16.5,33,'tropical; warm, dry winters; hot, wet summers','uv','.bf','xof');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(261,18,'republic of madagascar','madagascar','southern africa','antananarivo',587040,4828,0,'indian ocean',2876,'maromokotro','26-jun-1960','independence day','26-jun',18595469,3.03,57.34,17.5,116,'tropical along coast, temperate inland, arid in south','ma','.mg','mga');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(224,11,'republic of guinea','guinea','western africa','conakry',245857,320,0,'atlantic ocean',1752,'mont nimba','2-oct-1958','independence day','2-oct',9690222,2.63,49.5,17.7,16,'generally hot and humid; monsoonal-type rainy season (june to november) with southwesterly winds; dry season (december to may) with northeasterly harmattan winds','gv','.gn','gnf');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(234,11,'federal republic of nigeria','nigeria','western africa','abuja',923768,853,0,'atlantic ocean',2419,'chappal waddi','1-oct-1960','independence day','1-oct',131859731,2.38,47.08,18.7,70,'varies; equatorial in south, tropical in center, arid in north','ni','.ng','ngn');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(231,11,'republic of liberia','liberia','western africa','monrovia',111370,579,0,'atlantic ocean',1380,'mount wuteve','26-jul-1847','independence day','26-jul',3042004,4.91,39.65,18.1,53,'tropical; hot, humid; dry winters with hot days and cool to cold nights; wet, cloudy summers with frequent heavy showers','li','.lr','lrd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(377,155,'principality of monaco','monaco','western europe','monaco',2,4,0,'mediterranean sea',140,'mont agel','19-nov-1903','national day','19-nov',32543,0.4,79.69,45.4,0,'mediterranean with mild, wet winters and hot, dry summers','mn','.mc','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(212,15,'kingdom of morocco','morocco','northern africa','rabat',446550,1835,-55,'sebkha tah',4165,'jebel toubkal','2-mar-1956','throne day','30-jul',33241259,1.55,70.94,23.9,60,'mediterranean, becoming more extreme in the interior','mo','.ma','mad');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(216,15,'tunisian republic','tunisia','northern africa','tunis',163610,1148,-17,'shatt al gharsah',1544,'jebel ech chambi','20-mar-1956','independence day','20-mar',10175014,0.99,75.12,27.8,30,'temperate in north with mild, rainy winters and hot, dry summers; desert in south','ts','.tn','tnd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(232,11,'republic of sierra leone','sierra leone','western africa','freetown',71740,402,0,'atlantic ocean',1948,'loma mansa','27-apr-1961','independence day','27-apr',6005250,2.3,40.22,17.4,10,'tropical; hot, humid; summer rainy season (may to december); winter dry season (december to april)','sl','.sl','sll');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(233,11,'republic of ghana','ghana','western africa','accra',239460,539,0,'atlantic ocean',880,'mount afadjato','6-mar-1957','independence day','6-mar',22409572,2.07,58.87,19.9,12,'tropical; warm and comparatively dry along southeast coast; hot and humid in southwest; hot and dry in north','gh','','ghc');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(235,17,'republic of chad','chad','central africa','n djamena',1284000000,0,160,'djourab depression',3415,'emi koussi','11-aug-1960','independence day','11-aug',9944201,2.93,47.52,16,51,'tropical in south, desert in north','cd','.td','xaf');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(353,155,'republic of ireland','ireland','western europe','dublin',70280,1448,0,'atlantic ocean',1041,'carrauntoohil','6-dec-1921','saint patricks day','17-mar',4062235,1.15,77.73,34,36,'temperate maritime; modified by north atlantic current; mild winters, cool summers; consistently humid; overcast about half the time','ei','.ie','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(220,11,'republic of the gambia','the gambia','western africa','banjul',11300,80,0,'atlantic ocean',53,'unnamed location','18-feb-1965','independence day','18-feb',1641564,2.84,54.14,17.7,1,'tropical; hot, rainy season (june to november); cooler, dry season (november to may)','ga','.gm','gmd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(221,11,'republic of senegal','senegal','western africa','dakar',196190,531,0,'atlantic ocean',581,'unnamed feature near nepen diakha','4-apr-1960','independence day','4-apr',11987121,2.34,59.25,19.1,20,'tropical; hot, humid; rainy season (may to november) has strong southeast winds; dry season (december to april) dominated by hot, dry, harmattan wind','sg','.sn','xof');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(225,11,'republic of cote d ivoire','cote d ivoire','western africa','yamoussoukro',322460,515,0,'gulf of guinea',1752,'mont nimba','7-aug-1960','independence day','7-aug',17654843,2.03,48.82,19.2,35,'tropical along coast, semiarid in far north; three seasons - warm and dry (november to march), hot and dry (march to may), hot and wet (june to october)','iv','.ci','xof');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(358,154,'republic of finland','finland','northern europe','helsinki',338145,1250,0,'baltic sea',1328,'haltiatunturi','6-dec-1917','independence day','6-dec',5231372,0.14,78.5,41.3,148,'cold temperate; potentially subarctic but comparatively mild because of moderating influence of the north atlantic current, baltic sea, and more than 60,000 lakes','fi','.fi','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(223,11,'republic of mali','mali','western africa','bamako',1240000000,0,23,'senegal river',1155,'hombori tondo','22-sep-2001','independence day','22-sep',11716829,2.63,49,15.8,28,'subtropical to arid; hot and dry (february to june); rainy, humid, and mild (june to november); cool and dry (november to february)','ml','.ml','xof');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(374,145,'republic of armenia','armenia','southwestern asia','yerevan',29800,0,400,'debed river',4090,'aragats lerrnagagat','21-sep-1991','independence day','21-sep',2976372,-0.19,71.84,30.4,16,'highland continental, hot summers, cold winters','am','.am','amd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(227,11,'republic of niger','niger','western africa','niamey',1267000000,0,200,'niger river',2022,'mont bagzane','3-aug-1960','republic day','18-dec',12525094,2.92,43.76,16.5,27,'desert; mostly hot, dry, dusty; tropical in extreme south','ng','.ne','xof');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(249,15,'republic of the sudan','sudan','northern africa','khartoum',2505810,853,0,'red sea',3187,'kinyeti','1-jan-1956','independence day','1-jan',41236378,2.55,58.92,18.3,86,'tropical in south; arid desert in north; rainy season varies by region (april to november)','su','.sd','sdd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(352,155,'grand duchy of luxembourg','luxembourg','western europe','luxembourg',2586,0,133,'moselle river',559,'buurgplaatz','12-jan-1905','national day','23-jun',474413,1.23,78.89,38.7,2,'modified continental with mild winters, cool summers','lu','.lu','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(252,14,'somalia','','eastern africa','mogadishu',637657,3025,0,'indian ocean',2416,'shimbiris','1-jul-1960','foundation of the somali republic','1-jul',8863338,2.85,48.47,17.6,64,'principally desert; northeast monsoon (december to february), moderate temperatures in north and very hot in south; southwest monsoon (may to october), torrid in the north and hot in the south, irregular rainfall, hot and humid periods (tangambili) between monsoons','so','.so','sos');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(507,13,'republic of panama','panama','central america','panama',78200,2490,0,'pacific ocean',3475,'volcan de chiriqui','3-nov-1903','independence day','3-nov',3191319,1.6,75.22,26.1,109,'tropical maritime; hot, humid, cloudy; prolonged rainy season (may to january), short dry season (january to may)','pm','.pa','pab');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(597,5,'republic of suriname','suriname','south america','paramaribo',163270,386,-2,'unnamed location',1230,'juliana top','25-nov-1975','independence day','25-nov',439117,0.2,69.01,26.5,47,'tropical; moderated by trade winds','ns','.sr','srd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(674,9,'republic of nauru','nauru','oceania','no official capital',21,30,0,'pacific ocean',61,'unnamed location','31-jan-1968','independence day','31-jan',13287,1.81,63.08,20.6,1,'tropical with a monsoonal pattern; rainy season (november to february)','nr','.nr','aud');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(242,11,'republic of the congo','congo','western africa','brazzaville',342000,169,0,'atlantic ocean',903,'mount berongou','15-aug-1960','independence day','15-aug',3702314,2.6,52.8,16.6,32,'tropical; rainy season (march to june); dry season (june to october); persistent high temperatures and humidity; particularly enervating climate astride the equator','cf','.cg','xaf');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(380,151,'ukraine','','eastern europe','kiev',603700,2782,0,'black sea',2061,'hora hoverla','24-aug-1991','independence day','24-aug',46710816,-0.6,69.98,39.2,537,'temperate continental; mediterranean only on the southern crimean coast; precipitation disproportionately distributed, highest in west and north, lesser in east and southeast; winters vary from cool along the black sea to cold farther inland; summers are warm across the greater part of the country, hot in the south','up','.ua','uah');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(420,151,'czech republic','czech republic','central europe','prague',78866,0,115,'elbe river',1602,'snezka','1-jan-1993','czech founding day','28-oct',10235455,-0.06,76.22,39.3,121,'temperate; cool summers; cold, cloudy, humid winters','ez','.cz','czk');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(504,13,'republic of honduras','honduras','central america','tegucigalpa',112090,820,0,'caribbean sea',2870,'cerro las minas','15-sep-1821','independence day','15-sep',7326496,2.16,69.33,19.5,116,'subtropical in lowlands, temperate in mountains','ho','.hn','hnl');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(963,145,'syrian arab republic','syria','middle east','damascus',185180,193,-200,'unnamed location near lake tiberias',2814,'mount hermon','17-apr-1946','independence day','17-apr',18881361,2.3,70.32,20.7,92,'mostly desert; hot, dry, sunny summers (june to august) and mild, rainy winters (december to february) along coast; cold weather with snow or sleet periodically in damascus','sy','.sy','syp');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(237,11,'republic of cameroon','cameroon','western africa','yaounde',475440,402,0,'atlantic ocean',4095,'fako','1-jan-1960','republic day','20-may',17340702,2.04,51.16,18.9,47,'varies with terrain, from tropical along coast to semiarid and hot in north','cm','.cm','xaf');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1242,29,'commonwealth of the bahamas','the bahamas','caribbean','nassau',13940,3542,0,'atlantic ocean',63,'mount alvernia, on cat island','10-jul-1973','independence day','10-jul',303770,0.64,65.6,27.8,64,'tropical marine; moderated by warm waters of gulf stream','bf','.bs','bsd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1787,29,'commonwealth of puerto rico','puerto rico','caribbean','san juan',13790,501,0,'caribbean sea',1339,'cerro de punta','','us independence day','4-jul',3927188,0.4,78.4,34.7,30,'tropical marine, mild; little seasonal temperature variation','rq','.pr','usd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(886,30,'taiwan','','eastern asia','taipei',35980,1566,0,'south china sea',3952,'yu shan','','republic day','10-oct',23036087,0.61,77.43,34.6,42,'tropical; marine; rainy season during southwest monsoon (june to august); cloudiness is persistent and extensive all year','tw','.tw','twd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(960,34,'republic of maldives','maldives','southern asia','male',300,644,0,'indian ocean',2,'unnamed location','26-jul-1965','independence day','26-jul',359008,2.78,64.41,17.9,5,'tropical; hot, humid; dry, northeast monsoon (november to march); rainy, southwest monsoon (june to august)','mv','.mv','mvr');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(962,145,'hashemite kingdom of jordan','jordan','middle east','amman',92300,26,-408,'dead sea',1734,'jabal ram','25-may-1946','independence day','25-may',5906760,2.49,78.4,23,17,'mostly arid desert; rainy season in west (november to april)','jo','.jo','jod');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(359,39,'republic of bulgaria','bulgaria','southeastern europe','sofia',110910,354,0,'black sea',2925,'musala','3-mar-1878','liberation day','3-mar',7385367,-0.86,72.3,40.8,213,'temperate; cold, damp winters; hot, dry summers','bu','.bg','bgl');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(370,151,'republic of lithuania','lithuania','eastern europe','vilnius',65200,90,0,'baltic sea',294,'juozapines kalnas','6-sep-1991','independence day','11-mar',3585906,-0.3,74.2,38.2,95,'transitional, between maritime and continental; wet, moderate winters and summers','lh','.lt','ltl');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(371,151,'republic of latvia','latvia','eastern europe','riga',64589,531,0,'baltic sea',312,'gaizinkalns','21-aug-1991','independence day','18-nov',2274735,-0.67,71.33,39.4,47,'maritime; wet, moderate winters','lg','.lv','lvl');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(1868,29,'republic of trinidad and tobago','trinidad and tobago','caribbean','port-of-spain',5128,362,0,'caribbean sea',940,'el cerro del aripo','31-aug-1962','independence day','31-aug',1065842,-0.87,66.76,31.2,6,'tropical; rainy season (june to december)','td','.tt','ttd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(685,9,'independent state of samoa','samoa','oceania','apia',2944,403,0,'pacific ocean',1857,'mauga silisili','1-jan-1962','independence day celebration','1-jun',176908,-0.2,71,25.2,4,'tropical; rainy season (november to april), dry season (may to october)','ws','.ws','sat');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(594,5,'department of guiana','french guiana','northern south america','cayenne',91000,378,0,'atlantic ocean',851,'bellevue de linini','','bastille day','14-jul',199509,1.96,77.27,28.6,11,'tropical; hot, humid; little seasonal temperature variation','fg','.gf','eur');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(965,145,'state of kuwait','kuwait','middle east','kuwait',17820,499,0,'persian gulf',306,'unnamed location','19-jun-1961','national day','25-feb',2418393,3.52,77.2,25.9,7,'dry desert; intensely hot summers; short, cool winters','ku','.kw','kd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(880,34,'peoples republic of bangladesh','bangladesh','southern asia','dhaka',144000,580,0,'indian ocean',1230,'keokradong','16-dec-1971','independence day','26-mar',147365352,2.09,62.46,22.2,16,'tropical; mild winter (october to march); hot, humid summer (march to june); humid, warm rainy monsoon (june to october)','bg','.bd','bdt');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(354,154,'republic of iceland','iceland','northern europe','reykjavik',103000,4970,0,'atlantic ocean',2110,'hvannadalshnukur','1-dec-1918','independence day','17-jun',299388,0.87,80.31,34.2,97,'temperate; moderated by north atlantic current; mild, windy winters; damp, cool summers','ic','.is','isk');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(241,11,'gabonese republic','gabon','western africa','libreville',267667,885,0,'atlantic ocean',1575,'mont iboundji','17-aug-1960','founding of the gabonese democratic party','12-mar',1424906,2.13,54.49,18.6,56,'tropical; always hot, humid','gb','.ga','xaf');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(687,9,'territory of new caledonia and dependencies','new caledonia','oceania','noumea',19060,2254,0,'pacific ocean',1628,'mont panie','','bastille day','14-jul',219246,1.24,74.27,27.8,25,'tropical; modified by southeast trade winds; hot, humid','nc','.nc','xpf');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(974,145,'state of qatar','qatar','middle east','doha',11437,563,0,'persian gulf',103,'qurayn abu al bawl','3-sep-1971','independence day','3-sep',885359,2.5,73.9,31.7,5,'arid; mild, pleasant winters; very hot, humid summers','qa','.qa','qar');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(971,145,'united arab emirates','al imarat al arabiyah al muttahidah','middle east','abu dhabi',82880,1318,0,'persian gulf',1527,'jabal yibir','2-dec-1971','independence day','2-dec',2602713,1.52,75.44,28.1,35,'desert','ae','.ae','aed');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(972,145,'state of israel','israel','middle east','jerusalem',20770,273,-408,'dead sea',1208,'har meron','14-may-1948','independence day','14-may',6352117,1.18,79.46,29.6,51,'temperate; hot and dry in southern and eastern desert areas','is','.il','ils');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(973,145,'kingdom of bahrain','bahrain','middle east','manama',665,161,0,'persian gulf',122,'jabal ad dukhan','15-aug-1971','national day','16-dec',698585,1.45,74.45,29.4,3,'arid; mild, pleasant winters; very hot, humid summers','ba','.bh','bhd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(372,151,'republic of estonia','estonia','eastern europe','tallinn',45226,3794,0,'baltic sea',318,'suur munamagi','20-aug-1991','independence day','20-aug',1324333,-0.64,72.04,39.3,26,'maritime, wet, moderate winters, cool summers','en','.ee','eek');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(856,35,'lao peoples democratic republic','laos','southeastern asia','vientiane',236800,0,70,'mekong river',2817,'phou bia','19-jul-1949','republic day','2-dec',6368481,2.39,55.49,18.9,44,'tropical monsoon; rainy season (may to november); dry season (december to april)','la','.la','lak');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(680,9,'republic of palau','palau','oceania','koror',458,1519,0,'pacific ocean',242,'mount ngerchelchuus','1-oct-1994','constitution day','9-jul',20579,1.31,70.42,31.7,3,'tropical; hot and humid; wet season may to november','ps','.pw','usd');

insert into wf_countries (country_id,region_id,country_name,country_translated_name,location,capitol,area,coastline,lowest_elevation,lowest_elev_name,highest_elevation,highest_elev_name,date_of_independence,national_holiday_name,national_holiday_date,population,population_growth_rate,life_expect_at_birth,median_age,airports,climate,fips_id,internet_extension,currency_code)
values(967,145,'republic of yemen','yemen','middle east','sanaa',527970,1906,0,'arabian sea',3760,'jabal an nabi shu ayb','22-may-1990','unification day','22-may',21456188,3.46,62.12,16.6,45,'mostly desert; hot and humid along west coast; temperate in western mountains affected by seasonal monsoon; extraordinarily hot, dry, harsh desert in east','ym','.ye','yer');

-- populate wf_spoken_languages
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(39,1810,'n','slovene-speaking minority in the trieste-gorizia area');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(225,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(964,80,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(964,1000,'qy','official in kurdish regions');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(964,100,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(964,90,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(81,860,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(203,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(203,1580,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(204,0,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(962,80,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(205,0,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(254,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(254,970,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(996,1100,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(996,1650,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(850,980,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(686,800,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(686,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(82,980,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(82,460,'n','english widely taught in junior high and high school');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(618,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(618,270,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(618,1230,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(965,80,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(965,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(3,900,'qy','qazaq, state language');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(3,1650,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(856,1110,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(856,560,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(856,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(961,80,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(961,560,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(961,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(961,90,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(371,1130,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(371,1650,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(371,1150,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(370,1150,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(370,1650,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(370,1560,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(231,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(421,1800,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(421,770,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(421,1620,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(421,2350,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(423,660,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(266,1720,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(266,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(266,3000,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(266,2700,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(352,1170,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(352,660,'qy','administrative language');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(352,560,'qy','administrative language');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(218,80,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(218,850,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(218,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(261,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(261,1220,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(596,560,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(596,340,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(853,200,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(853,1270,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(853,760,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(373,1380,'y','virtually the same as the romanian language');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(373,1650,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(373,610,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(270,1200,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(270,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(976,910,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(976,220,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(976,1650,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1664,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(265,250,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(265,280,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(265,320,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(265,310,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(265,290,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(265,260,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(265,300,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(381,1710,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(389,1180,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(389,40,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(389,2250,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(389,1620,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(389,1710,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(223,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(223,107,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(377,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(377,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(377,850,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(377,1390,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(212,80,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(212,560,'qy','french often the language of business, government, and diplomacy');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(230,340,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(230,140,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(230,560,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(230,460,'y','official; spoken by less than 1% of the population');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(222,80,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(222,1590,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(222,1840,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(222,560,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(222,710,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(222,2650,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(356,1260,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(356,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(968,80,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(968,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(968,106,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(968,2400,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(960,1250,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(960,460,'qy','english spoken by most government officials');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(52,1850,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(60,105,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(60,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(60,270,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(60,1910,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(60,1250,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(60,1520,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(258,450,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(258,1580,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(258,440,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(258,430,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(687,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(683,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(671,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(227,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(227,720,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(227,400,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(678,460,'n','local languages (more than 100)');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(678,560,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(234,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(234,720,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(234,2900,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(234,790,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(31,410,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(31,570,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(47,160,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(47,1480,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(977,1440,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(977,1210,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(977,1960,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(977,1900,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(977,1190,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(977,460,'n','note: many in government and business also speak english');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(674,460,'qy','english widely understood, spoken, and used for most government and commercial purposes');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(597,410,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(597,460,'qy',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(599,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(599,410,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(599,340,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(505,1850,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(64,1310,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(595,700,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(206,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(51,1610,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(51,101,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(208,0,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(92,1600,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(92,1760,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(92,1540,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(92,2400,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(92,106,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(92,460,'y','official and lingua franca of pakistani elite and most government ministries');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(48,1560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(507,1850,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(507,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(351,1580,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(351,1370,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(675,1340,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(675,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(680,1510,'qy','palauan 64.7 percent official in all islands except sonsoral - sonsoralese and english are official, tobi - tobi and english are official, and angaur- angaur, japanese, and english are official');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(680,530,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(680,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(680,270,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(680,860,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(245,1580,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(245,350,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(974,80,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(974,460,'qy','english commonly used as a second language');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(262,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(262,340,'qy','creole widely used');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(692,1320,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(692,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(40,1640,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(40,770,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(40,660,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(63,530,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(63,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1787,1850,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1787,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(7,1650,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(250,950,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(250,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(250,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(250,970,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(966,80,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(508,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1869,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(248,340,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(248,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(27,840,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(27,830,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(27,30,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(27,1700,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(27,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(27,1730,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(27,1720,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(221,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(221,2650,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(221,1590,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(221,870,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(221,1290,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(290,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(386,1820,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(232,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(378,850,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(65,1270,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(65,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(65,1230,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(65,760,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(65,200,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(65,1930,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(65,1910,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(252,1830,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(252,80,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(252,850,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(252,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(34,220,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(34,230,'qy','castilian is the official language nationwide; the other languages are official regionally');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(34,620,'qy','castilian is the official language nationwide; the other languages are official regionally');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1758,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1758,560,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(249,80,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(249,1470,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(249,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(209,1480,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(209,1650,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(46,1870,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(280,0,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(963,80,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(963,1000,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(963,90,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(963,560,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(963,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(41,660,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(41,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(41,850,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(41,40,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(41,1580,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(41,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1868,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1868,740,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1868,560,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1868,1850,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1868,270,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(66,1950,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(66,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(992,1890,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(992,1650,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1649,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(690,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(676,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(228,480,'qy','the two major african languages in the south');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(228,1350,'qy','the two major african languages in the south');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(228,380,'qy','major african languages in the north');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(239,1580,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(297,410,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(297,1530,'n','(a spanish, portuguese, dutch, english dialect)');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(297,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(297,1850,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1268,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(971,80,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(971,1550,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(971,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(971,740,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(971,2400,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(93,1550,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(93,1540,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(93,2450,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(93,2300,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(213,80,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(213,560,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(994,103,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(994,1650,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(994,90,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(355,40,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(355,670,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(355,1630,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(355,1790,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(374,90,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(374,2850,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(374,1650,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(376,230,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(376,560,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(376,210,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(376,1580,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(244,1580,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(244,110,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(684,1660,'y','(closely related to hawaiian and other polynesian languages) note: most people are bilingual');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(684,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(684,2100,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(54,1850,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(54,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(54,850,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(54,660,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(54,560,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(61,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(61,270,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(61,850,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(2000,0,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(43,660,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(43,1810,'qy','official in carinthia');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(43,360,'qy','official in burgenland');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(43,770,'qy','official in burgenland');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1264,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(672,0,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(973,80,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(973,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(973,510,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(973,2400,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1246,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(267,1730,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(267,890,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(267,1690,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(267,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1441,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1441,1580,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(32,410,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(32,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(32,660,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1242,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1242,340,'qy','among haitian immigrants');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(880,109,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(880,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(501,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(501,1850,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(501,1330,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(501,640,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(501,340,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(387,170,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(387,360,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(387,1710,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(591,1850,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(591,1610,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(591,101,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(2001,190,'n','minority ethnic groups have their own languages');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(229,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(229,550,'n','most common vernaculars in south');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(375,130,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(375,1650,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(677,460,'y','english is official but spoken by only 1%-2% of the population  note: 120 indigenous languages');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(677,1340,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(300,0,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(55,1580,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(55,1850,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(55,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(55,560,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(975,420,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(359,180,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(359,2250,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(359,1620,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(673,1230,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(673,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(673,270,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(257,960,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(257,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(257,1860,'n','(along lake tanganyika and in the bujumbura area)');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(2,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(2,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(855,920,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(855,560,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(855,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(235,1680,'n','in south');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(235,80,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(94,1910,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(94,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(242,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(242,1140,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(242,930,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(243,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(243,1140,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(243,940,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(243,930,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(243,2150,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(86,270,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(86,1270,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(86,200,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(86,1740,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(86,1360,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(86,2750,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(86,630,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(56,1850,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1345,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(67,1230,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(67,460,'n',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(237,460,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(237,560,'y',null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(269,80,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(269,560,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(269,1750,'n','(a blend of swahili and arabic)');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(57,1850,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1670,530,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1670,240,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1670,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(506,1850,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(236,560,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(236,1670,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(238,1580,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(238,350,'n','(a blend of portuguese and west african words)');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(13,1310,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(357,670,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(357,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(45,390,'n','note: english is the predominant second language');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(45,680,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(253,560,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(253,80,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(253,1830,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(253,20,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1767,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1767,560,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1809,1850,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(593,1850,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(593,1610,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(593,50,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(20,80,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(20,460,'n','english and french widely understood by educated classes');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(20,560,'n','english and french widely understood by educated classes');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(353,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(353,820,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(240,1850,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(240,560,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(240,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(240,490,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(372,470,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(372,1650,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(291,20,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(291,80,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(291,1970,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(291,990,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(291,1980,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(503,1850,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(503,1420,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(251,60,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(251,1980,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(251,1500,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(251,690,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(251,1830,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(251,80,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(251,460,'n','(major foreign language taught in schools)');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(15,0,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(420,370,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(594,560,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(358,540,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(358,1870,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(679,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(679,520,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(679,750,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(500,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(691,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(298,500,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(298,390,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(689,560,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(689,1570,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(33,560,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(220,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(220,1290,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(220,2650,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(220,580,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(241,560,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(241,490,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(241,1410,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(241,1490,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(241,120,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(241,108,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(995,650,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(995,1650,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(995,90,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(233,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(233,480,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(350,460,'n','used in schools and for official purposes');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(350,1850,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(350,850,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(350,1580,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1473,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1473,560,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(22,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(22,560,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(299,680,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(299,390,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(299,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(49,660,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(590,560,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(590,340,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1671,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1671,240,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1671,530,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(30,670,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(30,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(30,560,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(502,1850,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(502,50,'n','(23 officially recognized amerindian languages, including quiche, cakchiquel, kekchi, mam, garifuna, and xinca)');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(224,560,'y','note - each ethnic group has its own language');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(592,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(592,50,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(592,340,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(592,740,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(592,2400,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(509,560,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(509,340,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(852,270,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(852,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(504,1850,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(504,50,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(385,360,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(385,1710,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(385,850,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(385,370,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(385,1800,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(36,770,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(354,780,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(354,660,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(62,104,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(62,410,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(202,1300,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(91,460,'n','english enjoys associate status but is the most important language for national, political, and commercial communication');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(91,740,'y','hindi is the national language and primary tongue of 30% of the people');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(98,2200,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(98,1000,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(98,106,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(98,2250,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(972,730,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(972,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(39,850,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(39,660,'n','parts of trentino-alto adige region are predominantly german speaking');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(39,560,'n','small french-speaking minority in valle d aosta region');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(216,80,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(216,560,'qy','commerce');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(670,1940,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(670,1580,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(670,810,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(670,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(90,2250,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(90,1000,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(688,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(688,1660,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(886,1880,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(993,2300,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(993,2450,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(255,970,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(255,460,'qy','primary language of commerce, administration, and higher education');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(255,80,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(256,1860,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(44,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(380,2350,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1,1850,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(598,1850,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(598,990,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(998,1650,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(998,1890,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1784,560,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(58,1850,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(84,2500,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(84,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(84,560,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(84,270,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(84,920,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1340,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1340,1850,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1340,560,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(264,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(264,30,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(264,660,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(681,2550,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(681,590,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(681,560,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(283,710,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(283,80,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(685,1660,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(685,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(268,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(268,1780,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(967,80,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(260,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(263,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(235,560,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(94,1770,'y','note: english is commonly used in government and is spoken competently by about 10% of the population');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1670,270,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(12,0,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(506,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(53,1850,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(13,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(357,2250,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(45,500,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(45,660,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(385,770,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(385,660,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(354,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(62,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(202,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(98,1550,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(98,1160,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(98,80,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(972,80,'qy','arabic used officially for arab minority');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1876,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(962,460,'n','english widely understood among upper and middle classes');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(60,1920,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(60,1950,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(258,2800,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(258,290,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(683,1460,'y','a polynesian language closely related to tongan and samoan');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(977,140,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(977,1450,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(674,1430,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(599,1530,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(599,1850,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(64,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(595,1850,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(51,1850,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(207,0,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(690,2000,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(676,2100,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(228,880,'qy','major african languages in the north');
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(886,1280,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(993,1650,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(255,1860,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(256,460,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(44,2600,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(380,1650,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(226,560,'y', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(998,2450,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1784,460,'n', null);
insert into wf_spoken_languages(country_id,language_id,official,comments)
values(1284,460,'y', null);

create table  "f_customers"
   ("id" numeric(5,0),
    "first_name" varchar(25) constraint "f_csr_first_name_nn" not null  ,
    "last_name" varchar(35) constraint "f_csr_last_name_nn" not null  ,
    "address" varchar(50) constraint "f_csrs_address_nn" not null  ,
    "city" varchar(30) constraint "f_csr_city_nn" not null  ,
    "state" varchar(20) constraint "f_csr_state_nn" not null  ,
    "zip" numeric(10,0) constraint "f_csr_zip_nn" not null  ,
    "phone_number" varchar(10) constraint "f_csr_phone_numb_nn" not null  ,
     constraint "f_csr_id_pk" primary key ("id")
   
   );

create table  "f_promotional_menus"
   ("code" varchar(3),
    "name" varchar(30) constraint "f_pmu_name_nn" not null  ,
    "start_date" date constraint "f_pmu_start_date_nn" not null  ,
    "end_date" date,
    "give_away" varchar(80),
     constraint "f_pmu_code_pk" primary key ("code")
   
   );

create table  "f_regular_menus"
   ("code" varchar(3),
    "type" varchar(30) constraint "f_rmu_type_nn" not null  ,
    "hours_served" varchar(30) constraint "f_rmu_hours_served_nn" not null  ,
     constraint "f_rmu_code_pk" primary key ("code")
   
   );

create table  "f_food_items"
   ("food_item_number" numeric(5,0),
    "description" varchar(100) constraint "f_fim_desc_nn" not null  ,
    "price" numeric(8,2) constraint "f_fim_price_nn" not null  ,
    "regular_code" varchar(3),
    "promo_code" varchar(3),
     constraint "f_fim_food_item_number_pk" primary key ("food_item_number")
   
   );

create table  "f_staffs"
   ("id" numeric(5,0),
    "first_name" varchar(25) constraint "f_stf_first_name_nn" not null  ,
    "last_name" varchar(35) constraint "f_stf_last_name_nn" not null  ,
    "birthdate" date constraint "f_stf_birthdate_nn" not null  ,
    "salary" numeric(8,2) constraint "f_stf_salary_nn" not null  ,
    "overtime_rate" numeric(5,2),
    "training" varchar(50),
    "staff_type" varchar(20) constraint "f_stf_staff_type_nn" not null  ,
    "manager_id" numeric(5,0),
    "manager_budget" numeric(8,2),
    "manager_target" numeric(8,2),
     constraint "f_stf_id_pk" primary key ("id")
   
   );

create table  "f_orders"
   ("order_number" numeric(5,0),
    "order_date" date constraint "f_odr_order_date_nn" not null  ,
    "order_total" numeric(8,2),
    "cust_id" numeric(5,0) constraint "f_odr_cust_id_nn" not null  ,
    "staff_id" numeric(5,0) constraint "f_odr_staff_id_nn" not null  ,
     constraint "f_odr_order_number_pk" primary key ("order_number")
   
   );

create table  "f_order_lines"
   ("order_number" numeric(5,0),
    "food_item_number" numeric(5,0),
    "quantity" numeric(3,0) constraint "f_ole_quantity_nn" not null  ,
     constraint "f_ole_pk" primary key ("order_number", "food_item_number")
   
   );

create table  "f_shifts"
   ("code" numeric(5,0),
    "description" varchar(100) constraint "f_sft_desc_nn" not null  ,
     constraint "f_sft_code_pk" primary key ("code")
   
   );

create table  "f_shift_assignments"
   ("code" numeric(5,0),
    "id" numeric(5,0),
    "shift_assign_date" date constraint "f_sat_shift_assign_date_nn" not null  ,
     constraint "f_sat_pk" primary key ("code", "id")
   
   );

alter table  "f_food_items" add constraint "f_fim_promo_code_fk" foreign key ("promo_code")
      references  "f_promotional_menus" ("code")  ;

alter table  "f_food_items" add constraint "f_fim_regular_code_fk" foreign key ("regular_code")
      references  "f_regular_menus" ("code")  ;

alter table  "f_orders" add constraint "f_odr_cust_id_fk" foreign key ("cust_id")
      references  "f_customers" ("id")  ;

alter table  "f_orders" add constraint "f_odr_staff_id_fk" foreign key ("staff_id")
      references  "f_staffs" ("id")  ;

alter table  "f_order_lines" add constraint "f_ole_food_item_number_fk" foreign key ("food_item_number")
      references  "f_food_items" ("food_item_number")  ;

alter table  "f_order_lines" add constraint "f_ole_order_number_fk" foreign key ("order_number")
      references  "f_orders" ("order_number")  ;

alter table  "f_shift_assignments" add constraint "f_sat_code_fk" foreign key ("code")
      references  "f_shifts" ("code")  ;

alter table  "f_shift_assignments" add constraint "f_sat_id_fk" foreign key ("id")
      references  "f_staffs" ("id")  ;

--populate f_customer table
insert into f_customers(id,first_name,last_name,address,city,state,zip,phone_number)
values(123,'cole','bee','123 main street','orlando','fl',32838,'4075558234');
insert into f_customers(id,first_name,last_name,address,city,state,zip,phone_number)
values(456,'zoe','twee','1009 oliver avenue','boston','ma',12889,'7098675309');
--populate f_promotional_menus table
insert into f_promotional_menus(code,name,start_date,end_date,give_away)
values('100','back to school',to_date('09-01-2004','mm-dd-yyyy'),to_date('09-30-2004','mm-dd-yyyy'),'ballpen and highlighter');
insert into f_promotional_menus(code,name,start_date,end_date,give_away)
values('110','valentines special',to_date('02-10-2004','mm-dd-yyyy'),to_date('02-15-2004','mm-dd-yyyy'),'small box of chocolates');
--populate f_regular_menus table
insert into f_regular_menus(code,type,hours_served)
values('10','breakfast','6-11am');
insert into f_regular_menus(code,type,hours_served)
values('20','lunch/dinner','11-9pm');
--populate f_food_items table
insert into f_food_items(food_item_number,description,price,regular_code,promo_code)
values(90,'fries',1.09,'20',null);
insert into f_food_items(food_item_number,description,price,regular_code,promo_code)
values(93,'strawberry shake',3.59,null,'110');
--populate f_staffs table
insert into f_staffs(id,first_name,last_name,birthdate,salary,overtime_rate,training,staff_type,manager_id,manager_budget,manager_target)
values(12,'sue','doe',to_date('07-01-1980','mm-dd-yyyy'),6.75,10.25,null,'order taker',19,null,null);
insert into f_staffs(id,first_name,last_name,birthdate,salary,overtime_rate,training,staff_type,manager_id,manager_budget,manager_target)
values(9,'bob','miller',to_date('03-19-1979','mm-dd-yyyy'),10,null,'grill','cook',19,null,null);
insert into f_staffs(id,first_name,last_name,birthdate,salary,overtime_rate,training,staff_type,manager_id,manager_budget,manager_target)
values(19,'monique','tuttle',to_date('03-30-1969','mm-dd-yyyy'),60,null,null,'manager',null,50000,70000);
--populate f_orders table
insert into f_orders(order_number,order_date,order_total,cust_id,staff_id)
values(5678,to_date('12-10-2002','mm-dd-yyyy'),103.02,123,12);
--populate f_order_lines table
insert into f_order_lines(order_number,food_item_number,quantity)
values(5678,90,2);
--populate f_shifts table
insert into f_shifts(code,description)
values(1,'8am to 12pm');
insert into f_shifts(code,description)
values(2,'6pm to 10pm');
--populate f_shift_assignments table
insert into f_shift_assignments(code,id,shift_assign_date)
values(1,12,to_date('05-06-2004','mm-dd-yyyy'));

create table  "d_cds"
   ("cd_number" numeric(5,0),
    "title" varchar(50) constraint "d_cds_title_nn" not null  ,
    "producer" varchar(50) constraint "d_cds_producer_nn" not null  ,
    "year" varchar(4) constraint "d_cds_year_nn" not null  ,
     constraint "d_cds_cd_number_pk" primary key ("cd_number")
   
   );

create table  "d_clients"
   ("client_number" numeric(5,0),
    "first_name" varchar(25) constraint "d_clt_fist_name_nn" not null  ,
    "last_name" varchar(30) constraint "d_clt_last_name_nn" not null  ,
    "phone" numeric(15,0) constraint "d_clt_phone_nn" not null  ,
    "email" varchar(50),
     constraint "d_clt_client_number_pk" primary key ("client_number")
   
   );

create table  "d_packages"
   ("code" numeric(10,0),
    "low_range" numeric(6,0) constraint "d_pke_low_range_nn" not null  ,
    "high_range" numeric(6,0) constraint "d_pke_high_range_nn" not null  ,
     constraint "d_pke_code_pk" primary key ("code")
   
   );

create table  "d_themes"
   ("code" numeric(10,0),
    "description" varchar(100) constraint "d_tme_desc_nn" not null  ,
     constraint "d_tme_code_pk" primary key ("code")
   
   );

create table  "d_venues"
   ("id" numeric(5,0),
    "loc_type" varchar(30) constraint "d_vne_loc_type_nn" not null  ,
    "address" varchar(100) constraint "d_vne_address_nn" not null  ,
    "rental_fee" varchar(50) constraint "d_vne_rental_fee_nn" not null  ,
    "comments" varchar(100),
     constraint "d_vne_id_pk" primary key ("id")
   
   );

create table  "d_events"
   ("id" numeric(5,0),
    "name" varchar(50) constraint "d_eve_name_nn" not null  ,
    "event_date" date constraint "d_eve_event_date_nn" not null  ,
    "description" varchar(50),
    "cost" numeric(8,2) constraint "d_eve_cost_nn" not null  ,
    "venue_id" numeric(5,0) constraint "d_eve_venue_id_nn" not null  ,
    "package_code" numeric(5,0) constraint "d_eve_package_code_nn" not null  ,
    "theme_code" numeric(10,0) constraint "d_eve_theme_code_nn" not null  ,
    "client_number" numeric(5,0) constraint "d_eve_client_number_nn" not null  ,
     constraint "d_eve_id_pk" primary key ("id")
   
   );

create table  "d_partners"
   ("id" numeric(5,0),
    "first_name" varchar(25) constraint "d_ptr_first_name_nn" not null  ,
    "last_name" varchar(30) constraint "d_ptr_last_name_nn" not null  ,
    "expertise" varchar(25),
    "specialty" varchar(25),
    "auth_expense_amt" numeric(8,2),
    "manager_id" numeric(5,0),
    "partner_type" varchar(25) constraint "d_ptr_partner_type_nn" not null  ,
     constraint "d_ptr_id_pk" primary key ("id")
   
   );

create table  "d_job_assignments"
   ("partner_id" numeric(5,0),
    "event_id" numeric(5,0),
    "job_date" date constraint "d_jat_job_date_nn" not null  ,
    "status" varchar(50),
     constraint "d_jat_pk" primary key ("partner_id", "event_id")
   
   );

create table  "d_types"
   ("code" numeric(10,0),
    "description" varchar(50) constraint "d_tpe_desc_nn" not null  ,
     constraint "d_tpe_code_pk" primary key ("code")
   
   );

create table  "d_songs"
   ("id" numeric(5,0),
    "title" varchar(50) constraint "d_sng_title_nn" not null  ,
    "duration" varchar(20),
    "artist" varchar(20),
    "type_code" numeric(5,0) constraint "d_sng_type_code_nn" not null  ,
     constraint "d_sng_id_pk" primary key ("id")
   
   );

create table  "d_play_list_items"
   ("event_id" numeric(5,0),
    "song_id" numeric(5,0),
    "comments" varchar(80),
     constraint "d_plm_pk" primary key ("event_id", "song_id")
   
   );

create table  "d_track_listings"
   ("song_id" numeric(5,0),
    "cd_number" numeric(5,0),
    "track" numeric(2,0) constraint "d_tlg_track_number_nn" not null  ,
     constraint "d_tlg_pk" primary key ("song_id", "cd_number")
   
   );

alter table  "d_events" add constraint "d_eve_client_number_fk" foreign key ("client_number")
      references  "d_clients" ("client_number")  ;
alter table  "d_events" add constraint "d_eve_package_code_fk" foreign key ("package_code")
      references  "d_packages" ("code")  ;
alter table  "d_events" add constraint "d_eve_theme_code_fk" foreign key ("theme_code")
      references  "d_themes" ("code")  ;
alter table  "d_events" add constraint "d_eve_venue_id_fk" foreign key ("venue_id")
      references  "d_venues" ("id")  ;
alter table  "d_job_assignments" add constraint "d_jat_event_id_fk" foreign key ("event_id")
      references  "d_events" ("id")  ;
alter table  "d_job_assignments" add constraint "d_jat_partner_id_fk" foreign key ("partner_id")
      references  "d_partners" ("id")  ;
alter table  "d_play_list_items" add constraint "d_plm_event_id_fk" foreign key ("event_id")
      references  "d_events" ("id")  ;
alter table  "d_play_list_items" add constraint "d_plm_song_id_fk" foreign key ("song_id")
      references  "d_songs" ("id")  ;
alter table  "d_songs" add constraint "d_sng_type_code_fk" foreign key ("type_code")
      references  "d_types" ("code")  ;
alter table  "d_track_listings" add constraint "d_tlg_cd_number_fk" foreign key ("cd_number")
      references  "d_cds" ("cd_number")  ;
alter table  "d_track_listings" add constraint "d_tlg_song_id_fk" foreign key ("song_id")
      references  "d_songs" ("id")  ;

create index  "d_cds_idx" on  "d_cds" ("title");
create index  "song_id_idx" on  "d_track_listings" ("song_id");

-- populate tabes
insert into d_cds(cd_number,title,producer,year)
values(90,'the celebrants live in concert','old town records','1997');
insert into d_cds(cd_number,title,producer,year)
values(91,'party music for all occasions','the music man','2000');
insert into d_cds(cd_number,title,producer,year)
values(92,'back to the shire','middle earth records','2002');
insert into d_cds(cd_number,title,producer,year)
values(93,'songs from my childhood','old town records','1999');
insert into d_cds(cd_number,title,producer,year)
values(94,'carpe diem','r & b inc.','2000');
insert into d_cds(cd_number,title,producer,year)
values(95,'here comes the bride','the music man','2001');
insert into d_cds(cd_number,title,producer,year)
values(96,'graduation songbook','tunes are us','1998');
insert into d_cds(cd_number,title,producer,year)
values(98,'whirled peas','old town records','2004');

insert into d_clients(client_number,first_name,last_name,phone,email)
values(5922,'hiram','peters',3715832249,'hpeters@yahoo.com');
insert into d_clients(client_number,first_name,last_name,phone,email)
values(5857,'serena','jones',7035335900,'serena.jones@jones.com');
insert into d_clients(client_number,first_name,last_name,phone,email)
values(6133,'lauren','vigil',4072220090,'lbv@lbv.net');

insert into d_packages(code,low_range,high_range)
values(79,500,2500);
insert into d_packages(code,low_range,high_range)
values(87,2501,5000);
insert into d_packages(code,low_range,high_range)
values(112,5001,10000);
insert into d_packages(code,low_range,high_range)
values(200,10001,15000);

insert into d_themes(code,description)
values(200,'tropical');
insert into d_themes(code,description)
values(220,'carnival');
insert into d_themes(code,description)
values(240,'sixties');
insert into d_themes(code,description)
values(110,'classic');
insert into d_themes(code,description)
values(198,'mardi gras');
insert into d_themes(code,description)
values(454,'eighties');
insert into d_themes(code,description)
values(340,'football');
insert into d_themes(code,description)
values(502,'fairy tale');

insert into d_venues(id,loc_type,address,rental_fee,comments)
values(100,'private home','52 west end drive, los angeles, ca 90210','0','large kitchen, spacious lawn');
insert into d_venues(id,loc_type,address,rental_fee,comments)
values(105,'private home','123 magnolia road, hudson, n.y. 11220','0','3 level townhouse, speakers on all floors');
insert into d_venues(id,loc_type,address,rental_fee,comments)
values(101,'private home','4 primrose lane, chevy chase, md 22127','0','gazebo, multi-level deck');
insert into d_venues(id,loc_type,address,rental_fee,comments)
values(95,'school hall','4 mahogany drive, boston, ma 10010','75/hour','school closes at 10pm');
insert into d_venues(id,loc_type,address,rental_fee,comments)
values(99,'national park','87 park avenue, san diego, ca 28978','400/flat fee','bring generators');
insert into d_venues(id,loc_type,address,rental_fee,comments)
values(220,'hotel','200 pennsylvania ave, washington d.c. 09002','300/per person','classy affair, tight security, private entrance for vendors');

insert into d_events(client_number,id,name,event_date,description,cost,venue_id,package_code,theme_code)
values(5922,100,'peters graduation',to_date('05-14-2004','mm-dd-yyyy'),'party for 200, red, white, blue motif',8000,100,112,200);
insert into d_events(client_number,id,name,event_date,description,cost,venue_id,package_code,theme_code)
values(6133,105,'vigil wedding',to_date('04-28-2004','mm-dd-yyyy'),'black tie at four season hotel',10000,220,200,200);

insert into d_partners(id,first_name,last_name,expertise,specialty,auth_expense_amt,manager_id,partner_type)
values(11,'jennifer','cho','weddings','all types',null,33,'wedding coordinator');
insert into d_partners(id,first_name,last_name,expertise,specialty,auth_expense_amt,manager_id,partner_type)
values(22,'jason','tsang',null,'hip hop',null,33,'disk jockey');
insert into d_partners(id,first_name,last_name,expertise,specialty,auth_expense_amt,manager_id,partner_type)
values(33,'allison','plumb','event planning',null,300000,33,'manager');

insert into d_job_assignments(partner_id,event_id,job_date,status)
values(11,105,to_date('02-02-2004','mm-dd-yyyy'),'visited');

insert into d_types(code,description)
values(1,'jazz');
insert into d_types(code,description)
values(12,'pop');
insert into d_types(code,description)
values(40,'reggae');
insert into d_types(code,description)
values(88,'country');
insert into d_types(code,description)
values(77,'new age');

insert into d_songs(id,title,duration,artist,type_code)
values(45,'its finally over','5 min','the hobbits',12);
insert into d_songs(id,title,duration,artist,type_code)
values(46,'im going to miss my teacher','2 min','jane pop',12);
insert into d_songs(id,title,duration,artist,type_code)
values(47,'hurrah for today','3 min','the jubilant trio',77);
insert into d_songs(id,title,duration,artist,type_code)
values(48,'meet me at the altar','6 min','bobby west',1);
insert into d_songs(id,title,duration,artist,type_code)
values(49,'lets celebrate','8 min','the celebrants',77);
insert into d_songs(id,title,duration,artist,type_code)
values(50,'all these years','10 min','diana crooner',88);

insert into d_play_list_items(event_id,song_id,comments)
values(100,45,'play late');
insert into d_play_list_items(event_id,song_id,comments)
values(100,46,null);
insert into d_play_list_items(event_id,song_id,comments)
values(100,47,'play early');
insert into d_play_list_items(event_id,song_id,comments)
values(105,48,'play after cake cutting');
insert into d_play_list_items(event_id,song_id,comments)
values(105,49,'play first');
insert into d_play_list_items(event_id,song_id,comments)
values(105,47,'play for the father');

insert into d_track_listings(song_id,cd_number,track)
values(45,92,1);
insert into d_track_listings(song_id,cd_number,track)
values(46,93,1);
insert into d_track_listings(song_id,cd_number,track)
values(47,91,2);
insert into d_track_listings(song_id,cd_number,track)
values(48,95,5);
insert into d_track_listings(song_id,cd_number,track)
values(49,91,3);

create table  "regions"
   ("region_id" numeric constraint "region_id_nn" not null  ,
    "region_name" varchar(25),
    constraint "reg_id_pk" primary key ("region_id")
     
   );
   
create table  "countries"
   ("country_id" char(2) constraint "country_id_nn" not null  ,
    "country_name" varchar(40),
    "region_id" numeric,
     constraint "country_c_id_pk" primary key ("country_id")  
   );

alter table  "countries" add constraint "countr_reg_fk" foreign key ("region_id")
	references  "regions" ("region_id")  ;
   
create table  "locations"
   ("location_id" numeric(4,0),
    "street_address" varchar(40),
    "postal_code" varchar(12),
    "city" varchar(30) constraint "loc_city_nn" not null  ,
    "state_province" varchar(25),
    "country_id" char(2),
    constraint "loc_id_pk" primary key ("location_id")
     
   );
   
alter table  "locations" add constraint "loc_c_id_fk" foreign key ("country_id")
	references  "countries" ("country_id")  ;
create index  "loc_city_ix" on  "locations" ("city");
create index  "loc_country_ix" on  "locations" ("country_id");
create index  "loc_state_province_ix" on  "locations" ("state_province");

create table  "departments"
   ("department_id" numeric(4,0),
    "department_name" varchar(30) constraint "dept_name_nn" not null  ,
    "manager_id" numeric(6,0),
    "location_id" numeric(4,0),
     constraint "dept_id_pk" primary key ("department_id")
   
   );
 
alter table  "departments" add constraint "dept_loc_fk" foreign key ("location_id")
	references  "locations" ("location_id")  ;

create index  "dept_location_ix" on  "departments" ("location_id");
	
create table  "jobs"
   ("job_id" varchar(10),
    "job_title" varchar(35) constraint "job_title_nn" not null  ,
    "min_salary" numeric(6,0),
    "max_salary" numeric(6,0),
     constraint "job_id_pk" primary key ("job_id")
   
   );
	
create table  "employees"
   ("employee_id" numeric(6,0),
    "first_name" varchar(20),
    "last_name" varchar(25) constraint "emp_last_name_nn" not null  ,
    "email" varchar(25) constraint "emp_email_nn" not null  ,
    "phone_number" varchar(20),
    "hire_date" date constraint "emp_hire_date_nn" not null  ,
    "job_id" varchar(10) constraint "emp_job_nn" not null  ,
    "salary" numeric(8,2),
    "commission_pct" numeric(2,2),
    "manager_id" numeric(6,0),
    "department_id" numeric(4,0),
	"bonus" varchar(5),
     constraint "emp_salary_min" check (salary > 0)  ,
     constraint "emp_id_pk" primary key ("employee_id")
   ,
     constraint "emp_email_uk" unique ("email")
   
  );
  
alter table  "employees" add constraint "emp_dept_fk" foreign key ("department_id")
	references  "departments" ("department_id")  ;
alter table  "employees" add constraint "emp_job_fk" foreign key ("job_id")
	references  "jobs" ("job_id")  ;
alter table  "employees" add constraint "emp_manager_fk" foreign key ("manager_id")
	references  "employees" ("employee_id")  ;
--alter table  "departments" add constraint "dept_mgr_fk" foreign key ("manager_id")
--	references  "employees" ("employee_id");
create index  "emp_department_ix" on  "employees" ("department_id");
create index  "emp_job_ix" on  "employees" ("job_id");
create index  "emp_manager_ix" on  "employees" ("manager_id");
create index  "emp_name_ix" on  "employees" ("last_name", "first_name");

create table  "job_grades"
   ("grade_level" varchar(3),
    "lowest_sal" numeric,
    "highest_sal" numeric
   );

create table  "job_history"
   ("employee_id" numeric(6,0) constraint "jhist_employee_nn" not null  ,
    "start_date" date constraint "jhist_start_date_nn" not null  ,
    "end_date" date constraint "jhist_end_date_nn" not null  ,
    "job_id" varchar(10) constraint "jhist_job_nn" not null  ,
    "department_id" numeric(4,0),
     constraint "jhist_date_interval" check (end_date > start_date)  ,
     constraint "jhist_emp_id_st_date_pk" primary key ("employee_id", "start_date")
   
   );

alter table  "job_history" add constraint "jhist_dept_fk" foreign key ("department_id")
	references  "departments" ("department_id")  ;
-- the folowing fk constraint is disabled as table contains historical data for employees that are not in the current employees table
--alter table  "job_history" add constraint "jhist_emp_fk" foreign key ("employee_id")
--	  references  "employees" ("employee_id");
alter table  "job_history" add constraint "jhist_job_fk" foreign key ("job_id")
	  references  "jobs" ("job_id")  ;
create index  "jhist_department_ix" on  "job_history" ("department_id");
create index  "jhist_employee_ix" on  "job_history" ("employee_id");
create index  "jhist_job_ix" on  "job_history" ("job_id");

--populate regions table
insert into regions (region_id, region_name)
values(1,'europe');
insert into regions (region_id, region_name)
values(2,'americas');
insert into regions (region_id, region_name)
values(3,'asia');
insert into regions (region_id, region_name)
values(4,'middle east and africa');

--populate countries table
insert into countries (country_id, country_name, region_id)
values('ca','canada',2);
insert into countries (country_id, country_name, region_id)
values('de','germany',1);
insert into countries (country_id, country_name, region_id)
values('uk','united kingdom',1);
insert into countries (country_id, country_name, region_id)
values('us','united states of america',2);

--populate locations table
insert into locations (location_id, street_address, postal_code, city, state_province, country_id)
values(1800,'460 bloor st. w.','on m5s 1x8','toronto','ontario','ca');
insert into locations (location_id, street_address, postal_code, city, state_province, country_id)
values(2500,'magdalen centre, the oxford science park','ox9 9zb','oxford','oxford','uk');
insert into locations (location_id, street_address, postal_code, city, state_province, country_id)
values(1400,'2014 jabberwocky rd','26192','southlake','texas','us');
insert into locations (location_id, street_address, postal_code, city, state_province, country_id)
values(1500,'2011 interiors blvd','99236','south san francisco','california','us');
insert into locations (location_id, street_address, postal_code, city, state_province, country_id)
values(1700,'2004 charade rd','98199','seattle','washington','us');

--populate departments table
insert into departments (department_id, department_name, manager_id, location_id)
values(10,'administration',200,1700);
insert into departments (department_id, department_name, manager_id, location_id)
values(20,'marketing',201,1800);
insert into departments (department_id, department_name, manager_id, location_id)
values(50,'shipping',124,1500);
insert into departments (department_id, department_name, manager_id, location_id)
values(60,'it',103,1400);
insert into departments (department_id, department_name, manager_id, location_id)
values(80,'sales',149,2500);
insert into departments (department_id, department_name, manager_id, location_id)
values(90,'executive',100,1700);
insert into departments (department_id, department_name, manager_id, location_id)
values(110,'accounting',205,1700);
insert into departments (department_id, department_name, manager_id, location_id)
values(190,'contracting',null,1700);

--populate jobs table
insert into jobs (job_id, job_title, min_salary, max_salary)
values('ad_pres','president',20000,40000);
insert into jobs (job_id, job_title, min_salary, max_salary)
values('ad_vp','administration vice president',15000,30000);
insert into jobs (job_id, job_title, min_salary, max_salary)
values('ad_asst','administration assistant',3000,6000);
insert into jobs (job_id, job_title, min_salary, max_salary)
values('ac_mgr','accounting manager',8200,16000);
insert into jobs (job_id, job_title, min_salary, max_salary)
values('ac_account','public accountant',4200,9000);
insert into jobs (job_id, job_title, min_salary, max_salary)
values('sa_man','sales manager',10000,20000);
insert into jobs (job_id, job_title, min_salary, max_salary)
values('sa_rep','sales representative',6000,12000);
insert into jobs (job_id, job_title, min_salary, max_salary)
values('st_man','stock manager',5500,8500);
insert into jobs (job_id, job_title, min_salary, max_salary)
values('st_clerk','stock clerk',2000,5000);
insert into jobs (job_id, job_title, min_salary, max_salary)
values('it_prog','programmer',4000,10000);
insert into jobs (job_id, job_title, min_salary, max_salary)
values('mk_man','marketing manager',9000,15000);
insert into jobs (job_id, job_title, min_salary, max_salary)
values('mk_rep','marketing representative',4000,9000);

--populate employees table
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values(100,'steven','king','sking','515.123.4567',to_date('1987-06-17','yyyy-mm-dd'),'ad_pres',24000,null,null,90);
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values(101,'neena','kochhar','nkochhar','515.123.4568',to_date('1989-09-21','yyyy-mm-dd'),'ad_vp',17000,null,100,90 );
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values(102,'lex','de haan','ldehaan','515.123.4569',to_date('1993-01-13','yyyy-mm-dd'),'ad_vp',17000,null,100,90 );
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values(200,'jennifer','whalen','jwhalen','515.123.4444',to_date('1987-09-17','yyyy-mm-dd'),'ad_asst',4400,null,101,10 );
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values(205,'shelley','higgins','shiggins','515.123.8080',to_date('1994-06-07','yyyy-mm-dd'),'ac_mgr',12000,null,101,110 );
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values(206,'william','gietz','wgietz','515.123.8181',to_date('1994-06-07','yyyy-mm-dd'),'ac_account',8300,null,205,110 );
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id, bonus)
values(149,'eleni','zlotkey','ezlotkey','011.44.1344.429018',to_date('2000-01-29','yyyy-mm-dd'),'sa_man',10500,.2,100,80, '1500' );
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id, bonus)
values(174,'ellen','abel','eabel','011.44.1644.429267',to_date('1996-05-11','yyyy-mm-dd'),'sa_rep',11000,.3,149,80,'1700' );
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id, bonus)
values(176,'jonathon','taylor','jtaylor','011.44.1644.429265',to_date('1998-03-24','yyyy-mm-dd'),'sa_rep',8600,.2,149,80,'1250' );
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values(178,'kimberely','grant','kgrant','011.44.1644.429263',to_date('1999-05-24','yyyy-mm-dd'),'sa_rep',7000,.15,149,null );
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values(124,'kevin','mourgos','kmourgos','650.123.5234',to_date('1999-11-16','yyyy-mm-dd'),'st_man',5800,null,100,50);
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values(141,'trenna','rajs','trajs','650.121.8009',to_date('1995-10-17','yyyy-mm-dd'),'st_clerk',3500,null,124,50 );
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values(142,'curtis','davies','cdavies','650.121.2994',to_date('1997-01-29','yyyy-mm-dd'),'st_clerk',3100,null,124,50 );
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values(143,'randall','matos','rmatos','650.121.2874',to_date('1998-03-15','yyyy-mm-dd'),'st_clerk',2600,null,124,50 );
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values(144,'peter','vargas','pvargas','650.121.2004',to_date('1998-07-09','yyyy-mm-dd'),'st_clerk',2500,null,124,50 );
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values(103,'alexander','hunold','ahunold','590.423.4567',to_date('1990-01-03','yyyy-mm-dd'),'it_prog',9000,null,102,60 );
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values(104,'bruce','ernst','bernst','590.423.4568',to_date('1991-05-21','yyyy-mm-dd'),'it_prog',6000,null,103,60 );
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values(107,'diana','lorentz','dlorentz','590.423.5567',to_date('1999-02-07','yyyy-mm-dd'),'it_prog',4200,null,103,60 );
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values(201,'michael','hartstein','mhartste','515.123.5555',to_date('1996-02-17','yyyy-mm-dd'),'mk_man',13000,null,100,20 );
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values(202,'pat','fay','pfay','603.123.6666',to_date('1997-08-17','yyyy-mm-dd'),'mk_rep',6000,null,201,20 );

--populate job_history table
insert into job_history(employee_id,start_date,end_date,job_id,department_id)
values(200,to_date('09-17-1987','mm-dd-yyyy'),to_date('06-17-1993','mm-dd-yyyy'),'ad_asst',90 );
insert into job_history(employee_id,start_date,end_date,job_id,department_id)
values(101,to_date('10-28-1993','mm-dd-yyyy'),to_date('03-15-1997','mm-dd-yyyy'),'ac_mgr',110 );
insert into job_history(employee_id,start_date,end_date,job_id,department_id)
values(200,to_date('07-01-1994','mm-dd-yyyy'),to_date('12-31-1998','mm-dd-yyyy'),'ac_account',90 );
insert into job_history(employee_id,start_date,end_date,job_id,department_id)
values(101,to_date('09-21-1989','mm-dd-yyyy'),to_date('10-27-1993','mm-dd-yyyy'),'ac_account',110 );
insert into job_history(employee_id,start_date,end_date,job_id,department_id)
values(176,to_date('01-01-1999','mm-dd-yyyy'),to_date('12-31-1999','mm-dd-yyyy'),'sa_man',80 );
insert into job_history(employee_id,start_date,end_date,job_id,department_id)
values(176,to_date('03-24-1998','mm-dd-yyyy'),to_date('12-31-1998','mm-dd-yyyy'),'sa_rep',80 );
insert into job_history(employee_id,start_date,end_date,job_id,department_id)
values(122,to_date('01-01-1999','mm-dd-yyyy'),to_date('12-31-1999','mm-dd-yyyy'),'st_clerk',50 );
insert into job_history(employee_id,start_date,end_date,job_id,department_id)
values(114,to_date('03-24-1998','mm-dd-yyyy'),to_date('12-31-1999','mm-dd-yyyy'),'st_clerk',50 );
insert into job_history(employee_id,start_date,end_date,job_id,department_id)
values(102,to_date('01-13-1993','mm-dd-yyyy'),to_date('07-24-1998','mm-dd-yyyy'),'it_prog',60 );
insert into job_history(employee_id,start_date,end_date,job_id,department_id)
values(201,to_date('02-17-1996','mm-dd-yyyy'),to_date('12-19-1999','mm-dd-yyyy'),'mk_rep',20 );

--populate job_grades table
insert into job_grades(grade_level,lowest_sal,highest_sal)
values('a',1000,2999);
insert into job_grades(grade_level,lowest_sal,highest_sal)
values('b',3000,5999);
insert into job_grades(grade_level,lowest_sal,highest_sal)
values('c',6000,9999);
insert into job_grades(grade_level,lowest_sal,highest_sal)
values('d',10000,14999);
insert into job_grades(grade_level,lowest_sal,highest_sal)
values('e',15000,24999);
insert into job_grades(grade_level,lowest_sal,highest_sal)
values('f',25000,40000);

create or replace view  "emp_details_view" ("employee_id", "job_id", "manager_id", "department_id", "location_id", "country_id", "first_name", "last_name", "salary", "commission_pct", "department_name", "job_title", "city", "state_province", "country_name", "region_name") 
	as select
		e.employee_id, e.job_id, e.manager_id, e.department_id,
		d.location_id,
		l.country_id,
		e.first_name, e.last_name, e.salary, e.commission_pct,
		d.department_name,
		j.job_title,
		l.city, l.state_province,
		c.country_name,
		r.region_name
    from
        employees e,
        departments d,
        jobs j,
        locations l,
        countries c,
        regions r
    where
        e.department_id = d.department_id
        and d.location_id = l.location_id
        and l.country_id = c.country_id
        and c.region_id = r.region_id
        and j.job_id = e.job_id
	;
	
--create sequence for departments pk				
create sequence "departments_seq"  
	minvalue 1 
	maxvalue 9990 
	increment by 10 
	start with 280 
	 ;

--create sequence for employees pk	
create sequence "employees_seq"  
	minvalue 1 
	maxvalue 9990 
	increment by 1 
	start with 207 
	 ;

--create sequence for locations pk	
create sequence "locations_seq"  
	minvalue 1 
	maxvalue 9900 
	increment by 100 
	start with 3300 
	 ;