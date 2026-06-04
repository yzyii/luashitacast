local profile = {}

local fastCastValue = 0.07 -- 7% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local parade_gorget = {
    Neck = { Name = 'Parade Gorget', Priority = 50 },
}
local hercules_ring = {
    -- Ring1 = 'Hercules\' Ring',
}
local valor_leggings = {
    Legs = { Name = 'Vlr. Leggings +1', Priority = 60 },
}
local arco_de_velocidad = {
    Range = { Name = 'Arco de Velocidad', Priority = 60 },
}
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}
local shadow_mantle = {
    Back = 'Shadow Mantle',
}
local resentment_cape_override = { -- An additional override if resentment cape is active
    Ear2 = { Name = 'Cassie Earring', Priority = 20 },
}

local sets = {
    Idle = { -- 1427
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Range = { Name = 'Rosenbogen', Priority = 60 },
        Ammo = 'displaced',
        Head = 'displaced',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Cassie Earring', Priority = 20 },
        Body = { Name = 'Royal Cloak', Priority = 50 },
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = { Name = 'Kaiser Diechlings', Priority = 60 },
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = {},
    IdleDT = { -- Disabled on horizon_safe_mode -- 1434
        Head = 'Darksteel Cap +1',
        Neck = { Name = 'Shield Torque', Priority = 60 },
        Body = 'Dst. Harness +1',
        Ring1 = 'Jelly Ring',
    },
    IdleALTDT = { -- Disabled on horizon_safe_mode
        Head = { Name = 'Kaiser Schaller', Priority = 60 },
        Neck = { Name = 'Shield Torque', Priority = 60 },
        Body = { Name = 'Kaiser Cuirass', Priority = 60 },
        Hands = { Name = 'Kaiser Handschuhs', Priority = 60 },
        Ring1 = 'Jelly Ring',
        Feet = { Name = 'Kaiser Schuhs', Priority = 60 },
    },
    Resting = {
        Main = 'Pluto\'s Staff',
        Sub = 'displaced',
        Neck = { Name = 'Pch. Collar', Priority = 70 },
        Ear1 = 'Relaxing Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = 'Nomad\'s Tunica',
        Hands = 'Nomad\'s Gloves',
        Legs = 'Nomad\'s Hose',
        Feet = 'Nomad\'s Boots',
    },
    Town = {},
    Movement = {
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Legs = { Name = 'Blood Cuisses', Priority = 70 },
        Feet = { Name = 'Kaiser Schuhs', Priority = 100 },
    },
    Movement_TP = {
        Hands = { Name = 'Homam Manopolas', Priority = 70 },
        Feet = { Name = 'Homam Gambieras', Priority = 70 },
    },

    DT = { -- 1434
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Head = 'Darksteel Cap +1',
        Neck = { Name = 'Shield Torque', Priority = 60 },
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Cassie Earring', Priority = 20 },
        Body = 'Dst. Harness +1',
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Jelly Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = { Name = 'Kaiser Diechlings', Priority = 60 },
        Feet = 'Dst. Leggings +1',
    },
    MDT = { -- 1415
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Head = 'Coral Visor +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Cor. Scale Mail +1',
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Gigant Mantle', Priority = 60 },
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = 'Coral Cuisses +1',
        Feet = 'Coral Greaves +1',
    },
    FireRes = {
        Main = 'Hrotti', -- 15
        Sub = { Name = 'Nms. Shield +1', Priority = 50 }, -- 15
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Tarasque Mitts +1', -- 6
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Dino Mantle', -- 4
        Waist = 'Water Belt', -- 20
        Legs = { Name = 'Blood Cuisses', Priority = 70 }, -- 21
        Feet = 'Power Sandals', -- 7
    },
    IceRes = {
        Main = { Name = 'Tutelary', Priority = 60 },
        Sub = 'Ice Shield +1', -- 25
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Omn. Earring', -- 11
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Feral Gloves', -- 4
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
        Back = 'Ram Mantle +1', -- 6
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
        Body = 'Assault Brstplate', -- 15
        Hands = { Name = 'Kaiser Handschuhs', Priority = 60 },
        Ring1 = 'Adroit Ring', -- 10
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Gaia Mantle +1', -- 12
        Waist = 'Earth Belt', -- 20
        Legs = { Name = 'Blood Cuisses', Priority = 70 }, -- 21
        Feet = { Name = 'Kaiser Schuhs', Priority = 60 },
    },
    EarthRes = {
        Main = { Name = 'Club of Trials', Priority = 70 }, -- 10
        Sub = { Name = 'Nms. Shield +1', Priority = 50 }, -- 15
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Sand Gloves', -- 11
        Ring1 = 'Robust Ring', -- 10
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Gaia Mantle +1', -- 10
        Waist = 'Wind Belt', -- 20
        Legs = 'Beak Trousers +1', -- 7
        Feet = { Name = 'Blood Greaves', Priority = 70 }, -- 21
    },
    WindRes = {
        Main = { Name = 'Sapara Of Trials', Priority = 60 }, -- 10
        Sub = { Name = 'Nms. Shield +1', Priority = 50 }, -- 15
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Omn. Earring', -- 11
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = { Name = 'Kaiser Handschuhs', Priority = 60 },
        Ring1 = 'Nimble Ring', -- 10
        Ring2 = 'Malgust Ring', -- 10
        Back = 'Wolf Mantle +1', -- 3
        Waist = 'Ice Belt', -- 20
        Legs = 'Mythril Cuisses +1', -- 3
        Feet = { Name = 'Blood Greaves', Priority = 70 }, -- 21
    },
    WaterRes = {
        Main = { Name = 'Club of Trials', Priority = 70 }, -- 10
        Sub = { Name = 'Nms. Shield +1', Priority = 50 }, -- 15
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Coral Fng. Gnt. +1', -- 4
        Ring1 = 'Communion Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = 'Wolf Mantle +1', -- 3
        Waist = 'Lightning Belt', -- 20
        Legs = { Name = 'Blood Cuisses', Priority = 70 }, -- 21
        Feet = { Name = 'Scp. Leggings +1', Priority = 60 }, -- 7
    },
    Evasion = { -- Breath Damage Taken
        Main = 'Hrotti',
        Sub = 'Palmerin\'s Shield',
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Legs = 'Bahamut\'s Hose',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
    },
    Override = { -- An additional override set explicitly to be used for sets such as crafting, HELM, fishing, or any other special sets such as DRK 2HR, MNK Counter etc. n.b. Any unused Resist or Evasion set can be used similarly.
        Body = 'Field Tunica',
        Hands = 'Field Gloves',
        Legs = 'Field Hose',
        Feet = 'Field Boots'
    },

    Precast = {
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Legs = { Name = 'Homam Cosciales', Priority = 70 },
    },
    SIRD = { -- Override sets (Resistance / Evasion) take precedence if in use. -- 1459
        Main = { Name = 'Tutelary', Priority = 60 },
        Sub = 'Light Buckler',
        Head = { Name = 'Kaiser Schaller', Priority = 60 },
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Knightly Earring', -- 9
        Ear2 = { Name = 'Magnetic Earring', Priority = 1 }, -- 8
        Body = { Name = 'Kaiser Cuirass', Priority = 60 },
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = 'Silver Obi +1', -- 8
        Legs = { Name = 'Vlr. Breeches +1', Priority = 1 }, -- 10
        Feet = 'Mountain Gaiters',
    },
    Haste = { -- 1478
        Main = { Name = 'Capricorn Staff', Priority = -100 },
        Sub = 'displaced',
        Head = { Name = 'Homam Zucchetto', Priority = 1 },
        Neck = 'Willpower Torque',
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 1 },
        Body = { Name = 'Kaiser Cuirass', Priority = 60 },
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring1 = 'Blitz Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = 'Sonic Belt',
        Legs = { Name = 'Homam Cosciales', Priority = 70 },
        Feet = { Name = 'Homam Gambieras', Priority = 70 },
    },
    Haste_Ichi = { -- Optional, provided here only if you wish to mix in SIRD or other stats over max haste
        Main = { Name = 'Durandal', Priority = -100 },
        Sub = 'Light Buckler',
    },
    Flash = { -- Set Hierarchy is Hate -> Haste -> Flash -- 1436
        Neck = 'Harmonia\'s Torque',
        Ear2 = { Name = 'Hades Earring +1', Priority = 50 },
        Body = { Name = 'Hydra Haubert', Priority = -100 },
        Ring1 = 'Hercules\' Ring',
        Back = { Name = 'Valor Cape', Priority = 60 },
    },

    Hate = { -- 1435
        Main = { Name = 'Tutelary', Priority = 60 },
        Sub = 'Kaiser Shield',
        Head = 'Bahamut\'s Mask',
        Neck = 'Harmonia\'s Torque',
        Ear1 = { Name = 'Hades Earring +1', Priority = 50 },
        Ear2 = { Name = 'Cassie Earring', Priority = 20 },
        Body = { Name = 'Hydra Haubert', Priority = -100 },
        Hands = { Name = 'Hydra Moufles', Priority = 20 },
        Ring1 = 'Hercules\' Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Valor Cape', Priority = 60 },
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Vlr. Breeches +1', Priority = 1 },
        Feet = { Name = 'Vlr. Leggings +1', Priority = 60 },
    },
    Cure = { -- 1349
        Main = 'Apollo\'s Staff',
        Sub = 'displaced',
        Ear1 = 'Hospitaler Earring',
        Hands = { Name = 'Vlr. Gauntlets +1', Priority = 60 },
    },

    Cheat_C3HPDown = { -- 1207
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Range = 'Lightning Bow +1',
        Ammo = 'displaced',
        Head = 'Darksteel Cap +1',
        Body = { Name = 'Hydra Haubert', Priority = 20 },
        Neck = 'Willpower Torque',
        Ear1 = 'Knightly Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Hands = { Name = 'Hydra Moufles', Priority = 20 },
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Serket Ring', Priority = 20 },
        Back = 'Shadow Mantle',
        Waist = 'Silver Obi +1',
        Legs = { Name = 'Vlr. Breeches +1', Priority = 60 },
        Feet = 'Mountain Gaiters',
    },
    Cheat_C3HPUp = { -- 1430 (223)
        Main = 'Apollo\'s Staff',
        Sub = 'displaced',
        Range = { Name = 'Rosenbogen', Priority = 60 },
        Ammo = 'displaced',
        Head = 'Bahamut\'s Mask',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Hospitaler Earring',
        Ear2 = { Name = 'Hades Earring +1', Priority = 50 },
        Body = { Name = 'Hydra Haubert', Priority = 20 },
        Hands = { Name = 'Hydra Moufles', Priority = 20 },
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Valor Cape', Priority = 60 },
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Vlr. Breeches +1', Priority = 60 },
        Feet = { Name = 'Vlr. Leggings +1', Priority = 60 },
    },
    Cheat_C4HPDown = { -- 1072
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Range = 'Lightning Bow +1',
        Ammo = 'displaced',
        Head = { Name = 'Faerie Hairpin', Priority = 30 },
        Neck = 'Willpower Torque',
        Ear1 = 'Knightly Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = { Name = 'Hydra Haubert', Priority = 20 },
        Hands = { Name = 'Hydra Moufles', Priority = 20 },
        Ring1 = { Name = 'Ether Ring', Priority = 20 },
        Ring2 = { Name = 'Serket Ring', Priority = 20 },
        Back = 'Shadow Mantle',
        Waist = 'Silver Obi +1',
        Legs = { Name = 'Hydra Brayettes', Priority = 20 },
        Feet = { Name = 'Hydra Sollerets', Priority = 20 },
    },
    Cheat_C4HPUp = { -- 1514 (442)
        Main = 'Apollo\'s Staff',
        Sub = 'displaced',
        Range = { Name = 'Rosenbogen', Priority = 60 },
        Ammo = 'displaced',
        Head = 'Bahamut\'s Mask',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Hospitaler Earring',
        Ear2 = { Name = 'Hades Earring +1', Priority = 50 },
        Body = { Name = 'Vlr. Surcoat +1', Priority = 60 },
        Hands = { Name = 'Vlr. Gauntlets +1', Priority = 60 },
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Valor Cape', Priority = 60 },
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Vlr. Breeches +1', Priority = 60 },
        Feet = { Name = 'Vlr. Leggings +1', Priority = 60 },
    },

    Enlight = { -- Only used on dps mode
        Neck = 'Divine Torque',
        Ear1 = 'Divine Earring',
        Body = { Name = 'Glt. Surcoat +1', Priority = 60 },
        Back = { Name = 'Altruistic Cape', Priority = 50 },
    },
    Banish = {
        Main = 'Apollo\'s Staff',
        Sub = 'displaced',
        Head = 'Maat\'s Cap',
        Neck = { Name = 'Promise Badge', Priority = 60 },
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Novio Earring',
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Hands = { Name = 'Dvt. Mitts +1', Priority = 50 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = { Name = 'Altruistic Cape', Priority = 50 },
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Magic Cuisses',
        Feet = { Name = 'Vlr. Leggings +1', Priority = 60 },
    },

    Enhancing = {
        Neck = 'Enhancing Torque',
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Legs = { Name = 'Glt. Breeches +1', Priority = 60 },
    },
    Stoneskin = {
        Main = { Name = 'Tutelary', Priority = 60 },
        Sub = 'Light Buckler',
        Head = 'Maat\'s Cap',
        Neck = 'Stone Gorget',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Hands = { Name = 'Dvt. Mitts +1', Priority = 50 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Shadow Mantle',
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = { Name = 'Kaiser Diechlings', Priority = 60 },
        Feet = { Name = 'Vlr. Leggings +1', Priority = 60 },
    },

    TP_LowAcc = {
        Head = { Name = 'Homam Zucchetto', Priority = 70 },
        Neck = 'Fortitude Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Assault Earring',
        Body = 'Haubergeon +1',
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring1 = 'Flame Ring',
        Ring2 = 'Blitz Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Sonic Belt',
        Legs = { Name = 'Homam Cosciales', Priority = 70 },
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 }
    },
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Body = { Name = 'Homam Corazza', Priority = 70 },
        Hands = { Name = 'Homam Manopolas', Priority = 70 },
        Ring1 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Back = 'Settler\'s Cape',
        Feet = { Name = 'Homam Gambieras', Priority = 70 }
    },

    Weapon_Loadout_1 = {
        Main = 'Joyeuse',
        Sub = 'Palmerin\'s Shield',
        Range = 'Lightning Bow +1',
        Ammo = 'displaced',
    },
    Weapon_Loadout_2 = {
        Main = 'Justice Sword',
        Sub = 'Octave Club',
        Range = 'Lightning Bow +1',
        Ammo = 'Virtue Stone',
        Neck = 'Peacock Amulet',
        Ear1 = 'Stealth Earring',
    },
    Weapon_Loadout_3 = {
        Main = 'Martial Wand',
        Sub = 'Octave Club',
        Range = 'Lightning Bow +1',
        Ammo = 'displaced',
        Neck = 'Prudence Torque',
        Ear1 = 'Stealth Earring',
    },

    WS = {
        Head = 'Maat\'s Cap',
        Neck = 'Fortitude Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Assault Earring',
        Body = { Name = 'Hct. Harness +1', Priority = 60 },
        Hands = { Name = 'Hct. Mittens +1', Priority = 60 },
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Vlr. Breeches +1', Priority = 60 },
        Feet = { Name = 'Hct. Leggings +1', Priority = 60 },
    },
    WS_HighAcc = {
        Ring1 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Waist = 'Life Belt',
    },
    WS_Vorpal = {},
    WS_Swift = {},
    WS_Savage = {
        Neck = 'Soil Gorget',
    },
    WS_KnightsOfRound = {
        Neck = 'Light Gorget',
        Ear2 = 'Triumph Earring',
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 60 },
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
        Waist = 'Warwolf Belt',
    },
    WS_SpiritsWithin = {},

    Cover = {
        -- Head = { Name = 'Glt. Coronet +1', Priority = 60 },
        Body = { Name = 'Vlr. Surcoat +1', Priority = 60 },
    },
    Rampart = { -- Rampart gives VIT x2 damage shield in era
        Main = { Name = 'Durandal', Priority = -100 },
        Sub = 'Kaiser Shield',
        Range = { Name = 'Rosenbogen', Priority = 60 },
        Ammo = 'displaced',
        Head = { Name = 'Kaiser Schaller', Priority = 60 },
        Neck = 'Fortitude Torque',
        Ear1 = 'Robust Earring',
        Ear2 = 'Robust Earring',
        Body = { Name = 'Kaiser Cuirass', Priority = 60 },
        Hands = { Name = 'Kaiser Handschuhs', Priority = 60 },
        Ring1 = 'Robust Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Valor Cape', Priority = 60 },
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Kaiser Diechlings', Priority = 60 },
        Feet = { Name = 'Kaiser Schuhs', Priority = 60 },
    },
    ShieldBash = {
        Sub = 'Kaiser Shield',
        Ear1 = 'Knightly Earring',
        Hands = { Name = 'Vlr. Gauntlets +1', Priority = 60 },
    },
    HolyCircle = {
        Feet = { Name = 'Glt. Leggings +1', Priority = 60 },
    },

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    VileElixir = {
        Main = { Name = 'Tutelary', Priority = 60 },
        Sub = 'Kaiser Shield',
        Range = { Name = 'Rosenbogen', Priority = 60 },
        Ammo = 'displaced',
        Head = { Name = 'Homam Zucchetto', Priority = 70 },
        Neck = { Name = 'Pch. Collar', Priority = 70 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Hands = { Name = 'Blood Fng. Gnt.', Priority = 70 },
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Gigant Mantle', Priority = 60 },
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = { Name = 'Blood Cuisses', Priority = 70 },
        Feet = { Name = 'Homam Gambieras', Priority = 70 },
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

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

sets.parade_gorget = parade_gorget
sets.hercules_ring = hercules_ring
sets.valor_leggings = valor_leggings
sets.arco_de_velocidad = arco_de_velocidad
sets.warlocks_mantle = warlocks_mantle
sets.shadow_mantle = shadow_mantle
sets.resentment_cape_override = resentment_cape_override
profile.Sets = gcmelee.AppendSets(sets)

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()

    if (action.Name == 'Chivalry') then
        return
    end

    gFunc.EquipSet(sets.Hate)

    if (action.Name == 'Holy Circle') then
        gFunc.EquipSet(sets.HolyCircle)
    elseif (action.Name == 'Rampart') then
        gFunc.EquipSet(sets.Rampart)
        local environment = gData.GetEnvironment()
        if (environment.DayElement == 'Dark') then
            gFunc.EquipSet('shadow_mantle')
        end
    elseif (action.Name == 'Shield Bash') then
        gFunc.EquipSet(sets.ShieldBash)
    elseif (action.Name == 'Sentinel') then
        gFunc.EquipSet(sets.valor_leggings)
    elseif (action.Name == 'Cover') then
        gFunc.EquipSet(sets.Cover)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    gcmelee.DoPreshot(sets.Preshot, gFunc.Combine(sets.Preshot, sets.Ranged), snapShotValue)
end

profile.HandleMidshot = function()
    gcmelee.DoMidshot(sets, gFunc.Combine(sets.Preshot, sets.Ranged))
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local action = gData.GetAction()
    if (action.Name == 'Vorpal Blade') then
        gFunc.EquipSet(sets.WS_Vorpal)
    elseif (action.Name == 'Swift Blade') then
        gFunc.EquipSet(sets.WS_Swift)
    elseif (action.Name == 'Savage Blade') then
        gFunc.EquipSet(sets.WS_Savage)
    elseif (action.Name == 'Knights of Round') then
        gFunc.EquipSet(sets.WS_KnightsOfRound)
    elseif (action.Name == 'Spirits Within') then
        gFunc.EquipSet(sets.WS_SpiritsWithin)
    end
end

profile.OnLoad = function()
    gcmelee.Load()
    gcmelee.SetIsDPS(false)
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
end

profile.HandleCommand = function(args)
    gcmelee.DoCommands(args)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)

    local player = gData.GetPlayer()
    local cover = gData.GetBuffCount('Cover')

    if (cover >= 1) then
        gFunc.EquipSet(sets.Cover)
    end

    local environment = gData.GetEnvironment()
    if (environment.Time >= 6 and environment.Time < 18 and player.HPP < 100) then
        gFunc.EquipSet('arco_de_velocidad')
    end

    if (player.HPP >= 85) then
        gFunc.EquipSet('parade_gorget')
    end

    if (player.HPP <= 50) then
        gFunc.EquipSet('hercules_ring')
    end

    gcmelee.DoDefaultOverride()

    if (gcdisplay.IdleSet == 'MDT' and conquest:GetOutsideControl()) then
        gFunc.EquipSet('resentment_cape_override')
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    local target = gData.GetActionTarget()
    local action = gData.GetAction()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

    local cheatDelay = 0
    if (player.SubJob == 'RDM' and warlocks_mantle.Back) then
        cheatDelay = gcmelee.DoPrecast(fastCastValue + 0.02)
        gFunc.EquipSet('warlocks_mantle')
    else
        cheatDelay = gcmelee.DoPrecast(fastCastValue)
    end

    local function delayCheat()
        if (target.Name == me) then
            if (action.Name == 'Cure III') then
                gFunc.ForceEquipSet(sets.Cheat_C3HPDown)
                gFunc.ForceEquipSet(sets.Cheat_C3HPUp)
            elseif (action.Name == 'Cure IV') then
                gFunc.ForceEquipSet(sets.Cheat_C4HPDown)
                gFunc.ForceEquipSet(sets.Cheat_C4HPUp)
            end
        end
    end

    if (cheatDelay <= 0) then
        delayCheat()
    else
        delayCheat:once(cheatDelay)
    end
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local target = gData.GetActionTarget()
    local action = gData.GetAction()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

    if (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Hate)
        gFunc.EquipSet(sets.Cure)

        if (target.Name == me) then
            if (action.Name == 'Cure III') then
                gFunc.EquipSet(sets.Cheat_C3HPUp)
            elseif (action.Name == 'Cure IV') then
                gFunc.EquipSet(sets.Cheat_C4HPUp)
            end
        end
    elseif (action.Skill == 'Divine Magic') then
        if (action.Name == 'Flash') then
            gFunc.EquipSet(sets.Hate)
            gFunc.EquipSet(sets.Haste)
            gFunc.EquipSet(sets.Flash)
        elseif (action.Name == 'Enlight') then
            if (gcmelee.GetIsDPS()) then
                gFunc.EquipSet(sets.Enlight)
            end
        else
            gFunc.EquipSet(sets.Banish)
        end
    elseif (action.Skill == 'Ninjutsu') then
        gFunc.EquipSet(sets.Haste)
        if (action.Name == 'Utusemi: Ichi') then
            gFunc.EquipSet(sets.Haste_Ichi)
        end
    elseif (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing)
        if (action.Name == 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin)
        end
    end
end

return profile
