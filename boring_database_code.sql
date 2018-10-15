
-----------------------------------------------------------------------|
------------------------------------------------------------------------|
/*	                                                                    |
    Author: LinhVT               										|
    Created day: 01-10-2018       										|
    Edited day: 03-10-2018        										|
    Reasons for editing:          										|
                              										    |
  1. 3/10 Add some parameters for some tables below.				    |
			symbol character(10); in "soil_type" table				    |
			to_depth double;	  in "soil_result" table			    |
			latidude＝＞latitude	  in "position" table				   |
  2.10/10 Add removing the exiting tables.                         		|
  3.                              										|
  4.                              										|
	Finished day: 03-10-2018      										|
*/                                										
------------------------------------------------------------------------|

-------------------------------------------------------------------------
-------------------------------------------------------------------------
-------------------------Drop existing tables.---------------------------
----------------------18. soil_classification（一般）----------------------
DROP TABLE IF EXISTS
   soil_classification
;
----------------------17. particle_size----------------------
DROP TABLE IF EXISTS
   particle_size
;

----------------------16. general（一般）----------------------
DROP TABLE IF EXISTS
   general
;

----------------------15. shear----------------------
DROP TABLE IF EXISTS
   shear
;
----------------------14. consolidation----------------------
DROP TABLE IF EXISTS
   consolidation
;
----------------------13. consistency_characteristic----------------------
DROP TABLE IF EXISTS
   consistency_characteristic
;
----------------------12. executing----------------------
DROP TABLE IF EXISTS
   executing
;
----------------------11. soil_sample----------------------
DROP TABLE IF EXISTS
   soil_sample
;
----
----------------------10. soil_result（土質の試験の結果）----------------------
DROP TABLE IF EXISTS
   soil_result
;
--------------------------9. spt_result（SPT試験の結果）----------------------
DROP TABLE IF EXISTS
   spt_result
;
--------------------------8. result（ボーリングの試験の結果）---------------------
DROP TABLE IF EXISTS
   result
;
--------------------------7. using_tool（用具使用）--------------------------
DROP TABLE IF EXISTS
   using_tool
;
--------------------------6. boring_test（ボーリング試験）----------------------
DROP TABLE IF EXISTS
   boring_test
;
--------------------------5. soil_type（土のタイプ）---------------------------
DROP TABLE IF EXISTS
   soil_type
;
--------------------------4. construction（工事）---------------------------
DROP TABLE IF EXISTS
   construction
;
--------------------------3. tool（用具）-----------------------------------
DROP TABLE IF EXISTS
   tool
;
--------------------------2. party（実装機関）-------------------------------
DROP TABLE IF EXISTS
   party
;

--------------------------1. position（工事の位置）---------------------------
DROP TABLE IF EXISTS
   position
;
/*
-------------------------------------------------------------------------
-- Create a new database.
CREATE DATABASE db_boring_data  -- create a new data base
with ENCODING = 'UTF-8'         -- use utf-8 for encoding
OWNER = "TuanLinh"              -- person who created this database.
TEMPLATE = template1            -- use template1 as a template.

-------------------------------------------------------------------------
-------------------------------------------------------------------------
*/
 -- 1.Create a "position" table with its properties
 CREATE TABLE "position"(
	id bigint,      
	name character(200),        -- 住所
    latitude  character(50),    -- 緯度
    longitude  character(50),   -- 軽度
	constraint pk_position primary key(id)
);

 -- 2. Create a "party" table and its properties.
CREATE TABLE "party"(
	id bigint,
	name character(200),	 -- 会社名
    address character(200),		-- 住所名前
	phone  character(12),         -- 携帯電話番号 081804228150アドレス
	constraint pk_party primary key("id")
);

 --3. Create "tool" with its properties.
CREATE TABLE "tool"(
	id bigint,      
	name character(200),        -- 用具の名前
	constraint pk_tool primary key(id)
);


 --4. Create "construction" table and its properties.
CREATE TABLE "construction"(
	id bigint,
	name character(200),		-- 事名
	position_id bigint,      -- 位置のIｄ
	constraint pk_construction primary key(id)
);

 --5. create "soil_type" table and its poperties.
