SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `artikel`
-- ----------------------------
DROP TABLE IF EXISTS `artikel`;
CREATE TABLE `artikel` (`Artikelnr` 	varchar(5) 	NOT NULL,
						`Omschrijving` 	varchar(80) NOT NULL,
						`Categorie` 	varchar(20) NOT NULL,
						`Verkoopprijs` 	int(5) 		NOT NULL,
						PRIMARY KEY (`Artikelnr`),
						INDEX idx_pk_artikel USING BTREE (`Artikelnr`)
)ENGINE=Innodb;

-- ----------------------------
--  Records of `artikel`
-- ----------------------------
BEGIN;
INSERT INTO `artikel` VALUES ('F0445', 'Aerobicsschoenen Flits', 'Fitness', '70'), ('F0523', 'Aerobicsschoenen Alpha', 'Fitness', '85'), ('F4552', 'Sweater Muri', 'Fitness', '19'), ('F4712', 'T-shirt Aero', 'Fitness', '17'), ('F9456', 'Hometrainer Basic', 'Fitness', '165'), ('F9457', 'Hometrainer Luxe', 'Fitness', '240'), ('F9458', 'Hometrainer All in One', 'Fitness', '378'), ('G0557', 'Clubset dames', 'Golf', '412'), ('G0558', 'Clubset heren', 'Golf', '487'), ('G1355', 'Golfschoenen Tornal', 'Golf', '176'), ('G1372', 'Golfschoenen TRUX', 'Golf', '125'), ('G3255', 'Putter James', 'Golf', '40'), ('G3261', 'Club Hippo', 'Golf', '45'), ('G3262', 'Club Fairway', 'Golf', '200'), ('G3263', 'Club Wilson', 'Golf', '175'), ('G8423', 'Trolley P70', 'Golf', '85'), ('G8472', 'Trolley P90', 'Golf', '97'), ('G8478', 'Golftas James', 'Golf', '45'), ('G9912', 'Golfballen TRUX', 'Golf', '13'), ('H1694', 'Hockeystick Mulberry', 'Hockey', '38'), ('H1695', 'Hockeystick Dita', 'Hockey', '54'), ('H2671', 'Hockeyschoenen Twister', 'Hockey', '73'), ('H4518', 'Hockeyballen', 'Hockey', '18'), ('O1276', 'Rugzak Trekking', 'Outdoor', '85'), ('O1277', 'Rugzak Camel', 'Outdoor', '73'), ('O1433', 'Slaapzak dons', 'Outdoor', '54'), ('O1434', 'Slaapzak Mummi', 'Outdoor', '66'), ('O2884', 'Loopschoenen Trekking', 'Outdoor', '85'), ('O3201', 'Luchtbed 1 persoons', 'Outdoor', '24'), ('O3202', 'Luchtbed 2 persoons', 'Outdoor', '43'), ('O7712', 'Regenponcho', 'Outdoor', '40'), ('O8113', 'Pannenset', 'Outdoor', '14'), ('O9345', 'Verrekijker 8x50', 'Outdoor', '114'), ('R2265', 'Hartslagmeter', 'Running', '23'), ('R3417', 'Loopschoenen Nike', 'Running', '95'), ('R3418', 'Loopschoenen Air', 'Running', '68'), ('R4517', 'Aeromod hardloopbroek', 'Running', '34'), ('R4568', 'Broek Asics Sprinter', 'Running', '45'), ('T2331', 'Junior racket', 'Tennis', '34'), ('T2410', 'Racket sport', 'Tennis', '87'), ('T2412', 'Racket alu', 'Tennis', '93'), ('T3471', 'Tennisschoenen ACE', 'Tennis', '133'), ('T3480', 'Tennisschoenen indoor', 'Tennis', '112'), ('T5230', 'Tennissokken', 'Tennis', '7'), ('T9912', 'Tennisballen training', 'Tennis', '12'), ('T9913', 'Tennisballen wedstrijd', 'Tennis', '18'), ('V2377', 'Voetbalshirt Flits', 'Voetbal', '37'), ('V2378', 'Voetbalshort Flits', 'Voetbal', '42'), ('V4102', 'Trainingspak Comfort', 'Voetbal', '43'), ('V4814', 'Veldschoenen Goal', 'Voetbal', '69'), ('V4815', 'Veldschoenen Inter', 'Voetbal', '78'), ('V4832', 'Zaalschoenen Goal', 'Voetbal', '62'), ('V4833', 'Zaalschoenen Inter', 'Voetbal', '70'), ('V9120', 'Voetbal Geo', 'Voetbal', '45'), ('V9121', 'Wedstrijdbal', 'Voetbal', '57'), ('V9320', 'Keepershandschoenen', 'Voetbal', '58'), ('V9466', 'Scheenbeschermers', 'Voetbal', '37'), ('VT127', 'Tafeltennistafel Top', 'Vrije tijd', '175'), ('VT288', 'Inline skates senior', 'Vrije tijd', '115'), ('VT289', 'Inline skates Synchro', 'Vrije tijd', '149'), ('VT312', 'Jack Always', 'Vrije tijd', '65'), ('VT485', 'Darts sport', 'Vrije tijd', '18'), ('VT489', 'Dartsbord Barry', 'Vrije tijd', '28'), ('Z3354', 'Zwembroek sport', 'Zwemsport', '33'), ('Z3357', 'Zwemshort INQ', 'Zwemsport', '48'), ('Z3380', 'Wedstrijd badpak', 'Zwemsport', '83'), ('Z3461', 'Bikini Jauve', 'Zwemsport', '37'), ('Z8812', 'Snorkelset', 'Zwemsport', '26'), ('Z8823', 'Flippers', 'Zwemsport', '28');
COMMIT;

