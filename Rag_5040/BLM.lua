local profile = {}

local fastCastValue = 0.04 -- 4% from gear listed in Precast set

local ninSJMaxMP = 650 -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = 728 -- The Max MP you have when /whm in your idle set
local rdmSJMaxMP = 709 -- The Max MP you have when /rdm in your idle set

local nukeExtraThreshold = 850 -- The minimum MP for which NukeExtra StoneskinExtra, and PhalanxExtra set will be used instead of regular sets (to allow additional nukes using max mp sets)

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}
local republic_circlet = {
    -- Head = 'Republic Circlet',
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
    Legs = 'Src. Tonban +1',
}

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Ammo = 'Dream Sand',
        Head = 'Genie Tiara',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Src. Coat +1', Priority = 100 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = 'Umbra Cape',
        Waist = { Name = 'Penitent\'s Rope', Priority = -100 },
        Legs = 'Igqira Lappas',
        Feet = 'Herald\'s Gaiters',
    },
    IdleALT = {},
    IdleMaxMP = {
        Ammo = { Name = 'Hedgehog Bomb', Priority = 100 },
        Neck = { Name = 'Uggalepih Pendant', Priority = 100 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 100 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 100 },
        Hands = { Name = 'Zenith Mitts +1', Priority = 100 },
        Waist = { Name = 'Hierarch Belt', Priority = 100 },
        Legs = { Name = 'Src. Tonban +1', Priority = 100 },
        Back = { Name = 'Merciful Cape', Priority = 100 },
    },
    Resting = {
        Main = 'Pluto\'s Staff',
        Head = 'Hydra Beret',
        Neck = 'Pch. Collar',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Hydra Gloves',
        Ring1 = 'Serket Ring',
        Back = 'Mahatma Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    Town = {
        Main = 'Terra\'s Staff',
        Head = 'Src. Petasos +1',
        Body = 'Src. Coat +1',
        Hands = 'Zenith Mitts +1',
        Legs = 'Src. Tonban +1',
        Feet = 'Herald\'s Gaiters',
    },
    Movement = {
        Feet = 'Herald\'s Gaiters',
    },

    DT = {
        Main = 'Terra\'s Staff',
        Head = 'Genie Tiara',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Src. Coat +1', Priority = 100 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Igqira Lappas',
        Feet = 'Mountain Gaiters',
    },
    DTNight = {
        Main = 'Terra\'s Staff',
        Head = 'Genie Tiara',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Src. Coat +1', Priority = 100 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Igqira Lappas',
        Feet = 'Mountain Gaiters',
    },
    MDT = {
        Main = 'Terra\'s Staff',
        Head = 'Black Ribbon',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring', -- 2
        Body = { Name = 'Src. Coat +1', Priority = 100 },
        Hands = 'Merman\'s Bangles', -- 3
        Ring1 = 'Merman\'s Ring', -- 4 -- Using this over Shadow Ring for consistency
        Ring2 = { Name = 'Sattva Ring', Priority = 100 }, -- 5
        Back = { Name = 'Hexerei Cape', Priority = 100 }, -- 3
        Waist = { Name = 'Sorcerer\'s Belt', Priority = 100 },
        Legs = 'Igqira Lappas',
        Feet = 'Mountain Gaiters',
    },
    FireRes = {
        Main = 'Neptune\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Water Belt', -- 20
        Legs = 'Igqira Lappas',
        Feet = 'Power Sandals', -- 7
    },
    IceRes = {
        Main = 'Vulcan\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
        Back = 'Aurora Mantle +1', -- 8
        Waist = 'Fire Belt', -- 20
        Legs = 'Igqira Lappas',
        Feet = 'Mountain Gaiters',
    },
    LightningRes = {
        Main = 'Terra\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Spinel Ring', -- 9
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Earth Belt', -- 20
        Legs = 'Igqira Lappas',
        Feet = 'Mountain Gaiters',
    },
    EarthRes = {
        Main = 'Auster\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Robust Ring', -- 10
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Wind Belt', -- 20
        Legs = 'Igqira Lappas',
        Feet = 'Mountain Gaiters',
    },
    WindRes = {
        Main = 'Aquilo\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Hands = 'Mage\'s Cuffs', -- 5
        Ring1 = 'Emerald Ring', -- 9
        Ring2 = 'Malgust Ring', -- 10
        Back = 'Aurora Mantle +1', -- 8
        Waist = 'Ice Belt', -- 20
        Legs = 'Igqira Lappas',
        Feet = 'Mountain Gaiters',
    },
    WaterRes = {
        Main = 'Jupiter\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Communion Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Lightning Belt', -- 20
        Legs = 'Igqira Lappas',
        Feet = 'Mountain Gaiters',
    },
    Evasion = {},

    Precast = {
        Ear1 = 'Loquac. Earring',
        Feet = 'Rostrum Pumps',
    },
    Casting = { -- Default SIRD used for Idle sets
        Main = 'Eremite\'s Wand', -- 25
        Sub = 'Genbu\'s Shield',
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Waist = 'Silver Obi +1', -- 8
        Feet = 'Wizard\'s Sabots', -- 20
        Ammo = 'Tiphia Sting',
        Back = 'Umbra Cape',
    },
    SIRD = { -- Used on Stoneskin, Blink, Aquaveil and Utsusemi casts regardless of Override set. If you wish to remain in FireRes etc. during casts, leave empty.
        Main = 'Eremite\'s Wand', -- 25
        Sub = 'Genbu\'s Shield',
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Waist = 'Silver Obi +1', -- 8
        Feet = 'Wizard\'s Sabots', -- 20
        Ammo = 'Tiphia Sting',
        Back = 'Umbra Cape',
    },
    Yellow = { -- This will override Precast if /lag is turned on or the spell casting time is too short. e.g. Tier 1: "Stone"
        Ammo = 'Tiphia Sting', -- 25
        Head = 'Zenith Crown +1', -- 55
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Loquac. Earring', 
        Ear2 = 'Magnetic Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Zenith Mitts +1', -- 55
        Ring1 = 'Ether Ring', -- 30
        Ring2 = 'Serket Ring', -- 50
        Back = { Name = 'Prism Cape', Priority = 100 }, -- -10
        Waist = { Name = 'Penitent\'s Rope', Priority = -100 }, -- 20
        Legs = 'Igqira Lappas',
        Feet = 'Rostrum Pumps', -- 30
    },
    YellowHNM = {
        Back = 'Umbra Cape',
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Head = 'Nashira Turban', -- 2
        Ear1 = 'Loquac. Earring',
        Body = 'Nashira Manteel', -- 3
        Hands = 'Nashira Gages', -- 1
        Waist = 'Swift Belt', -- 4
        Legs = 'Nashira Seraweels', -- 2
        Feet = 'Nashira Crackows', -- 1
    },
    ConserveMP = {
        Ammo = 'Dream Sand',
        Ear2 = 'Magnetic Earring',
        Body = 'Igqira Weskit',
        Back = 'Maledictor\'s Shawl',
        Feet = 'Src. Sabots +1',
    },

    Cure = {
        Ammo = 'Dream Sand',
        Head = 'Hydra Beret', -- 8
        Neck = 'Benign Necklace', -- 2
        Ear1 = 'Novia Earring', -- 7
        Ear2 = 'Magnetic Earring',
        Body = 'Hydra Doublet', -- 9
        Hands = 'Hydra Gloves', -- 5
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Mahatma Cape', -- 5
        Waist = 'Penitent\'s Rope', -- 3
        Legs = 'Hydra Brais', -- 6
        Feet = 'Hydra Gaiters', -- 5
    },
    Cursna = {
        Back = 'Altruistic Cape',
    },

    Enhancing = {
        Main = 'Kirin\'s Pole',
        Ammo = 'Hedgehog Bomb',
        Head = 'Nashira Turban',
        Neck = 'Enhancing Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Igqira Huaraches',
    },
    Stoneskin = {
        Main = 'Kirin\'s Pole',
        Ammo = 'Hedgehog Bomb',
        Head = 'Nashira Turban',
        Neck = 'Stone Gorget',
        Ear1 = { Name = 'Loquac. Earring', Priority = 100 },
        Ear2 = 'Cmn. Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Waist = 'Swift Belt',
        Back = { Name = 'Mahatma Cape', Priority = 100 },
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Mahatma Pigaches', Priority = 100 },
    },
    StoneskinExtra = {
        Main = 'Kirin\'s Pole',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 100 },
        Head = { Name = 'Zenith Crown +1', Priority = 100 },
        Neck = 'Stone Gorget',
        Ear1 = { Name = 'Loquac. Earring', Priority = 100 },
        Ear2 = 'Cmn. Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Dvt. Mitts +1',
        Ring1 = { Name = 'Serket Ring', Priority = 100 },
        Ring2 = 'Communion Ring',
        Back = { Name = 'Mahatma Cape', Priority = 100 },
        Waist = { Name = 'Hierarch Belt', Priority = 100 },
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Mahatma Pigaches', Priority = 100 },
    },
    PhalanxExtra = {
        Main = 'Eremite\'s Wand',
        Sub = 'Genbu\'s Shield',
        Ammo = 'Hedgehog Bomb',
        Head = 'Zenith Crown +1',
        Neck = 'Enhancing Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Hydra Doublet',
        Hands = 'Src. Gloves +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Merciful Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Src. Tonban +1',
        Feet = 'Src. Sabots +1',
    },
    Spikes = {
        Main = 'Kirin\'s Pole',
        Ammo = 'Phtm. Tathlum',
        Head = 'Maat\'s Cap',
        Neck = 'Enhancing Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Merciful Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Src. Sabots +1',
    },

    Enfeebling = {
        Head = 'Genie Tiara',
        Neck = 'Enfeebling Torque',
        Body = 'Wzd. Coat +1',
        Legs = 'Igqira Lappas',
        Hands = 'Nashira Gages',
        Feet = 'Nashira Crackows',
    },
    EnfeeblingMND = {
        Ammo = 'Hedgehog Bomb',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Waist = 'Penitent\'s Rope',
        Feet = 'Mahatma Pigaches',
    },
    EnfeeblingINT = {
        Ammo = 'Phtm. Tathlum',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Omn. Earring',
        Hands = 'Mahatma Cuffs',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Waist = 'Sorcerer\'s Belt',
        Feet = 'Src. Sabots +1',
    },
    EnfeeblingACC = {
        Ear2 = 'Enfeebling Earring',
        Back = 'Altruistic Cape',
    },

    Divine = {},
    Banish = {},
    Dark = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Dark Earring',
        Body = 'Nashira Manteel',
        Hands = 'Src. Gloves +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Merciful Cape',
        Waist = 'Swift Belt',
        Legs = 'Wzd. Tonban +1',
        Feet = 'Igqira Huaraches',
    },
    Stun = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear1 = 'Loquac. Earring',
        Body = 'Nashira Manteel',
        Hands = 'Nashira Gages',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Merciful Cape',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Nashira Crackows',
    },

    Nuke = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Maat\'s Cap',
        Neck = 'Prudence Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Igqira Weskit',
        Hands = { Name = 'Zenith Mitts +1', Priority = -100 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Prism Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Src. Sabots +1', Priority = 1 },
    },
    NukeHNM = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Wzd. Petasos +1', -- 4
        Neck = 'Prudence Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Novia Earring', -- 7
        Body = 'Mahatma Hpl.', -- 4
        Hands = 'Wzd. Gloves +1', -- 2
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Mahatma Cape', -- 5
        Waist = 'Penitent\'s Rope', -- 3
        Legs = 'Mahatma Slops', -- 4
        Feet = 'Src. Sabots +1', -- 3
    },
    NukeACC = {
        Head = 'Src. Petasos +1',
        Neck = 'Elemental Torque',
        Hands = 'Wzd. Gloves +1',
        Back = 'Merciful Cape',
        Feet = 'Nashira Crackows',
    },
    NukeDOT = {
        Main = 'Kirin\'s Pole',
        Ammo = 'Phtm. Tathlum',
        Head = 'Maat\'s Cap',
        Neck = 'Prudence Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Omn. Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Wzd. Gloves +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Prism Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Src. Sabots +1',
    },
    NukeExtra = {
        Ammo = 'Phtm. Tathlum',
        Head = { Name = 'Zenith Crown +1', Priority = 100 },
        Neck = 'Prudence Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Igqira Weskit',
        Hands = { Name = 'Zenith Mitts +1', Priority = 100 },
        Ring1 = 'Snow Ring',
        Ring2 = { Name = 'Serket Ring', Priority = 100 },
        Back = { Name = 'Merciful Cape', Priority = 100 },
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Src. Sabots +1',
    },
    MB = {
        Ammo = 'Dream Sand',
        Hands = 'Src. Gloves +1',
        Back = 'Maledictor\'s Shawl',
    },
    MBHNM = {
        Hands = 'Wzd. Gloves +1',
        Back = 'Mahatma Cape',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},
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
profile.Sets = gcmage.AppendSets(sets)

profile.HandleAbility = function()
    gcmage.DoAbility()
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
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
    gcmage.DoDefault(ninSJMaxMP, whmSJMaxMP, nil, rdmSJMaxMP, nil)

    local spikes = gData.GetBuffCount('Blaze Spikes') + gData.GetBuffCount('Shock Spikes') + gData.GetBuffCount('Ice Spikes')
    local isPhysical = gcdisplay.IdleSet == 'Normal' or gcdisplay.IdleSet == 'Alternate' or gcdisplay.IdleSet == 'DT'
    if (spikes > 0 and isPhysical) then
        gFunc.EquipSet('opuntia_hoop')
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == 'RDM' and warlocks_mantle.Back) then
        gcmage.DoPrecast(sets, fastCastValue + 0.02)
        gFunc.EquipSet('warlocks_mantle')
    else
        gcmage.DoPrecast(sets, fastCastValue)
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
