--[[
---------------------------------------------------
LUXART VEHICLE CONTROL V3 (FOR FIVEM)
---------------------------------------------------
Coded by Lt.Caine
ELS Clicks by Faction
Additions by TrevorBarns
---------------------------------------------------
FILE: SIRENS.lua
PURPOSE: Associate specific sirens with specific
vehicles. Siren assignments. 
---------------------------------------------------
SIREN TONE TABLE: 
	ID- Generic Name	(SIREN STRING)									[vehicles.awc name]
	1 - Airhorn 		(SIRENS_AIRHORN)								[AIRHORN_EQD]
	2 - Wail 			(VEHICLES_HORNS_SIREN_1)						[SIREN_PA20A_WAIL]
	3 - Yelp 			(VEHICLES_HORNS_SIREN_2)						[SIREN_2]
	4 - Priority 		(VEHICLES_HORNS_POLICE_WARNING)					[POLICE_WARNING]
	5 - CustomA* 		(RESIDENT_VEHICLES_SIREN_WAIL_01)				[SIREN_WAIL_01]
	6 - CustomB* 		(RESIDENT_VEHICLES_SIREN_WAIL_02)				[SIREN_WAIL_02]
	7 - CustomC* 		(RESIDENT_VEHICLES_SIREN_WAIL_03)				[SIREN_WAIL_03]
	8 - CustomD* 		(RESIDENT_VEHICLES_SIREN_QUICK_01)				[SIREN_QUICK_01]
	9 - CustomE* 		(RESIDENT_VEHICLES_SIREN_QUICK_02)				[SIREN_QUICK_02]
	10 - CustomF* 		(RESIDENT_VEHICLES_SIREN_QUICK_03)				[SIREN_QUICK_03]
	11 - Powercall 		(VEHICLES_HORNS_AMBULANCE_WARNING)				[AMBULANCE_WARNING]
	12 - FireHorn	 	(VEHICLES_HORNS_FIRETRUCK_WARNING)				[FIRE_TRUCK_HORN]
	13 - Firesiren 		(RESIDENT_VEHICLES_SIREN_FIRETRUCK_WAIL_01)		[SIREN_FIRETRUCK_WAIL_01]
	14 - Firesiren2 	(RESIDENT_VEHICLES_SIREN_FIRETRUCK_QUICK_01)	[SIREN_FIRETRUCK_QUICK_01]
]]
-- CHANGE SIREN NAMES, AUDIONAME, AUDIOREF
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_LSPD_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_LSSD_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_BCSO_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_SAHP_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_FIB_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_LSFD_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_LSFD_OLD', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_BCFD_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_BCFD_OLD', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_LSCOFD_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_LSCOFD_OLD', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_USSS_NEW', false)

