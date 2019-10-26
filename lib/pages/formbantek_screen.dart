
import 'package:flutter/material.dart';
import 'package:bantek/bantek.dart';
import 'package:bantek/widgets/walkthrough.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:bantek/widgets/datetime_picker_formfield.dart';
import 'package:bantek/widgets/flutter_search_panel.dart';
import 'package:bantek/widgets/search_item.dart';
import 'package:bantek/widgets/search_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
List<SearchItem<int>> searchpanel = [
  SearchItem(1  ,'AEG	Aek Godang Airport (AEG)	Aek Godang	Aek Godang (AEG), Indonesia'),
SearchItem(2  ,'ARD	Alor Island Airport (ARD)	Alor Island	Alor Island (ARD), Indonesia'),
SearchItem(3  ,'AHI	Amahai Airport (AHI)	Amahai	Amahai (AHI), Indonesia'),
SearchItem(4  ,'AMQ	Pattimura Airport (AMQ)	Ambon	Ambon (AMQ), Indonesia'),
SearchItem(5  ,'AGD	Anggi Airport (AGD)	Anggi	Anggi (AGD), Indonesia'),
SearchItem(6  ,'AAS	Apalapsili Airport (AAS)	Apalapsili	Apalapsili (AAS), Indonesia'),
SearchItem(7  ,'ARJ	Arso Airport (ARJ)	Arso	Arso (ARJ), Indonesia'),
SearchItem(8  ,'AKQ	Gunung Batin Airport (AKQ)	Astraksetra	Astraksetra (AKQ), Indonesia'),
SearchItem(9  ,'ABU	Atambua Airport (ABU)	Atambua	Atambua (ABU), Indonesia'),
SearchItem(10 ,'AUT	Atauro Airport (AUT)	Atauro	Atauro (AUT), Indonesia'),
SearchItem(11 ,'AYW	Ayawasi Airport (AYW)	Ayawasi	Ayawasi (AYW), Indonesia'),
SearchItem(12 ,'BXB	Babo Airport (BXB)	Babo	Babo (BXB), Indonesia'),
SearchItem(13 ,'BXD	Bade Airport (BXD)	Bade	Bade (BXD), Indonesia'),
SearchItem(14 ,'BJW	Bajawa Airport (BJW)	Bajawa	Bajawa (BJW), Indonesia'),
SearchItem(15 ,'BPN	Sepingan Airport (BPN)	Balikpapan	Balikpapan (BPN), Indonesia'),
SearchItem(16 ,'NAF	Banaina Airport (NAF)	Banaina	Banaina (NAF), Indonesia'),
SearchItem(17 ,'BTJ	Blang Bintang Airport (BTJ)	Banda Aceh	Banda Aceh (BTJ), Indonesia'),
SearchItem(18 ,'NDA	Bandanaira Airport (NDA)	Bandanaira	Bandanaira (NDA), Indonesia'),
SearchItem(19 ,'TKG	Branti International Airport (TKG)	Bandar Lampung	Bandar Lampung (TKG), Indonesia'),
SearchItem(20 ,'BDO	Husein Sastranegara International Airport (BDO)	Bandung	Bandung (BDO), Indonesia'),
SearchItem(21 ,'BDJ	Sjamsudin Noor International Airport (BDJ)	Banjarmasin	Banjarmasin (BDJ), Indonesia'),
SearchItem(22 ,'BTH	Hang Nadim International Airport (BTH)	Batam	Batam (BTH), Indonesia'),
SearchItem(23 ,'BXM	Batom Airport (BXM)	Batom	Batom (BXM), Indonesia'),
SearchItem(24 ,'BTW	Batu Licin Airport (BTW)	Batu Licin	Batu Licin (BTW), Indonesia'),
SearchItem(25 ,'BUW	Baubau Airport (BUW)	Baubau	Baubau (BUW), Indonesia'),
SearchItem(26 ,'BKS	Padangkemiling Airport (BKS)	Bengkulu	Bengkulu (BKS), Indonesia'),
SearchItem(27 ,'BJK	Benjina Airport (BJK)	Benjina	Benjina (BJK), Indonesia'),
SearchItem(28 ,'BEJ	Berau Airport (BEJ)	Berau	Berau (BEJ), Indonesia'),
SearchItem(29 ,'BIK	Mokmer Airport (BIK)	Biak	Biak (BIK), Indonesia'),
SearchItem(30 ,'BMU	Bima Airport (BMU)	Bima	Bima (BMU), Indonesia'),
SearchItem(31 ,'NTI	Bintuni Airport (NTI)	Bintuni	Bintuni (NTI), Indonesia'),
SearchItem(32 ,'BUI	Bokondini Airport (BUI)	Bokondini	Bokondini (BUI), Indonesia'),
SearchItem(33 ,'BJG	Bolaang Airport (BJG)	Bolaang	Bolaang (BJG), Indonesia'),
SearchItem(34 ,'BXT	Bontang Airport (BXT)	Bontang	Bontang (BXT), Indonesia'),
SearchItem(35 ,'BYQ	Bunyu Airport (BYQ)	Bunyu	Bunyu (BYQ), Indonesia'),
SearchItem(36 ,'UOL	Buol Airport (UOL)	Buol	Buol (UOL), Indonesia'),
SearchItem(37 ,'CPF	Cepu Airport (CPF)	Cepu	Cepu (CPF), Indonesia'),
SearchItem(38 ,'CXP	Tunggul Wulung Airport (CXP)	Cilacap	Cilacap (CXP), Indonesia'),
SearchItem(39 ,'CBN	Penggung Airport (CBN)	Cirebon	Cirebon (CBN), Indonesia'),
SearchItem(40 ,'DRH	Dabra Airport (DRH)	Dabra	Dabra (DRH), Indonesia'),
SearchItem(41 ,'DTD	Datadawai Airport (DTD)	Datadawai	Datadawai (DTD), Indonesia'),
SearchItem(42 ,'DPS	Ngurah Rai Airport (DPS)	Denpasar Bali	Denpasar Bali (DPS), Indonesia'),
SearchItem(43 ,'DIL	Comoro Airport (DIL)	Dili	Dili (DIL), Indonesia'),
SearchItem(44 ,'DOB	Dobo Airport Airport (DOB)	Dobo	Dobo (DOB), Indonesia'),
SearchItem(45 ,'DUM	Pinang Kampai Airport (DUM)	Dumai	Dumai (DUM), Indonesia'),
SearchItem(46 ,'ELR	Elelim Airport (ELR)	Elelim	Elelim (ELR), Indonesia'),
SearchItem(47 ,'EWI	Enarotali Airport (EWI)	Enarotali	Enarotali (EWI), Indonesia'),
SearchItem(48 ,'ENE	Ende Airport (ENE)	Ende	Ende (ENE), Indonesia'),
SearchItem(49 ,'EWE	Ewer Airport (EWE)	Ewer	Ewer (EWE), Indonesia'),
SearchItem(50 ,'FKQ	Fak Fak Airport (FKQ)	Fak Fak	Fak Fak (FKQ), Indonesia'),
SearchItem(51 ,'GAV	Gag Island Airport (GAV)	Gag Island	Gag Island (GAV), Indonesia'),
SearchItem(52 ,'GLX	Galela Airport (GLX)	Galela	Galela (GLX), Indonesia'),
SearchItem(53 ,'GEB	Gebe Airport (GEB)	Gebe	Gebe (GEB), Indonesia'),
SearchItem(54 ,'GTO	Tolotio Airport (GTO)	Gorontalo	Gorontalo (GTO), Indonesia'),
SearchItem(55 ,'GNS	Gunungsitoli Airport (GNS)	Gunungsitoli	Gunungsitoli (GNS), Indonesia'),
SearchItem(56 ,'ILA	Illaga Airport (ILA)	Illaga	Illaga (ILA), Indonesia'),
SearchItem(57 ,'IUL	Ilu Airport (IUL)	Ilu	Ilu (IUL), Indonesia'),
SearchItem(58 ,'INX	Inanwatan Airport (INX)	Inanwatan	Inanwatan (INX), Indonesia'),
SearchItem(59 ,'HLP	Halim Perdana Kusuma International Airport (HLP)	Jakarta	Jakarta (HLP), Indonesia'),
SearchItem(60 ,'CGK	Soekarno-Hatta Inernational Airport (CGK)	Jakarta	Jakarta (JKT), Indonesia'),
SearchItem(61 ,'DJB	Sultan Taha Syarifudn Airport (DJB)	Jambi	Jambi (DJB), Indonesia'),
SearchItem(62 ,'DJJ	Sentani Airport (DJJ)	Jayapura	Jayapura (DJJ), Indonesia'),
SearchItem(62 ,'DJJ	Sentani Airport (DJJ)	Jayapura	Jayapura (DJJ), Indonesia'),
SearchItem(63 ,'KNG	Kaimana Airport (KNG)	Kaimana	Kaimana (KNG), Indonesia'),
SearchItem(64 ,'KBX	Kambuaya Airport (KBX)	Kambuaya	Kambuaya (KBX), Indonesia'),
SearchItem(65 ,'KCD	Kamur Airport (KCD)	Kamur	Kamur (KCD), Indonesia'),
SearchItem(66 ,'KWB	Karimunjawa Airport (KWB)	Karimunjawa	Karimunjawa (KWB), Indonesia'),
SearchItem(67 ,'KBF	Karubaga Airport (KBF)	Karubaga	Karubaga (KBF), Indonesia'),
SearchItem(68 ,'KAZ	Kau Airport (KAZ)	Kau	Kau (KAZ), Indonesia'),
SearchItem(69 ,'KEQ	Kebar Airport (KEQ)	Kebar	Kebar (KEQ), Indonesia'),
SearchItem(70 ,'KEA	Keisah Airport (KEA)	Keisah	Keisah (KEA), Indonesia'),
SearchItem(71 ,'LLN	Kelila Airport (LLN)	Kelila	Kelila (LLN), Indonesia'),
SearchItem(72 ,'KLQ	Keluang Airport (KLQ)	Keluang	Keluang (KLQ), Indonesia'),
SearchItem(73 ,'KDI	Wolter Monginsidi Airport (KDI)	Kendari	Kendari (KDI), Indonesia'),
SearchItem(74 ,'KEI	Kepi Airport (KEI)	Kepi	Kepi (KEI), Indonesia'),
SearchItem(75 ,'KRC	Kerinci Airport (KRC)	Kerinci	Kerinci (KRC), Indonesia'),
SearchItem(76 ,'KTG	Ketapang Airport (KTG)	Ketapang	Ketapang (KTG), Indonesia'),
SearchItem(77 ,'KMM	Kimam Airport (KMM)	Kimam	Kimam (KMM), Indonesia'),
SearchItem(78 ,'KOX	Kokonao Airport (KOX)	Kokonao	Kokonao (KOX), Indonesia'),
SearchItem(79 ,'KCI	Kon Airport (KCI)	Kon	Kon (KCI), Indonesia'),
SearchItem(80 ,'KOD	Kotabangun Airport (KOD)	Kotabangun	Kotabangun (KOD), Indonesia'),
SearchItem(81 ,'KBU	Kotabaru Airport (KBU)	Kotabaru	Kotabaru (KBU), Indonesia'),
SearchItem(82 ,'KOE	Eltari Airport (KOE)	Kupang	Kupang (KOE), Indonesia'),
SearchItem(83 ,'LBJ	Mutiara Airport (LBJ)	Labuan Bajo	Labuan Bajo (LBJ), Indonesia'),
SearchItem(84 ,'LAH	Labuha Airport (LAH)	Labuha	Labuha (LAH), Indonesia'),
SearchItem(85 ,'LUV	Langgur Airport (LUV)	Langgur	Langgur (LUV), Indonesia'),
SearchItem(86 ,'LKA	Larantuka Airport (LKA)	Larantuka	Larantuka (LKA), Indonesia'),
SearchItem(87 ,'LHI	Lereh Airport (LHI)	Lereh	Lereh (LHI), Indonesia'),
SearchItem(88 ,'LWE	Lewoleba Airport (LWE)	Lewoleba	Lewoleba (LWE), Indonesia'),
SearchItem(89 ,'LSX	Lhok Sukon Airport (LSX)	Lhok Sukon	Lhok Sukon (LSX), Indonesia'),
SearchItem(90 ,'LSW	Lhoksumawe Airport (LSW)	Lhoksumawe	Lhoksumawe (LSW), Indonesia'),
SearchItem(91 ,'LPU	Long Apung Airport (LPU)	Long Apung	Long Apung (LPU), Indonesia'),
SearchItem(92 ,'LBW	Long Bawan Airport (LBW)	Long Bawan	Long Bawan (LBW), Indonesia'),
SearchItem(93 ,'LYK	Lunyuk Airport (LYK)	Lunyuk	Lunyuk (LYK), Indonesia'),
SearchItem(94 ,'LUW	Luwuk Airport (LUW)	Luwuk	Luwuk (LUW), Indonesia'),
SearchItem(95 ,'MLG	Abdul Rahman Saleh Airport (MLG)	Malang	Malang (MLG), Indonesia'),
SearchItem(96 ,'MPT	Maliana Airport (MPT)	Maliana	Maliana (MPT), Indonesia'),
SearchItem(97 ,'MJU	Mamuju Airport (MJU)	Mamuju	Mamuju (MJU), Indonesia'),
SearchItem(98 ,'MDC	Samratulangi Airport (MDC)	Manado	Manado (MDC), Indonesia'),
SearchItem(99 ,'MAL	Mangole Airport (MAL)	Mangole	Mangole (MAL), Indonesia'),
SearchItem(100,'MJY	Mangunjaya Airport (MJY)	Mangunjaya	Mangunjaya (MJY), Indonesia'),
SearchItem(101,'MKW	Rendani Airport (MKW)	Manokwari	Manokwari (MKW), Indonesia'),
SearchItem(102,'MSI	Masalembo Airport (MSI)	Masalembo	Masalembo (MSI), Indonesia'),
SearchItem(103,'MXB	Masamba Airport (MXB)	Masamba	Masamba (MXB), Indonesia'),
SearchItem(104,'MWK	Matak Airport (MWK)	Matak	Matak (MWK), Indonesia'),
SearchItem(105,'AMI	Selaparang Airport (AMI)	Mataram	Mataram (AMI), Indonesia'),
SearchItem(106,'MOF	Waioti Airport (MOF)	Maumere	Maumere (MOF), Indonesia'),
SearchItem(107,'KNO	Kualanamu International Airport (KNO)	Medan	Medan (KNO), Indonesia'),
SearchItem(108,'MNA	Melangguane Airport (MNA)	Melangguane	Melangguane (MNA), Indonesia'),
SearchItem(109,'MKQ	Mopah Airport (MKQ)	Merauke	Merauke (MKQ), Indonesia'),
SearchItem(110,'RDE	Merdey Airport (RDE)	Merdey	Merdey (RDE), Indonesia'),
SearchItem(111,'MEQ	Seunagan Airport (MEQ)	Meulaboh	Meulaboh (MEQ), Indonesia'),
SearchItem(112,'MDP	Mindiptana Airport (MDP)	Mindiptana	Mindiptana (MDP), Indonesia'),
SearchItem(113,'ONI	Moanamani Airport (ONI)	Moanamani	Moanamani (ONI), Indonesia'),
SearchItem(114,'OTI	Morotai Island Airport (OTI)	Pitu, Morotai Island	Pitu, Morotai Island (OTI), Indonesia'),
SearchItem(115,'MPC	Muko-Muko Airport (MPC)	Muko-Muko	Muko-Muko (MPC), Indonesia'),
SearchItem(116,'LII	Mulia Airport (LII)	Mulia	Mulia (LII), Indonesia'),
SearchItem(117,'MUF	Muting Airport (MUF)	Muting	Muting (MUF), Indonesia'),
SearchItem(118,'NBX	Nabire Airport (NBX)	Nabire	Nabire (NBX), Indonesia'),
SearchItem(119,'NAH	Naha Airport (NAH)	Naha	Naha (NAH), Indonesia'),
SearchItem(120,'NAM	Namlea Airport (NAM)	Namlea	Namlea (NAM), Indonesia'),
SearchItem(121,'NRE	Namrole Airport (NRE)	Namrole	Namrole (NRE), Indonesia'),
SearchItem(122,'NPO	Nangapinoh Airport (NPO)	Nangapinoh	Nangapinoh (NPO), Indonesia'),
SearchItem(123,'NTX	Natuna Ranai Airport (NTX)	Natuna Ranai	Natuna Ranai (NTX), Indonesia'),
SearchItem(124,'FOO	Numfoor Airport (FOO)	Numfoor	Numfoor (FOO), Indonesia'),
SearchItem(125,'NNX	Nunukan Airport (NNX)	Nunukan	Nunukan (NNX), Indonesia'),
SearchItem(126,'OBD	Obano Airport (OBD)	Obano	Obano (OBD), Indonesia'),
SearchItem(127,'OEC	Ocussi Airport (OEC)	Ocussi	Ocussi (OEC), Indonesia'),
SearchItem(128,'OKQ	Okaba Airport (OKQ)	Okaba	Okaba (OKQ), Indonesia'),
SearchItem(129,'OKL	Oksibil Airport (OKL)	Oksibil	Oksibil (OKL), Indonesia'),
SearchItem(130,'PDG	Minangkabau International Airport Airport (PDG)	Padang	Padang (PDG), Indonesia'),
SearchItem(131,'PKY	Palangkaraya Airport (PKY)	Palangkaraya	Palangkaraya (PKY), Indonesia'),
SearchItem(132,'PLM	Mahmud Badaruddin II International Airport (PLM)	Palembang	Palembang (PLM), Indonesia'),
SearchItem(133,'PBW	Palibelo Airport (PBW)	Palibelo	Palibelo (PBW), Indonesia'),
SearchItem(134,'PLW	Mutiara Airport (PLW)	Palu	Palu (PLW), Indonesia'),
SearchItem(135,'PKN	Pangkalanbuun Airport (PKN)	Pangkalanbuun	Pangkalanbuun (PKN), Indonesia'),
SearchItem(136,'PGK	Pangkalpinang Airport (PGK)	Pangkalpinang	Pangkalpinang (PGK), Indonesia'),
SearchItem(137,'PPR	Pasir Pangarayan Airport (PPR)	Pasir Pangarayan	Pasir Pangarayan (PPR), Indonesia'),
SearchItem(138,'PKU	Sultan Syarif Kasim II International Airport (PKU)	Pekanbaru	Pekanbaru (PKU), Indonesia'),
SearchItem(139,'PDO	Pendopo Airport (PDO)	Pendopo	Pendopo (PDO), Indonesia'),
SearchItem(140,'PUM	Pomala Airport (PUM)	Pomala	Pomala (PUM), Indonesia'),
SearchItem(141,'PCB	Pondok Cabe Airport (PCB)	Pondok Cabe	Pondok Cabe (PCB), Indonesia'),
SearchItem(142,'PNK	Supadio International Airport (PNK)	Pontianak	Pontianak (PNK), Indonesia'),
SearchItem(143,'PSJ	Poso Airport (PSJ)	Poso	Poso (PSJ), Indonesia'),
SearchItem(144,'PPJ	Pulau Panjang Airport (PPJ)	Pulau Panjang	Pulau Panjang (PPJ), Indonesia'),
SearchItem(145,'PWL	Purwokerto Airport (PWL)	Purwokerto	Purwokerto (PWL), Indonesia'),
SearchItem(146,'PSU	Putussibau Airport (PSU)	Putussibau	Putussibau (PSU), Indonesia'),
SearchItem(147,'RAQ	Sugimanuru Airport (RAQ)	Raha	Raha (RAQ), Indonesia'),
SearchItem(148,'RSK	Ransiki Airport (RSK)	Ransiki	Ransiki (RSK), Indonesia'),
SearchItem(149,'RGT	Japura Airport (RGT)	Rengat	Rengat (RGT), Indonesia'),
SearchItem(150,'RKI	Rokot Airport (RKI)	Rokot	Rokot (RKI), Indonesia'),
SearchItem(151,'RTI	Roti Airport (RTI)	Roti	Roti (RTI), Indonesia'),
SearchItem(152,'RTG	Ruteng Airport (RTG)	Ruteng	Ruteng (RTG), Indonesia'),
SearchItem(153,'SBG	Narita Airport (SBG)	Sabang	Sabang (SBG), Indonesia'),
SearchItem(154,'SRI	Samarinda Airport (SRI)	Samarinda	Samarinda (SRI), Indonesia'),
SearchItem(155,'SMQ	Sampit Airport (SMQ)	Sampit	Sampit (SMQ), Indonesia'),
SearchItem(156,'SQN	Sanana Airport (SQN)	Sanana	Sanana (SQN), Indonesia'),
SearchItem(157,'SGQ	Sanggata Airport (SGQ)	Sanggata	Sanggata (SGQ), Indonesia'),
SearchItem(158,'SAE	Sangir Airport (SAE)	Sangir	Sangir (SAE), Indonesia'),
SearchItem(159,'ZRM	Sarmi Airport (ZRM)	Sarmi	Sarmi (ZRM), Indonesia'),
SearchItem(160,'SXK	Saumlaki Airport (SXK)	Saumlaki	Saumlaki (SXK), Indonesia'),
SearchItem(161,'SAU	Sawu Airport (SAU)	Sawu	Sawu (SAU), Indonesia'),
SearchItem(162,'SRG	Achmad Yani International Airport (SRG)	Semarang	Semarang (SRG), Indonesia'),
SearchItem(163,'SEH	Senggeh Airport (SEH)	Senggeh	Senggeh (SEH), Indonesia'),
SearchItem(164,'ZEG	Senggo Airport (ZEG)	Senggo	Senggo (ZEG), Indonesia'),
SearchItem(165,'SZH	Senipah Airport (SZH)	Senipah	Senipah (SZH), Indonesia'),
SearchItem(166,'ZRI	Serui Airport (ZRI)	Serui	Serui (ZRI), Indonesia'),
SearchItem(167,'SIW	Sibisa Airport (SIW)	Sibisa	Sibisa (SIW), Indonesia'),
SearchItem(168,'NKD	Sinak Airport (NKD)	Sinak	Sinak (NKD), Indonesia'),
SearchItem(169,'SIQ	Dabo Airport (SIQ)	Singkep	Singkep (SIQ), Indonesia'),
SearchItem(170,'SQG	Sintang Airport (SQG)	Sintang	Sintang (SQG), Indonesia'),
SearchItem(171,'RKO	Sipora Airport (RKO)	Sipora	Sipora (RKO), Indonesia'),
SearchItem(172,'SOC	Adi Sumarmo International Airport (SOC)	Solo City	Solo City (SOC), Indonesia'),
SearchItem(173,'SQR	Soroako Airport (SQR)	Soroako	Soroako (SQR), Indonesia'),
SearchItem(174,'SOQ	Jefman Airport (SOQ)	Sorong	Sorong (SOQ), Indonesia'),
SearchItem(175,'ZKL	Steenkool Airport (ZKL)	Steenkool	Steenkool (ZKL), Indonesia'),
SearchItem(176,'UAI	Suai Airport (UAI)	Suai	Suai (UAI), Indonesia'),
SearchItem(177,'SWQ	Brang Bidji Airport (SWQ)	Sumbawa	Sumbawa (SWQ), Indonesia'),
SearchItem(178,'SUP	Trunojoyo Airport (SUP)	Sumenep	Sumenep (SUP), Indonesia'),
SearchItem(179,'SEQ	Sungai Pakning Airport (SEQ)	Sungai Pakning	Sungai Pakning (SEQ), Indonesia'),
SearchItem(180,'SUB	Juanda International Airport (SUB)	Surabaya	Surabaya (SUB), Indonesia'),
SearchItem(181,'TAX	Taliabu Airport (TAX)	Taliabu	Taliabu (TAX), Indonesia'),
SearchItem(182,'TMC	Tjilik Riwut Airport (TMC)	Tambolaka	Tambolaka (TMC), Indonesia'),
SearchItem(183,'TTR	Tana Toraja Airport (TTR)	Tana Toraja	Tana Toraja (TTR), Indonesia'),
SearchItem(184,'TNB	Tanah Grogot Airport (TNB)	Tanah Grogot	Tanah Grogot (TNB), Indonesia'),
SearchItem(185,'TMH	Tanahmerah Airport (TMH)	Tanahmerah	Tanahmerah (TMH), Indonesia'),
SearchItem(186,'TJB	Tanjung Balai Airport (TJB)	Tanjung Balai	Tanjung Balai (TJB), Indonesia'),
SearchItem(187,'TJQ	H.A.S. Hanandjoeddin International Airport (TJQ)	Tanjung Pandan	Tanjung Pandan (TJQ), Indonesia'),
SearchItem(188,'TNJ	Raja Haji Fisabilillah International Airport (TNJ)	Tanjung Pinang	Tanjung Pinang (TNJ), Indonesia'),
SearchItem(189,'TSX	Tanjung Santan Airport (TSX)	Tanjung Santan	Tanjung Santan (TSX), Indonesia'),
SearchItem(190,'TJS	Tanjung Selor Airport (TJS)	Tanjung Selor	Tanjung Selor (TJS), Indonesia'),
SearchItem(191,'TJG	Tanjung Warukin Airport (TJG)	Tanjung Warukin	Tanjung Warukin (TJG), Indonesia'),
SearchItem(192,'TPK	Tapaktuan Airport (TPK)	Tapaktuan	Tapaktuan (TPK), Indonesia'),
SearchItem(193,'TRK	Tarakan International Airport (TRK)	Tarakan	Tarakan (TRK), Indonesia'),
SearchItem(194,'TSY	Tasikmalaya Airport (TSY)	Tasikmalaya	Tasikmalaya (TSY), Indonesia'),
SearchItem(195,'TIM	Timika Airport (TIM)	Tembagapura	Tembagapura (TIM), Indonesia'),
SearchItem(196,'TXM	Teminabuan Airport (TXM)	Teminabuan	Teminabuan (TXM), Indonesia'),
SearchItem(197,'TTE	Babullah Airport (TTE)	Ternate	Ternate (TTE), Indonesia'),
SearchItem(198,'TMY	Tiom Airport (TMY)	Tiom	Tiom (TMY), Indonesia'),
SearchItem(199,'TLI	Tolitoli Airport (TLI)	Tolitoli	Tolitoli (TLI), Indonesia'),
SearchItem(200,'TBM	Tumbang Samba Airport (TBM)	Tumbang Samba	Tumbang Samba (TBM), Indonesia'),
SearchItem(201,'UBR	Ubrub Airport (UBR)	Ubrub	Ubrub (UBR), Indonesia'),
SearchItem(202,'UPG	Hasanudin Airport (UPG)	Ujung Pandang	Ujung Pandang (UPG), Indonesia'),
SearchItem(203,'VIQ	Viqueque Airport (VIQ)	Viqueque	Viqueque (VIQ), Indonesia'),
SearchItem(204,'WET	Wagethe Airport (WET)	Wagethe	Wagethe (WET), Indonesia'),
SearchItem(205,'WGP	Waingapu Airport (WGP)	Waingapu	Waingapu (WGP), Indonesia'),
SearchItem(206,'WMX	Wamena Airport (WMX)	Wamena	Wamena (WMX), Indonesia'),
SearchItem(207,'WAR	Waris Airport (WAR)	Waris	Waris (WAR), Indonesia'),
SearchItem(208,'WSR	Wasior Airport (WSR)	Wasior	Wasior (WSR), Indonesia'),
SearchItem(209,'JOG	Adisutjipto International Airport (JOG)	Yogyakarta	Yogyakarta (JOG), Indonesia'),
SearchItem(210,'RUF	Yuruf Airport (RUF)	Yuruf	Yuruf (RUF), Indonesia'),
SearchItem(211,'UGU	Zugapa Airport (UGU)	Zugapa	Zugapa (UGU), Indonesia'),
];
TextEditingController departure_date = TextEditingController();
TextEditingController return_date = TextEditingController();
String type_of_bantek;
int fromdeparture,todeparture;
class FormBantek extends StatefulWidget {
  static String tag = 'FormBantek-page';
  @override
  _FormBantekState createState() => new _FormBantekState();
}

