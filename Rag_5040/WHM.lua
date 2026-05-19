local profile = {}

local fastCastValue = 0.04 -- 0% from gear listed in Precast set. Note: Do NOT include cure clogs / ruckes rung here.
local cureCastMeritValue = 0.20 -- The Cure Cast Time Merits you have on your character (up to 0.2 in era).

local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = nil -- The Max MP you have when /blm in your idle set
local drkSJMaxMP = nil -- The Max MP you have when /drk in your idle set

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}
local virology_ring = {
    Ring2 = 'Virology Ring',
}
local republic_circlet = {
    Head = 'Republic Circlet',
}
local cure_clogs = {
    Feet = 'Cure Clogs',
}
local ruckes_rung = {
    Main = 'Rucke\'s Rung',
}
local medicine_ring = {
    Ring1 = 'Medicine Ring',
}
local mjollnir = {
    -- Main = 'Mjollnir',
}
local asklepios = { -- Used for Cures with Mjollnir when /NIN
    -- Sub = 'Asklepios',
}

-- Disabled on horizon_safe_mode
local medicine_earring_hp_threshold = 442 -- HP at which Medicine Earring set is equipped
local medicine_earring = { -- 1474
    Ammo = { Name = 'Hedgehog Bomb', Priority = 10 },
    Head = 'Dream Ribbon',
    Neck = { Name = 'Shield Pendant', Priority = 15 },
    Ear1 = { Name = 'Cassie Earring', Priority = 15 },
    Ear2 = { Name = 'Pigeon Earring +1', Priority = 20 },
    Body = { Name = 'Justaucorps +1', Priority = 20 },
    Hands = { Name = 'Feronia\'s Bangles', Priority = 20 },
    Ring1 = 'Shadow Ring',
    Ring2 = { Name = 'Bomb Queen Ring', Priority = 20 },
    Back = { Name = 'Gigant Mantle', Priority = 20 },
    Waist = { Name = 'Powerful Rope', Priority = 30 },
    Legs = { Name = 'Bls. Trousers +1', Priority = 10 },
    Feet = { Name = 'Root Sabots', Priority = 20 },
}

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 10 },
        Head = 'Dream Ribbon',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Clr. Bliaut +1', Priority = 10 },
        Hands = { Name = 'Clr. Mitts +1', Priority = 30 },
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = 'Umbra Cape',
        Waist = { Name = 'Hierarch Belt', Priority = 10 },
        Legs = { Name = 'Bls. Trousers +1', Priority = 10 },
        Feet = { Name = 'Blessed Pumps +1', Priority = 10 },
    },
    IdleALT = {},
    IdleMaxMP = {
        Main = 'Terra\'s Staff',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 10 },
        Head = { Name = 'Faerie Hairpin', Priority = 8 },
        Neck = { Name = 'Uggalepih Pendant', Priority = 10 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 10 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 10 },
        Body = { Name = 'Clr. Bliaut +1', Priority = 10 },
        Hands = { Name = 'Clr. Mitts +1', Priority = 30 },
        Ring1 = { Name = 'Serket Ring', Priority = 5 },
        Ring2 = { Name = 'Vivian Ring', Priority = 5 },
        Back = { Name = 'Mahatma Cape', Priority = 10 },
        Waist = { Name = 'Hierarch Belt', Priority = 10 },
        Legs = { Name = 'Bls. Trousers +1', Priority = 10 },
        Feet = { Name = 'Blessed Pumps +1', Priority = 10 },
    },
    Resting = {
        Main = 'Pluto\'s Staff',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 10 },
        Head = 'Hydra Beret',
        Neck = { Name = 'Pch. Collar', Priority = 20 },
        Ear1 = 'Relaxing Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 10 },
        Body = 'Mahatma Hpl.',
        Hands = 'Hydra Gloves',
        Ring1 = { Name = 'Serene Ring', Priority = 5 },
        Ring2 = { Name = 'Serene Ring', Priority = 5 },
        Back = 'Mahatma Cape',
        Waist = 'Cleric\'s Belt',
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    Town = {},
    Movement = {
        Feet = { Name = 'Herald\'s Gaiters', Priority = 10 },
    },
    Movement_TP = {},

    DT = {
        Main = 'Terra\'s Staff',
        Head = 'Dream Ribbon',
        Neck = 'Jeweled Collar +1',
        Ring1 = 'Jelly Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = 'Umbra Cape',
    },
    DTNight = {},
    MDT = {
        Head = 'Dream Ribbon',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Dalmatica', Priority = 5 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = 'Hexerei Cape',
        Waist = { Name = 'Powerful Rope', Priority = 30 },
        Legs = { Name = 'Silk Slacks +1', Priority = 20 },
        Feet = { Name = 'Root Sabots', Priority = 20 },
    },
    FireRes = {
        Main = 'Neptune\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = { Name = 'Dalmatica', Priority = 5 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Water Belt', -- 20
        Legs = { Name = 'Silk Slacks +1', Priority = 20 },
        Feet = 'Power Sandals', -- 7
    },
    IceRes = {
        Main = 'Vulcan\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Omn. Earring', -- 11
        Ear2 = 'Omn. Earring', -- 11
        Body = { Name = 'Dalmatica', Priority = 5 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
        Back = { Name = 'Aurora Mantle +1', Priority = 10 }, -- 8
        Waist = 'Fire Belt', -- 20
        Legs = { Name = 'Silk Slacks +1', Priority = 20 },
        Feet = 'T.M. Pigaches +2', -- 10
    },
    LightningRes = {
        Main = 'Terra\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = { Name = 'Dalmatica', Priority = 5 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Adroit Ring', -- 10
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Earth Belt', -- 20
        Legs = { Name = 'Silk Slacks +1', Priority = 20 },
        Feet = { Name = 'Root Sabots', Priority = 20 },
    },
    EarthRes = {
        Main = 'Auster\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = { Name = 'Dalmatica', Priority = 5 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Robust Ring', -- 10
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Wind Belt', -- 20
        Legs = { Name = 'Silk Slacks +1', Priority = 20 },
        Feet = 'Cmb.Cst. Shoes', -- 4
    },
    WindRes = {
        Main = 'Aquilo\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Omn. Earring', -- 11
        Ear2 = 'Omn. Earring', -- 11
        Body = { Name = 'Dalmatica', Priority = 5 },
        Hands = 'Mage\'s Cuffs', -- 5
        Ring1 = 'Nimble Ring', -- 10
        Ring2 = 'Malgust Ring', -- 10
        Back = { Name = 'Aurora Mantle +1', Priority = 10 }, -- 8
        Waist = 'Ice Belt', -- 20
        Legs = { Name = 'Silk Slacks +1', Priority = 20 },
        Feet = 'Air Solea +1', -- 4
    },
    WaterRes = {
        Main = 'Jupiter\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = { Name = 'Dalmatica', Priority = 5 },
        Hands = 'Silk Cuffs +1', -- 7
        Ring1 = 'Communion Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = 'Blue Cape +1', -- 7
        Waist = 'Lightning Belt', -- 20
        Legs = 'Frog Trousers', -- 7
        Feet = { Name = 'Root Sabots', Priority = 20 },
    },
    Evasion = {},
    Override = { -- An additional override set explicitly to be used for sets such as crafting, HELM, fishing, or any other special sets such as DRK 2HR, MNK Counter etc. n.b. Any unused Resist or Evasion set can be used similarly.
        Body = 'Field Tunica',
        Hands = 'Field Gloves',
        Legs = 'Field Hose',
        Feet = 'Field Boots'
    },

    Precast = {
        Ear1 = { Name = 'Loquac. Earring', Priority = 10 },
        Feet = { Name = 'Rostrum Pumps', Priority = 5 },
    },
    SIRD = { -- Override sets (Resistance / Evasion) take precedence if in use.
        Main = { Name = 'Eremite\'s Wand +1', Priority = 10 }, -- 25
        Sub = 'Genbu\'s Shield',
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear2 = { Name = 'Magnetic Earring', Priority = 10 }, -- 8
        Waist = 'Druid\'s Rope', -- 10
        Feet = { Name = 'Hlr. Duckbills +1', Priority = 10 }, -- 25
    },
    SIRD_NIN = {
        Sub = { Name = 'Eremite\'s Wand +1', Priority = 10 },
    },
    Haste = {
        Head = 'Nashira Turban',
        Body = 'Nashira Manteel',
        Hands = { Name = 'Blessed Mitts +1', Priority = 10 },
        Back = 'Shadow Mantle',
        Waist = 'Swift Belt',
        Legs = { Name = 'Bls. Trousers +1', Priority = 10 },
        Feet = { Name = 'Blessed Pumps +1', Priority = 10 },
    },
    ConserveMP = {
        Ammo = { Name = 'Dream Sand', Priority = 10 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 10 },
        Back = 'Maledictor\'s Shawl',
    },

    Hate = { -- Switches to this set when casting Sleep, Blind, Dispel, Bind, Flash and Cures on other players if /hate is toggled on
        Ammo = { Name = 'Fortune Egg', Priority = 10 },
        Head = { Name = 'Rival Ribbon', Priority = 10 },
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Eris\' Earring +1',
        Ear2 = 'Eris\' Earring +1',
        Hands = 'Merman\'s Bangles',
        Body = 'Nashira Manteel',
        Ring1 = { Name = 'Sattva Ring', Priority = 20 },
        Ring2 = 'Mermaid Ring',
        Legs = 'Nashira Seraweels',
        Feet = 'Nashira Crackows',
        Back = 'Toreador\'s Cape',
    },
    Cheat_C3HPDown = {
        Head = 'Nashira Turban',
        Neck = 'Willpower Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 10 },
        Body = { Name = 'Clr. Bliaut +1', Priority = 10 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = 'Shadow Mantle',
        Waist = 'Druid\'s Rope',
        Legs = { Name = 'Bls. Trousers +1', Priority = 10 },
        Feet = { Name = 'Hlr. Duckbills +1', Priority = 10 },
    },
    Cheat_C4HPDown = {
        Head = 'Nashira Turban',
        Neck = 'Willpower Torque',
        Ear1 = { Name = 'Loquac. Earring', Priority = 10 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 10 },
        Body = { Name = 'Dalmatica', Priority = 5 },
        Hands = { Name = 'Zenith Mitts +1', Priority = 5 },
        Ring1 = { Name = 'Serket Ring', Priority = 5 },
        Ring2 = { Name = 'Vivian Ring', Priority = 5 },
        Back = 'Shadow Mantle',
        Waist = 'Druid\'s Rope',
        Feet = { Name = 'Hlr. Duckbills +1', Priority = 10 },
    },
    Cheat_HPUp = {
        Ammo = { Name = 'Happy Egg', Priority = 20 },
        Head = { Name = 'Rival Ribbon', Priority = 10 },
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Eris\' Earring +1',
        Ear2 = 'Eris\' Earring +1',
        Body = { Name = 'Aristocrat\'s Coat', Priority = 10 },
        Hands = { Name = 'Feronia\'s Bangles', Priority = 20 },
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 20 },
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = { Name = 'Gigant Mantle', Priority = 20 },
        Waist = { Name = 'Powerful Rope', Priority = 30 },
        Legs = 'Nashira Seraweels',
        Feet = { Name = 'Root Sabots', Priority = 20 },
    },

    Yellow = {
        Ammo = { Name = 'Tiphia Sting', Priority = -5 },
        Head = 'Nashira Turban',
        Neck = 'Willpower Torque',
        Ear1 = { Name = 'Loquac. Earring', Priority = 10 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 10 },
        Body = { Name = 'Dalmatica', Priority = 5 },
        Hands = { Name = 'Zenith Mitts +1', Priority = 5 },
        Ring1 = { Name = 'Serket Ring', Priority = 5 },
        Ring2 = { Name = 'Vivian Ring', Priority = 5 },
        Back = 'Shadow Mantle',
        Waist = 'Druid\'s Rope',
        Feet = { Name = 'Hlr. Duckbills +1', Priority = 10 },
    },
    Cure = {
        Ammo = 'Dream Sand',
        Head = 'Hydra Beret', -- 8
        Neck = 'Benign Necklace', -- 2
        Ear1 = 'Novia Earring', -- 7
        Ear2 = 'Magnetic Earring',
        Body = { Name = 'Aristocrat\'s Coat', Priority = 10 },
        Hands = 'Hydra Gloves', -- 5
        Ring1 = { Name = 'Serene Ring', Priority = 5 }, -- 2
        Ring2 = { Name = 'Serene Ring', Priority = 5 }, -- 2
        Back = { Name = 'Mahatma Cape', Priority = 10 }, -- 6
        Waist = { Name = 'Penitent\'s Rope', Priority = -5 }, -- 3
        Legs = { Name = 'Bls. Trousers +1', Priority = 10 }, -- 6
        Feet = { Name = 'Blessed Pumps +1', Priority = 10 }, -- 5
    },
    Cure5 = {
        Ammo = { Name = 'Hedgehog Bomb', Priority = 10 }, -- 1
        Neck = 'Ajari Necklace',
        Ear2 = 'Cmn. Earring',
        Hands = { Name = 'Hlr. Mitts +1', Priority = 10 }, -- 4
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
    },
    Benediction = {
        Ammo = { Name = 'Hedgehog Bomb', Priority = 10 }, -- 1
        Head = 'Hydra Beret', -- 8
        Neck = { Name = 'Pch. Collar', Priority = 20 },
        Ear1 = 'Novia Earring', -- 7
        Ear2 = { Name = 'Cassie Earring', Priority = 15 },
        Body = { Name = 'Hydra Doublet', Priority = 10 }, -- 9
        Hands = 'Hydra Gloves', -- 5
        Ring1 = { Name = 'Serene Ring', Priority = 5 }, -- 2
        Ring2 = { Name = 'Serene Ring', Priority = 5 }, -- 2
        Back = { Name = 'Mahatma Cape', Priority = 10 }, -- 6
        Waist = { Name = 'Penitent\'s Rope', Priority = -5 }, -- 3
        Legs = { Name = 'Bls. Trousers +1', Priority = 10 }, -- 6
        Feet = { Name = 'Blessed Pumps +1', Priority = 10 }, -- 5
    },
    Regen = {
        Main = 'Rucke\'s Rung',
        Body = { Name = 'Clr. Bliaut +1', Priority = 10 },
    },
    Cursna = {
        Main = 'Prelatic Pole',
        Neck = 'Healing Torque',
        Ear1 = 'Healing Earring',
        Body = 'Nashira Manteel',
        Hands = { Name = 'Hlr. Mitts +1', Priority = 10 },
        Legs = { Name = 'Clr. Pantaln. +1', Priority = 10 },
        Back = { Name = 'Altruistic Cape', Priority = 10 },
    },

    Enhancing = {
        Main = { Name = 'Eremite\'s Wand +1', Priority = 10 },
        Sub = 'Genbu\'s Shield',
        Ammo = { Name = 'Dream Sand', Priority = 10 },
        Head = 'Nashira Turban',
        Neck = 'Enhancing Torque',
        Ear1 = 'Augmenting Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 10 },
        Body = 'Nashira Manteel',
        Hands = { Name = 'Blessed Mitts +1', Priority = 10 },
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = { Name = 'Merciful Cape', Priority = 10 },
        Waist = 'Swift Belt',
        Legs = { Name = 'Bls. Trousers +1', Priority = 10 },
        Feet = { Name = 'Clr. Duckbills +1', Priority = 10 },
    },
    Stoneskin = {
        Head = 'Nashira Turban',
        Neck = 'Stone Gorget',
        Ear1 = { Name = 'Loquac. Earring', Priority = 10 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 10 },
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Blessed Mitts +1', Priority = 10 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Shadow Mantle',
        Waist = 'Druid\'s Rope',
        Legs = { Name = 'Bls. Trousers +1', Priority = 10 },
        Feet = { Name = 'Hlr. Duckbills +1', Priority = 10 },
    },
    Spikes = {
        Main = 'Kirin\'s Pole',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 10 },
        Head = 'Maat\'s Cap',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Zenith Mitts +1', Priority = 5 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Waist = { Name = 'Penitent\'s Rope', Priority = -5 },
        Legs = 'Mahatma Slops',
    },
    Barspell = {
        Body = { Name = 'Blessed Bliaut', Priority = 10 },
        Legs = { Name = 'Clr. Pantaln. +1', Priority = 10 },
    },

    Enfeebling = {
        Head = 'Nashira Turban',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Enfeebling Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 10 },
        Body = { Name = 'Hlr. Bliaut +1', Priority = 10 },
        Hands = { Name = 'Clr. Mitts +1', Priority = 30 },
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Serene Ring', Priority = 5 },
        Back = { Name = 'Altruistic Cape', Priority = 10 },
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Nashira Crackows',
    },
    EnfeeblingMND = {
        Ammo = { Name = 'Holy Ampulla', Priority = 10 },
        Ear2 = 'Cmn. Earring',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Waist = { Name = 'Cleric\'s Belt', Priority = 10 },
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Clr. Duckbills +1', Priority = 10 },
    },
    EnfeeblingINT = {
        Ammo = { Name = 'Phtm. Tathlum', Priority = 10 },
        Ear2 = 'Omn. Earring',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Waist = { Name = 'Penitent\'s Rope', Priority = -5 },
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Hlr. Duckbills +1', Priority = 10 },
    },
    EnfeeblingACC = {
    },

    Divine = {
        Ammo = { Name = 'Hedgehog Bomb', Priority = 10 },
        Head = 'Nashira Turban',
        Neck = 'Benign Necklace',
        Ear1 = 'Novia Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Nashira Manteel',
        Hands = { Name = 'Blessed Mitts +1', Priority = 10 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = { Name = 'Altruistic Cape', Priority = 10 },
        Waist = 'Swift Belt',
        Legs = { Name = 'Bls. Trousers +1', Priority = 10 },
        Feet = { Name = 'Blessed Pumps +1', Priority = 10 },
    },
    Banish = {
        Ammo = { Name = 'Holy Ampulla', Priority = 10 },
        Head = 'Nashira Turban',
        Neck = 'Ajari Necklace',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Novio Earring',
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Zenith Mitts +1', Priority = 5 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = { Name = 'Altruistic Cape', Priority = 10 },
        Waist = { Name = 'Cleric\'s Belt', Priority = 10 },
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Clr. Duckbills +1', Priority = 10 },
    },
    Dark = {
        Ammo = { Name = 'Phtm. Tathlum', Priority = 10 },
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Dark Earring',
        Ear2 = 'Omn. Earring',
        Body = 'Nashira Manteel',
        Hands = 'Nashira Gages',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = { Name = 'Merciful Cape', Priority = 10 },
        Waist = { Name = 'Penitent\'s Rope', Priority = -5 },
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Hlr. Duckbills +1', Priority = 10 },
    },

    Nuke = {},
    NukeACC = {},
    NukeDOT = {},

    TP = {
        Head = 'Nashira Turban',
        Neck = 'Prudence Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Nashira Manteel',
        Hands = { Name = 'Blessed Mitts +1', Priority = 10 },
        Ring1 = { Name = 'Toreador\'s Ring', Priority = 20 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 20 },
        Back = { Name = 'Bellicose Mantle', Priority = -5 },
        Waist = 'Swift Belt',
        Legs = { Name = 'Bls. Trousers +1', Priority = 10 },
        Feet = { Name = 'Blessed Pumps +1', Priority = 10 },
    },
    TP_Mjollnir_Haste = {
        Head = 'Optical Hat'
    },
    TP_HighAcc = {
        Head = 'Optical Hat',
        Body = { Name = 'Hydra Doublet', Priority = 10 },
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    TP_NIN = {
        Ear1 = 'Stealth Earring',
    },

    Weapon_Loadout_1 = {
        Main = 'Purgatory Mace',
        Sub = 'Octave Club',
        Ammo = { Name = 'Tiphia Sting', Priority = -5 },
    },
    Weapon_Loadout_2 = {
        Main = 'Purgatory Mace',
        Sub = 'Viking Shield',
        Ammo = { Name = 'Tiphia Sting', Priority = -5 },
    },
    Weapon_Loadout_3 = {},

    WS = {
        Head = 'Maat\'s Cap',
        Neck = 'Prudence Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Flora Cotehardie', Priority = 5 },
        Hands = { Name = 'Hlr. Mitts +1', Priority = 10 },
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
        Back = 'Ryl. Army Mantle',
        Waist = 'Life Belt',
        Legs = { Name = 'Bls. Trousers +1', Priority = 10 },
        Feet = { Name = 'Clr. Duckbills +1', Priority = 10 },
    },
    WS_HighAcc = {
        Head = 'Optical Hat',
        Body = { Name = 'Hydra Doublet', Priority = 10 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 20 },
        Legs = 'Hydra Brais',
    },
    WS_Randgrith = {
        Neck = 'Breeze Gorget',
        Ear2 = 'Triumph Earring',
        Ring2 = 'Triumph Ring',
    },

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {
        Ammo = 'Pebble',
    },

    LockSet1 = { -- Devotion
        Main = { Name = 'Rsv.Cpt. Mace', Priority = 20 },
        Sub = { Name = 'Ptr.Prt. Shield', Priority = 15 },
        Ammo = { Name = 'Happy Egg', Priority = 20 },
        Head = 'Hydra Beret',
        Neck = { Name = 'Shield Pendant', Priority = 15 },
        Ear1 = { Name = 'Cassie Earring', Priority = 15 },
        Ear2 = { Name = 'Pigeon Earring +1', Priority = 20 },
        Body = { Name = 'Justaucorps +1', Priority = 20 },
        Hands = { Name = 'Feronia\'s Bangles', Priority = 20 },
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 20 },
        Ring2 = { Name = 'Bloodbead Ring', Priority = 18 },
        Back = { Name = 'Gigant Mantle', Priority = 20 },
        Waist = { Name = 'Powerful Rope', Priority = 30 },
        Legs = { Name = 'Bls. Trousers +1', Priority = 10 },
        Feet = { Name = 'Root Sabots', Priority = 20 },
    },
    LockSet2 = {},
    LockSet3 = {},

    VileElixir = {
        Ammo = { Name = 'Hedgehog Bomb', Priority = 10 },
        Head = { Name = 'Faerie Hairpin', Priority = 8 },
        Neck = { Name = 'Uggalepih Pendant', Priority = 10 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 10 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 10 },
        Body = { Name = 'Clr. Bliaut +1', Priority = 10 },
        Hands = { Name = 'Clr. Mitts +1', Priority = 10 },
        Ring1 = { Name = 'Serket Ring', Priority = 5 },
        Ring2 = { Name = 'Vivian Ring', Priority = 5 },
        Back = { Name = 'Mahatma Cape', Priority = 10 },
        Waist = { Name = 'Hierarch Belt', Priority = 10 },
        Legs = { Name = 'Bls. Trousers +1', Priority = 10 },
        Feet = { Name = 'Blessed Pumps +1', Priority = 10 },
    },
}

