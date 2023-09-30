local profile = {}

local fastCastValue = 0.42 -- 20% from traits 22% from gear

local ninSJMaxMP = 605 -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = 683 -- The Max MP you have when /whm in your idle set
local blmSJMaxMP = 702 -- The Max MP you have when /blm in your idle set

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Head = 'Dls. Chapeau +1',
        Neck = 'Dark Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = {
        Main = 'Terra\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Head = 'Dls. Chapeau +1',
        Neck = 'Dark Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Dst. Leggings +1',
    },
    IdleMaxMP = {
        Main = 'Terra\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Head = 'Dls. Chapeau +1',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Duelist\'s Tabard',
        Hands = 'Blood Fng. Gnt.',
        Ring1 = 'Serket Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Blood Greaves',
    },
    Resting = {
        Main = 'Pluto\'s Staff',
        Head = 'Dls. Chapeau +1',
        Neck = 'Checkered Scarf',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Mahatma Hpl.',
        Back = 'Errant Cape',
        Waist = 'Duelist\'s Belt',
        Legs = 'Baron\'s Slops',
    },
    Town = {},
    Movement = {
        Head = 'Dls. Chapeau +1',
        Legs = 'Blood Cuisses',
    },

    DT = {
        Main = 'Terra\'s Staff', -- 20
        Ammo = 'Hedgehog Bomb',
        Head = 'Dls. Chapeau +1',
        Neck = 'Dark Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1', -- 4
        Hands = 'Dst. Mittens +1', -- 2
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Umbra Cape', -- 6
        Waist = 'Warwolf Belt',
        Legs = 'Dst. Subligar +1', -- 3
        Feet = 'Dst. Leggings +1', -- 2
    },
    DTNight = {
        Main = 'Terra\'s Staff', -- 20
        Ammo = 'Hedgehog Bomb',
        Head = 'Dls. Chapeau +1',
        Neck = 'Dark Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1', -- 4
        Hands = 'Dst. Mittens +1', -- 2
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Umbra Cape', -- 12
        Waist = 'Warwolf Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Dst. Leggings +1', -- 2
    },
    MDT = { -- Shell IV provides 23% MDT
        Main = 'Terra\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Head = 'Dls. Chapeau +1',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring', -- 2
        Body = 'Cor. Scale Mail +1', -- 4
        Hands = 'Coral Fng. Gnt. +1', -- 2
        Ring1 = 'Merman\'s Ring', -- 4
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Hexerei Cape', -- 3
        Waist = 'Warwolf Belt',
        Legs = 'Coral Cuisses +1', -- 3
        Feet = 'Coral Greaves +1', -- 2
    },
    FireRes = { -- 143
        Main = 'Neptune\'s Staff', -- 20
        Ammo = 'Hedgehog Bomb',
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Scp. Breastplate', -- 9
        Hands = 'Scp. Gauntlets', -- 5
        Ring1 = 'Ruby Ring', -- 9
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Water Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Power Sandals', -- 7
    },
    IceRes = { -- 141
        Main = 'Vulcan\'s Staff', -- 20
        Ammo = 'Hedgehog Bomb',
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Diamond Earring', -- 10
        Body = 'Northern Jerkin', -- 6
        Hands = 'Feral Gloves', -- 4
        Ring1 = 'Diamond Ring', -- 9
        Ring2 = 'Malfrost Ring', -- 10
        Back = 'Tundra Mantle', -- 5
        Waist = 'Fire Belt', -- 20
        Legs = 'Feral Trousers', -- 6
        Feet = 'Blood Greaves', -- 21
    },
    LightningRes = { -- 133
        Main = 'Terra\'s Staff', -- 20
        Range = 'Lightning Bow +1', -- 7
        Ammo = '',
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Topaz Earring', -- 10
        Ear2 = 'Topaz Earring', -- 10
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Spinel Ring', -- 9
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Lightning Mantle', -- 6
        Waist = 'Earth Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Dst. Leggings +1',
    },
    EarthRes = { -- 144
        Main = 'Auster\'s Staff', -- 20
        Ammo = 'Hedgehog Bomb',
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Topaz Earring', -- 10
        Ear2 = 'Topaz Earring', -- 10
        Body = 'Gaia Doublet', -- 10
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Topaz Ring', -- 9
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Beak Mantle +1',
        Waist = 'Wind Belt', -- 20
        Legs = 'Beak Trousers +1', -- 7
        Feet = 'Blood Greaves', -- 21
    },
    WindRes = { -- 136
        Main = 'Aquilo\'s Staff', -- 20
        Ammo = 'Hedgehog Bomb',
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Diamond Earring', -- 10
        Body = 'Northern Jerkin', -- 6
        Hands = 'Mage\'s Cuffs', -- 5
        Ring1 = 'Emerald Ring', -- 9
        Ring2 = 'Malgust Ring', -- 10
        Back = 'Tundra Mantle', -- 5
        Waist = 'Ice Belt', -- 20
        Legs = 'Dst. Subligar +1',
        Feet = 'Blood Greaves', -- 21
    },

    Precast = {
        Head = 'Wlk. Chapeau +1',
        Ear1 = 'Loquac. Earring',
        Body = 'Duelist\'s Tabard',
    },
    Casting = { -- Default Casting Equipment when using Idle sets
        Head = 'Dls. Chapeau +1',
        Neck = 'Willpower Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1',
        Waist = 'Druid\'s Rope',
    },
    SIRD = { -- 102% to Cap, used on Stoneskin, Blink, Aquaveil and Utsusemi casts
        Main = 'Hermit\'s Wand', -- 25
        Sub = 'Hermit\'s Wand', -- 25
        Ammo = 'Hedgehog Bomb',
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Body = 'Warlock\'s Tabard', -- 10
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Druid\'s Rope', -- 10
        Legs = 'Dst. Subligar +1',
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Head = 'Wlk. Chapeau +1',
        Ear1 = 'Loquac. Earring',
        Body = 'Duelist\'s Tabard',
        Hands = 'Dusk Gloves',
        Waist = 'Swift Belt',
        -- Legs = 'Nashira Serawheels',
        Feet = 'Nashira Crackows',
        -- Feet = 'Dusk Ledelsens',
    },

    Hate = { -- Switches to this set when casting Sleep, Blind, Dispel and Bind if /hate is toggled on
        Ammo = 'Phtm. Tathlum',
        Head = 'Baron\'s Chapeau', -- 2
        Neck = 'Harmonia\'s Torque', -- 3
        Ear1 = 'Eris\' Earring', -- 2
        Ear2 = 'Eris\' Earring', -- 2
        Body = 'Duelist\'s Tabard',
        Hands = 'Dusk Gloves',
        Ring1 = 'Mermaid Ring', -- 2
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Prism Cape',
        Waist = 'Warwolf Belt', -- 3
        Legs = 'Blood Cuisses',
        -- Legs = 'Nashira Serawheels',
        Feet = 'Heroic Boots', -- 1
    },
    C3HPDown = {},
    C4HPDown = {
        Head = 'Wlk. Chapeau +1',
        Neck = 'Checkered Scarf',
        Hands = 'Zenith Mitts +1',
        Ring2 = 'Serket Ring',
        Legs = 'Dst. Subligar +1',
        Feet = 'Mahatma Pigaches',
    },
    HPUp = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Baron\'s Chapeau', -- 2
        Neck = 'Harmonia\'s Torque', -- 3
        Ear1 = 'Eris\' Earring', -- 2
        Ear2 = 'Eris\' Earring', -- 2
        Body = 'Ogre Jerkin +1',
        Hands = 'Blood Fng. Gnt.',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Gigant Mantle',
        Waist = 'Warwolf Belt', -- 3
        Legs = 'Blood Cuisses',
        Feet = 'Heroic Boots', -- 1
    },

    Cure = {
        Ammo = 'Hedgehog Bomb', -- 1
        Head = 'Raven Beret', -- 8
        Neck = 'Healing Torque',
        Ear1 = 'Novia Earring', -- 7
        Ear2 = 'Magnetic Earring',
        Body = 'Raven Jupon', -- 9
        Hands = 'Raven Bracers', -- 5
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Errant Cape', -- 5
        Waist = 'Penitent\'s Rope', -- 3
        Legs = 'Raven Hose', -- 6
        Feet = 'Raven Gaiters', -- 5
    },
    Cursna = {
        Main = 'Prelatic Pole',
        Neck = 'Healing Torque',
        Body = 'Duelist\'s Tabard',
        Legs = 'Warlock\'s Tights',
        -- Back = 'Altruistic Cape',
    },

    Enhancing = {
        Main = 'Mythic Wand +1',
        Sub = 'Nms. Shield +1',
        Ammo = 'Hedgehog Bomb',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Enhancing Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Merciful Cape',
        Waist = 'Swift Belt',
        Legs = 'Warlock\'s Tights',
        Feet = 'Nashira Crackows',
        -- Feet = 'Dusk Ledelsens',
    },
    Stoneskin = {
        -- Neck = 'Stone Gorget',
    },
    Spikes = {
        Main = 'Mythic Wand +1',
        Sub = 'Nms. Shield +1',
        Ammo = 'Phtm. Tathlum',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Enhancing Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Warlock\'s Tights',
        Feet = 'Dls. Boots +1',
    },

    Enfeebling = {
        Head = 'Dls. Chapeau +1',
        Neck = 'Enfeebling Torque',
        Body = 'Warlock\'s Tabard',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
    },
    EnfeeblingMND = {
        Ammo = 'Hedgehog Bomb',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Feet = 'Mahatma Pigaches',
    },
    EnfeeblingINT = {
        Ammo = 'Phtm. Tathlum',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        Hands = 'Mahatma Cuffs',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Feet = 'Wise Pigaches',
    },
    EnfeeblingACC = {
        -- Ear2 = 'Enfeebling Earring',
        -- Back = 'Altruistic Cape',
        -- Legs = 'Nashira Serawheels',
    },

    Dark = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        -- Ear2 = 'Dark Earring',
        Body = 'Mahatma Hpl.',
        -- Body = 'Nashira Manteel',
        Hands = 'Blood Fng. Gnt.',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Nashira Crackows',
    },

    Nuke = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Elemental Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Dls. Boots +1',
    },
    NukeACC = {
        Hands = 'Mahatma Cuffs',
        Back = 'Merciful Cape',
        Legs = 'Duelist\'s Tights',
        Feet = 'Nashira Crackows',
    },
    NukeDOT = {
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        Hands = 'Mahatma Cuffs',
        Back = 'Merciful Cape',
        Legs = 'Duelist\'s Tights',
        Feet = 'Wise Pigaches',
    },

    Convert = { -- Type /vert to equip this set and /lock your gear at the same time.
        Main = 'Apollo\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Head = 'Faerie Hairpin',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Blue Cotehardie',
        Hands = 'Blood Fng. Gnt.',
        Ring1 = 'Ether Ring',
        Ring2 = 'Serket Ring',
        Back = 'Errant Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Blood Greaves',
    },
    ConvertOOR = { -- Out of Region Convert Set
        Main = 'Apollo\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Head = 'Faerie Hairpin',
        Neck = 'Rep.Gold Medal',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Blue Cotehardie',
        Hands = 'Blood Fng. Gnt.',
        Ring1 = 'Ether Ring',
        Ring2 = 'Serket Ring',
        Back = 'Errant Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Blood Greaves',
    },

    Stun = { -- Type /csstun to equip this set and /lock your gear at the same time.
        Main = 'Jupiter\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        -- Ear2 = 'Dark Earring',
        Body = 'Mahatma Hpl.',
        -- Body = 'Nashira Manteel',
        Hands = 'Blood Fng. Gnt.',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Nashira Crackows',
    },

    TP = {
        Main = 'Joyeuse',
        Sub = 'Genbu\'s Shield',
        Range = 'Lightning Bow +1',
        Ammo = '',
        Head = 'Dls. Chapeau +1',
        -- Head = 'Walahra Turban', -- 4
        -- Neck = 'PCC',
        Ear1 = 'Merman\'s Earring',
        -- Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        -- Body = 'Nashira Manteel', -- 3
        Hands = 'Dusk Gloves', -- 3
        -- Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Sattva Ring',
        -- Ring2 = 'Toreador\'s Ring',
        -- Back = 'Forager's Mantle',
        Waist = 'Swift Belt', -- 4
        -- Legs = 'Nashira Serawheels', -- 2
        Feet = 'Nashira Crackows',
        -- Feet = 'Dusk Ledelsens', -- 2
    },
    TP_NIN = {
        -- Main = 'Enhancing Sword',
        -- Sub = 'Joyeuse',
        -- Ear1 = 'Stealth Earring',
    },
    WS = {
        -- Head = 'Optical Hat',
        -- Neck = 'PCC',
        Ear1 = 'Merman\'s Earring',
        -- Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Blue Cotehardie',
        -- Body = 'Assault Jerkin',
        -- Hands = 'Ogre Gloves +1',
        Ring1 = 'Ruby Ring',
        -- Ring2 = 'Flame Ring',
        -- Back = 'Forager's Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Duelist\'s Tights',
        -- Legs = 'Dusk Trousers',
        -- Feet = 'Rutter Sabatons',
    },
    WS_Soil = {
        -- Neck = 'Soil Gorget',
    },
    WS_Spirits = {
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Sattva Ring',
        Hands = 'Blood Fng. Gnt.',
        Body = 'Ogre Jerkin +1',
        Back = 'Gigant Mantle',
        Legs = 'Blood Cuisses',
        Head = 'Dls. Chapeau +1',
        Feet = 'Blood Greaves',
    },

    LockSet1 = {
        Main = 'Fencing Degen',
        Sub = 'Turtle Shield +1',
        Ammo = 'Morion Tathlum',
        Head = 'Traveler\'s Hat',
        Neck = 'Justice Badge',
        Ear1 = 'Healer\'s Earring',
        Ear2 = 'Morion Earring +1',
        Body = 'Ryl.Sqr. Robe',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Saintly Ring',
        Ring2 = 'Saintly Ring',
        Back = 'White Cape',
        Waist = 'Druid\'s Rope',
        Legs = 'Custom Slacks',
        Feet = 'Mannequin Pumps',
    },
    LockSet2 = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Elemental Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Dls. Boots +1',
    },
    LockSet3 = {},

    FallbackSub = { -- Used only when you do not have complete staff sets
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('common\\gcmage.lua')

profile.OnLoad = function()
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
end

profile.HandleCommand = function(args)
    gcmage.DoCommands(args)
end

profile.HandleDefault = function()
    gcmage.DoDefault(ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, nil)
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, nil)
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction()

    gFunc.EquipSet(sets.WS)

    if (action.Name == 'Savage Blade') or (action.Name == 'Vorpal Blade') or (action.Name == 'Swift Blade') or (action.Name == 'Evisceration') then
        gFunc.EquipSet(sets.WS_Soil)
    elseif (action.Name == 'Spirits Within') then
        gFunc.EquipSet(sets.WS_Spirits)
    end
end

return profile
