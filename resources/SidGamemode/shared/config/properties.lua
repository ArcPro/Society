Config = Config or {}
Config.Properties = {

    -- ===============================
    -- =========== Houses ============
    -- ===============================

    ["michael_house"] = {
        position = { x = -815.8, y = 178.5, z = 72.15 - 0.95, w = 292.92 },
        storage = { x = -799.83, y = 177.27, z = 72.83 - 0.95 },
        name = "Maison de Michael",
        max_weight = 100,
        type = "house",
    },

    ["franklin_house"] = {
        position = { x = 7.93, y = 538.76, z = 176.03 - 0.95, w = 154.1 },
        storage = { x = -8.21, y = 522.51, z = 174.63 - 0.95 },
        name = "Maison de Franklin",
        max_weight = 100,
        type = "house",
    },

    ["franklin_aunt_house"] = {
        position = { x = -14.29, y = -1440.52, z = 31.1 - 0.95, w = 342.94 },
        storage = { x = -10.4, y = -1430.28, z = 31.1 - 0.95 },
        name = "Maison de Tante de Franklin",
        max_weight = 100,
        type = "house",
    },

	["gtao_house_hi_1"] = {
        position = { x = -174.27, y = 497.66, z = 137.67 - 0.95, w = 199.79 },
        storage = { x = -170.19, y = 495.86, z = 137.65 - 0.95 },
        name = "Maison de luxe 1",
        max_weight = 100,
        type = "house",
    },

    ["gtao_house_hi_2"] = {
        position = { x = 373.57, y = 423.55, z = 145.91 - 0.95, w = 171.35 },
        storage = { x = 375.30, y = 420.05, z = 145.91 - 0.95 },
        name = "Maison de luxe 2",
        max_weight = 100,
        type = "house",
    },

    ["gtao_house_mid_1"] = {
        position = { x = 346.5, y = -1012.91, z = -99.2 - 0.95, w = 0.77 },
        storage = { x = 345.1, y = -995.77, z = -99.2 - 0.95 },
        max_weight = 75,
        name = "Maison",
        type = "house",
    },

    ["gtao_house_low_1"] = {
        position = { x = 266.1, y = -1007.35, z = -101.01 - 0.95, w = 3.89 },
        storage = { x = 265.63, y = -999.44, z = -99.01 - 0.95 },
        name = "Petite maison",
        max_weight = 50,
        type = "house",
    },

	["gn_house_1"] = {
        name = "Maison 1",
        type = "house",
        position = { x = 1662.923096, y = 4739.235352, z = 1.292358 - 0.95, w = 107.716537 },
        storage = { x = 1658.953857, y = 4737.995605, z = 1.292358 - 0.95 },
        max_weight = 50,
    },

    ["gn_house_2"] = {
        name = "Maison 2",
        type = "house",
        position = { x = 1661.090088, y = 4776.079102, z = 1.258667 - 0.95, w = 93.543304 },
        storage = { x = 1659.059326, y = 4771.371582, z = 1.258667 - 0.95 },
        max_weight = 50,
    },

    ["gn_house_3"] = {
        name = "Maison 3",
        type = "house",
        position = { x = 1720.272583, y = 4676.821777, z = -0.375854 - 0.95, w = 269.291351 },
        storage = { x = 1731.362671, y = 4675.569336, z = -0.375854 - 0.95 },
        max_weight = 50,
    },

    ["gn_house_4"] = {
        name = "Maison 4",
        type = "house",
        position = { x = 1672.549438, y = 4658.202148, z = 1.578735 - 0.95, w = 90.708656 },
        storage = { x = 1666.641724, y = 4651.833008, z = 1.578735 - 0.95 },
        max_weight = 50,
    },

    ["gn_house_5"] = {
        name = "Maison 5",
        type = "house",
        position = { x = 1681.727417, y = 4689.573730, z = -1.251953 - 0.95, w = 90.708656 },
        storage = { x = 1674.514282, y = 4690.325195, z = -1.251953 - 0.95 },
        max_weight = 50,
    },

    -- ===============================
    -- ========= Apartments ==========
    -- ===============================

    ["floyd_house"] = {
        position = { x = -1150.7, y = -1520.9, z = 10.6 - 0.95, w = 46.31 },
        storage = { x = -1152.97, y = -1516.63, z = 10.6 - 0.95 },
        name = "Appartement de Floyd",
        type = "apartment",
        max_weight = 100,
    },

    --[[ ["trevor_trailer"] = {
        position = { x = 1973.06, y = 3816.17, z = 33.43 - 0.95, w = 34.3 },
        storage = { x = 1969.34, y = 3814.81, z = 33.43 - 0.95 },
        name = "Caravane de Trevor",
        type = "apartment",
        max_weight = 50,
    }, ]]

    ["gtao_apartment_hi"] = {
        position = { x = -1450.2, y = -525.59, z = 56.93 - 0.95, w = 37.04 },
        storage = { x = -1457.15, y = -529.91, z = 56.93 - 0.95 },
        name = "Appartement de luxe 1",
        type = "apartment",
        max_weight = 50,
    },

    ["hl_apartment"] = {
        position = { x = -1452.18, y = -540.66, z = 74.04 - 0.95, w = 34.61 },
        storage = { x = -1466.79, y = -528.14, z = 73.44 - 0.95 },
        name = "Appartement de luxe 2",
        type = "apartment",
        max_weight = 50,
    },

    ["exec_apartment_1"] = {
        position = { x = -787.29, y = 315.77, z = 217.64 - 0.95, w = 273.66 },
        storage = { x = -795.27, y = 326.36, z = 217.03 - 0.95 },
        name = "Appartement de luxe 3",
        type = "apartment",
        max_weight = 50,
    },

    ["exec_apartment_2"] = {
        position = { x = -773.79, y = 342.02, z = 196.69 - 0.95, w = 88.31 },
        storage = { x = -765.81, y = 331.45, z = 196.08 - 0.95 },
        name = "Appartement de luxe 4",
        type = "apartment",
        max_weight = 50,
    },

    ["exec_apartment_3"] = {
        position = { x = -787.21, y = 315.73, z = 187.91 - 0.95, w = 272.72 },
        storage = { x = -795.33, y = 326.34, z = 187.3 - 0.95 },
        name = "Appartement de luxe 5",
        type = "apartment",
        max_weight = 50,
    },

    ["diamond_casino"] = {
        position = { x = 969.49, y = 63.21, z = 112.56 - 0.95, w = 241.91 },
        storage = { x = 974.45, y = 65.69, z = 116.16 - 0.95 },
        name = "Penthouse du casino",
        type = "apartment",
        max_weight = 50,
    },

	["hotel_room_luxe"] = {
        position = { x = 94.417587, y = -924.698914, z = 31.992676 - 0.95, w = 158.740158 },
        storage = { x = 88.654953, y = -930.487915, z = 31.992676 - 0.95 },
        name = "Chambre hotel luxueuse",
        type = "apartment",
        max_weight = 50,
    },

    ["ob_trailers"] = {
        position = { x = 891.586792, y = 2854.153809, z = 57.031494 - 0.95, w = 223.937012 },
        storage = { x = 896.136292, y = 2857.978027, z = 56.980957 - 0.95 },
        name = "Caravane 3",
        type = "apartment",
        max_weight = 50,
    },

	["apt_wood_black"] = {
        name = "Petit appartement boisé sombre",
        type = "apartment",
        position = { x = -723.525757, y = 196.380447, z = 128.955215 - 0.95, w = 208.614090 },
        storage = { x = -727.987061, y = 192.048752, z = 128.938873 - 0.95 },
        max_weight = 50,
    },

	["apt_wood_brown"] = {
        position = { x = -1455.634399, y = -556.980652, z = 79.393776 - 0.95, w = 213.059967 },
        storage = { x = -1459.201050, y = -562.130188, z = 79.393921 - 0.95 },
        name = "Petit appartement boisé",
        type = "apartment",
        max_weight = 50,
    },

	["small_hotelroom"] = {
        position = { x = -295.660950, y = -811.344604, z = 85.180618 - 0.95, w = 338.002533 },
        storage = { x = -294.862274, y = -807.962708, z = 85.269287 - 0.95 },
        name = "Petite chambre d'hotel",
        type = "apartment",
        max_weight = 50,
    },

	-- ================================
	-- ============ Empty =============
	-- ================================

    ["empty_villa_1"] = {
        position = { x = -762.843933, y = 333.679108, z = 120.319458 - 0.95, w = 127.559052 },
        storage = { x = -784.035156, y = 325.806580, z = 118.904053 - 0.95 },
        name = "Villa vide 1",
        type = "empty",
        max_weight = 150,
    },

    ["empty_house_1"] = {
        position = { x = -66.540657, y = -1406.109863, z = 30.122314 - 0.95, w = 0.000000 },
        storage = { x = -62.769226, y = -1395.837402, z = 30.122314 - 0.95 },
        name = "Maison vide 1",
        type = "empty",
        max_weight = 100,
    },

    ["empty_house_2"] = {
        position = { x = -733.753845, y = 194.268127, z = 99.189697 - 0.95, w = 297.637787 },
        storage = { x = -721.753845, y = 202.193405, z = 99.644653 - 0.95 },
        name = "Maison vide 2",
        max_weight = 100,
        type = "empty",
    },

    ["empty_ranch_1"] = {
        position = { x = 1397.604370, y = 1141.424194, z = 95.381714 - 0.95, w = 274.960632 },
        storage = { x = 1399.318726, y = 1163.881348, z = 95.381714 - 0.95 },
        name = "Ranch vide 1",
        max_weight = 100,
        type = "empty",
    },

    ["empty_apt_luxe_1"] = {
        position = { x = -789.547241, y = 328.931854, z = 133.849854 - 0.95, w = 263.622070 },
        storage = { x = -784.021973, y = 330.817596, z = 133.849854 - 0.95 },
        name = "Appartement de luxe vide 1",
        max_weight = 50,
        type = "empty",
    },

    ["empty_apt_luxe_2"] = {
        position = { x = -786.606567, y = 331.450562, z = 146.706177 - 0.95, w = 263.622070 },
        storage = { x = -780.962646, y = 333.257141, z = 146.706177 - 0.95 },
        name = "Appartement de luxe vide 2",
        max_weight = 50,
        type = "empty",
    },

    ["empty_apt_luxe_3"] = {
        position = { x = -907.885742, y = -458.769226, z = 137.354614 - 0.95, w = 297.637787 },
        storage = { x = -898.562622, y = -440.083496, z = 135.956055 - 0.95 },
        name = "Appartement de luxe vide 3",
        max_weight = 50,
        type = "empty",
    },

    ["empty_apt_luxe_4"] = {
        position = { x = -769.569214, y = -365.406586, z = 25.589722 - 0.95, w = 155.905502 },
        storage = { x = -785.881348, y = -372.527466, z = 24.983154 - 0.95 },
        name = "Appartement de luxe vide 4",
        max_weight = 50,
        type = "empty",
    },

    ["empty_craphouse_1"] = {
        position = { x = 1137.006592, y = -1587.718628, z = 29.549438 - 0.95, w = 0.000000 },
        storage = { x = 1138.338501, y = -1580.320923, z = 29.549438 - 0.95 },
        name = "Maison délabrée vide 1",
        max_weight = 50,
        type = "empty",
    },

    ["empty_craphouse_2"] = {
        position = { x = 1394.97, y = 3614.07, z = 25.421265 - 0.95, w = 294.803162 },
        storage = { x = 1394.123047, y = 3618.501221, z = 29.380981 - 0.95 },
        name = "Maison délabrée vide 2",
        max_weight = 50,
        type = "empty",
    },

    ["empty_apt_1"] = {
        position = { x = 31.252750, y = -1283.854980, z = 29.768555 - 0.95, w = 5.669291 },
        storage = { x = 31.793409, y = -1279.846191, z = 29.768555 - 0.95 },
        name = "Appartement vide 1",
        max_weight = 50,
        type = "empty",
    },

    ["empty_apt_2"] = {
        position = { x = -926.663757, y = -1515.679077, z = 13.373657 - 0.95, w = 201.259842 },
        storage = { x = -925.200012, y = -1520.742798, z = 13.373657 - 0.95 },
        name = "Appartement vide 2",
        max_weight = 50,
        type = "empty",
    },

    ["empty_trailer"] = {
        position = { x = 1985.287964, y = 3023.670410, z = 47.882080 - 0.95, w = 144.566910 },
        storage = { x = 1988.320923, y = 3021.059326, z = 47.882080 - 0.95 },
        name = "Caravane vide",
        max_weight = 50,
        type = "empty",
    },

	["shell_1"] = {
        position = { x = 295.14, y = 128.96, z = 141.05 - 0.95, w = 164.11 },
        storage = { x = 292.63, y = 130.68, z = 141.05 - 0.95 },
        name = "Appartement vide 1",
        max_weight = 50,
        type = "empty",
    },

    ["shell_2"] = {
        position = { x = 294.57, y = 118.36, z = 134.356 - 0.95, w = 68.0 },
        storage = { x = 288.38, y = 124.18, z = 134.356 - 0.95 },
        name = "Appartement vide 2",
        max_weight = 50,
        type = "empty",
    },

    ["shell_3"] = {
        position = { x = 294.49, y = 126.33, z = 129.06 - 0.95, w = 159.82 },
        storage = { x = 296.18, y = 124.81, z = 129.06 - 0.95 },
        name = "Appartement vide 3",
        max_weight = 50,
        type = "empty",
    },

    ["shell_4"] = {
        position = { x = 294.74, y = 122.16, z = 119.21 - 0.95, w = 341.97 },
        storage = { x = 291.65, y = 124.18, z = 119.21 - 0.95 },
        name = "Appartement vide 4",
        max_weight = 50,
        type = "empty",
    },

    ["shell_5"] = {
        position = { x = 300.329681, y = 112.272530, z = 124.397095 - 0.95, w = 342.992126 },
        storage = { x = 305.802185, y = 117.481323, z = 124.397095 - 0.95 },
        name = "Appartement vide 5",
        max_weight = 50,
        type = "empty",
    },

    ["manoir_agea"] = {
        position = { x = 1505.103271, y = 5237.274902, z = 100.706177 - 0.95, w = 269.291351 },
        storage = { x = 1510.773682, y = 5242.259277, z = 100.706177 - 0.95 },
        name = "Manoir vide",
        max_weight = 100,
        type = "empty",
    },

    ["avp_shell_01"] = {
        position = { x = 503.897369, y = 1.787809, z = -151.939362 - 0.95, w = 92.230484 },
        storage = { x = 498.448669, y = 5.659512, z = -151.939209 - 0.95 },
        name = "Maison vide 3",
        max_weight = 100,
        type = "empty",
    },

    ["avp_shell_02"] = {
        position = { x = 510.392181, y = 49.956287, z = -150.806503 - 0.95, w = 94.255623 },
        storage = { x = 502.955078, y = 52.394661, z = -150.993042 - 0.95 },
        name = "Maison vide 4",
        max_weight = 100,
        type = "empty",
    },

    ["avp_shell_03"] = {
        position = { x = 494.645203, y = 103.072624, z = -151.955872 - 0.95, w = 271.273743 },
        storage = { x = 493.391663, y = 99.892090, z = -151.955872 - 0.95 },
        name = "Maison vide 5",
        max_weight = 100,
        type = "empty",
    },

    -- ================================
    -- =========== Offices ============
    -- ================================

    ["import_ceo_office_1"] = {
        position = { x = -141.1987, y = -620.913, z = 168.8205 - 0.95, w = 275.2 },
        storage = { x = -130.11, y = -634.39, z = 168.8205 - 0.95 },
        name = "Bureau 1",
        max_weight = 25,
        type = "office",
    },

    ["import_ceo_office_2"] = {
        position = { x = -75.8466, y = -826.9893, z = 243.3859 - 0.95, w = 73.4 },
        storage = { x = -77.79, y = -810.08, z = 243.3859 - 0.95 },
        name = "Bureau 2 (avec chambre)",
        max_weight = 25,
        type = "office",
    },

    ["import_ceo_office_3"] = {
        position = { x = -1579.756, y = -565.0661, z = 108.523 - 0.95, w = 295.75 },
        storage = { x = -1563.17, y = -570.96, z = 108.523 - 0.95 },
        name = "Bureau 3",
        max_weight = 25,
        type = "office",
    },

    ["import_ceo_office_4"] = {
        position = { x = -1392.667, y = -480.4736, z = 72.04217 - 0.95, w = 12.5 },
        storage = { x = -1379.78, y = -470.81, z = 72.04217 - 0.95 },
        name = "Bureau 4 (avec chambre)",
        max_weight = 25,
        type = "office",
    },

    ["contract_security_office"] = {
        position = { x = -1033.37, y = -434.82, z = 63.86 - 0.95, w = 298.2 },
        storage = { x = -1026.46, y = -427.51, z = 67.66 - 0.95 },
        name = "Bureau 5",
        max_weight = 50,
        type = "office",
    },

	["empty_barber"] = {
        position = { x = -34.272526, y = -159.046158, z = 56.526001 - 0.95, w = 155.905502 },
        storage = { x = -39.850548, y = -164.281311, z = 56.526001 - 0.95 },
        name = "Barber vide",
        type = "office",
        max_weight = 25,
    },

    ["empty_office_1"] = {
        position = { x = -7.516479, y = -697.002197, z = 154.844727 - 0.95, w = 161.574799 },
        storage = { x = -8.650547, y = -699.560425, z = 154.844727 - 0.95 },
        name = "Bureau vide 1",
        max_weight = 25,
        type = "office",
    },

    ["empty_office_2"] = {
        position = { x = -101.937653, y = -825.354065, z = 17.080503 - 0.95, w = 1.477893 },
        storage = { x = -84.477036, y = -815.543152, z = 17.080486 - 0.95 },
        name = "Bureau vide 2",
        max_weight = 25,
        type = "office",
    },

    ["empty_office_3"] = {
        position = { x = 133.529678, y = -760.232971, z = 145.408813 - 0.95, w = 65.196854 },
        storage = { x = 127.556046, y = -758.940674, z = 145.408813 - 0.95 },
        name = "Bureau vide 3",
        max_weight = 25,
        type = "office",
    },

    -- ================================
    -- ========== Warehouses ==========
    -- ================================

    ["criminal_warehouse"] = {
        position = { x = 844.42, y = -3004.97, z = -44.4 - 0.95, w = 94.57 },
        storage = { x = 846.1229, y = -3000.47, z = -48.99 - 0.95 },
        type = "warehouse",
        max_weight = 50,
        name = "Cave",
    },

	["large_warehouse"] = {
		position = { x = 992.571411, y = -3097.991211, z = -39.012451 - 0.95, w = 274.960632 },
		storage = { x = 1003.622009, y = -3101.353760, z = -39.012451 - 0.95 },
		name = "Grand Entrepot",
		type = "warehouse",
		max_weight = 500,
	},

	["container"] = {
        position = { x = 583.397827, y = -2963.630859, z = 0.668823 - 0.95, w = 93.543304 },
        storage = { x = 576.369263, y = -2964.237305, z = 0.668823 - 0.95 },
        name = "Conteneur",
        type = "warehouse",
        max_weight = 100,
    },

    ["empty_warehouse_1"] = {
        position = { x = -1189.846191, y = -2122.786865, z = 13.390503 - 0.95, w = 223.937012 },
        storage = { x = -1181.789062, y = -2126.584717, z = 13.390503 - 0.95 },
        name = "Entrepot vide 1",
        type = "warehouse",
        max_weight = 200,
    },

    ["empty_warehouse_2"] = {
        position = { x = -1147.556030, y = -3471.929688, z = 17.164795 - 0.95, w = 334.488190 },
        storage = { x = -1144.892334, y = -3463.213135, z = 17.164795 - 0.95 },
        name = "Entrepot vide 2",
        type = "warehouse",
        max_weight = 500,
    },

    ["empty_warehouse_3"] = {
        position = { x = -1892.729614, y = -3009.415283, z = 6.330444 - 0.95, w = 59.527554 },
        storage = { x = -1896.250488, y = -3010.404297, z = 6.330444 - 0.95 },
        name = "Entrepot vide 3",
        type = "warehouse",
        max_weight = 100,
    },

    ["empty_weed_1"] = {
        position = { x = -1021.793396, y = -2831.340576, z = 3.617554 - 0.95, w = 62.362206 },
        storage = { x = -1038.909912, y = -2829.296631, z = 3.617554 - 0.95 },
        name = "Entrepot vide 4",
        type = "warehouse",
        max_weight = 150,
    },

    ["empty_coke_1"] = {
        position = { x = 512.070312, y = -535.002197, z = 20.079834 - 0.95, w = 85.039368 },
        storage = { x = 506.083527, y = -540.593384, z = 20.079834 - 0.95 },
        name = "Entrepot vide 5",
        type = "warehouse",
        max_weight = 150,
    },

	-- ===============================
    -- =========== Garages ===========
    -- ===============================

	["2cars_garage"] = {
        position = { x = 173.29, y = -1003.60, z = -99.65 - 0.95, w = 0.0 },
        name = "Garage 2 places",
        type = "garage",
    },

	["6cars_garage"] = {
        position = { x = 202.32, y = -1004.18, z = -99.65 - 0.95, w = 0.0 },
        name = "Garage 6 places",
        type = "garage",
    },

	["10cars_garage"] = {
        position = { x = 232.04, y = -1003.19, z = -99.66 - 0.95, w = 0.0 },
        name = "Garage 10 places",
        type = "garage",
    },

	["50cars_garage"] = {
        position = { x = 1258.08, y = 230.06, z = -48.14 - 0.95, w = 270.0 },
        name = "Garage 50 places",
        type = "garage",
    },

	["empty_10cars"] = {
        position = { x = -168.527466, y = -138.224182, z = 74.959717 - 0.95, w = 238.110229 },
        name = "Garage 10 places vide",
        type = "garage",
    },

    ["empty_6cars"] = {
        position = { x = -159.375824, y = -165.824173, z = 74.824951 - 0.95, w = 334.488190 },
        name = "Garage 6 places vide",
        type = "garage",
    },

    ["empty_2cars"] = {
        position = { x = -192.382416, y = -250.931870, z = 55.009521 - 0.95, w = 345.826782 },
        name = "Garage 2 places vide",
        type = "garage",
    },

	["truck_garage"] = {
		position = { x = 813.560425, y = -3001.318604, z = -69.005127 - 0.95, w = 0.54 },
		name = "Garage poids lourds",
		type = "garage",
	},

    ["import_vehicle_garage"] = {
        position = { x = 970.75, y = -2992.41, z = -39.65 - 0.95, w = 184.15 },
        storage = { x = 968.46, y = -2999.79, z = -39.65 - 0.95 },
        name = "Entrepôt de véhicules",
		max_weight = 250,
        type = "garage",
    },

	["20cars_garage"] = {
        position = { x = 1209.837402, y = -3252.646240, z = -48.004395 - 0.95, w = 87.874016 },
        name = "Garage 20 places",
        type = "garage",
    },

    ["expo_garage"] = {
        position = { x = -1357.951660, y = 165.824173, z = -98.048340 - 0.95, w = 184.251968 },
        name = "Garage 20 places d'exposition",
        type = "garage",
    },

    ["10luxe_garage"] = {
        position = { x = 519.942871, y = -2637.942871, z = -49.004395 - 0.95, w = 0 },
        name = "Garage 10 places de luxe",
        type = "garage",
    },

    --[[
		["15luxe_garage"] = {
			position = { x = -1072.997803, y = -65.723068, z = -89.202148, w = 178.582672 },
			name = "Garage 15 places de luxe",
			type = "garage",
		},
	]]

    ["plane_garage"] = {
        position = { x = -1266.962646, y = -2979.098877, z = -47.498901 - 0.95, w = 172.913391 },
        name = "Garage à avions",
        type = "garage",
    },

    ["garage_100places"] = {
        position = { x = -1541.512085, y = -571.529663, z = -16.029297 - 0.95, w = 34.015747 },
        name = "Garage 100 Places",
        type = "garage",
    },

    ["gunrunning_bunker"] = {
        position = { x = 892.6384, y = -3245.866, z = -98.2645 - 0.95, w = 90.0 },
        storage = { x = 903.73, y = -3199.51, z = -97.18 - 0.95 },
        max_weight = 1000,
        name = "Bunker",
        type = "garage",
    },

    ["arcade_bar"] = {
        position = { x = 2679.852783, y = -361.348663, z = -55.186771 - 0.95, w = 271.554871 },
        storage = { x = 2721.675781, y = -371.139526, z = -55.380924 - 0.95 },
        name = "Salle d'arcade (STAFF)",
        max_weight = 1000,
        type = "garage",
    },

    -- ===============================
    -- ============ Other ============
    -- ===============================

    ["biker_clubhouse_1"] = {
        position = { x = 1121.05, y = -3152.61, z = -37.06 - 0.95, w = 6.44 },
        storage = { x = 1116.96, y = -3162.93, z = -36.87 - 0.95 },
        name = "Clubhouse 1",
        max_weight = 100,
        type = "other",
    },

    ["biker_clubhouse_2"] = {
        position = { x = 997.12, y = -3158.12, z = -38.91 - 0.95, w = 271.53 },
        storage = { x = 1009.93, y = -3168.08, z = -38.9 - 0.95 },
        name = "Clubhouse 2",
        max_weight = 100,
        type = "other",
    },

    ["doomsday_facility"] = {
        position = { x = 483.2006, y = 4810.5405, z = -58.9192 - 0.95, w = 0.0 },
        storage = { x = 423.49, y = 4812.35, z = -59.0 - 0.95 },
        name = "Complexe",
        max_weight = 50,
        type = "other",
    },

    ["afterhours_nightclub"] = {
        position = { x = -1569.46, y = -3017.31, z = -74.41 - 0.95, w = 2.27 },
        storage = { x = -1619.74, y = -3020.23, z = -75.20 - 0.95 },
        name = "Boite de nuit underground",
        max_weight = 50,
        type = "other",
    },

    ["contract_security_studio"] = {
        position = { x = -1021.77, y = -92.28, z = -99.4 - 0.95, w = 5.20 },
        storage = { x = -1004.74, y = -63.17, z = -99.0 - 0.95 },
        name = "Studio de musique",
        max_weight = 10,
        type = "other",
    },
}