-- ----------------------------
--  Table structure for `bestelling`
-- ----------------------------
DROP TABLE IF EXISTS `bestelling`;
CREATE TABLE `bestelling` (
						`Bestelnr` varchar(6) NOT NULL,
						`Wcode` varchar(4) NOT NULL,
						`Besteldatum` date NOT NULL,
						PRIMARY KEY (`Bestelnr`),
						FOREIGN KEY (`Wcode`) REFERENCES `winkel` (`Wcode`),
						INDEX idx_pk_bestellling USING BTREE (`Bestelnr`),
						INDEX idx_fk_wcode_bestelling USING BTREE (`Wcode`)
) ENGINE=Innodb;

-- ----------------------------
--  Records of `bestelling`
-- ----------------------------
BEGIN;
INSERT INTO `bestelling` VALUES ('114281', 'BA10', '2001-06-14'), ('114287', 'PS05', '2001-06-14'), ('114310', 'BI31', '2001-06-18'), ('114718', 'SZ01', '2001-06-27'), ('114719', 'SZ02', '2001-06-27'), ('123455', 'KE23', '2001-07-14'), ('125317', 'AN12', '2001-07-22'), ('125423', 'PS11', '2001-07-29'), ('126813', 'BF34', '2001-08-15'), ('126814', 'PS05', '2001-08-15'), ('126914', 'BF34', '2001-08-28'), ('127611', 'PS02', '2001-09-01'), ('131887', 'KE23', '2001-09-03'), ('131889', 'TO03', '2001-09-03'), ('132582', 'AN12', '2001-09-18'), ('132585', 'SZ01', '2001-09-18'), ('133512', 'PS02', '2001-09-20'), ('133515', 'SZ02', '2001-09-20'), ('133674', 'BI31', '2001-09-22'), ('141165', 'AN12', '2001-10-28'), ('141167', 'PS02', '2001-10-28'), ('141168', 'PS11', '2001-10-28'), ('143240', 'BA10', '2001-11-13'), ('143242', 'PS05', '2001-11-13'), ('144178', 'BI31', '2001-11-26'), ('144180', 'TO05', '2001-11-26'), ('145324', 'TO11', '2001-11-28'), ('146541', 'KE23', '2001-11-30'), ('149234', 'HE11', '2001-11-30'), ('151206', 'PS11', '2001-12-01'), ('153701', 'HE11', '2001-12-02'), ('155418', 'ME10', '2001-12-04'), ('155420', 'TO05', '2001-12-04'), ('155632', 'KE23', '2001-12-06'), ('158321', 'BI31', '2001-12-18'), ('158993', 'BF34', '2001-12-03'), ('159122', 'BF34', '2001-12-25'), ('159128', 'PS05', '2001-12-25'), ('161345', 'PS02', '2002-01-30'), ('161348', 'PS11', '2002-01-30'), ('162370', 'BA10', '2002-02-01'), ('168305', 'TO13', '2001-02-25'), ('170221', 'BF34', '2002-03-14'), ('170224', 'TO05', '2002-03-14'), ('172376', 'BI31', '2002-03-22'), ('172381', 'PS05', '2002-03-22'), ('178234', 'BF34', '2002-03-21'), ('178239', 'PS02', '2002-03-21'), ('179211', 'ME10', '2002-03-30'), ('179321', 'HE11', '2002-03-30'), ('183654', 'KE23', '2002-04-12'), ('183657', 'PS05', '2002-04-12'), ('185399', 'HE11', '2002-04-18'), ('186231', 'ME10', '2002-04-19'), ('193470', 'PS11', '2002-05-17'), ('201655', 'ME10', '2002-06-23'), ('201657', 'PS11', '2002-06-23'), ('201661', 'PS02', '2002-06-23');
COMMIT;

