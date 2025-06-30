Lists = Lists or {}

Lists.Variations = {}

Lists.Variations.Clothes = {
    FACE = 0,
    MASK = 1,
    HAIR = 2,
    TORSO = 3,
    PANTS = 4,
    BACKPACK = 5,
    SHOES = 6,
    SCARF = 7,
    UNDERSHIRT = 8,
    KEVLAR = 9,
    DECALS = 10,
    TSHIRT = 11,
}

Lists.Variations.Props = {
    HAT = 0,
    GLASSES = 1,
    EARS = 2,
    WATCH = 6,
    BRACELET = 7,
}

Lists.Variations.ClothIndexes = {
    [0] = "FACE",
    [1] = "MASK",
    [2] = "HAIR",
    [3] = "TORSO",
    [4] = "PANTS",
    [5] = "BACKPACK",
    [6] = "SHOES",
    [7] = "SCARF",
    [8] = "UNDERSHIRT",
    [9] = "KEVLAR",
    [10] = "DECALS",
    [11] = "TSHIRT",
}

Lists.Variations.PropsIndexes = {
    [0] = "HAT",
    [1] = "GLASSES",
    [2] = "EARS",
    [6] = "WATCH",
    [7] = "BRACELET",
}


Lists.Variations.Naked = {
    ["m"] = {
        [1] = 0,
        [3] = 15,
        [4] = 37,
        [5] = 0,
        [6] = 47,
        [7] = 0,
        [8] = 15,
        [9] = 0,
        [10] = 0,
        [11] = 15,
    },
    ["f"] = {
        [1] = 0,
        [3] = 15,
        [4] = 15,
        [5] = 0,
        [6] = 48,
        [7] = 0,
        [8] = 15,
        [9] = 0,
        [10] = 0,
        [11] = 15,
    },
}

Lists.Variations.NakedOutfits = {
	["m"] = {
		props = {
			[Lists.Variations.Props.BRACELET]		= {-1, 0},
			[Lists.Variations.Props.GLASSES]        = {-1, 0},
			[Lists.Variations.Props.WATCH]			= {-1, 0},
			[Lists.Variations.Props.EARS]			= {-1, 0},
			[Lists.Variations.Props.HAT]			= {-1, 0},
		},
		components = {
			[Lists.Variations.Clothes.UNDERSHIRT]   = {Lists.Variations.Naked["m"][Lists.Variations.Clothes.UNDERSHIRT], 0},
			[Lists.Variations.Clothes.BACKPACK]		= {Lists.Variations.Naked["m"][Lists.Variations.Clothes.BACKPACK], 0},
			[Lists.Variations.Clothes.KEVLAR]		= {Lists.Variations.Naked["m"][Lists.Variations.Clothes.KEVLAR], 0},
			[Lists.Variations.Clothes.TSHIRT]		= {Lists.Variations.Naked["m"][Lists.Variations.Clothes.TSHIRT], 0},
			[Lists.Variations.Clothes.DECALS]	    = {Lists.Variations.Naked["m"][Lists.Variations.Clothes.DECALS], 0},
			[Lists.Variations.Clothes.TORSO]		= {Lists.Variations.Naked["m"][Lists.Variations.Clothes.TORSO], 0},
			[Lists.Variations.Clothes.PANTS]		= {Lists.Variations.Naked["m"][Lists.Variations.Clothes.PANTS], 4},
			[Lists.Variations.Clothes.SHOES]		= {Lists.Variations.Naked["m"][Lists.Variations.Clothes.SHOES], 0},
			[Lists.Variations.Clothes.SCARF]		= {Lists.Variations.Naked["m"][Lists.Variations.Clothes.SCARF], 0},
			[Lists.Variations.Clothes.MASK]			= {Lists.Variations.Naked["m"][Lists.Variations.Clothes.MASK], 0},
		},
	},

	["f"] = {
		props = {
			[Lists.Variations.Props.BRACELET]		= {-1, 0},
			[Lists.Variations.Props.GLASSES]        = {-1, 0},
			[Lists.Variations.Props.WATCH]			= {-1, 0},
			[Lists.Variations.Props.EARS]			= {-1, 0},
			[Lists.Variations.Props.HAT]			= {-1, 0},
		},
		components = {
			[Lists.Variations.Clothes.UNDERSHIRT]   = {Lists.Variations.Naked["f"][Lists.Variations.Clothes.UNDERSHIRT], 0},
			[Lists.Variations.Clothes.BACKPACK]		= {Lists.Variations.Naked["f"][Lists.Variations.Clothes.BACKPACK], 0},
			[Lists.Variations.Clothes.KEVLAR]		= {Lists.Variations.Naked["f"][Lists.Variations.Clothes.KEVLAR], 0},
			[Lists.Variations.Clothes.TSHIRT]		= {Lists.Variations.Naked["f"][Lists.Variations.Clothes.TSHIRT], 0},
			[Lists.Variations.Clothes.DECALS]	    = {Lists.Variations.Naked["f"][Lists.Variations.Clothes.DECALS], 0},
			[Lists.Variations.Clothes.TORSO]		= {Lists.Variations.Naked["f"][Lists.Variations.Clothes.TORSO], 0},
			[Lists.Variations.Clothes.PANTS]		= {Lists.Variations.Naked["f"][Lists.Variations.Clothes.PANTS], 0},
			[Lists.Variations.Clothes.SHOES]		= {Lists.Variations.Naked["f"][Lists.Variations.Clothes.SHOES], 0},
			[Lists.Variations.Clothes.SCARF]		= {Lists.Variations.Naked["f"][Lists.Variations.Clothes.SCARF], 0},
			[Lists.Variations.Clothes.MASK]			= {Lists.Variations.Naked["f"][Lists.Variations.Clothes.MASK], 0},
		},
	}
}
