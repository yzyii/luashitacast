local profile = {}

local fastCastValue = 0.42 -- 20% from traits 22% from gear listed in Precast set

local ninSJMaxMP = 535 -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = 613 -- The Max MP you have when /whm in your idle set
local blmSJMaxMP = 632 -- The Max MP you have when /blm in your idle set
local drkSJMaxMP = 556 -- The Max MP you have when /drk in your idle set

local blue_cotehardie = false
local blue_cotehardie_plus_one = true
local dilation_ring = true
local dilation_ring_slot = 'Ring2'

local displayheadOnAbility = true

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Dls. Chapeau +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = {
        Main = 'Terra\'s Staff',
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Dls. Chapeau +1',
        Neck = 'Jeweled Collar +1',
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
    IdleMaxMP = {
        Main = 'Terra\'s Staff',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Dls. Chapeau +1',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Dls. Tabard +1',
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
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Dls. Chapeau +1',
        Neck = 'Pch. Collar',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Hydra Gloves',
        Back = 'Errant Cape',
        Waist = 'Duelist\'s Belt',
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    Town = {},
    Movement = {
        Head = 'Dls. Chapeau +1',
        Legs = 'Blood Cuisses',
    },

    DT = {
        Main = 'Terra\'s Staff', -- 20
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Dls. Chapeau +1',
        Neck = 'Jeweled Collar +1',
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
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Dls. Chapeau +1',
        Neck = 'Jeweled Collar +1',
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
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Dls. Chapeau +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring', -- 2
        Body = 'Cor. Scale Mail +1', -- 4
        Hands = 'Coral Fng. Gnt. +1', -- 2
        Ring1 = 'Shadow Ring',
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Hexerei Cape', -- 3
        Waist = 'Penitent\'s Rope',
        Legs = 'Coral Cuisses +1', -- 3
        Feet = 'Coral Greaves +1', -- 2
    },
    FireRes = { -- 145
        Main = 'Neptune\'s Staff', -- 20
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Black Ribbon', -- 10
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Scp. Breastplate', -- 9
        Hands = 'Tarasque Mitts +1', -- 6
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Water Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Power Sandals', -- 7
    },
    IceRes = { -- 145
        Main = 'Vulcan\'s Staff', -- 20
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Black Ribbon', -- 10
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Northern Jerkin', -- 6
        Hands = 'Feral Gloves', -- 4
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
        Back = 'Aurora Mantle', -- 7
        Waist = 'Fire Belt', -- 20
        Legs = 'Feral Trousers', -- 6
        Feet = 'Blood Greaves', -- 21
    },
    LightningRes = { -- 133
        Main = 'Terra\'s Staff', -- 20
        Range = 'Lightning Bow +1', -- 7
        Ammo = '',
        Head = 'Black Ribbon', -- 10
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
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
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Black Ribbon', -- 10
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Gaia Doublet', -- 10
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Robust Ring', -- 10
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Beak Mantle +1', -- 7
        Waist = 'Wind Belt', -- 20
        Legs = 'Beak Trousers +1', -- 7
        Feet = 'Blood Greaves', -- 21
    },
    WindRes = { -- 139
        Main = 'Aquilo\'s Staff', -- 20
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Black Ribbon', -- 10
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Northern Jerkin', -- 6
        Hands = 'Mage\'s Cuffs', -- 5
        Ring1 = 'Emerald Ring', -- 9
        Ring2 = 'Malgust Ring', -- 10
        Back = 'Aurora Mantle', -- 7
        Waist = 'Ice Belt', -- 20
        Legs = 'Coral Cuisses +1',
        Feet = 'Blood Greaves', -- 21
    },
    WaterRes = { -- 137
        Main = 'Jupiter\'s Staff', -- 20
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Black Ribbon', -- 10
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Cor. Scale Mail +1', -- 6
        Hands = 'Coral Fng. Gnt. +1', -- 4
        Ring1 = 'Communion Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Lightning Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Coral Greaves +1', -- 4
    },
    Evasion = {},

    Precast = {
        Head = 'Wlk. Chapeau +1',
        Ear1 = 'Loquac. Earring',
        Body = 'Dls. Tabard +1',
    },
    Casting = { -- Default Casting Equipment when using Idle sets
        Main = 'Eremite\'s Wand', -- 25
        Sub = 'Eremite\'s Wand', -- 25
        Ammo = 'Hedgehog Bomb',
        Ammo = '',
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Body = 'Wlk. Tabard +1', -- 12
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Druid\'s Rope', -- 10
        Legs = 'Dst. Subligar +1',
        Feet = 'Mountain Gaiters', -- 5
    },
    SIRD = { -- Used on Stoneskin, Blink, Aquaveil and Utsusemi casts
        Main = 'Eremite\'s Wand', -- 25
        Sub = 'Eremite\'s Wand', -- 25
        Ammo = 'Hedgehog Bomb',
        Ammo = '',
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Body = 'Wlk. Tabard +1', -- 12
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
        Body = 'Dls. Tabard +1',
        Hands = 'Dusk Gloves +1',
        Waist = 'Sonic Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Dusk Ledelsens +1',
    },
    ConserveMP = {
        Ammo = 'Dream Sand',
        Ear2 = 'Magnetic Earring',
        Back = 'Maledictor\'s Shawl',
    },

    Hate = { -- Switches to this set when casting Sleep, Blind, Dispel and Bind if /hate is toggled on
        Ammo = 'Phtm. Tathlum',
        Head = 'Rival Ribbon', -- 2
        Neck = 'Harmonia\'s Torque', -- 3
        Ear1 = 'Eris\' Earring', -- 2
        Ear2 = 'Hades Earring +1', -- 2
        Body = 'Dls. Tabard +1',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Mermaid Ring', -- 2
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Toreador\'s Cape', -- 4
        Waist = 'Warwolf Belt', -- 3
        Legs = 'Nashira Seraweels',
        Feet = 'Heroic Boots', -- 1
    },
    Cheat_C3HPDown = {
        Main = 'Eremite\'s Wand', -- 25
        Sub = 'Eremite\'s Wand', -- 25
        Ammo = 'Tiphia Sting',
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Body = 'Wlk. Tabard +1', -- 12
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Serket Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Druid\'s Rope', -- 10
        Legs = 'Dst. Subligar +1',
        Feet = 'Mountain Gaiters', -- 5
    },
    Cheat_C4HPDown = {
        Main = 'Eremite\'s Wand', -- 25
        Sub = 'Eremite\'s Wand', -- 25
        Ammo = 'Tiphia Sting',
        Head = 'Zenith Crown +1',
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Body = 'Wlk. Tabard +1', -- 12
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Ether Ring',
        Ring2 = 'Serket Ring',
        Back = 'Umbra Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Mahatma Pigaches',
    },
    Cheat_HPUp = {
        Ammo = 'Happy Egg',
        Head = 'Rival Ribbon', -- 2
        Neck = 'Harmonia\'s Torque', -- 3
        Ear1 = 'Eris\' Earring', -- 2
        Ear2 = 'Hades Earring +1', -- 2
        Body = 'Dls. Tabard +1',
        Hands = 'Blood Fng. Gnt.',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Toreador\'s Cape', -- 4
        Waist = 'Warwolf Belt', -- 3
        Legs = 'Blood Cuisses',
        Feet = 'Heroic Boots', -- 1
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
        Back = 'Errant Cape', -- 5
        Waist = 'Penitent\'s Rope', -- 3
        Legs = 'Hydra Brais', -- 6
        Feet = 'Hydra Gaiters', -- 5
    },
    Cursna = {
        Body = 'Dls. Tabard +1',
        Legs = 'Warlock\'s Tights',
        Back = 'Altruistic Cape',
    },

    Enhancing = {
        Main = 'Neptune\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Enhancing Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Glamor Jupon',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Merciful Cape',
        Waist = 'Sonic Belt',
        Legs = 'Warlock\'s Tights',
        Feet = 'Dusk Ledelsens +1',
    },
    Stoneskin = {
        Neck = 'Stone Gorget',
        Body = 'Mahatma Hpl.',
        Hands = 'Dusk Gloves +1',
        Back = 'Prism Cape',
    },
    Spikes = {
        Main = 'Aquilo\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Enhancing Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Warlock\'s Tights',
        Feet = 'Dls. Boots +1',
    },

    Enfeebling = {
        Head = 'Dls. Chapeau +1',
        Body = 'Mahatma Hpl.',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
    },
    EnfeeblingMND = {
        Ammo = 'Hedgehog Bomb',
        Neck = 'Faith Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Feet = 'Mahatma Pigaches',
    },
    EnfeeblingINT = {
        Ammo = 'Phtm. Tathlum',
        Neck = 'Prudence Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Omn. Earring',
        Hands = 'Mahatma Cuffs',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Feet = 'Wise Pigaches +1',
    },
    EnfeeblingACC = {
        Neck = 'Enfeebling Torque',
        Body = 'Wlk. Tabard +1',
        Ear2 = 'Enfeebling Earring',
        Back = 'Altruistic Cape',
        Legs = 'Nashira Seraweels',
    },

    Divine = { -- Just using my Hate set here for Flash
        Ammo = 'Phtm. Tathlum',
        Head = 'Rival Ribbon', -- 2
        Neck = 'Harmonia\'s Torque', -- 3
        Ear1 = 'Eris\' Earring', -- 2
        Ear2 = 'Hades Earring +1', -- 2
        Body = 'Dls. Tabard +1',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Mermaid Ring', -- 2
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Toreador\'s Cape', -- 4
        Waist = 'Warwolf Belt', -- 3
        Legs = 'Nashira Seraweels',
        Feet = 'Heroic Boots', -- 1
    },
    Dark = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Dark Earring',
        Body = 'Nashira Manteel',
        Hands = 'Blood Fng. Gnt.',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
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
        Ring2 = 'Omniscient Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Dls. Boots +1',
    },
    NukeACC = {
        Back = 'Merciful Cape',
        Legs = 'Dls. Tights +1',
        Feet = 'Nashira Crackows',
    },
    NukeDOT = {
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Omn. Earring',
        Hands = 'Mahatma Cuffs',
        Back = 'Merciful Cape',
        Legs = 'Dls. Tights +1',
        Feet = 'Nashira Crackows',
    },

    Convert = { -- Type /vert to equip this set and /lock your gear at the same time.
        Main = 'Apollo\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Head = 'Faerie Hairpin',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Blue Cotehard. +1',
        Hands = 'Zenith Mitts +1',
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
        Body = 'Wlk. Tabard +1',
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Ether Ring',
        Ring2 = 'Serket Ring',
        Back = 'Errant Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Blood Greaves',
    },

    Stun = {
        Main = 'Jupiter\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Dark Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Abyssal Earring',
        Body = 'Dls. Tabard +1',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Merciful Cape',
        Waist = 'Sonic Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Dusk Ledelsens +1',
    },
    StunACC = { -- You can also type /csstun to equip this set and /lock your gear at the same time if you have a tinfoil hat.
        Main = 'Jupiter\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Dark Earring',
        Body = 'Nashira Manteel',
        Hands = 'Blood Fng. Gnt.',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
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
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Hydra Doublet',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Dusk Ledelsens +1',
    },
    TP_HighAcc = {
        Range = 'Lightning Bow +1',
        Ammo = '',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Hydra Doublet',
        Hands = 'Hydra Gloves',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Commander\'s Cape',
        Waist = 'Life Belt',
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    TP_NIN = {
        Main = 'Martial Knife',
        -- Main = 'Joyeuse',
        -- Main = 'Justice Sword',
        -- Main = 'Blau Dolch',
        Sub = 'Octave Club',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Stealth Earring',
        Range = 'Lightning Bow +1',
        Ammo = '',
        -- Ammo = 'Virtue Stone',
    },
    TP_Mjollnir_Haste = {},
    WS = {
        Head = 'Optical Hat',
        Ear2 = 'Merman\'s Earring',
        Body = 'Assault Jerkin',
        Hands = 'Tarasque Mitts +1',
        Waist = 'Warwolf Belt',
        Legs = 'Hydra Brais',
        Feet = 'Rutter Sabatons',
    },
    WS_HighAcc = {
        Body = 'Hydra Doublet',
        Hands = 'Hydra Gloves',
        Waist = 'Life Belt',
        Feet = 'Hydra Gaiters',
    },
    WS_Soil = {
        Neck = 'Soil Gorget',
    },
    WS_Evisceration = {
        Hands = 'Custom M Gloves',
    },
    WS_Spirits = {},
    WS_Energy = {
        Head = 'Zenith Crown +1',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Neck = 'Faith Torque',
        Body = 'Mahatma Hpl.',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Mahatma Pigaches',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 //dia')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 //stun')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('common\\gcmage.lua')

profile.HandleAbility = function()
    if (displayheadOnAbility) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/displayhead')
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction()

    gFunc.EquipSet(sets.WS)
    if (gcdisplay.GetCycle('TP') == 'HighAcc') then
        gFunc.EquipSet('WS_HighAcc')
    end
    gcmage.DoFenrirsEarring()

    if (action.Name == 'Savage Blade') or (action.Name == 'Vorpal Blade') or (action.Name == 'Swift Blade') then
        gFunc.EquipSet(sets.WS_Soil)
    end

    if (action.Name == 'Evisceration') then
        gFunc.EquipSet(sets.WS_Soil)
        gFunc.EquipSet(sets.Evisceration)
    end

    if (action.Name == 'Energy Drain') or (action.Name == 'Energy Steal') then
        gFunc.EquipSet(sets.WS_Energy)
    end

    if (action.Name == 'Spirits Within') then
        gFunc.EquipSet(sets.WS_Spirits)
    end
end

profile.OnLoad = function()
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
end

profile.HandleCommand = function(args)
    gcmage.DoCommands(args)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmage.DoDefault(ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, nil, drkSJMaxMP)

    local player = gData.GetPlayer()
    if (blue_cotehardie and player.MP <= 40) then
        gFunc.Equip('Body', 'Blue Cotehardie')
    end
    if (blue_cotehardie_plus_one and player.MP <= 50) then
        gFunc.Equip('Body', 'Blue Cotehard. +1')
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, nil, drkSJMaxMP)

    local action = gData.GetAction()
    if (dilation_ring) then -- Haste is technically MP inefficient but I prefer to just always use it anyway
        if (action.Name == 'Haste' or action.Name == 'Refresh') then
            gFunc.Equip(dilation_ring_slot, 'Dilation Ring')
        end
    end
end

return profile