-- ----------------------------
--  Table structure for `bestelregel`
-- ----------------------------
DROP TABLE IF EXISTS `bestelregel`;
CREATE TABLE 			`bestelregel` (
						`Bestelnr` 		varchar(6) 	NOT NULL,
						`Artikelnr` 	varchar(5) 	NOT NULL,
						`Maat` 			varchar(10) NOT NULL,
						`Besteld_aantal` int(5) 	NOT NULL,
						`Kortingsperc` 	int(5) 		NOT NULL,
						PRIMARY KEY (`Bestelnr`,`Artikelnr`,`Maat`),
						FOREIGN KEY (`Artikelnr`) REFERENCES `artikel` (`Artikelnr`),
						FOREIGN KEY (`Bestelnr`) REFERENCES `bestelling` (`Bestelnr`),
						INDEX idx_pk_bestelregel USING BTREE (`Bestelnr`,`Artikelnr`,`Maat`),
						INDEX idx_fk_bestelregel USING BTREE (`Artikelnr`),
						INDEX idx_fk_bestelregel2 USING BTREE (`Bestelnr`)
) ENGINE=Innodb;

-- ----------------------------
--  Records of `bestelregel`
-- ----------------------------
BEGIN;
INSERT INTO `bestelregel` VALUES ('114281', 'F0445', '38', '5', '3'), ('114281', 'F0445', '40', '5', '3'), ('114281', 'F0445', '42', '5', '3'), ('114281', 'F0445', '44', '5', '3'), ('114287', 'G1355', '38', '1', '0'), ('114287', 'G1355', '39', '1', '0'), ('114287', 'G1355', '40', '1', '0'), ('114287', 'G1355', '41', '1', '0'), ('114287', 'G1355', '42', '1', '0'), ('114287', 'G1355', '43', '1', '0'), ('114287', 'G1355', '44', '1', '0'), ('114310', 'H1694', 'H', '5', '2'), ('114310', 'H1694', 'M', '5', '2'), ('114310', 'H2671', '38', '5', '3'), ('114310', 'H2671', '40', '5', '3'), ('114718', 'VT288', '38W', '3', '0'), ('114718', 'VT288', '39W', '3', '0'), ('114718', 'VT288', '40M', '3', '0'), ('114719', 'VT289', '43M', '20', '3'), ('114719', 'VT312', 'L', '5', '2'), ('114719', 'VT312', 'M', '5', '2'), ('123455', 'O1433', 'g', '5', '2'), ('123455', 'O1434', 'g', '5', '2'), ('125317', 'VT485', 'g', '10', '0'), ('125317', 'VT489', 'g', '5', '0'), ('125423', 'G3255', 'g', '2', '0'), ('125423', 'G3262', '5', '2', '0'), ('125423', 'G3262', '7', '2', '0'), ('126813', 'V2377', 'L', '3', '0'), ('126813', 'V2377', 'M', '3', '0'), ('126813', 'V2377', 'S', '3', '0'), ('126813', 'V2377', 'XL', '3', '0'), ('126813', 'V4102', 'L', '5', '3'), ('126813', 'V4102', 'M', '5', '3'), ('126813', 'V4102', 'S', '5', '3'), ('126813', 'V4102', 'XL', '5', '3'), ('126814', 'G3261', '3', '3', '0'), ('126814', 'G3261', '5', '3', '0'), ('126914', 'F9456', 'g', '1', '0'), ('126914', 'F9457', 'g', '1', '0'), ('126914', 'F9458', 'g', '1', '0'), ('127611', 'G0557', 'g', '2', '0'), ('127611', 'G0558', 'g', '2', '0'), ('127611', 'G3263', '5', '3', '0'), ('131887', 'V4833', '40', '5', '2'), ('131887', 'V4833', '42', '5', '2'), ('131887', 'V9120', 'g', '5', '0'), ('131887', 'V9121', 'g', '5', '0'), ('131889', 'R3418', '43', '3', '0'), ('131889', 'V2377', 'M', '5', '0'), ('131889', 'V2377', 'XL', '5', '0'), ('132582', 'VT485', 'g', '15', '0'), ('132585', 'VT289', '38W', '5', '2'), ('132585', 'VT289', '43M', '5', '2'), ('132585', 'VT289', '47M', '5', '2'), ('133512', 'G8478', 'g', '3', '0'), ('133512', 'G9912', 'g', '5', '0'), ('133515', 'VT288', '38W', '10', '3'), ('133515', 'VT288', '39W', '10', '3'), ('133515', 'VT288', '40M', '10', '3'), ('133674', 'H4518', 'g', '10', '0'), ('133674', 'O2884', '41', '3', '0'), ('133674', 'O2884', '43', '3', '0'), ('133674', 'O2884', '44', '2', '0'), ('141165', 'VT489', 'g', '5', '0'), ('141167', 'H1695', 'H', '3', '0'), ('141167', 'H1695', 'M', '3', '0'), ('141167', 'V4814', '40', '2', '0'), ('141167', 'V4814', '42', '2', '0'), ('141168', 'O8113', 'g', '10', '2'), ('141168', 'T3480', '38', '2', '0'), ('141168', 'T3480', '41', '3', '0'), ('141168', 'T9912', 'g', '10', '0'), ('143240', 'O1276', 'g', '3', '0'), ('143240', 'T2410', 'L3', '2', '0'), ('143240', 'T2410', 'L4', '2', '0'), ('143240', 'V9121', 'g', '10', '2'), ('143240', 'VT127', 'g', '1', '0'), ('143242', 'O3202', 'g', '3', '0'), ('143242', 'T2331', 'L1', '2', '0'), ('143242', 'T2331', 'L2', '2', '0'), ('144178', 'R4517', '38', '3', '0'), ('144178', 'R4517', '40', '3', '0'), ('144178', 'R4517', '42', '3', '0'), ('144178', 'R4568', '40', '5', '2'), ('144178', 'R4568', '42', '5', '2'), ('144180', 'F9456', 'g', '2', '0'), ('144180', 'F9457', 'g', '2', '0'), ('144180', 'F9458', 'g', '2', '0'), ('145324', 'V4102', 'L', '5', '2'), ('145324', 'V4102', 'M', '5', '2'), ('145324', 'V4102', 'S', '5', '2'), ('145324', 'V4102', 'XL', '5', '2'), ('146541', 'G8423', 'g', '1', '0'), ('146541', 'G8472', 'g', '1', '0'), ('149234', 'R3418', '39', '3', '0'), ('149234', 'R3418', '40', '3', '0'), ('149234', 'R3418', '41', '3', '0'), ('151206', 'F0523', '42', '5', '2'), ('151206', 'F4712', 'M', '3', '0'), ('151206', 'O9345', 'g', '3', '0'), ('153701', 'VT289', '47M', '10', '3'), ('153701', 'VT485', 'g', '3', '0'), ('153701', 'VT489', 'g', '3', '0'), ('155418', 'F0523', '38', '1', '0'), ('155418', 'F0523', '39', '1', '0'), ('155418', 'F0523', '40', '2', '0'), ('155418', 'F0523', '41', '2', '0'), ('155418', 'F0523', '42', '2', '0'), ('155418', 'F0523', '43', '1', '0'), ('155418', 'F0523', '44', '1', '0'), ('155418', 'O3201', 'g', '3', '0'), ('155420', 'O1433', 'g', '5', '2'), ('155420', 'O3201', 'g', '2', '0'), ('155420', 'O3202', 'g', '2', '0'), ('155632', 'O1276', 'g', '2', '0'), ('155632', 'T2412', 'L3', '3', '0'), ('155632', 'V9320', '5', '2', '0'), ('158321', 'Z3380', '4', '2', '0'), ('158321', 'Z3380', '5', '2', '0'), ('158321', 'Z3380', '6', '2', '0'), ('158321', 'Z8823', 'L', '10', '2'), ('158321', 'Z8823', 'M', '10', '2'), ('158993', 'O1277', 'g', '10', '2'), ('159122', 'O1277', 'g', '5', '2'), ('159122', 'VT312', 'L', '5', '2'), ('159122', 'VT312', 'M', '5', '2'), ('159128', 'T3471', '39', '5', '2'), ('159128', 'T3471', '40', '5', '2'), ('159128', 'T3471', '41', '5', '2'), ('159128', 'T3471', '42', '5', '2'), ('159128', 'T3471', '43', '5', '2'), ('161345', 'Z3354', '5', '2', '0'), ('161345', 'Z3354', '6', '2', '0'), ('161345', 'Z3354', '7', '2', '0'), ('161345', 'Z3357', '5', '1', '0'), ('161345', 'Z3357', '6', '1', '0'), ('161345', 'Z3357', '7', '1', '0'), ('161348', 'T5230', 'L', '20', '2'), ('161348', 'T5230', 'M', '20', '2'), ('161348', 'V4814', '43', '2', '0'), ('162370', 'R2265', 'g', '10', '2'), ('162370', 'VT288', '38W', '5', '2'), ('162370', 'VT288', '40M', '5', '2'), ('168305', 'T2412', 'L3', '5', '2'), ('168305', 'T9913', 'g', '5', '0'), ('168305', 'V4814', '40', '5', '2'), ('168305', 'V4814', '42', '5', '2'), ('170221', 'O7712', 'M', '3', '0'), ('170221', 'O7712', 'XL', '3', '0'), ('170221', 'O9345', 'g', '2', '0'), ('170224', 'R3417', '40', '3', '0'), ('170224', 'R4568', '38', '2', '0'), ('170224', 'R4568', '40', '2', '0'), ('170224', 'R4568', '42', '2', '0'), ('172376', 'T2412', 'L3', '10', '3'), ('172381', 'Z8812', 'g', '3', '0'), ('172381', 'Z8823', 'L', '3', '0'), ('172381', 'Z8823', 'M', '3', '0'), ('178234', 'T2412', 'L2', '2', '0'), ('178234', 'T2412', 'L3', '2', '0'), ('178234', 'T2412', 'L4', '2', '0'), ('178239', 'R3417', '38', '1', '0'), ('178239', 'R3417', '40', '2', '0'), ('178239', 'R3417', '42', '2', '0'), ('178239', 'R3417', '44', '1', '0'), ('179211', 'T5230', 'L', '20', '2'), ('179211', 'T5230', 'M', '20', '2'), ('179211', 'T5230', 'S', '20', '2'), ('179211', 'T9913', 'g', '10', '0'), ('179321', 'Z3461', '4', '3', '0'), ('179321', 'Z3461', '5', '3', '0'), ('179321', 'Z3461', '6', '3', '0'), ('183654', 'V2378', 'L', '5', '2'), ('183654', 'V2378', 'M', '5', '2'), ('183654', 'V2378', 'S', '5', '2'), ('183654', 'V2378', 'XL', '5', '2'), ('183657', 'G1372', '38', '2', '0'), ('183657', 'G1372', '40', '2', '0'), ('183657', 'G1372', '42', '2', '0'), ('183657', 'G3255', 'g', '1', '0'), ('185399', 'VT127', 'g', '8', '3'), ('186231', 'V4815', '39', '5', '2'), ('186231', 'V4815', '41', '5', '2'), ('186231', 'V4815', '43', '5', '2'), ('186231', 'Z8812', 'g', '10', '3'), ('193470', 'V9121', 'g', '10', '2'), ('193470', 'VT489', 'g', '10', '3'), ('201655', 'F4552', 'L', '3', '0'), ('201655', 'F4552', 'M', '3', '0'), ('201655', 'F4552', 'S', '3', '0'), ('201655', 'F4552', 'XL', '3', '0'), ('201655', 'F4712', 'L', '10', '3'), ('201655', 'F4712', 'M', '10', '3'), ('201655', 'F4712', 'S', '10', '3'), ('201655', 'F4712', 'XL', '10', '3'), ('201657', 'Z3461', '4', '2', '0'), ('201657', 'Z3461', '5', '3', '0'), ('201657', 'Z3461', '6', '2', '0'), ('201661', 'V4832', '39', '5', '2'), ('201661', 'V4832', '41', '5', '2'), ('201661', 'V4832', '43', '5', '2'), ('201661', 'V9466', '3', '2', '0'), ('201661', 'V9466', '5', '2', '0'), ('201661', 'V9466', '7', '2', '0');
COMMIT;