CREATE TABLE "soil_type"(
	id bigint,
	name character(500),--　土のタイプの名前
	symbol character(10),--　記号
	description text,--　説明
	image_url character(500),--　写真のアドレス
	constraint pk_soil_type primary key(id)
);

 --6. Create "using_tool" with its properties.
CREATE TABLE "using_tool"(
	id bigint,      
	tool_id bigint,        -- 使う用具のId
    boring_test_id  bigint,  -- どんなタイプ
	constraint pk_using_tool primary key(id)
);
 --7. create "boring_test" table and its poperties.
CREATE TABLE "boring_test"(
	id bigint,
	name character(500),--　調査名
	construction_id bigint, --　工事名
	order_party_id bigint, --　発注機関
	order_conducing_id bigint, --　調査業者名
	constraint pk_boring_test primary key(id)
);
 --8. create "result" table and its poperties.
CREATE TABLE "result"(
	id bigint,
	boring_test_id bigint, -- ボーリングの試験のId
	slope_of_ground double precision,     -- 地盤勾配
	direction character(100),  -- 方向
	angle character(20),       -- 角度
	started_day date,          -- 開始日
	finished_day date,         -- 完成日
	kpm double precision,      -- KPM
	water_elevation double precision, -- 孔内水立
	water_elevation_meauring_date date, -- 制定月日
	constraint pk_result primary key(id)
);

 --9. Create "spt_result" table and its properties.
CREATE TABLE "spt_result"(
	id bigint,
	from_depth double precision,    --　深さから
	-- to_depth double precision,        --　深さまで
	first smallint,		 -- 一番目の１０センチのＳＰＴ
	penetration_on_first double precision,
	second smallint,	 -- 二番目の１０センチのＳＰＴ
	penetration_on_second double precision,
	third smallint,		 -- 三番目の１０センチのＳＰＴ　　　
	penetration_on_third double precision,
	result_id bigint,
	constraint pk_spt_result primary key(id)
);

 --10. create "soil_result" table and its poperties.
CREATE TABLE "soil_result"(
	id bigint,
	from_depth double precision,   --　深さから
	to_depth double precision,   --　深さまで
	soil_type_id bigint,	--　土のタイプのIｄ
	description text,	--　説明（土はどんな状態か）
	color_description text,	--　説明（土の色はどう）
	result_id bigint,         --  結果のid  
	constraint pk_soil_result primary key(id)
);
 -------------------------------------------------------------------------
 /*
 	
	Editor: LinhVT
	- Edited date: 12/10/2018
	- Add some tables for soil tested results.
	- Add some records for testing.
 */
 --11. create "soil_sample" (試料) table and its poperties.
 CREATE TABLE "soil_sample"(
	id bigint,
	sample_no character(50),
	from_depth double precision,   --　深さから
	to_depth double precision,   --　深さまで
	result_id bigint,
	constraint pk_soil_sample primary key(id)
);