profile.SetMacroBook = function()
    -- AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    -- AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('common\\gcmage.lua')

sets.warlocks_mantle = warlocks_mantle
sets.virology_ring = virology_ring
sets.republic_circlet = republic_circlet
sets.cure_clogs = cure_clogs
sets.ruckes_rung = ruckes_rung
sets.medicine_ring = medicine_ring
sets.mjollnir = mjollnir
sets.asklepios = asklepios
sets.medicine_earring = medicine_earring
profile.Sets = gcmage.AppendSets(sets)

profile.HandleAbility = function()
    gcmage.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Benediction') then
        gFunc.EquipSet(sets.Benediction)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    gcmage.DoPreshot(sets.Preshot, gFunc.Combine(sets.Preshot, sets.Ranged), snapShotValue)
end

profile.HandleMidshot = function()
    gcmage.DoMidshot(sets, gFunc.Combine(sets.Preshot, sets.Ranged))
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)
    if (gcdisplay.GetCycle('TP') == 'HighAcc') then
        gFunc.EquipSet('WS_HighAcc')
    end

    local action = gData.GetAction()
    if (action.Name == 'Randgrith') then
        gFunc.EquipSet(sets.WS_Randgrith)
    end

    gcmage.DoFenrirsEarring()
end

profile.OnLoad = function()
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
end