class _FormBantekState extends State<FormBantek> {
  
  // List<SearchItem<int>> searchpanel;
  var content;
  String dropdownValue;
  final format = DateFormat("yyyy-MM-dd");
  List data = List(); //edited line
  final String url_airport=Bantek.url_airport;
  Future getdata() async {
    var response = await http.get(Uri.encodeFull(url_airport), headers: { 'accept':'application/json' });
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    content = json.decode(response.body);
    print(content.length);
    setState(() {
      // searchpanel.addAll(content);
    });
  }
  @override
  void initState() {
    super.initState();   
    this.getdata();  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,title: Text("Form Bantek")),
      body:Center(
        child: Form(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              FlutterSearchPanel<int>(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                // selected: 3,
                title: 'From',
                data: searchpanel,
                icon: new Icon(Icons.check_circle, color: Colors.white),
                color: Colors.blue,
                textStyle: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0, decorationStyle: TextDecorationStyle.dotted),
                onChanged: (int value) {
                  fromdeparture=value;
                  print(value);
                },
              ),
              SizedBox(height: 20.0),
              FlutterSearchPanel<int>(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                title: 'To',
                data: searchpanel,
                icon: new Icon(Icons.check_circle, color: Colors.white),
                color: Colors.blue,
                textStyle: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0, decorationStyle: TextDecorationStyle.dotted),
                onChanged: (int value) {
                  todeparture=value;
                  print(value);
                },
              ),
              SizedBox(height: 20.0),
              DateTimeField(
                controller: departure_date,
                decoration: InputDecoration(
                  hintText: 'Departure Date',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
                format: format,                
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                },
              ),
              SizedBox(height: 20.0),
              DateTimeField(                
                controller: return_date,
                decoration: InputDecoration(                  
                  hintText: 'Return Date',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
                format: format,                
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                },
              ),
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                border: Border.all(color: Colors.grey)
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(                  
                value: dropdownValue,
                hint: Text("Type of Bantek EOB/DETASERING"),   
                isExpanded: false, 
                items: <String>['EOB', 'DETASERING'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (String value) {
                  type_of_bantek=value;
                   setState(() {
                  dropdownValue = value;
                });
                },
              ),
                ),
              ),              
              SizedBox(height: 48.0),
              RaisedButton(
                onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String name=prefs.getString('name');
          String id = prefs.getString('id');
          String division = prefs.getString('division');
          print('id ${id}');
          print('name ${name}');
          print('division ${division}');
          print('departure_date ${departure_date.text}');
          print('return_date ${return_date.text}');
          print('from ${fromdeparture}');
          print('to ${todeparture}');
          print('type_of_bantek ${type_of_bantek}');
          http.post(Bantek.url_submit_form, body: {
            'id': id, 
            'name': name,
            'division': division,
            'departure_date': departure_date.text,
            'return_date': return_date.text,
            'from':fromdeparture.toString(),
            'to':todeparture.toString(),
            'type_of_bantek':type_of_bantek,
                  }).then((res) {
                    print(res.statusCode);
                    print(res.body);
					return showDialog(context: context,builder: (context) {return AlertDialog(content: Text("Input Success"),);},);
					//Bantek.goToHomeUser(context);
                  }).catchError((err) {
                    print(err);
                  });
			
     
                },
                child: Text('SUBMIT DATA'),
              )
            ],
          ),
        ),
      )
    );
  }
}