--12. create "executing"(実装) table and its poperties.
 CREATE TABLE "executing"(
	id bigint,	
	soil_sample_id int,   --
	conducting_date date,
 	constraint pk_executing primary key(id) 
);
 --13. create "consistency_characteristic"(ンシステンシー　特性) table and its poperties.
 CREATE TABLE "consistency_characteristic"(
	id bigint,
	liquid_limit double precision,   --　液性限界
	plasticity_limit double precision,   --　塑性限界
	plasticity_index double precision,   --　塑性指数
	executing_id bigint,
	constraint pk_consistency_characteristic primary key(id)
);

 --14. create "consolidation"(圧密) table and its poperties.
 CREATE TABLE "consolidation"(
	id bigint,
	compression_index double precision,   -- 圧縮指数
	consolidation_yield_stress double precision,   --　圧密降伏応力
	test_method character(100), -- 試験方法
	executing_id bigint,
 	constraint pk_consolidation primary key(id) 
);


 --15. create "shear"(せん断) table and its poperties.
 CREATE TABLE "shear"(
	id bigint,
	total_stress_c double precision,  
	total_stress_c1 double precision, 
	affective_stress_c double precision,  
	affective_stress_c1 double precision, 
	executing_id bigint,
 	constraint pk_shear primary key(id) 
);


 --16. create "general"(一般) table and its poperties.
 CREATE TABLE "general"(
	id bigint,
	dry_density double precision,   -- 湿潤密度
	wet_density double precision,   --　乾燥密度
	soil_particle double precision,   -- 土粒子の密度
	natural_water_content double precision, --　自然含水化
	void_ratio double precision,   --　間隙比
	dryness double precision,     --　乾和度
	executing_id bigint,
 	constraint pk_general primary key(id) 
);

 --17. create "particle_size"(粒度) table and its poperties.
 CREATE TABLE "particle_size"(
	id bigint,
	stone double precision,   -- 石分
	gravel double precision,   --　礫分
	sand double precision,   -- 砂分
	silt double precision, --　泥土、シルト
	clay double precision,   --　粘土
	max_size double precision,     --　最大粒径
	equal_coefficient double precision,     --　均等係数
	particle_size_50persent double precision,     --　50 % 粒径 
	particle_size_10persent double precision,     --　10 % 粒径
	executing_id bigint,
 	constraint pk_particle_size primary key(id) 
);
--18. create "soil_classification"(土の分類) table and its poperties.
 CREATE TABLE "soil_classification"(
	id bigint,	
	soil_id int,  
	conducting_date date,
	executing_id bigint,
 	constraint pk_soil_classification primary key(id) 
);

 -------------------------------------------------------------------------
 -------------------------------------------------------------------------

-- add a foreign key constraint to an existing rate.

alter table "construction"
add constraint fk_position_of_construction
foreign key (position_id) references position(id);

alter table "soil_result" 
add constraint fk_type_soil_detail
foreign key (soil_type_id) references soil_type(id),
add constraint fk_result_of_soil_classing
foreign key (result_id) references result(id);

alter table "spt_result" 
add constraint fk_spt_result
foreign key (result_id) references result(id);

alter table "using_tool"
add constraint fk_using_tools
foreign key (tool_id) references tool(id),
add constraint fk_using_for_boring_test
foreign key (boring_test_id) references boring_test(id);

alter table "result" 
add constraint fk_result_boring_test
foreign key (boring_test_id) references boring_test(id);

alter table "boring_test" 
add constraint fk_party_ordered
foreign key (order_party_id) references party(id),
add constraint fk_party_conduced
foreign key (order_conducing_id) references party(id),
add constraint fk_boring_test_of_construction
foreign key (construction_id) references construction(id);

alter table "consolidation"
add constraint fk_consolidation_executing
foreign key (executing_id)
references executing(id);

alter table  "consistency_characteristic"
add constraint fk_consistency_characteristic_executing
foreign key (executing_id)
references executing(id);

alter table "shear"
add constraint fk_shear_executing
foreign key (executing_id)
references executing(id);

alter table "general"
add constraint fk_general_executing
foreign key (executing_id)
references executing(id);

alter table "particle_size"
add constraint fk_particle_size_executing
foreign key (executing_id)
references executing(id);

alter table "soil_classification"
add constraint fk_soil_classification_executing
foreign key (executing_id)
references executing(id),
add constraint fk_soil_classification_soil_type
foreign key (soil_id) references soil_type(id);

