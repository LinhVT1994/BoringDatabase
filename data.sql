 --------------Insert data into database for testing.---------------------
 -------------------------------------------------------------------------
 -------------------------------------------------------------------------
 -- 1. Insert into "position" table.
 
 insert into "position"("id", "name", "latitude","longitude") 
 values
 	(1,'新南地区店舗開発地盤調査','38,02,59.5300','140,43,48.6100')
	;
	

 -- 2. Insert into "party" table.
 insert into "party"("id", "name", "address","phone") 
 values
 	(1,'東北ボーリング株式会社','','022-288-0321'),
	(2,'仙南ハウス産業株式会社','',NULL);
	
 -- 3. Insert into "tool" table.
insert into "tool"("id", "name") 
values
	(1,'東邦D－１'),
	(2,'半自動型'),
	(3,'V5-P'),
	(4,'ヤンマーNFD-13');

 -- 4. Insert into "construction" table.
 insert into "construction"("id","name","position_id")
 values
 (1,'安楽亭',1);
 -- 5. Insert into "soil_type" table.
 insert into "soil_type"("id", "name","symbol", "description","image_url") 
 values
     (1,'シルト','M','', NULL),
	 (2,'砂質シルト','Sm','', NULL),
	 (3,'礫混じり粗砂','GCs','', NULL);
	 
	 	
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
	
	