local profile = {}

local fastCastValue = 0.04 -- Only include Fast Cast i.e. Loquacious Earring, Rostrum Pumps
local fastCastValueSong = 0.38 -- Only include Song Spellcasting Time i.e. Minstrel's Ring, Sha'ir Manteel

local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

local whmSJMaxMP = nil -- The Max MP you have when /whm in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = nil -- The Max MP you have when /blm in your idle set

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}
local gaudy_harness = {
    Body = 'Gaudy Harness',
}

local sets = {
    Idle = { -- 1176
        Main = 'Terra\'s Staff',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Genbu\'s Kabuto', Priority = 60 },
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Dalmatica', Priority = 10 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Hexerei Cape', Priority = 50 },
        Waist = { Name = 'Penitent\'s Rope', Priority = -10 },
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = {
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Back = 'Umbra Cape',
    },
    IdleMaxMP = { -- 1176
        Neck = { Name = 'Pch. Collar', Priority = 70 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Hands = { Name = 'Seiryu\'s Kote', Priority = 60 },
        Ring1 = { Name = 'Serket Ring', Priority = 10 },
        Back = { Name = 'Mahatma Cape', Priority = 50 },
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Feet = { Name = 'Rostrum Pumps', Priority = 10 },
    },
    Resting = {
        Main = 'Pluto\'s Staff',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = 'Hydra Beret',
        Neck = { Name = 'Pch. Collar', Priority = 70 },
        Ear1 = 'Relaxing Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = 'Mahatma Hpl.',
        Hands = 'Hydra Gloves',
        Ring1 = { Name = 'Serene Ring', Priority = 10 },
        Ring2 = { Name = 'Serene Ring', Priority = 10 },
        Back = { Name = 'Mahatma Cape', Priority = 50 },
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    Town = {},
    Movement = {},
    Movement_TP = {
        Hands = 'Hydra Gloves',
        Feet = 'Hydra Gaiters',
    },

    DT = {
		Main = 'Terra\'s Staff',
        Head = 'Darksteel Cap +1',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Umbra Cape',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    DTNight = {},
    MDT = {
        Head = 'Dream Ribbon',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Dalmatica', Priority = 10 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Hexerei Cape', Priority = 50 },
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = { Name = 'Silk Slacks +1', Priority = 60 },
        Feet = { Name = 'Root Sabots', Priority = 60 },
    },
    FireRes = {
        Main = 'Neptune\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Scp. Brstplate +1', -- 10
        Hands = 'Tarasque Mitts +1', -- 6
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Dino Mantle', -- 4
        Waist = 'Water Belt', -- 20
        Legs = 'Dino Trousers', -- 4
        Feet = 'Suzaku\'s Sune-Ate', -- 50
    },
    IceRes = {
        Main = 'Vulcan\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Omn. Earring', -- 11
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Tundra Jerkin', -- 7
        Hands = 'Feral Gloves', -- 4
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
        Back = 'Aurora Mantle +1', -- 8
        Waist = 'Fire Belt', -- 20
        Legs = 'Feral Trousers', -- 6
        Feet = 'Feral Ledelsens', -- 4
    },
    LightningRes = {
        Main = 'Terra\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = { Name = 'Flora Cotehardie', Priority = 10 }, -- 5
        Hands = { Name = 'Seiryu\'s Kote', Priority = 60 },
        Ring1 = 'Adroit Ring', -- 10
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Lightning Mantle', -- 6
        Waist = 'Earth Belt', -- 20
        Legs = 'Byakko\'s Haidate', -- 50
        Feet = { Name = 'Root Sabots', Priority = 60 },
    },
    EarthRes = {
        Main = 'Auster\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Gaia Doublet +1', -- 12
        Hands = 'Sand Gloves', -- 11
        Ring1 = 'Robust Ring', -- 10
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Beak Mantle +1', -- 7
        Waist = 'Wind Belt', -- 20
        Legs = 'Beak Trousers +1', -- 7
        Feet = 'Cmb.Cst. Shoes', -- 4
    },
    WindRes = {
        Main = 'Aquilo\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Omn. Earring', -- 11
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Tundra Jerkin', -- 7
        Hands = 'Mage\'s Cuffs', -- 5
        Ring1 = 'Nimble Ring', -- 10
        Ring2 = 'Malgust Ring', -- 10
        Back = 'Aurora Mantle +1', -- 8
        Waist = 'Ice Belt', -- 20
        Legs = { Name = 'Silk Slacks +1', Priority = 60 },
        Feet = 'Air Solea +1', -- 4
    },
    WaterRes = {
        Main = 'Jupiter\'s Staff', -- 20
        Head = { Name = 'Genbu\'s Kabuto', Priority = 60 }, -- 50
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = { Name = 'Scp. Harness +1', Priority = 60 }, -- 20
        Hands = { Name = 'Scp. Mittens +1', Priority = 60 }, -- 7
        Ring1 = 'Communion Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = { Name = 'Blue Cape +1', Priority = 30 }, -- 7
        Waist = 'Lightning Belt', -- 20
        Legs = { Name = 'Scp. Subligar +1', Priority = 60 }, -- 7
        Feet = { Name = 'Scp. Leggings +1', Priority = 60 }, -- 7
    },
    Evasion = {},
    Override = { -- An additional override set explicitly to be used for sets such as crafting, HELM, fishing, or any other special sets such as DRK 2HR, MNK Counter etc. n.b. Any unused Resist or Evasion set can be used similarly.
        Body = 'Field Tunica',
        Hands = 'Field Gloves',
        Legs = 'Field Hose',
        Feet = 'Field Boots'
    },

    Precast_Songs_HPDown = { -- This set will equip even before precast for songs in case you require HP Down equipment to trigger Minstrel's Ring
    },
    Precast = {
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Hands = { Name = 'Seiryu\'s Kote', Priority = 60 },
        Feet = { Name = 'Rostrum Pumps', Priority = 10 },
    },
    Precast_Songs = { -- 1548
        Main = { Name = 'Tutelary', Priority = 60 },
 		Sub = 'Genbu\'s Shield',
        Head = { Name = 'Genbu\'s Kabuto', Priority = 60 },
        Neck = { Name = 'Pch. Collar', Priority = 70 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 100 },
        Ear2 = { Name = 'Cassie Earring', Priority = 20 },
        Body = { Name = 'Sheikh Manteel', Priority = 50 },
        Hands = { Name = 'Seiryu\'s Kote', Priority = 60 },
        Ring1 = 'Minstrel\'s Ring',
        Ring2 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Back = { Name = 'Gigant Mantle', Priority = 60 },
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = { Name = 'Dusk Trousers +1', Priority = 60 },
        Feet = { Name = 'Rostrum Pumps', Priority = 10 },
    },
    SIRD = { -- Override sets (Resistance / Evasion) take precedence if in use.
        Head = { Name = 'Genbu\'s Kabuto', Priority = 60 },
        Neck = 'Willpower Torque', -- 5
        Ear1 = { Name = 'Loquac. Earring', Priority = 100 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 100 }, -- 8
        Body = { Name = 'Dalmatica', Priority = 10 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = 'Druid\'s Rope', -- 10
        Legs = 'Dst. Subligar +1',
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = {
        Range = 'Angel Lyre',
		Head = 'Patroclus\'s Helm',
        Neck = { Name = 'Uggalepih Pendant', Priority = 100 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 100 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 100 },
        Body = { Name = 'Sheikh Manteel', Priority = 50 },
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 },
    },
    ConserveMP = {
        Ammo = { Name = 'Dream Sand', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Back = 'Maledictor\'s Shawl',
    },

    Sing_Default = { -- Defaulting to Wind and Debuffs just because we have to default to something
        Range = { Name = 'Shofar +1', Priority = 60 }, -- Realistically pointless to fill out
        Head = { Name = 'Brd. Roundlet +1', Priority = 60 },
        Neck = 'Wind Torque',
        Ear1 = 'Musical Earring',
        Ear2 = 'Singing Earring',
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Chl. Cuffs +1', Priority = 60 },
        Ring1 = 'Heavens Ring',
        Ring2 = 'Heavens Ring',
        Back = { Name = 'Astute Cape', Priority = 50 },
        Waist = 'Gleeman\'s Belt',
        Legs = { Name = 'Chl. Cannions +1', Priority = 60 },
        Feet = { Name = 'Sheikh Crackows', Priority = 50 },
    },
    Sing_Buff = {
        Main = 'Chanter\'s Staff',
        Body = { Name = 'Minstrel\'s Coat', Priority = 60 },
        Ring1 = { Name = 'Shadow Ring', Priority = 10 },
        Ring2 = { Name = 'Serene Ring', Priority = 10 },
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Feet = { Name = 'Rostrum Pumps', Priority = 10 },
    },
    Sing_Debuff = {
    },

    Sing_Recast = {
        Hands = { Name = 'Sheikh Gages', Priority = 50 },
    },

    Sing_Ballad_Large = {
        Range = 'Balladier\'s Harp',
    },
    Sing_Ballad_Small = {
        Range = { Name = 'Shofar +1', Priority = 60 },
    },
    Sing_Paeon = {
        Range = 'Ebony Harp +2',
    },
    Sing_Mazurka = {
        Range = 'Harlequin\'s Horn',
    },
    Sing_Minuet = {
        Range = 'Cornette +2',
    },
    Sing_March = {
        Range = 'Faerie Piccolo',
    },
    Sing_Madrigal = {
        Range = 'Traversiere +2',
    },
    Sing_Elegy = {
        Range = 'Horn +1',
    },

    Sing_Lullaby = {
        Range = 'Nursemaid\'s Harp',
        Neck = 'String Torque',
        Body = { Name = 'Chl. Jstcorps +1', Priority = 60 },
        Legs = 'Mahatma Slops',
    },
    Sing_HordeLullaby_Large = {
        Range = 'Nursemaid\'s Harp',
        Neck = 'String Torque',
        Body = { Name = 'Chl. Jstcorps +1', Priority = 60 },
        Legs = 'Mahatma Slops',
    },
    Sing_HordeLullaby_Small = {
        Range = 'Mary\'s Horn',
        Neck = 'Wind Torque',
        Body = 'Mahatma Hpl.',
        Legs = { Name = 'Chl. Cannions +1', Priority = 60 },
    },
    Sing_Finale = {
        Range = 'Military Harp',
        Neck = 'String Torque',
        Body = { Name = 'Chl. Jstcorps +1', Priority = 60 },
        Legs = 'Mahatma Slops',
    },
    Sing_Requiem = {
        Range = { Name = 'Shofar +1', Priority = 60 },
    },
    Sing_Carol = {
        Range = 'Crumhorn +2',
    },
    Sing_Mambo = {
        Range = 'Gemshorn +1',
    },
    Sing_Prelude = {
        Range = 'Angel\'s Flute +1',
    },
    Sing_Threnody = {
        Range = 'Sorrowful Harp',
        Neck = 'String Torque',
        Body = { Name = 'Chl. Jstcorps +1', Priority = 60 },
        Legs = 'Mahatma Slops',
    },
    Sing_Hymnus = {
        Range = 'Angel Lyre',
        Head = 'Darksteel Cap +1',
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 100 }, -- 8
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = 'Druid\'s Rope', -- 10
        Legs = 'Dst. Subligar +1',
        Feet = 'Mountain Gaiters', -- 5

    },
    Sing_Etude = {
        Range = 'Mythic Harp +1',
        Neck = 'String Torque',
        Body = { Name = 'Chl. Jstcorps +1', Priority = 60 },
        Legs = { Name = 'Dusk Trousers +1', Priority = 60 },
    },
    Sing_Minne = {
        Range = 'Harp +1',
        Neck = 'String Torque',
        Body = { Name = 'Chl. Jstcorps +1', Priority = 60 },
        Legs = { Name = 'Dusk Trousers +1', Priority = 60 },
    },
    Sing_Virelai = {
        Range = 'Cyt. Anglica +1',
        Neck = 'String Torque',
        Body = { Name = 'Chl. Jstcorps +1', Priority = 60 },
        Legs = 'Mahatma Slops',
    },

    Cure = {
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 }, -- 1
        Head = 'Hydra Beret', -- 8
        Neck = 'Benign Necklace', -- 2
        Ear1 = 'Novia Earring', -- 7
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = { Name = 'Hydra Doublet', Priority = 50 }, -- 9
        Hands = 'Hydra Gloves', -- 5
        Ring1 = { Name = 'Serene Ring', Priority = 10 }, -- 2
        Ring2 = { Name = 'Serene Ring', Priority = 10 }, -- 2
        Back = { Name = 'Mahatma Cape', Priority = 50 }, -- 6
        Waist = { Name = 'Penitent\'s Rope', Priority = -10 }, -- 3
        Legs = 'Hydra Brais', -- 6
        Feet = 'Hydra Gaiters', -- 5
    },
    Cursna = {
        Main = 'Prelatic Pole',
        Neck = 'Healing Torque',
        Ear2 = 'Healing Earring',
        Back = { Name = 'Altruistic Cape', Priority = 50 },
        Legs = 'Druid\'s Slops',
    },

    Enhancing = {
        Range = 'Angel Lyre',
		Head = 'Patroclus\'s Helm',
        Neck = 'Enhancing Torque',
        Ear1 = 'Augment. Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 100 },
        Body = { Name = 'Sheikh Manteel', Priority = 50 },
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Waist = 'Sonic Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 },
    },
    Stoneskin = {
        Main = 'Chanter\'s Staff',
        Range = 'Angel Lyre',
        Head = 'Maat\'s Cap',
        Neck = 'Stone Gorget',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Dvt. Mitts +1', Priority = 100 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Prism Cape',
        Waist = { Name = 'Penitent\'s Rope', Priority = -10 },
        Legs = 'Mahatma Slops',
        Feet = 'Suzaku\'s Sune-ate',
    },
    Spikes = {
        Main = 'Aquilo\'s Staff',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = 'Maat\'s Cap',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Zenith Mitts +1', Priority = 10 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Waist = { Name = 'Penitent\'s Rope', Priority = -10 },
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Rostrum Pumps', Priority = 10 },
    },

    Enfeebling = {},
    EnfeeblingMND = {},
    EnfeeblingINT = {},
    EnfeeblingACC = {},

    Banish = {},
    Dark = {},
    Stun = {},

    Nuke = {},
    NukeACC = {},
    NukeDOT = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP = {
        Range = 'Angel Lyre',
        Ammo = 'displaced',
		Head = 'Patroclus\'s Helm',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Sheikh Manteel', Priority = 50 },
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring1 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Back = 'Bard\'s Cape',
        Waist = 'Sonic Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 },
    },
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {},
    TP_NIN = {
        Ear1 = 'Stealth Earring',
    },

    Weapon_Loadout_1 = {
        Main = 'Blau Dolch',
		Sub = 'Octave Club',
        -- Do not place a Ranged weapon or Ammo in these slots or instrument switching will be disabled entirely
        Ammo = 'displaced',
    },
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},

    WS = {
        Range = 'Oliphant',
        Ammo = 'displaced',
        Head = { Name = 'Hecatomb Cap +1', Priority = 60 },
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Brd. Jstcorps +1',
        Hands = { Name = 'Hct. Mittens +1', Priority = 60 },
        Ring1 = 'Thunder Ring',
        Ring2 = 'Adroit Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Hct. Subligar +1', Priority = 60 },
        Feet = { Name = 'Hct. Leggings +1', Priority = 60 },
    },
    WS_HighAcc = {},

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {
        Ammo = 'Pebble',
    },

    VileElixir = {
        Main = { Name = 'Tutelary', Priority = 60 },
 		Sub = 'Genbu\'s Shield',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Genbu\'s Kabuto', Priority = 60 },
        Neck = { Name = 'Pch. Collar', Priority = 70 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = { Name = 'Dalmatica', Priority = 10 },
        Hands = { Name = 'Seiryu\'s Kote', Priority = 60 },
        Ring1 = { Name = 'Serket Ring', Priority = 10 },
        Ring2 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Back = { Name = 'Gigant Mantle', Priority = 60 },
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = { Name = 'Dusk Trousers +1', Priority = 60 },
        Feet = { Name = 'Rostrum Pumps', Priority = 10 },
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
sets.gaudy_harness = gaudy_harness
profile.Sets = gcmage.AppendSets(sets)

profile.HandleAbility = function()
    gcmage.DoAbility()
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
    gcmage.DoFenrirsEarring()
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'sballad','shorde','srecast'})
    gcdisplay.CreateToggle('SmallBallad', false)
    gcdisplay.CreateToggle('SmallHorde', false)
    gcdisplay.CreateToggle('SleepRecast', true)
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
    gcinclude.ClearAlias(T{'sballad','shorde','srecast'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'sballad') then
        gcdisplay.AdvanceToggle('SmallBallad')
        gcinclude.Message('SmallBallad', gcdisplay.GetToggle('SmallBallad'))
    elseif (args[1] == 'shorde') then
        gcdisplay.AdvanceToggle('SmallHorde')
        gcinclude.Message('SmallHorde', gcdisplay.GetToggle('SmallHorde'))
    elseif (args[1] == 'srecast') then
        gcdisplay.AdvanceToggle('SleepRecast')
        gcinclude.Message('SleepRecast', gcdisplay.GetToggle('SleepRecast'))
    else
        gcmage.DoCommands(args, sets)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

local MPJobs = T{ 'RDM','BLM','WHM','SMN' }

profile.HandleDefault = function()
    gcmage.DoDefault(sets, nil, whmSJMaxMP, blmSJMaxMP, rdmSJMaxMP, nil)

    local player = gData.GetPlayer()
    local isMPSJ = MPJobs:contains(player.SubJob)
    if (player.MP < 50 and isMPSJ) then
        gFunc.EquipSet('gaudy_harness')
    end

    gcmage.DoDefaultOverride()

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    local action = gData.GetAction()

    local fcv = fastCastValue
    if (player.SubJob == 'RDM' and warlocks_mantle.Back) then
       fcv = fastCastValue + 0.02
    end

    local totalfcv = fcv
    if (action.Type == 'Bard Song') then
        totalfcv = 1 - (1 - fastCastValueSong) * (1 - fcv)
    end

    gcmage.DoPrecast(sets, totalfcv, 0)
    if (fcv ~= fastCastValue) then
        gFunc.EquipSet('warlocks_mantle')
    end
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, rdmSJMaxMP, nil)

    local action = gData.GetAction()
    if (action.Type == 'Bard Song') then
        gFunc.EquipSet(sets.Sing_Default)

        if string.match(action.Name, 'Threnody') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Threnody)
        elseif string.match(action.Name, 'Elegy') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Elegy)
        elseif string.match(action.Name, 'Foe Lullaby') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Lullaby)
            if (gcdisplay.GetToggle('SleepRecast')) then
                gFunc.EquipSet(sets.Sing_Recast)
            end
        elseif string.match(action.Name, 'Horde Lullaby') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_HordeLullaby_Large)
            if (gcdisplay.GetToggle('SmallHorde')) then
                gFunc.EquipSet(sets.Sing_HordeLullaby_Small)
            end
            if (gcdisplay.GetToggle('SleepRecast')) then
                gFunc.EquipSet(sets.Sing_Recast)
            end
        elseif (action.Name == 'Magic Finale') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Finale)
        elseif string.match(action.Name, 'Requiem') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Requiem)
        elseif string.match(action.Name, 'Carol') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Carol)
        elseif string.match(action.Name, 'Ballad') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.MDT)
            gFunc.EquipSet(sets.Haste)
            gFunc.EquipSet(sets.Sing_Recast)
            gFunc.EquipSet(sets.Sing_Ballad_Large)
            if (gcdisplay.GetToggle('SmallBallad')) then
                gFunc.EquipSet(sets.Sing_Ballad_Small)
            end
        elseif string.match(action.Name, 'Minuet') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Minuet)
        elseif string.match(action.Name, 'March') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_March)
        elseif string.match(action.Name, 'Madrigal') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Madrigal)
        elseif string.match(action.Name, 'Mambo') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Mambo)
        elseif string.match(action.Name, 'Prelude') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Prelude)
        elseif string.match(action.Name, 'Hymnus') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Haste)
            gFunc.EquipSet(sets.Sing_Recast)
            gFunc.EquipSet(sets.Sing_Hymnus)
        elseif (action.Name == 'Chocobo Mazurka') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.MDT)
            gFunc.EquipSet(sets.Haste)
            gFunc.EquipSet(sets.Sing_Recast)
            gFunc.EquipSet(sets.Sing_Mazurka)
        elseif string.match(action.Name, 'Paeon') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.MDT)
            gFunc.EquipSet(sets.Haste)
            gFunc.EquipSet(sets.Sing_Recast)
            gFunc.EquipSet(sets.Sing_Paeon)
        elseif string.match(action.Name, 'Etude') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Etude)
        elseif string.match(action.Name, 'Minne') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Minne)
        elseif string.match(action.Name, 'Virelai') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Virelai)
        end
    end
end

return profile
