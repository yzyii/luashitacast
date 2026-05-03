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
local medicine_earring_hp_threshold = 360 -- HP at which Medicine Earring set is equipped
local medicine_earring = { -- 1440
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
        Feet = { Name = 'Root Sabots', Priority = 20 },
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},
    Override = { -- Toggled with either /override or /or. Overrides idle set. Used for sets such as crafting, HELM, fishing, virtue stone, and more.
        Body = 'Field Tunica',
        Hands = 'Field Gloves',
        Legs = 'Field Hose',
        Feet = 'Field Boots'
    },

    Precast = {
        Ear1 = { Name = 'Loquac. Earring', Priority = 10 },
        Feet = { Name = 'Rostrum Pumps', Priority = 5 },
    },
    SIRD = { -- Used on Stoneskin, Blink, Aquaveil and Utsusemi casts regardless of Override set. If you wish to remain in FireRes etc. during casts, leave empty.
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
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
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
        Head = { Name = 'Rival Ribbon', Priority = 10 }, -- 2
        Neck = 'Harmonia\'s Torque', -- 3
        Ear1 = 'Eris\' Earring +1', -- 3
        Ear2 = 'Eris\' Earring +1', -- 3
        Hands = 'Merman\'s Bangles',
        Body = 'Nashira Manteel',
        Ring1 = { Name = 'Sattva Ring', Priority = 20 }, -- 5
        Ring2 = 'Mermaid Ring', -- 2
        Legs = 'Nashira Seraweels',
        Feet = 'Nashira Crackows',
        Back = 'Toreador\'s Cape', -- 4
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
        Waist = 'Druid\'s Rope', -- 10
        Legs = { Name = 'Bls. Trousers +1', Priority = 10 },
        Feet = { Name = 'Hlr. Duckbills +1', Priority = 10 },
    },
    Cheat_C4HPDown = {
        Ammo = 'Tiphia Sting',
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
        Head = { Name = 'Rival Ribbon', Priority = 10 }, -- 2
        Neck = 'Harmonia\'s Torque', -- 3
        Ear1 = 'Eris\' Earring +1', -- 3
        Ear2 = 'Eris\' Earring +1', -- 3
        Body = { Name = 'Aristocrat\'s Coat', Priority = 10 },
        Hands = 'Merman\'s Bangles',
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 20 },
        Ring2 = { Name = 'Sattva Ring', Priority = 20 }, -- 5
        Back = { Name = 'Gigant Mantle', Priority = 20 },
        Waist = { Name = 'Powerful Rope', Priority = 30 },
        Legs = 'Nashira Seraweels',
        Feet = { Name = 'Root Sabots', Priority = 20 },
    },

    Yellow = {},
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
        Head = 'Hydra Beret', -- 8
        Neck = 'Ajari Necklace',
        Ear1 = 'Novia Earring', -- 7
        Ear2 = 'Cmn. Earring',
        Body = { Name = 'Aristocrat\'s Coat', Priority = 10 },
        Hands = { Name = 'Hlr. Mitts +1', Priority = 10 }, -- 4
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = { Name = 'Mahatma Cape', Priority = 10 }, -- 6
        Waist = { Name = 'Penitent\'s Rope', Priority = -5 }, -- 3
        Legs = { Name = 'Bls. Trousers +1', Priority = 10 }, -- 6
        Feet = { Name = 'Blessed Pumps +1', Priority = 10 }, -- 5
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
        Neck = 'Stone Gorget',
            Ear1 = { Name = 'Loquac. Earring', Priority = 10 },
            Ear1 = 'Cmn. Earring',
            Body = 'Mahatma Hpl.',
        Back = 'Shadow Mantle',
            Ring1 = 'Aqua Ring',
            Ring2 = 'Communion Ring',
            Feet = { Name = 'Hlr. Duckbills +1', Priority = 10 },
    },
    Spikes = {},
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
        Ammo = { Name = 'Holy Ampulla', Priority = 10 },
        Head = 'Nashira Turban',
        Neck = 'Divine Torque',
        Ear1 = 'Divine Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Nashira Manteel',
        Hands = { Name = 'Blessed Mitts +1', Priority = 10 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = { Name = 'Altruistic Cape', Priority = 10 },
        Waist = { Name = 'Cleric\'s Belt', Priority = 10 },
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Clr. Duckbills +1', Priority = 10 },
    },
    Banish = {
        Neck = 'Ajari Necklace',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Novio Earring',
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Zenith Mitts +1', Priority = 5 },
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

    TP = {},
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {},
    TP_NIN = {},

    WS = {},
    WS_HighAcc = {},
    WS_Randgrith = {},

    Weapon_Loadout_1 = {},
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {
        Ammo = 'Pebble',
    },

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
