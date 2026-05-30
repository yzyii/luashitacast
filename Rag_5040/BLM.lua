local profile = {}

local fastCastValue = 0.04 -- 4% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = nil -- The Max MP you have when /whm in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set

local nukeExtraThreshold = 850 -- The minimum MP for which NukeExtra StoneskinExtra, and PhalanxExtra set will be used instead of regular sets (to allow additional nukes using max mp sets)

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}
local republic_circlet = {
    Head = 'Republic Circlet',
}
local opuntia_hoop = {
    Ring1 = 'Opuntia Hoop',
}
local diabolos_pole = {
    Main = 'Diabolos\'s Pole',
}
local sorcerers_ring = {
    Ring1 = 'Sorcerer\'s Ring', -- This is Ring1 instead of Ring2 to allow Ice Ring to work as well in gcmage.lua
}
local sorcerers_tonban = {
    Legs = { Name = 'Src. Tonban +1', Priority = 50 },
}

-- Disabled on horizon_safe_mode
local sorcerers_earring_hp_threshold = 424 -- HP at which Sorcerer's Earring set is equipped
local sorcerers_earring = { -- 1414
    Main = 'Terra\'s Staff',
    Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
    Head = 'Genie Tiara',
    Neck = { Name = 'Shield Pendant', Priority = 20 },
    Ear1 = { Name = 'Cassie Earring', Priority = 20 },
    Ear2 = 'Sorcerer\'s Earring',
    Body = { Name = 'Src. Coat +1', Priority = 70 },
    Hands = { Name = 'Feronia\'s Bangles', Priority = 60 },
    Ring1 = { Name = 'Bomb Queen Ring', Priority = 60 },
    Ring2 = { Name = 'Sattva Ring', Priority = 60 },
    Back = { Name = 'Gigant Mantle', Priority = 60 },
    Waist = { Name = 'Powerful Rope', Priority = 70 },
    Legs = { Name = 'Silk Slacks +1', Priority = 60 },
    Feet = { Name = 'Root Sabots', Priority = 60 },
}

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = 'Genie Tiara',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Dalmatica', Priority = 10 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Umbra Cape',
        Waist = { Name = 'Penitent\'s Rope', Priority = -20 },
        Legs = 'Genie Lappas',
        Feet = { Name = 'Herald\'s Gaiters', Priority = 50 },
    },
    IdleALT = {},
    IdleMaxMP = {
        Head = { Name = 'Faerie Hairpin', Priority = 30 },
        Neck = { Name = 'Uggalepih Pendant', Priority = 50 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Back = { Name = 'Mahatma Cape', Priority = 50 },
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = { Name = 'Src. Tonban +1', Priority = 50 },
    },
    Resting = {
        Main = 'Pluto\'s Staff',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = 'Hydra Beret',
        Neck = { Name = 'Pch. Collar', Priority = 60 },
        Ear1 = 'Relaxing Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = 'Mahatma Hpl.',
        Hands = 'Hydra Gloves',
        Ring1 = { Name = 'Serket Ring', Priority = 10 },
        Ring2 = { Name = 'Vivian Ring', Priority = 10 },
        Back = { Name = 'Mahatma Cape', Priority = 50 },
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    Town = {},
    Movement = {
        Feet = { Name = 'Herald\'s Gaiters', Priority = 50 },
    },
    Movement_TP = {},

    DT = {
        Main = 'Terra\'s Staff',
        Head = 'Genie Tiara',
        Body = { Name = 'Src. Coat +1', Priority = 70 },
        Ring1 = 'Jelly Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Umbra Cape',
        Waist = { Name = 'Sorcerer\'s Belt', Priority = 60 },
        Legs = 'Genie Lappas',
    },
    DTNight = {},
    MDT = {
        Main = 'Terra\'s Staff',
        Head = 'Dream Ribbon',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Dalmatica', Priority = 10 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Hexerei Cape',
        Waist = { Name = 'Sorcerer\'s Belt', Priority = 60 },
        Feet = { Name = 'Root Sabots', Priority = 60 },
    },
    FireRes = {
        Main = 'Neptune\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = { Name = 'Dalmatica', Priority = 10 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Water Belt', -- 20
        Legs = { Name = 'Silk Slacks +1', Priority = 60 },        
        Feet = 'Power Sandals', -- 7
    },
    IceRes = {
        Main = 'Vulcan\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Omn. Earring', -- 11
        Ear2 = 'Omn. Earring', -- 11
        Body = { Name = 'Dalmatica', Priority = 10 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
        Back = { Name = 'Aurora Mantle +1', Priority = 50 }, -- 8
        Waist = 'Fire Belt', -- 20
        Legs = { Name = 'Silk Slacks +1', Priority = 60 },
        Feet = 'T.M. Pigaches +2', -- 10
    },
    LightningRes = {
        Main = 'Terra\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = { Name = 'Dalmatica', Priority = 10 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Adroit Ring', -- 10
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Earth Belt', -- 20
        Legs = { Name = 'Silk Slacks +1', Priority = 60 },
        Feet = { Name = 'Root Sabots', Priority = 60 },
    },
    EarthRes = {
        Main = 'Auster\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = { Name = 'Dalmatica', Priority = 10 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Robust Ring', -- 10
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Blue Cape +1', -- 7
        Waist = 'Wind Belt', -- 20
        Legs = { Name = 'Silk Slacks +1', Priority = 60 },
        Feet = 'Cmb.Cst. Shoes', -- 4
    },
    WindRes = {
        Main = 'Aquilo\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Omn. Earring', -- 11
        Ear2 = 'Omn. Earring', -- 11
        Body = { Name = 'Dalmatica', Priority = 10 },
        Hands = 'Mage\'s Cuffs', -- 5
        Ring1 = 'Nimble Ring', -- 10
        Ring2 = 'Malgust Ring', -- 10
        Back = { Name = 'Aurora Mantle +1', Priority = 50 }, -- 8
        Waist = 'Ice Belt', -- 20
        Legs = { Name = 'Silk Slacks +1', Priority = 60 },
        Feet = 'Air Solea +1', -- 4
    },
    WaterRes = {
        Main = 'Jupiter\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = { Name = 'Dalmatica', Priority = 10 },
        Hands = 'Silk Cuffs +1', -- 7
        Ring1 = 'Communion Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = 'Blue Cape +1', -- 7
        Waist = 'Lightning Belt', -- 20
        Legs = { Name = 'Silk Slacks +1', Priority = 60 },
        Feet = { Name = 'Root Sabots', Priority = 60 },
    },
    Evasion = {},
    Override = { -- An additional override set explicitly to be used for sets such as crafting, HELM, fishing, or any other special sets such as DRK 2HR, MNK Counter etc. n.b. Any unused Resist or Evasion set can be used similarly.
        Body = 'Field Tunica',
        Hands = 'Field Gloves',
        Legs = 'Field Hose',
        Feet = 'Field Boots'
    },

    Precast = {
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Feet = { Name = 'Rostrum Pumps', Priority = 10 },
    },
    SIRD = { -- Override sets (Resistance / Evasion) take precedence if in use.
        Main = { Name = 'Eremite\'s Wand +1', Priority = 50 }, -- 25
        Sub = 'Genbu\'s Shield',
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 }, -- 8
        Back = 'Shadow Mantle',
        Waist = 'Druid\'s Rope', -- 10
        Feet = { Name = 'Wizard\'s Sabots', Priority = 50 }, -- 20
    },
    SIRD_NIN = {
        Sub = { Name = 'Eremite\'s Wand +1', Priority = 50 },
    },
    Haste = {
        Head = 'Nashira Turban',
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Body = 'Nashira Manteel',
        Hands = 'Nashira Gages',
        Back = 'Shadow Mantle',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Nashira Crackows',
    },
    ConserveMP = {
        Ammo = { Name = 'Dream Sand', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = 'Genie Weskit',
        Back = 'Maledictor\'s Shawl',
        Feet = { Name = 'Src. Sabots +1', Priority = 50 },
    },

    Cure = {
        Ammo = { Name = 'Dream Sand', Priority = 50 },
        Head = 'Hydra Beret', -- 8
        Neck = 'Benign Necklace', -- 2
        Ear1 = 'Novia Earring', -- 7
        Ear2 = 'Magnetic Earring',
        Body = { Name = 'Hydra Doublet', Priority = 50 }, -- 9
        Hands = 'Hydra Gloves', -- 5
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = { Name = 'Mahatma Cape', Priority = 50 }, -- 6
        Waist = { Name = 'Penitent\'s Rope', Priority = -20 }, -- 3
        Legs = 'Hydra Brais', -- 6
        Feet = 'Hydra Gaiters', -- 5
    },
    Cursna = {
        Main = 'Prelatic Pole',
        Neck = 'Healing Torque',
        Ear2 = 'Healing Earring',
        Body = 'Nashira Manteel',
        Back = { Name = 'Altruistic Cape', Priority = 50 },
        Legs = 'Druid\'s Slops',
    },

    Enhancing = {
        Main = { Name = 'Eremite\'s Wand +1', Priority = 50 },
        Sub = 'Genbu\'s Shield',
        Ammo = { Name = 'Dream Sand', Priority = 50 },
        Head = 'Nashira Turban',
        Neck = 'Enhancing Torque',
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = 'Nashira Manteel',
        Hands = 'Nashira Gages',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Genie Huaraches',
    },
    Stoneskin = {
        Head = 'Maat\'s Cap',
        Neck = 'Stone Gorget',
        Ear1 = 'Cmn. Earring',
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Dvt. Mitts +1', Priority = 50 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Shadow Mantle',
        Waist = 'Druid\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Mahatma Pigaches', Priority = 10 },
    },
    StoneskinExtra = {
        Main = 'Mythic Wand +1',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Zenith Crown +1', Priority = 10 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = 'Cmn. Earring',
        Ring1 = { Name = 'Vivian Ring', Priority = 10 },
        Back = { Name = 'Mahatma Cape', Priority = 50 },
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
    },
    PhalanxExtra = {
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Zenith Crown +1', Priority = 10 },
        Body = { Name = 'Hydra Doublet', Priority = 50 },
        Hands = { Name = 'Src. Gloves +1', Priority = 50 },
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = { Name = 'Src. Tonban +1', Priority = 50 },
    },
    Spikes = {
        Main = 'Kirin\'s Pole',
        Sub = 'displaced',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = 'Maat\'s Cap',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Zenith Mitts +1', Priority = 10 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Waist = { Name = 'Sorcerer\'s Belt', Priority = 60 },
        Legs = 'Mahatma Slops',
    },

    Enfeebling = {
        Head = 'Genie Tiara',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Enfeebling Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = { Name = 'Wzd. Coat +1', Priority = 50 },
        Hands = 'Nashira Gages',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Vivian Ring', Priority = 10 },
        Back = { Name = 'Altruistic Cape', Priority = 50 },
        Waist = 'Swift Belt',
        Legs = 'Genie Lappas',
        Feet = 'Nashira Crackows',
    },
    EnfeeblingMND = {
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Ear2 = 'Cmn. Earring',
        Hands = { Name = 'Dvt. Mitts +1', Priority = 50 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Waist = { Name = 'Penitent\'s Rope', Priority = -20 },
        Feet = { Name = 'Mahatma Pigaches', Priority = 10 },
    },
    EnfeeblingINT = {
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Ear2 = 'Omn. Earring',
        Hands = { Name = 'Mahatma Cuffs', Priority = 10 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Waist = { Name = 'Sorcerer\'s Belt', Priority = 60 },
        Feet = { Name = 'Src. Sabots +1', Priority = 50 },
    },
    EnfeeblingACC = {},

    Banish = {},
    Dark = {
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Dark Earring',
        Ear2 = 'Omn. Earring',
        Body = 'Nashira Manteel',
        Hands = { Name = 'Src. Gloves +1', Priority = 50 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Waist = { Name = 'Sorcerer\'s Belt', Priority = 60 },
        Legs = { Name = 'Wzd. Tonban +1', Priority = 50 },
        Feet = 'Genie Huaraches',
    },
    Stun = {
        Ear2 = { Name = 'Loquac. Earring', Priority = 50 },
        Hands = 'Nashira Gages',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Nashira Crackows',
    },

    Yellow = { -- This will override Precast if /lag is turned on or the spell casting time is too short. e.g. Tier 1: "Stone"
    },
    YellowHNM = {
    },

    Nuke = {
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = 'Maat\'s Cap',
        Neck = 'Prudence Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Genie Weskit',
        Hands = { Name = 'Zenith Mitts +1', Priority = 10 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = { Name = 'Prism Cape', Priority = 70 },
        Waist = { Name = 'Sorcerer\'s Belt', Priority = 60 },
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Src. Sabots +1', Priority = 50 },
    },
    NukeHNM = {
        Head = { Name = 'Wzd. Petasos +1', Priority = 50 },
        Ear2 = 'Novia Earring',
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Wzd. Gloves +1', Priority = 50 },
        Back = { Name = 'Mahatma Cape', Priority = 50 },
        Waist = { Name = 'Penitent\'s Rope', Priority = -20 },
    },
    NukeACC = {
        Head = { Name = 'Src. Petasos +1', Priority = 50 },
        Neck = 'Elemental Torque',
        Hands = { Name = 'Wzd. Gloves +1', Priority = 50 },
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Feet = 'Nashira Crackows',
    },
    NukeDOT = {
        Main = 'Kirin\'s Pole',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = 'Maat\'s Cap',
        Neck = 'Prudence Torque',
        Ear1 = 'Omn. Earring',
        Ear2 = 'Omn. Earring',
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Wzd. Gloves +1', Priority = 50 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = { Name = 'Prism Cape', Priority = 70 },
        Waist = { Name = 'Sorcerer\'s Belt', Priority = 60 },
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Src. Sabots +1', Priority = 50 },
    },
    NukeExtra = {
        Head = { Name = 'Zenith Crown +1', Priority = 100 },
        Ring1 = { Name = 'Serket Ring', Priority = 10 },
        Ring2 = { Name = 'Vivian Ring', Priority = 10 },
        Back = { Name = 'Merciful Cape', Priority = 50 },
    },
    MB = {
        Ammo = { Name = 'Dream Sand', Priority = 50 },
        Hands = { Name = 'Src. Gloves +1', Priority = 50 },
        Back = 'Maledictor\'s Shawl',
    },
    MBHNM = {
        Hands = { Name = 'Wzd. Gloves +1', Priority = 50 },
        Back = { Name = 'Mahatma Cape', Priority = 50 },
    },

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {
        Ammo = 'Pebble',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    VileElixir = {
        Main = 'Terra\'s Staff',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Faerie Hairpin', Priority = 30 },
        Neck = { Name = 'Uggalepih Pendant', Priority = 50 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = { Name = 'Hydra Doublet', Priority = 50 },
        Hands = { Name = 'Zenith Mitts +1', Priority = 10 },
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Ring2 = { Name = 'Serket Ring', Priority = 10 },
        Back = { Name = 'Mahatma Cape', Priority = 50 },
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = { Name = 'Src. Tonban +1', Priority = 50 },
        Feet = { Name = 'Herald\'s Gaiters', Priority = 50 },
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
sets.republic_circlet = republic_circlet
sets.opuntia_hoop = opuntia_hoop
sets.diabolos_pole = diabolos_pole
sets.sorcerers_ring = sorcerers_ring
sets.sorcerers_tonban = sorcerers_tonban
sets.sorcerers_earring = sorcerers_earring
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
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'extra'})
    gcdisplay.CreateToggle('Extra', false)
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
    gcinclude.ClearAlias(T{'extra'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'extra') then
        gcdisplay.AdvanceToggle('Extra')
        gcinclude.Message('Extra', gcdisplay.GetToggle('Extra'))
    else
        gcmage.DoCommands(args, sets)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmage.DoDefault(sets, ninSJMaxMP, whmSJMaxMP, nil, rdmSJMaxMP, nil)

    local spikes = gData.GetBuffCount('Blaze Spikes') + gData.GetBuffCount('Shock Spikes') + gData.GetBuffCount('Ice Spikes')
    local isPhysical = gcdisplay.IdleSet == 'Normal' or gcdisplay.IdleSet == 'Alternate' or gcdisplay.IdleSet == 'DT'
    if (spikes > 0 and isPhysical) then
        gFunc.EquipSet('opuntia_hoop')
    end

    local player = gData.GetPlayer()
    if (not gcinclude.horizon_safe_mode) then
        if (player.HP <= sorcerers_earring_hp_threshold) then
            gFunc.EquipSet('sorcerers_earring')
        end
    end

    gcmage.DoDefaultOverride()

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == 'RDM' and warlocks_mantle.Back) then
        gcmage.DoPrecast(sets, fastCastValue + 0.02, 0)
        gFunc.EquipSet('warlocks_mantle')
    else
        gcmage.DoPrecast(sets, fastCastValue, 0)
    end
end

local ElementalDebuffs = T{ 'Burn','Rasp','Drown','Choke','Frost','Shock' }

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, nukeExtraThreshold, rdmSJMaxMP, nil)

    local player = gData.GetPlayer()
    local action = gData.GetAction()
    if (republic_circlet.Head) then
        if (action.Skill == 'Elemental Magic' and gcdisplay.GetCycle('Mode') == 'Potency') then
            if (gcdisplay.GetToggle('Extra') and player.MP >= nukeExtraThreshold) then
                do return end
            end
            if (not ElementalDebuffs:contains(action.Name)) then
                if (conquest:GetInsideControl() and gcdisplay.GetToggle('HNM') == false and gcdisplay.GetCycle('Mode') ~= 'Accuracy') then
                    print(chat.header('LAC - BLM'):append(chat.message('In Region - Using Republic Circlet')))
                    gFunc.EquipSet('republic_circlet')
                end
            end
        end
    end
end

return profile