-- CHANGE SIREN NAMES, AUDIONAME, AUDIOREF
SIRENS = {
	--[[1]]   { Name = 'Airhorn',       String = 'SIRENS_AIRHORN',                              Ref = 0 },
	--[[2]]   { Name = 'Wail',          String = 'VEHICLES_HORNS_SIREN_1',                      Ref = 0 },
	--[[3]]   { Name = 'Yelp',          String = 'VEHICLES_HORNS_SIREN_2',                      Ref = 0 },
	--[[4]]   { Name = 'Priority',      String = 'VEHICLES_HORNS_POLICE_WARNING',               Ref = 0 },
	--[[5]]   { Name = 'CustomA',  		String = 'RESIDENT_VEHICLES_SIREN_WAIL_01',             Ref = 0 },
	--[[6]]   { Name = 'CustomB',       String = 'RESIDENT_VEHICLES_SIREN_WAIL_02',             Ref = 0 },
	--[[7]]   { Name = 'CustomA',    	String = 'RESIDENT_VEHICLES_SIREN_WAIL_03',             Ref = 0 },
	--[[8]]   { Name = 'CustomA',    	String = 'RESIDENT_VEHICLES_SIREN_QUICK_01',            Ref = 0 },
	--[[9]]   { Name = 'CustomA',    	String = 'RESIDENT_VEHICLES_SIREN_QUICK_02',            Ref = 0 },
	--[[10]]  { Name = 'CustomA',    	String = 'RESIDENT_VEHICLES_SIREN_QUICK_03',            Ref = 0 },
	--[[11]]  { Name = 'CustomA',    	String = 'VEHICLES_HORNS_AMBULANCE_WARNING',            Ref = 0 },
	--[[12]]  { Name = 'FireHorn',      String = 'VEHICLES_HORNS_FIRETRUCK_WARNING',            Ref = 0 },
	--[[13]]  { Name = 'Fire Yelp',     String = 'RESIDENT_VEHICLES_SIREN_FIRETRUCK_WAIL_01',   Ref = 0 },
	--[[14]]  { Name = 'Fire Yelp',     String = 'RESIDENT_VEHICLES_SIREN_FIRETRUCK_QUICK_01',  Ref = 0 },
	
	---------------------------------------------------------------------------------------------------------
	 
	-- LSPD -- Federal Signal SS2000
	
	--[[15]]  { Name = 'FSS-HORN',         String = 'OISS_SSA_VEHAUD_LSPD_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET'},
	--[[16]]  { Name = 'FSS-WAIL',         String = 'OISS_SSA_VEHAUD_LSPD_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET'},
	--[[17]]  { Name = 'FSS-YELP',         String = 'OISS_SSA_VEHAUD_LSPD_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET'},
	--[[18]]  { Name = 'FSS-PRIORITY',     String = 'OISS_SSA_VEHAUD_LSPD_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET'},
	--[[19]]  { Name = 'NO',               String = 'OISS_SSA_VEHAUD_LSPD_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET'},
	--[[20]]  { Name = 'NO',               String = 'OISS_SSA_VEHAUD_LSPD_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET',   Option = 3},
	
	-- LSSD --
	
	--[[21]]  { Name = 'FS-HORN',          String = 'OISS_SSA_VEHAUD_LSSD_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET'},
	--[[22]]  { Name = 'FS-WAIL',          String = 'OISS_SSA_VEHAUD_LSSD_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET'},
	--[[23]]  { Name = 'FS-YELP',          String = 'OISS_SSA_VEHAUD_LSSD_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET'},
	--[[24]]  { Name = 'FS-PRIORITY',      String = 'OISS_SSA_VEHAUD_LSSD_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET'},
	--[[25]]  { Name = 'NO',               String = 'OISS_SSA_VEHAUD_LSSD_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET',   Option = 3},
	--[[26]]  { Name = 'NO',               String = 'OISS_SSA_VEHAUD_LSSD_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET'},
	
	-- SAMS --
	
	--[[27]]  { Name = 'TMD-HORN',         String = 'OISS_SSA_VEHAUD_BCFD_OLD_HORN',             Ref = 'OISS_SSA_VEHAUD_BCFD_OLD_SOUNDSET'},
	--[[28]]  { Name = 'TMD-WAIL',         String = 'OISS_SSA_VEHAUD_BCFD_OLD_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_BCFD_OLD_SOUNDSET'},
	--[[29]]  { Name = 'TMD-YELP',         String = 'OISS_SSA_VEHAUD_BCFD_OLD_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_BCFD_OLD_SOUNDSET'},
	--[[30]]  { Name = 'TMD-HETRO',        String = 'OISS_SSA_VEHAUD_BCFD_OLD_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_BCFD_OLD_SOUNDSET'},
	--[[31]]  { Name = 'TMD-SWEEP',        String = 'OISS_SSA_VEHAUD_BCFD_OLD_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_BCFD_OLD_SOUNDSET'},
	--[[32]]  { Name = 'TMD-ULTRA HI-LO',  String = 'OISS_SSA_VEHAUD_BCFD_OLD_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_BCFD_OLD_SOUNDSET',   Option = 3},
	
	-- SAHP -- Whelen
	
	--[[33]]  { Name = 'WHL-HORN',         String = 'OISS_SSA_VEHAUD_SAHP_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET'},
	--[[34]]  { Name = 'WHL-WAIL',         String = 'OISS_SSA_VEHAUD_SAHP_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET'},
	--[[35]]  { Name = 'WHL-YELP',         String = 'OISS_SSA_VEHAUD_SAHP_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET'},
	--[[36]]  { Name = 'NO',               String = 'OISS_SSA_VEHAUD_SAHP_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET'},
	--[[37]]  { Name = 'NO',               String = 'OISS_SSA_VEHAUD_SAHP_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET'},
	--[[38]]  { Name = 'NO',               String = 'OISS_SSA_VEHAUD_SAHP_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET',   Option = 3},
	
	-- VHLs OLD -- Omega unitrol
	
	--[[39]]  { Name = 'OMEGA-HORN',       String = 'OISS_SSA_VEHAUD_FIB_NEW_HORN',              Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'}, 
	--[[40]]  { Name = 'OMEGA-WAIL',       String = 'OISS_SSA_VEHAUD_FIB_NEW_SIREN_ADAM',        Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'},
	--[[41]]  { Name = 'OMEGA-YELP',       String = 'OISS_SSA_VEHAUD_FIB_NEW_SIREN_BOY',         Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'}, 
	--[[42]]  { Name = 'OMEGA-PRIORITY',   String = 'OISS_SSA_VEHAUD_FIB_NEW_SIREN_CHARLES',     Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'}, 
	--[[43]]  { Name = 'NO',               String = 'OISS_SSA_VEHAUD_FIB_NEW_SIREN_DAVID',       Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'}, 
	--[[44]]  { Name = 'NO',               String = 'OISS_SSA_VEHAUD_FIB_NEW_SIREN_EDWARD',      Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'},
	
	-- Sirens motos --
	
	--[[45]]  { Name = 'WHL-HORN',         String = 'OISS_SSA_VEHAUD_LSFD_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_LSFD_NEW_SOUNDSET'},
	--[[46]]  { Name = 'WHL-WAIL',         String = 'OISS_SSA_VEHAUD_LSFD_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_LSFD_NEW_SOUNDSET'},
	--[[47]]  { Name = 'WHL-YELP',         String = 'OISS_SSA_VEHAUD_LSFD_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_LSFD_NEW_SOUNDSET'},
	--[[48]]  { Name = 'WHL-PRIORITY',     String = 'OISS_SSA_VEHAUD_LSFD_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_LSFD_NEW_SOUNDSET'},
	--[[49]]  { Name = 'NO',               String = 'OISS_SSA_VEHAUD_LSFD_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_LSFD_NEW_SOUNDSET'},
	--[[50]]  { Name = 'NO',               String = 'OISS_SSA_VEHAUD_LSFD_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_LSFD_NEW_SOUNDSET'},
	
	-- USSS --
	
	--[[51]]  { Name = 'CECOM HORN',       String = 'OISS_SSA_VEHAUD_USSS_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_USSS_NEW_SOUNDSET'},
	--[[52]]  { Name = 'CECOM WAIL',       String = 'OISS_SSA_VEHAUD_USSS_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_USSS_NEW_SOUNDSET'},
	--[[53]]  { Name = 'CECOM YELP',       String = 'OISS_SSA_VEHAUD_USSS_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_USSS_NEW_SOUNDSET'},
	--[[54]]  { Name = 'CECOM PRIO',       String = 'OISS_SSA_VEHAUD_USSS_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_USSS_NEW_SOUNDSET'},
	
	-- LSFD --
	
	--[[55]]  { Name = 'RANDOM',           String = 'OISS_SSA_VEHAUD_LSFD_OLD_HORN',             Ref = 'OISS_SSA_VEHAUD_LSFD_OLD_SOUNDSET'},
	--[[56]]  { Name = 'WAIL',             String = 'OISS_SSA_VEHAUD_LSFD_OLD_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_LSFD_OLD_SOUNDSET'},
	--[[57]]  { Name = 'YELP',             String = 'OISS_SSA_VEHAUD_LSFD_OLD_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_LSFD_OLD_SOUNDSET'},
	
	-- LSFD AMBULANCE --
	
	--[[58]]  { Name = 'HORN',             String = 'OISS_SSA_VEHAUD_BCFD_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_BCFD_NEW_SOUNDSET'},
	--[[59]]  { Name = 'WAIL',             String = 'OISS_SSA_VEHAUD_BCFD_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_BCFD_NEW_SOUNDSET'},
	--[[60]]  { Name = 'YELP',             String = 'OISS_SSA_VEHAUD_BCFD_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_BCFD_NEW_SOUNDSET'},
	
	
	}

--ASSIGN SIRENS TO VEHICLES
SIREN_ASSIGNMENTS = {
	--['<gameName>'] = {tones},
	['DEFAULT'] = { 1, 2, 3, 4 },
	['FIRETRUK'] = { 55, 56, 57 },
	['AMBULAN'] = { 28, 29 },
	['LGUARD'] = { 1, 2, 3, 4, 11 },

	-- Outro vehicles --
		--LSPD
	['LSPMOCPACK'] = { 15, 16, 17 },
	['LSPGRANG98'] = { 39, 40, 41, 42 },
	['LSPBUFF09'] = { 15, 16, 17 },
	['LSPBUFF09UM'] = { 15, 16, 17 },
	['LSPSTAN10'] = { 15, 16, 17 },
	['LSPSTAN10SL'] = { 15, 16, 17 },
	['LSPSTAN10UM'] = { 15, 16, 17 },
	['LSPALAMO13'] = { 15, 16, 17 },
	['LSPSCO13'] = { 15, 16, 17 },
	['LSPSCO13K9UM'] = { 15, 16, 17 },
	['LSPSCO13UM'] = { 15, 16, 17 },
	['LSPBUFF14'] = { 15, 16, 17 },
	['LSPBUFF14UM'] = { 15, 16, 17 },
	['LSPCENTURION'] = { 15, 16, 17 },
	['LSPSCO15BOMB'] = { 15, 16, 17 },
	['LSPSCO15K9'] = { 15, 16, 17 },
	['LSPYOS15BMB'] = { 15, 16, 17 },
	['LSPYOS15BMB2'] = { 15, 16, 17 },
	['LSPALAMO16K9'] = { 15, 16, 17 },
	['LSPGRANG16'] = { 15, 16, 17 },
	['LSPSCO16K9'] = { 15, 16, 17 },
	['LSPSCO16UM'] = { 15, 16, 17 },
	['LSPTORR16'] = { 15, 16, 17 },
	['LSPTORR16SL'] = { 15, 16, 17 },
	['LSPTORR16UM'] = { 15, 16, 17 },
	['LSPBUFF18UM'] = { 15, 16, 17 },
	['LSPSANDS20K9'] = { 15, 16, 17 },
	['LSPSCO20'] = { 15, 16, 17 },
	['LSPSCO20K9'] = { 15, 16, 17 },
	['LSPSCO20SL'] = { 15, 16, 17 },
	['LSPSCO20UM'] = { 15, 16, 17 },
	['POLICEB'] = { 45, 46, 47 },
	['NSCOUTPOL'] = { 15, 16, 17 },
	['LSPPIGEONP'] = { 15, 16, 17 },
	['PALAMOLD'] = { 39, 40, 41, 42 },
	['POLEVERON'] = { 15, 16, 17 },
	['POLICEOLD'] = { 39, 40, 41, 42 },
	['POLNSPEEDO'] = { 15, 16, 17 },
	['POLTHRUST'] = { 45, 46, 47 },
	['POLRAIDEN'] = { 15, 16, 17 },

		--LSSD
	['LSSDCENTU'] = { 21, 22, 23, 24 },
	['LSSD20SCOUT'] = { 21, 22, 23, 24 },
	['LSSDALAMOK9'] = { 21, 22, 23, 24 },
	['LSSDALAMO'] = { 21, 22, 23, 24 },
	['LSSDALEU'] = { 21, 22, 23, 24 },
	['LSSDBUFFSX'] = { 21, 22, 23, 24 },
	['LSSDCONT'] = { 21, 22, 23, 24 },
	['LSSDENDU'] = { 21, 22, 23, 24 },
	['LSSDFUG'] = { 21, 22, 23, 24 },
	['LSSDRUMPO'] = { 21, 22, 23, 24 },
	['LSSDSAR'] = { 39, 40, 41, 42 },
	['LSSDSCOUT1'] = { 21, 22, 23, 24 },
	['LSSDSCOUT16'] = { 21, 22, 23, 24 },
	['LSSDSCOUTUM'] = { 21, 22, 23, 24 },
	['LSSDSTAN'] = { 21, 22, 23, 24 },
	['LSSDSTANSL'] = { 21, 22, 23, 24 },
	['LSSDTHRUST'] = { 45, 46, 47 },
	['LSSDTORR'] = { 21, 22, 23, 24 },
	['LSSDUMK1'] = { 21, 22, 23, 24 },
	['LSSDUMK2'] = { 21, 22, 23, 24 },
	['LSSDUMK3'] = { 21, 22, 23, 24 },
	['LSSDUMK4'] = { 21, 22, 23, 24 },
	['LSDRAIDEN'] = { 21, 22, 23, 24 },

		--SAHP
	['NSCOUTSAHP'] = { 33, 34, 35 },
	['SAHP'] = { 33, 34, 35 },
	['SAHP3'] = { 33, 34, 35 },
	['SAHP6'] = { 33, 34, 35 },
	['SAHP20SCOUT'] = { 33, 34, 35 },
	['SAHPB'] = {  45, 46, 47 },
	['SAHPB2'] = {  45, 46, 47 },
	['SAHP2STX'] = { 33, 34, 35 },
	['SAHP2ASTX'] = { 33, 34, 35 },
	['SAHP2BSTX'] = { 33, 34, 35 },
	['SAHPBISON'] = { 33, 34, 35 },
	['SAHPALAMO2'] = { 33, 34, 35 },
	['SAHPSCO13UM'] = { 33, 34, 35 },
	['SAHPSCO16UM'] = { 33, 34, 35 },
	['SAHPYOSE'] = { 33, 34, 35 },

		--LSFD
	['BFDSUV'] = { 1, 59, 60 },
	['FDBUFF'] = { 1, 59, 60 },
	['FDSAND'] = { 1, 59, 60 },
	['LSFD2'] = { 1, 59, 60 },
	['LSFD3'] = { 1, 59, 60 },
	['LSFD5'] = { 1, 59, 60 },
	['LSFDCMD'] = { 1, 46, 47 },
	['LSFDTRUCK'] = { 1, 56, 57 },
	['LSFDTRUCK2'] = { 1, 56, 57 },
	['LSFDTRUCK3'] = { 1, 56, 57 },
	['MOCPACK2'] = { 1, 56, 57 },
	['LSFDLADDER'] = { 1, 56, 57 },

		--USSS
	['HALFBACK'] = { 39, 40, 41, 42 },
	['HAZARD'] = { 39, 40, 41, 42 },
	['INAUGURAL'] = { 39, 40, 41, 42 },
	['ROADRUNNER'] = { 39, 40, 41, 42 },
	['USSSFLAG'] = { 39, 40, 41, 42 },
	['USSSMINI2'] = { 39, 40, 41, 42 },
	['USSSSUV'] = { 39, 40, 41, 42 },
	['USSSVAN'] = { 39, 40, 41, 42 },
	['WATCHTOWER'] = { 39, 40, 41, 42 },
	['USSSMSU'] = { 39, 40, 41, 42 },
	['USSSALAMO'] = { 39, 40, 41, 42 },
	['USSSSANDST1'] = { 39, 40, 41, 42 },
	['USSSSCOUT20'] = { 39, 40, 41, 42 },
	['USSSSTAN'] = { 39, 40, 41, 42 },
	['USSSTORR1'] = { 39, 40, 41, 42 },
	['USSSSCOUT16'] = { 39, 40, 41, 42 },
	['USSSALAMO2'] = { 39, 40, 41, 42 },
	['USSSALEUTIAN'] = { 39, 40, 41, 42 },
	['USSSBUFF08'] = { 39, 40, 41, 42 },
	['USSSCATERING'] = { 39, 40, 41, 42 },
	['USSSEVERON'] = { 39, 40, 41, 42 },
	['USSSGRESLEY'] = { 39, 40, 41, 42 },
	['USSSJOGGER'] = { 39, 40, 41, 42 },
	['USSSSANDSTRM'] = { 39, 40, 41, 42 },
	['USSSSCOUTPS'] = { 39, 40, 41, 42 },
	['USSSSTX'] = { 39, 40, 41, 42 },
	['USSSTORR2'] = { 39, 40, 41, 42 },
	['USSSVIVA'] = { 39, 40, 41, 42 },
	['USSSYANK'] = { 39, 40, 41, 42 },

		--SAMS
	['DINGHYEMS'] = { 1, 2, 3, 4, 11 },
	['EMSBFSX'] = { 1, 28, 29 },
	['EMSCOMET'] = { 1, 28, 29 },
	['EMSNSPEEDO'] = { 1, 28, 29},
	['EMSSCOUT'] = { 1, 28, 29 },
	['EMSSEASHARK'] = { 1, 28, 29 },
	['EMSSUV'] = { 1, 28, 29 },
	['SAMSCARA'] = { 1, 28, 29 },
	['SANDBULANCE'] = { 1, 28, 29 },

	--FIB
	['FATTORRE'] = { 39, 40, 41, 42 },
	['FATBUFFALO'] = { 39, 40, 41, 42 },
	['FATSTALKER'] = { 39, 40, 41, 42 },
	['FATEVERON'] = { 39, 40, 41, 42 },
	['FIBP'] = { 39, 40, 41, 42 },
	['FIBP2'] = { 39, 40, 41, 42 },
	['FIBP3'] = { 39, 40, 41, 42 },
	['FIBP4'] = { 39, 40, 41, 42 },
	['FIBP5'] = { 39, 40, 41, 42 },
	['FIBP6'] = { 39, 40, 41, 42 },
	['FIBP7'] = { 39, 40, 41, 42 },
	['FIBP8'] = { 39, 40, 41, 42 },
	['GOVCAVAL3'] = { 39, 40, 41, 42 },
	['UMKCAVAL3'] = { 39, 40, 41, 42 },
	['FIBBUFSXUM'] = { 39, 40, 41, 42 },
	['fibbuffsumk'] = { 39, 40, 41, 42 },
	['FIBNSCOUT2'] = { 39, 40, 41, 42 },
	['FBI2'] = { 39, 40, 41, 42 },
}