alter table "soil_sample"
add constraint fk_soil_sample
foreign key (result_id)
references result(id);

 -------------------------------------------------------------------------
 -------------------------------------------------------------------------
 --------------Insert data into database for testing.---------------------
 -------------------------------------------------------------------------
 -------------------------------------------------------------------------
 
 -------------------------------------------------------------------------
 -------------------------------------------------------------------------
 --------------Insert data into database for testing.---------------------
 -------------------------------------------------------------------------
 -------------------------------------------------------------------------
 -- 1. Insert into "position" table.
 
 insert into "position"("id", "name", "latitude","longitude") 
 values
 	(1,'秋田県由利本荘市石脇字田尻野24-19','39°23’47.4”','140°1’47.8”'),
 	(2,'高岡市 長慶寺 地内','',''),
 	(3,'熊本県山鹿市鹿本町津袋地内','33°1’8.5"','30°45’50.6"'),
 	(4,'大阪府東大阪市菱江5丁目122-1','34°40’23.25"','3 4°40’23.25"');
	

 -- 2. Insert into "party" table.
 insert into "party"("id", "name", "address","phone") 
 values
 	(1,'株式会社 伊藤ボーリング','神奈川県 横須賀市秋谷２丁目３－１０','0188450573'),
 	(2,'株式会社東北マツダ','',''),
 	(3,'新栄地研株式会社','','0952320912'),
 	(4,'株式会社 中部設計','','0764424161');
	
 -- 3. Insert into "tool" table.
 insert into "tool"("id", "name") 
 values
	(1,'吉田式YBM-05D型'),
	(2,'吉田式GP-5型'),
	(3,'半自動型'),
	(4,'自動落下装置'),
	(5,'KANO V6C'),
	(6,'Do-D'),
	(7,'YBM-05'),
	(8,'SP-30'),
	(9,'GP-5'),
	(10,'半自動落下装置');

 -- 4. Insert into "construction" table.
 insert into "construction"("id","name","position_id")
 values
 (1,'安楽亭',1),
 (2,'山幸物流',2);
 
 
 -- 5. Insert into "soil_type" table.
 insert into "soil_type"("id", "name","symbol", "description","image_url") 
 values
     (1,
	 '盛土',
	  'Bn',
	 '粒径のほぼ均一な細砂からなる。細粒分の混入はほとんどない。一部少量の中砂を含む所も見られる。地下水位以下は含水が高く、掘進中に少量の逸水あり。7.40m付近に暗灰色を呈するシルト混り細砂の薄層を挟む。上部はやや緩い状態にある。8m以深は良く締まっている。',
	 'NotFound'),
	 (2,
	 '細砂',
	 'As',
	 '細砂主体であるが、部分的に少量の中砂や粗砂が混じる。',
	 'NotFound'),
	 (3,
	 '砂質土',
	  'As?',
	 '素掘り',
	 'NotFound'),
	 (4,
	 '玉石混じり砂',
	  'As?',
	 '玉石は硬質な安山岩主体でφ50mm程度が中心。玉石の最大はL=400mmの柱状コアで採取される。マトリックスは凝灰質細砂。N値は玉石障害で跳ね上がる',
	 'NotFound'),
	 (5,
	 '火山灰質砂黒灰',
	  'As?',
	 '5.00～5.70mは非常に軟らかく、逸水する。非溶結の凝灰岩。',
	 'NotFound'),
	 (6,
	 '埋土',
	  'As?',
	 '砂、ﾌﾟﾗｽﾁｯｸ、ﾋﾞﾆｰﾙ、ｶﾞﾗｽ、木片等を混入する、粘土。GL-3.00mよりは、最大径5㎝、径1～3㎝の礫が混入する。',
	 'NotFound');
	 
	 	
 -- 6. Insert into "boring_test" table.
 insert into "boring_test"("id","construction_id","order_party_id","order_conducing_id","name")