-- ----------------------------
--  Table structure for `maat`
-- ----------------------------
DROP TABLE IF EXISTS `maat`;
CREATE TABLE `maat` (
  `Artikelnr` 		varchar(5)  NOT NULL,
  `Maat` 			varchar(10) NOT NULL,
  PRIMARY KEY (`Artikelnr`,`Maat`),
	FOREIGN KEY (`Artikelnr`) REFERENCES `artikel` (`Artikelnr`),
INDEX idx_pk_maat USING BTREE (`Artikelnr`,`Maat`),
INDEX idx_fk_maat USING BTREE (`Artikelnr`)
) ENGINE=Innodb;

-- ----------------------------
--  Records of `maat`
-- ----------------------------
BEGIN;
INSERT INTO `maat` VALUES ('F0445', '38'), ('F0445', '39'), ('F0445', '40'), ('F0445', '41'), ('F0445', '42'), ('F0445', '43'), ('F0445', '44'), ('F0445', '45'), ('F0523', '38'), ('F0523', '39'), ('F0523', '40'), ('F0523', '41'), ('F0523', '42'), ('F0523', '43'), ('F0523', '44'), ('F0523', '45'), ('F4552', 'L'), ('F4552', 'M'), ('F4552', 'S'), ('F4552', 'XL'), ('F4712', 'L'), ('F4712', 'M'), ('F4712', 'S'), ('F4712', 'XL'), ('F9456', 'g'), ('F9457', 'g'), ('F9458', 'g'), ('G0557', 'g'), ('G0558', 'g'), ('G1355', '38'), ('G1355', '39'), ('G1355', '40'), ('G1355', '41'), ('G1355', '42'), ('G1355', '43'), ('G1355', '44'), ('G1355', '45'), ('G1372', '38'), ('G1372', '39'), ('G1372', '40'), ('G1372', '41'), ('G1372', '42'), ('G1372', '43'), ('G1372', '44'), ('G1372', '45'), ('G3255', 'g'), ('G3261', '3'), ('G3261', '5'), ('G3262', '5'), ('G3262', '7'), ('G3263', '3'), ('G3263', '5'), ('G3263', '7'), ('G8423', 'g'), ('G8472', 'g'), ('G8478', 'g'), ('G9912', 'g'), ('H1694', 'H'), ('H1694', 'L'), ('H1694', 'M'), ('H1695', 'H'), ('H1695', 'M'), ('H2671', '38'), ('H2671', '39'), ('H2671', '40'), ('H2671', '41'), ('H2671', '42'), ('H2671', '43'), ('H2671', '44'), ('H2671', '45'), ('H4518', 'g'), ('O1276', 'g'), ('O1277', 'g'), ('O1433', 'g'), ('O1434', 'g'), ('O2884', '38'), ('O2884', '39'), ('O2884', '40'), ('O2884', '41'), ('O2884', '42'), ('O2884', '43'), ('O2884', '44'), ('O2884', '45'), ('O3201', 'g'), ('O3202', 'g'), ('O7712', 'M'), ('O7712', 'XL'), ('O8113', 'g'), ('O9345', 'g'), ('R2265', 'g'), ('R3417', '38'), ('R3417', '39'), ('R3417', '40'), ('R3417', '41'), ('R3417', '42'), ('R3417', '43'), ('R3417', '44'), ('R3417', '45'), ('R3418', '38'), ('R3418', '39'), ('R3418', '40'), ('R3418', '41'), ('R3418', '42'), ('R3418', '43'), ('R3418', '44'), ('R3418', '45'), ('R4517', '38'), ('R4517', '40'), ('R4517', '42'), ('R4568', '38'), ('R4568', '40'), ('R4568', '42'), ('T2331', 'L1'), ('T2331', 'L2'), ('T2410', 'L2'), ('T2410', 'L3'), ('T2410', 'L4'), ('T2412', 'L2'), ('T2412', 'L3'), ('T2412', 'L4'), ('T3471', '38'), ('T3471', '39'), ('T3471', '40'), ('T3471', '41'), ('T3471', '42'), ('T3471', '43'), ('T3471', '44'), ('T3471', '45'), ('T3480', '38'), ('T3480', '39'), ('T3480', '40'), ('T3480', '41'), ('T3480', '42'), ('T3480', '43'), ('T3480', '44'), ('T3480', '45'), ('T5230', 'L'), ('T5230', 'M'), ('T5230', 'S'), ('T9912', 'g'), ('T9913', 'g'), ('V2377', 'L'), ('V2377', 'M'), ('V2377', 'S'), ('V2377', 'XL'), ('V2378', 'L'), ('V2378', 'M'), ('V2378', 'S'), ('V2378', 'XL'), ('V4102', 'L'), ('V4102', 'M'), ('V4102', 'S'), ('V4102', 'XL'), ('V4814', '38'), ('V4814', '39'), ('V4814', '40'), ('V4814', '41'), ('V4814', '42'), ('V4814', '43'), ('V4814', '44'), ('V4814', '45'), ('V4815', '38'), ('V4815', '39'), ('V4815', '40'), ('V4815', '41'), ('V4815', '42'), ('V4815', '43'), ('V4815', '44'), ('V4815', '45'), ('V4832', '38'), ('V4832', '39'), ('V4832', '40'), ('V4832', '41'), ('V4832', '42'), ('V4832', '43'), ('V4832', '44'), ('V4832', '45'), ('V4833', '38'), ('V4833', '39'), ('V4833', '40'), ('V4833', '41'), ('V4833', '42'), ('V4833', '43'), ('V4833', '44'), ('V4833', '45'), ('V9120', 'g'), ('V9121', 'g'), ('V9320', '3'), ('V9320', '5'), ('V9320', '7'), ('V9466', '3'), ('V9466', '5'), ('V9466', '7'), ('VT127', 'g'), ('VT288', '38W'), ('VT288', '39W'), ('VT288', '40M'), ('VT289', '38W'), ('VT289', '43M'), ('VT289', '47M'), ('VT312', 'L'), ('VT312', 'M'), ('VT485', 'g'), ('VT489', 'g'), ('Z3354', '4'), ('Z3354', '5'), ('Z3354', '6'), ('Z3354', '7'), ('Z3357', '4'), ('Z3357', '5'), ('Z3357', '6'), ('Z3357', '7'), ('Z3380', '4'), ('Z3380', '5'), ('Z3380', '6'), ('Z3461', '4'), ('Z3461', '5'), ('Z3461', '6'), ('Z8812', 'g'), ('Z8823', 'L'), ('Z8823', 'M');
COMMIT;

