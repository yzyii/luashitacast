local profile = {}

local fastCastValue = 0.42 -- 20% from traits 22% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

-- The following are provided as convenient saved settings over using the /setmp command. Not all SJs will be covered. e.g. DRG and usage of the command in these cases is required.
local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = nil -- The Max MP you have when /whm in your idle set
local blmSJMaxMP = nil -- The Max MP you have when /blm in your idle set
local drkSJMaxMP = nil -- The Max MP you have when /drk in your idle set

-- Disabled on horizon_safe_mode
local fencersRingForced = true -- Default /fring value
local fencersRingMaxHP = 930

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local blue_cotehardie = {
    -- Body = { Name = 'Blue Cotehardie', Priority = 10 },
}
local blue_cotehardie_plus_one = {
    Body = { Name = 'Blue Cotehard. +1', Priority = 10 },
}
local dilation_ring = {
    Ring2 = 'Dilation Ring',
}
local tp_fencers_ring = {
    Ring1 = 'Fencer\'s Ring',
}
local resentment_cape_override = { -- An additional override if resentment cape is active
    Head = { Name = 'Dls. Chapeau +1', Priority = 70 },
}

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Range = { Name = 'Arco de Velocidad', Priority = 60 },
        Ammo = 'displaced',
        Head = { Name = 'Dls. Chapeau +1', Priority = 70 },
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Dalmatica', Priority = 10 },
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Umbra Cape',
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = { Name = 'Blood Cuisses', Priority = 70 },
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = {
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Legs = 'Bahamut\'s Hose',
    },
    IdleMaxMP = {
        Range = 'displaced',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Neck = { Name = 'Uggalepih Pendant', Priority = 50 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Hands = { Name = 'Blood Fng. Gnt.', Priority = 70 },
        Ring1 = { Name = 'Serket Ring', Priority = 10 },
        Back = { Name = 'Mahatma Cape', Priority = 50 },
        Feet = { Name = 'Blood Greaves', Priority = 70 },
    },
    Resting = {
        Main = 'Pluto\'s Staff',
        Sub = 'displaced',
        Range = 'displaced',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Dls. Chapeau +1', Priority = 70 },
        Neck = { Name = 'Pch. Collar', Priority = 70 },
        Ear1 = 'Relaxing Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = 'Mahatma Hpl.',
        Hands = 'Hydra Gloves',
        Back = { Name = 'Mahatma Cape', Priority = 50 },
        Waist = 'Duelist\'s Belt',
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    Town = {},
    Movement = {
        Head = { Name = 'Dls. Chapeau +1', Priority = 70 },
        Legs = { Name = 'Blood Cuisses', Priority = 70 },
    },
    Movement_TP = {
        Hands = 'Hydra Gloves',
        Feet = 'Hydra Gaiters',
    },

    DT = {
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Range = { Name = 'Arco de Velocidad', Priority = 60 },
        Ammo = 'displaced',
        Head = 'Darksteel Cap +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Umbra Cape',
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    DTNight = {
        Head = { Name = 'Dls. Chapeau +1', Priority = 70 },
        Legs = { Name = 'Blood Cuisses', Priority = 70 },
    },
    MDT = {
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Range = { Name = 'Arco de Velocidad', Priority = 60 },
        Ammo = 'displaced',
        Head = 'Coral Visor +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Cor. Scale Mail +1',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Hexerei Cape', Priority = 50 },
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = 'Coral Cuisses +1',
        Feet = 'Coral Greaves +1',
    },
    FireRes = {
        Main = 'Sapara of Trials', -- 10
        Sub = 'Nms. Shield +1', -- 15
        Range = { Name = 'Arco de Velocidad', Priority = 60 },
        Ammo = 'displaced',
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
        Legs = { Name = 'Blood Cuisses', Priority = 70 }, -- 21
        Feet = 'Power Sandals', -- 7
    },
    IceRes = {
        Main = 'Vulcan\'s Staff', -- 20
        Sub = 'displaced',
        Range = { Name = 'Arco de Velocidad', Priority = 60 },
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Omn. Earring', -- 11
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Tundra Jerkin', -- 7
        Hands = 'Feral Gloves', -- 4
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
        Back = { Name = 'Aurora Mantle +1', Priority = 50 }, -- 8
        Waist = 'Fire Belt', -- 20
        Legs = 'Feral Trousers', -- 6
        Feet = { Name = 'Blood Greaves', Priority = 70 }, -- 21
    },
    LightningRes = {
        Main = 'Dynamis Sword', -- 9
        Sub = { Name = 'Nms. Shield +1', Priority = 50 }, -- 15
        Range = 'Lightning Bow +1', -- 7
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = { Name = 'Flora Cotehardie', Priority = 10 }, -- 5
        Hands = { Name = 'Feronia\'s Bangles', Priority = 60 },
        Ring1 = 'Adroit Ring', -- 10
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Lightning Mantle', -- 6
        Waist = 'Earth Belt', -- 20
        Legs = { Name = 'Blood Cuisses', Priority = 70 }, -- 21
        Feet = { Name = 'Root Sabots', Priority = 60 },
    },
    EarthRes = {
        Main = 'Auster\'s Staff', -- 20
        Sub = 'displaced',
        Range = { Name = 'Arco de Velocidad', Priority = 60 },
        Ammo = 'displaced',
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
        Feet = { Name = 'Blood Greaves', Priority = 70 }, -- 21
    },
    WindRes = {
        Main = 'Sapara of Trials', -- 10
        Sub = 'Nms. Shield +1', -- 15
        Range = { Name = 'Arco de Velocidad', Priority = 60 },
        Ammo = 'displaced',
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
        Legs = 'Coral Cuisses +1',
        Feet = { Name = 'Blood Greaves', Priority = 70 }, -- 21
    },
    WaterRes = {
        Main = 'Merman\'s Sword', -- 9
        Sub = 'Nms. Shield +1', -- 15
        Range = { Name = 'Arco de Velocidad', Priority = 60 },
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = { Name = 'Scp. Harness +1', Priority = 60 }, -- 20
        Hands = { Name = 'Scp. Mittens +1', Priority = 60 }, -- 7
        Ring1 = 'Communion Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = 'Wolf Mantle +1', -- 3
        Waist = 'Lightning Belt', -- 20
        Legs = { Name = 'Blood Cuisses', Priority = 70 }, -- 21
        Feet = { Name = 'Scp. Leggings +1', Priority = 60 }, -- 7
    },
    Evasion = {},
    Override = { -- An additional override set explicitly to be used for sets such as crafting, HELM, fishing, or any other special sets such as DRK 2HR, MNK Counter etc. n.b. Any unused Resist or Evasion set can be used similarly.
        Body = 'Field Tunica',
        Hands = 'Field Gloves',
        Legs = 'Field Hose',
        Feet = 'Field Boots'
    },

    Precast = {
        Head = { Name = 'Wlk. Chapeau +1', Priority = 50 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Body = { Name = 'Dls. Tabard +1', Priority = 50 },
    },
    SIRD = { -- Override sets (Resistance / Evasion) take precedence if in use.
        Main = { Name = 'Eremite\'s Wand', Priority = 50 }, -- 25
        Sub = 'Genbu\'s Shield',
        Range = 'displaced',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 }, -- 8
        Body = { Name = 'Wlk. Tabard +1', Priority = 50 }, -- 12
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = 'Druid\'s Rope', -- 10
        Legs = 'Dst. Subligar +1',
        Feet = 'Mountain Gaiters', -- 5
    },
    SIRD_NIN = {
        Sub = { Name = 'Eremite\'s Wand', Priority = 50 },
    },
    Haste = {
        Head = { Name = 'Wlk. Chapeau +1', Priority = 50 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Body = { Name = 'Dls. Tabard +1', Priority = 1 },
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Waist = 'Sonic Belt',
        Legs = 'Nashira Seraweels',
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 }
    },
    ConserveMP = {
        Range = 'displaced',
        Ammo = { Name = 'Dream Sand', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Back = 'Maledictor\'s Shawl',
    },

    Hate = { -- Switches to this set when casting Sleep, Blind, Dispel, Bind, Flash and Cures on other players if /hate is toggled on
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Range = 'displaced',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = { Name = 'Rival Ribbon', Priority = 50 },
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Eris\' Earring +1',
        Ear2 = 'Eris\' Earring +1',
        Body = { Name = 'Dls. Tabard +1', Priority = 50 },
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring1 = 'Mermaid Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Toreador\'s Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Heroic Boots +1',
    },
    Cheat_C3HPDown = { -- 1194
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Range = { Name = 'Arco de Velocidad', Priority = 60 },
        Ammo = 'displaced',
        Head = 'Darksteel Cap +1',
        Neck = { Name = 'Uggalepih Pendant', Priority = 50 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = { Name = 'Wlk. Tabard +1', Priority = 50 },
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Jelly Ring',
        Back = 'Shadow Mantle',
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    Cheat_C4HPDown = { -- 989
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Range = 'displaced',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = { Name = 'Zenith Crown +1', Priority = 10 },
        Neck = { Name = 'Star Necklace', Priority = 10 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = 'Dst. Harness +1',
        Hands = { Name = 'Zenith Mitts +1', Priority = 10 },
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Serket Ring', Priority = 10 },
        Back = 'Shadow Mantle',
        Waist = { Name = 'Penitent\'s Rope', Priority = -10 },
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    Cheat_HPUp = { -- 1413 (219 / 424) - Note that Cure Power does not cap on C4 when /NIN
        Main = 'Apollo\'s Staff',
        Sub = 'displaced',
        Range = { Name = 'Arco de Velocidad', Priority = 60 },
        Ammo = 'displaced',
        Head = { Name = 'Rival Ribbon', Priority = 50 },
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Eris\' Earring +1',
        Ear2 = 'Eris\' Earring +1',
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Hands = { Name = 'Feronia\'s Bangles', Priority = 60 },
        Ring1 = 'Bomb Queen Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Toreador\'s Cape',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Dusk Trousers +1', Priority = 60 },
        Feet = 'Heroic Boots +1',
    },

    Cure = {
        Range = 'displaced',
        Ammo = { Name = 'Dream Sand', Priority = 50 },
        Head = 'Hydra Beret',
        Neck = { Name = 'Promise Badge', Priority = 60 },
        Ear1 = 'Novia Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = { Name = 'Hydra Doublet', Priority = 50 },
        Hands = 'Hydra Gloves',
        Ring1 = { Name = 'Serene Ring', Priority = 10 },
        Ring2 = 'Communion Ring',
        Back = { Name = 'Mahatma Cape', Priority = 50 },
        Waist = { Name = 'Penitent\'s Rope', Priority = -10 },
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    Cursna = {
        Main = 'Prelatic Pole',
        Neck = 'Healing Torque',
        Ear2 = 'Healing Earring',
        Body = { Name = 'Dls. Tabard +1', Priority = 50 },
        Back = { Name = 'Altruistic Cape', Priority = 50 },
        Legs = { Name = 'Wlk. Tights +1', Priority = 50 },
    },

    Enhancing = {
        Range = 'displaced',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Wlk. Chapeau +1', Priority = 50 },
        Neck = 'Enhancing Torque',
        Ear1 = 'Augment. Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = 'Glamor Jupon',
        Hands = { Name = 'Dls. Gloves +1', Priority = 50 },
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Waist = 'Sonic Belt',
        Legs = { Name = 'Wlk. Tights +1', Priority = 50 },
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 }
    },
    Stoneskin = {
        Main = { Name = 'Eremite\'s Wand', Priority = 50 },
        Sub = 'Genbu\'s Shield',
        Range = 'displaced',
        Ammo = { Name = 'Dream Sand', Priority = 50 },
        Neck = 'Stone Gorget',
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Shadow Mantle',
    },
    Spikes = {
        Range = 'displaced',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = { Name = 'Wlk. Chapeau +1', Priority = 50 },
        Neck = 'Enhancing Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Hands = { Name = 'Dls. Gloves +1', Priority = 50 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Waist = { Name = 'Penitent\'s Rope', Priority = -10 },
        Legs = { Name = 'Wlk. Tights +1', Priority = 50 },
        Feet = { Name = 'Dls. Boots +1', Priority = 50 },
    },

    Enfeebling = {
        Head = { Name = 'Dls. Chapeau +1', Priority = 70 },
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Hands = 'Nashira Gages',
        Back = { Name = 'Prism Cape', Priority = 70 },
        Waist = { Name = 'Penitent\'s Rope', Priority = -10 },
        Legs = 'Mahatma Slops',
        Feet = 'Nashira Crackows',
    },
    EnfeeblingMND = {
        Range = 'displaced',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = 'Maat\'s Cap',
        Neck = { Name = 'Promise Badge', Priority = 60 },
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Hands = { Name = 'Dvt. Mitts +1', Priority = 50 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Feet = { Name = 'Mahatma Pigaches', Priority = 10 },
    },
    EnfeeblingINT = {
        Range = 'displaced',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = 'Maat\'s Cap',
        Neck = 'Prudence Torque',
        Ear1 = 'Omn. Earring',
        Ear2 = 'Omn. Earring',
        Hands = { Name = 'Mahatma Cuffs', Priority = 10 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Feet = 'Wise Pigaches +1',
    },
    EnfeeblingACC = {
        Head = { Name = 'Dls. Chapeau +1', Priority = 70 },
        Neck = 'Enfeebling Torque',
        Ear2 = 'Enfeebling Earring',
        Body = { Name = 'Wlk. Tabard +1', Priority = 50 },
        Hands = 'Nashira Gages',
        Back = { Name = 'Altruistic Cape', Priority = 50 },
        Legs = 'Nashira Seraweels',
    },

    Banish = {},
    Dark = {
        Range = 'displaced',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Dark Earring',
        Ear2 = 'Omn. Earring',
        Body = 'Nashira Manteel',
        Hands = { Name = 'Blood Fng. Gnt.', Priority = 70 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Waist = { Name = 'Penitent\'s Rope', Priority = -10 },
        Legs = 'Mahatma Slops',
        Feet = 'Nashira Crackows',
    },

    Nuke = {
        Range = 'displaced',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = { Name = 'Wlk. Chapeau +1', Priority = 50 },
        Neck = 'Prudence Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Hands = { Name = 'Zenith Mitts +1', Priority = 10 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = { Name = 'Prism Cape', Priority = 70 },
        Waist = { Name = 'Penitent\'s Rope', Priority = -10 },
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Dls. Boots +1', Priority = 50 },
    },
    NukeACC = {
        Neck = 'Elemental Torque',
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Legs = { Name = 'Dls. Tights +1', Priority = 50 },
        Feet = 'Nashira Crackows',
    },
    NukeDOT = {
        Neck = 'Elemental Torque',
        Ear1 = 'Elemental Earring',
        Ear2 = 'Omn. Earring',
        Hands = { Name = 'Mahatma Cuffs', Priority = 10 },
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Legs = { Name = 'Dls. Tights +1', Priority = 10 },
        Feet = 'Nashira Crackows',
    },

    Convert = { -- Type /vert to equip this set and /lock your gear at the same time.
        Main = 'Apollo\'s Staff',
        Sub = 'displaced',
        Range = 'displaced',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Faerie Hairpin', Priority = 30 },
        Neck = { Name = 'Uggalepih Pendant', Priority = 50 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Hands = { Name = 'Zenith Mitts +1', Priority = 10 },
        Ring1 = { Name = 'Serket Ring', Priority = 10 },
        Ring2 = { Name = 'Vivian Ring', Priority = 10 },
        Back = { Name = 'Mahatma Cape', Priority = 50 },
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = { Name = 'Blood Cuisses', Priority = 70 },
        Feet = { Name = 'Blood Greaves', Priority = 70 },
    },
    ConvertOOR = { -- Out of Region Convert Set. Since this uses /lac set, the full set must be supplied.
        Main = 'Apollo\'s Staff',
        Sub = 'displaced',
        Range = 'displaced',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Faerie Hairpin', Priority = 30 },
        Neck = { Name = 'Rep.Gold Medal', Priority = 50 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Hands = { Name = 'Zenith Mitts +1', Priority = 10 },
        Ring1 = { Name = 'Serket Ring', Priority = 10 },
        Ring2 = { Name = 'Vivian Ring', Priority = 10 },
        Back = { Name = 'Mahatma Cape', Priority = 50 },
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = { Name = 'Blood Cuisses', Priority = 70 },
        Feet = { Name = 'Blood Greaves', Priority = 70 },
    },

    Stun = {
        Main = 'Jupiter\'s Staff',
        Sub = 'displaced',
        Range = 'displaced',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = { Name = 'Wlk. Chapeau +1', Priority = 50 },
        Neck = 'Dark Torque',
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = 'Dark Earring',
        Body = { Name = 'Dls. Tabard +1', Priority = 50 },
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Waist = 'Sonic Belt',
        Legs = 'Nashira Seraweels',
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 }
    },
    StunACC = { -- You can also type /csstun to equip this set and /lock your gear at the same time if you have a tinfoil hat. Since this uses /lac set, the full set must be supplied.
        Main = 'Jupiter\'s Staff',
        Sub = 'displaced',
        Range = 'displaced',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Dark Earring',
        Ear2 = 'Omn. Earring',
        Body = 'Nashira Manteel',
        Hands = { Name = 'Blood Fng. Gnt.', Priority = 70 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Waist = { Name = 'Penitent\'s Rope', Priority = -10 },
        Legs = 'Mahatma Slops',
        Feet = 'Wise Pigaches +1',
    },

    TP = { -- 1253
        Head = 'Nashira Turban',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Nashira Manteel',
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring1 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Back = 'Forager\'s Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Nashira Seraweels',
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 }
    },
    TP_Mjollnir_Haste = {},
    TP_HighAcc = { -- 1224
        Head = 'Optical Hat',
        Body = { Name = 'Scp. Harness +1', Priority = 60 },
        Hands = 'Hydra Gloves',
        Waist = 'Life Belt',
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    TP_NIN = {
        Ear1 = 'Stealth Earring',
    },

    Weapon_Loadout_1 = {
        Main = 'Martial Knife',
        Sub = 'Octave Club',
        Range = 'Lightning Bow +1',
        Ammo = 'displaced',
    },
    Weapon_Loadout_2 = {
        Main = 'Blau Dolch',
        Sub = 'Octave Club',
        Range = 'Lightning Bow +1',
        Ammo = 'displaced',
    },
    Weapon_Loadout_3 = {},

    WS = {
        Head = 'Maat\'s Cap',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Assault Jerkin', Priority = -20 },
        Hands = 'Tarasque Mitts +1',
        Ring1 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Ring2 = 'Triumph Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Dusk Trousers +1', Priority = 60 },
        Feet = 'Rutter Sabatons',
    },
    WS_Evisceration = {
        Neck = 'Love Torque',
        Hands = { Name = 'Wlk. Gloves +1', Priority = 50 },
        Ring2 = 'Adroit Ring',
        Legs = { Name = 'Dls. Tights +1', Priority = 50 },
        Feet = { Name = 'Blood Greaves', Priority = 70 },
    },
    WS_Vorpal = {
        Neck = 'Fortitude Torque',
    },
    WS_Savage = {
        Neck = 'Soil Gorget',
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 60 },
        Feet = { Name = 'Ogre Ledelsens +1', Priority = 50 },
    },
    WS_HighAcc = {
        Body = { Name = 'Scp. Harness +1', Priority = 60 },
        Hands = 'Hydra Gloves',
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Waist = 'Life Belt',
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    WS_MercyStroke = {
        Neck = 'Soil Gorget',
        Ear2 = 'Triumph Earring',
        Body = { Name = 'Assault Jerkin', Priority = -20 },
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 60 },
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Dusk Trousers +1', Priority = 60 },
        Feet = 'Rutter Sabatons',
    },
    WS_KnightsOfRound = {
        Neck = 'Light Gorget',
        Ear2 = 'Triumph Earring',
        Body = { Name = 'Assault Jerkin', Priority = -20 },
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 60 },
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Dusk Trousers +1', Priority = 60 },
        Feet = { Name = 'Ogre Ledelsens +1', Priority = 50 },
    },
    WS_Cyclone = {
        Head = 'Maat\'s Cap',
        Neck = 'Prudence Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Hands = { Name = 'Zenith Mitts +1', Priority = 10 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = { Name = 'Prism Cape', Priority = 70 },
        Waist = { Name = 'Penitent\'s Rope', Priority = -10 },
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Dls. Boots +1', Priority = 50 },
    },
    WS_EnergySteal = {
        Head = 'Maat\'s Cap',
        Neck = { Name = 'Promise Badge', Priority = 60 },
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Hands = { Name = 'Dvt. Mitts +1', Priority = 50 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = { Name = 'Prism Cape', Priority = 70 },
        Waist = { Name = 'Penitent\'s Rope', Priority = -10 },
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Mahatma Pigaches', Priority = 10 },
    },
    WS_SpiritsWithin = {},

    FencersRingHPDown = { -- Set to force HP to or below fencersRingMaxHP -- 929
        Head = { Name = 'Zenith Crown +1', Priority = 10 },
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Dalmatica', Priority = 10 },
        Hands = { Name = 'Zenith Mitts +1', Priority = 10 },
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Serket Ring', Priority = 10 },
        Back = 'Umbra Cape',
        Waist = { Name = 'Penitent\'s Rope', Priority = -10 },
        Legs = 'Dst. Subligar +1',
        Feet = { Name = 'Mahatma Pigaches', Priority = 10 },
    },

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    VileElixir = {
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Range = 'displaced',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Faerie Hairpin', Priority = 30 },
        Neck = { Name = 'Uggalepih Pendant', Priority = 50 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Hands = { Name = 'Zenith Mitts +1', Priority = 10 },
        Ring1 = { Name = 'Serket Ring', Priority = 10 },
        Ring2 = { Name = 'Vivian Ring', Priority = 10 },
        Back = { Name = 'Mahatma Cape', Priority = 50 },
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = { Name = 'Blood Cuisses', Priority = 70 },
        Feet = { Name = 'Blood Greaves', Priority = 70 },
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

sets.blue_cotehardie = blue_cotehardie
sets.blue_cotehardie_plus_one = blue_cotehardie_plus_one
sets.dilation_ring = dilation_ring
sets.tp_fencers_ring = tp_fencers_ring
sets.resentment_cape_override = resentment_cape_override
profile.Sets = gcmage.AppendSets(sets)

local nextFencersRingCheck = 0

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
    local action = gData.GetAction()

    gFunc.EquipSet(sets.WS)
    gcmage.DoFenrirsEarring()

    if (action.Name == 'Evisceration') then
        gFunc.EquipSet(sets.WS_Evisceration)
    elseif (action.Name == 'Vorpal Blade') then
        gFunc.EquipSet(sets.WS_Vorpal)
    elseif (action.Name == 'Savage Blade') then
        gFunc.EquipSet(sets.WS_Savage)
    end

    if (gcdisplay.GetCycle('TP') == 'HighAcc') then
        gFunc.EquipSet('WS_HighAcc')
    end

    if (action.Name == 'Mercy Stroke') then
        gFunc.EquipSet(sets.WS_MercyStroke)
    elseif (action.Name == 'Knights of Round') then
        gFunc.EquipSet(sets.WS_KnightsOfRound)
    elseif (action.Name == 'Cyclone') then
        gFunc.EquipSet(sets.WS_Cyclone)
    elseif (action.Name == 'Energy Steal') then
        gFunc.EquipSet(sets.WS_EnergySteal)
    elseif (action.Name == 'Spirits Within') then
        gFunc.EquipSet(sets.WS_SpiritsWithin)
    end
end

profile.OnLoad = function()
    if (not gcinclude.horizon_safe_mode) then
        gcinclude.SetAlias(T{'fring'})
        gcdisplay.CreateToggle('F-Ring', fencersRingForced)
    end

    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()

    if (not gcinclude.horizon_safe_mode) then
        gcinclude.ClearAlias(T{'fring'})
    end
end

profile.HandleCommand = function(args)
    if (args[1] == 'fring') then
        gcdisplay.AdvanceToggle('F-Ring')
        gcinclude.Message('Fencer\'s Ring', gcdisplay.GetToggle('F-Ring'))
    else
        gcmage.DoCommands(args, sets)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer()
    if (not gcinclude.horizon_safe_mode) then
        if (gcdisplay.GetToggle('F-Ring') and gcdisplay.GetCycle('TP') ~= 'Off' and player.HP > fencersRingMaxHP and player.Status == 'Engaged') then
            local time = os.clock()
            if (time > nextFencersRingCheck) then
                nextFencersRingCheck = time + 2 -- only recheck again after 2 seconds to prevent spam if set up incorrectly
                gFunc.ForceEquipSet('FencersRingHPDown')
                gFunc.ForceEquipSet('TP')
            end
        end
    end

    gcmage.DoDefault(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, nil, drkSJMaxMP)

    if (player.MP <= 40) then
        gFunc.EquipSet('blue_cotehardie')
    end
    if (player.MP <= 50) then
        gFunc.EquipSet('blue_cotehardie_plus_one')
    end

    gcmage.DoDefaultOverride()

    if (gcdisplay.IdleSet == 'MDT' and conquest:GetOutsideControl()) then
        gFunc.EquipSet('resentment_cape_override')
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(sets, fastCastValue, 0)
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, nil, drkSJMaxMP)

    local action = gData.GetAction()
    if (action.Name == 'Haste' or action.Name == 'Refresh') then
        gFunc.EquipSet('dilation_ring') -- Haste is technically MP inefficient but I prefer to just always use it anyway
    end
end

return profile