values
   (1,1,1,2,'No.1');
   
 -- 7. Insert into "using_tool" table.
 insert into "using_tool"("id","tool_id","boring_test_id")
 values
    (1,1,1),
	(2,2,1),
	(3,3,1);

 
 -- 8. Insert into "result" table.
 insert into "result"("id","boring_test_id","slope_of_ground","direction","angle","started_day","finished_day")
 values
    (1,1,0,'','90','2018-01-02','2018-01-03');
 -- 9. Insert into "spt_result" table.
 insert into "spt_result" ("id", "from_depth","first","penetration_on_first","second","penetration_on_second","third","penetration_on_third","result_id")
 values
	( 1, 1.15, 2, 0.1,  3,   0.1,  3, 0.1, 1),
	( 2, 2.15, 3, 0.1,  3,   0.1,  4, 0.1, 1),
	( 3, 3.15, 3, 0.1,  4,   0.1,  5, 0.1, 1),
	( 4, 4.15, 3, 0.1,  3,   0.1,  4, 0.1, 1),
	( 5, 5.15, 2, 0.1,  3,   0.1,  3, 0.1, 1),
	( 6, 6.15, 3, 0.1,  3,   0.1,  4, 0.1, 1),
	( 7, 7.15, 2, 0.1,  3,   0.1,  3, 0.1, 1),
	( 8, 8.15, 3, 0.1,  3,   0.1,  4, 0.1, 1),
	( 9, 9.15, 3, 0.1,  3,   0.1,  4, 0.1, 1),
	(10, 10.15, 3, 0.1,3,    0.1,   4, 0.1, 1),
	(11, 11.15, 3, 0.1,3,    0.1,   4, 0.1, 1),
	(12, 12.15, 3, 0.1,3,    0.1,   4, 0.1, 1),
	(13, 13.15, 3, 0.1,3,    0.1,   4, 0.1, 1);
	
	
--10. Insert into "soil_result" table.
insert into "soil_result" ("id","from_depth","to_depth","soil_type_id","description","color_description","result_id")
values
	(1, 1.47, 0.27, 1, '上部5cmアスファルト。15cmまで砕石、礫径φ10～30mm程度。以深細砂.','茶褐～黄褐',1),
	(2, 0.27,-7.43, 2, '粒径のほぼ均一な細砂からなる。細粒分の混入はほとんどない。一部少量の中砂を含む所も見られる。地下水位以下は含水が高く、掘進中に少量の逸水あり。7.40m付近に暗灰色を呈するシルト混り細砂の薄層を挟む。上部はやや緩い状態にある。8m以深は良く締まっている。','褐',1),
	(3, -7.43, -8.63 ,2, '細砂主体であるが、部分的に少量の中砂や粗砂が混じる。','青灰',1),
	(4, -8.63, -9.02, 2, '粒径のほぼ均一な細砂からなる。細粒分の混入はほとんどない。所々中砂を少量含む所も見られる。全般に良く締まっている。','褐',1);
--11. Insert into "soil_sample" table.
insert into "soil_sample" ("id","sample_no","from_depth","to_depth","result_id")
values
	(1, 'No01',  2 , 2.9, 1),
	(2, 'No02', 4.15, 4.45, 1),
	(3, 'No03', 7.15, 7.45, 1),
	(4, 'No04', 9, 9.9, 1),
	(5, 'No05', 13, 13.33, 1);
--12. Insert into "executing" table.
insert into "executing" ("id","soil_sample_id","conducting_date")
values 
	(1, 1, '2018-01-16'),
	(2, 2,  '2018-01-16'),
	(3,  3 , '2018-01-16'),
	(4,  4,  '2018-01-16'),
	(5,  5 , '2018-01-16');

--13. Insert into "consistency_characteristic".
insert into "consistency_characteristic" ("id","liquid_limit","plasticity_limit","plasticity_index","executing_id")
values 
	(1, 0.2, 0.11, 0.21, 1),
	(2, 0.25, 0.11, 0.24, 2),
	(3, 0.22, 0.13, 0.26, 3),
	(4, 0.21, 0.15, 0.26, 4),
	(5, 0.27, 0.13, 0.28, 5);

--14. Insert into consolidation
insert into "consolidation" ("id","compression_index","consolidation_yield_stress","test_method","executing_id")
values 
	(1, 0.61, 73.9, '土の段階載荷による圧密試験',1),
	(2, 3.65, 139.4, '土の段階載荷による圧密試験' ,4),
	(3, 7.11, 182.4,  '土の段階載荷による圧密試験',5);
--15. Insert into shear
insert into "shear" ("id","total_stress_c","total_stress_c1","affective_stress_c","affective_stress_c1","executing_id")
values
	(1, 21.5, 1.1, NULL,NULL,   1);
--16.Insert into general table;