-- ----------------------------
--  Table structure for `winkel`
-- ----------------------------
DROP TABLE IF EXISTS `winkel`;
CREATE TABLE `winkel` (
  `Wcode` varchar(4) NOT NULL,
  `Naam` varchar(50) NOT NULL,
  `Adres` varchar(50) NOT NULL,
  `Plaats` varchar(50) NOT NULL,
  `Telefoonnr` varchar(10) NOT NULL,
  PRIMARY KEY (`Wcode`)
) ENGINE=Innodb;

-- ----------------------------
--  Records of `winkel`
-- ----------------------------
BEGIN;
INSERT INTO `winkel` VALUES ('HG15', 'Hanze Sports', 'Zernikeplein 1', 'Grunn', '0507654321'), ('AN12', 'Andy\'s Darts', 'Mijnsherenlaan 117a', 'Rotterdam', '0103556128'), ('BA10', 'Sporthuis Baan', 'Sarphatistraat 59', 'Amsterdam', '0204567125'), ('BF34', 'Bosch Funsports', 'Roermondsestraat 43', 'Venlo', '0774588143'), ('BI31', 'Biksan Sport', 'Hazelaar 13', 'Utrecht', '0304416732'), ('HE11', 'Helderman Sport', 'Hoogstraat 46', 'Schiedam', '0101366345'), ('KE23', 'Kean Sport', 'Koperwiek 54', 'Capelle a/d Ijssel', '0107718232'), ('ME10', 'Meevers Sport', 'Neptunusstraat 76', 'Lisse', '0252782290'), ('PS02', 'Perry Sport', 'Langestraat 86', 'Alkmaar', '0725126408'), ('PS05', 'Perry Sport', 'Straatweg 3', 'Maastricht', '0433510115'), ('PS11', 'Perry Sport', 'Zuidplein Hoog 932', 'Rotterdam', '0102939015'), ('SZ01', 'Skate Zone', 'Ceintuurbaan 57', 'Amsterdam', '0204886512'), ('SZ02', 'Skate Zone', 'Kerkweg 45', 'Utrecht', '0308876345'), ('TO03', 'TOP All Sports', 'Margrietstraat 31', 'Huizen', '0351238896'), ('TO05', 'TOP All Sports', 'De Vang 12a', 'Groningen', '0504411177'), ('TO11', 'TOP All Sports', 'Zuidkil 8', 'Dordrecht', '0786523118'), ('TO13', 'TOP All Sports', 'Koperwiek 5', 'Leeuwarden', '0586671243');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