profile.HandleCommand = function(args)
    gcmage.DoCommands(args, sets)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmage.DoDefault(sets, ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, drkSJMaxMP)

    local player = gData.GetPlayer()
    if (not gcinclude.horizon_safe_mode) then
        if (player.HP <= medicine_earring_hp_threshold) then
            gFunc.EquipSet('medicine_earring')
        end
    end

    gcmage.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == 'RDM' and warlocks_mantle.Back) then
        gcmage.DoPrecast(sets, fastCastValue + 0.02, cureCastMeritValue)
        gFunc.EquipSet('warlocks_mantle')
    else
        gcmage.DoPrecast(sets, fastCastValue, cureCastMeritValue)
    end
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, drkSJMaxMP)

    local action = gData.GetAction()
    if (action.Skill == 'Enhancing Magic') then
        if (string.match(action.Name, 'Regen')) then
            gFunc.EquipSet('Regen')
        elseif (string.match(action.Name, 'Bar')) then
            gFunc.EquipSet('Barspell')
        end
    elseif (string.match(action.Name, 'Banish')
        or string.match(action.Name, 'Holy')
        or (string.match(action.Name, 'Cure') and gData.GetActionTarget().Type == 'Monster')
    ) then
        if (republic_circlet.Head) then
            if (conquest:GetInsideControl()) then
                print(chat.header('LAC - WHM'):append(chat.message('In Region - Using Republic Circlet')))
                gFunc.EquipSet('republic_circlet')
            end
        end
    end

    gcmage.EquipWeaponLoadout()
end

return profile