insert into "general" ("id","dry_density","wet_density","soil_particle","natural_water_content","void_ratio","dryness","executing_id")
values 
	(1,1.6, 1.03, 2.69, 52.6, 1.438, 98.4, 1),
	(2,NULL, NULL,2.716, 34.5,NULL,NULL,  2),
	(3, NULL, NULL, 2.701, 35.5, NULL,NULL,3),
	(4, 1.718, 1.718, 2.706, 45.9, 1.276, 96.7, 4),
	(5, 1.599, 0.962, 2.671, 66.2, 1.776, 99.6, 5);
--17. Insert into particle_size table;
insert into "particle_size" ("id","stone","gravel","sand","silt","clay","max_size","equal_coefficient","executing_id")
values 
	(1, NULL,  0, 33.5,  40,  26.0,  2, NULL, 1),
	(2, NULL,  0, 78.2,  14.5,  7.3,  2,  15.7,  2),
	(3, NULL,  0, 84.2,  12,  3.8,  2,  3.58,  3),
	(4,  NULL, 0, 3.6,  70.2,  26.2,  0.25, NULL, 4),
	(5,  NULL, 0, 5.6,  586,  35.6,  0.425, NULL, 5);
--18 Insert into soil_classification table;
insert into "soil_classification" ("id","soil_id","conducting_date","executing_id")
values
	(1, 1,NULL, 1),
	(2, 2 , NULL, 2),
	(3, 3 ,NULL, 3),
	(4, 4 ,NULL, 4),
	(5, 5 ,NULL, 5);
	
	
 -------------------------------------------------------------------------
 -------------------------------------------------------------------------
 -----------------------Some sql query sample.-----------------------------
 -------------------------------------------------------------------------
 -------------------------------------------------------------------------
 -- Get the result of spt test what conduced by a company has name is "株式会社 伊藤ボーリング" 
 -- and the boring result will sort by depth where start to boring.
select * from boring_test, party, "result", "spt_result"
where boring_test."id" = party."id" and result."id" = spt_result."result_id" and party."name" = '株式会社 伊藤ボーリング'
ORDER by  spt_result."from_depth";

-- Get the result for soil result in the "秋田県" area
select position."id",position."name", boring_test."name",soil_result."from_depth",soil_result."to_depth",soil_type."name" as "soil_type",soil_type."symbol" as "soil_symbol", soil_type."description"
from "position", "construction", "boring_test", "result", "soil_result", "soil_type"
where 
	position."id" = construction."id" and 
	construction."id" = boring_test."construction_id" and
	boring_test."id" = result."id" and
    result."id" = soil_result."result_id" and
    soil_result."soil_type_id" = soil_type."id" and 
	position."name" like '秋田県%';
	
SELECT sample_no "試料", from_depth, to_depth, dry_density , wet_density, soil_particle, natural_water_content, void_ratio, dryness
FROM 
  executing ex 
  INNER JOIN soil_sample soil 
  ON ex.soil_sample_id = soil.id 
  INNER JOIN general gen
  ON gen.executing_id = ex.id
WHERE soil.result_id IN (SELECT rt.id
	FROM 
 		boring_test boring 
 	 	INNER JOIN construction ct 
 		ON boring.construction_id = ct.id 
  		INNER JOIN result rt
 	 	ON rt.boring_test_id = boring.id
	WHERE ct.name = '安楽亭');
 -------------------------------------------------------------------------
 -------------------------------------------------------------------------
SELECT 
	spt.id ,
	test.name,
	rs.started_day "実装日",
	rs.finished_day "完了日",
	from_depth as "深さから", 
	(from_depth + penetration_on_first+ penetration_on_second+ penetration_on_third)as "深さまで",
	first "一番目の10cmの打撃回数", penetration_on_first "一番目の10cm貫入量", second "二番目の10cmの打撃回数",
	penetration_on_second "二番目の10cm貫入量",
	third "三番目の10cmの打撃回数",
	penetration_on_third "三番目の10cm貫入量"
from result rs  
	INNER JOIN spt_result spt
    ON spt.result_id = rs.id
	INNER JOIN boring_test test
    ON test.id = rs.boring_test_id;
 
 
 
 
 