local profile = {}

local fastCastValue = 0.07 -- 0% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local windRingMaxHP = 0
local wind_ring = {
    -- Ring2 = 'Wind Ring',
}
local evasion_master_casters_mitts = {
    Hands = 'Mst.Cst. Mitts',
}

local sets = {
    Idle = {
        Head = { Name = 'Rog. Bonnet +1', Priority = 20 },
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Musical Earring',
        Ear2 = 'Novia Earring',
        Body = { Name = 'Scp. Harness +1', Priority = 20 },
        Hands = { Name = 'War Gloves +1', Priority = 20 },
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = 'Boxer\'s Mantle',
        Waist = { Name = 'Scouter\'s Rope', Priority = -5 },
        Legs = 'Raven Hose',
        Feet = 'Dance Shoes +1',
    },
    IdleALT = {
        Main = 'Terra\'s Staff',
        Head = { Name = 'Rog. Bonnet +1', Priority = 20 },
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Musical Earring',
        Ear2 = 'Novia Earring',
        Body = { Name = 'Scp. Harness +1', Priority = 20 },
        Hands = { Name = 'War Gloves +1', Priority = 20 },
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = 'Boxer\'s Mantle',
        Waist = { Name = 'Scouter\'s Rope', Priority = -5 },
        Legs = 'Raven Hose',
        Feet = 'Dance Shoes +1',
    },
    Resting = {
        Body = 'Nomad\'s Tunica',
        Neck = 'Paisley Scarf',
        Ear1 = 'Sanative Earring',
        Hands = 'Nomad\'s Gloves',
        Legs = 'Nomad\'s Hose',
        Feet = 'Nomad\'s Boots',
    },
    Town = {},
    Movement = {
        Feet = 'Trotter Boots',
    },
    Movement_TP = {
        Hands = { Name = 'Homam Manopolas', Priority = 30 },
    },

    DT = {
        Head = 'Darksteel Cap +1',
        Neck = { Name = 'Evasion Torque', Priority = 20 },
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = 'Shadow Mantle',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    MDT = {
        Head = { Name = 'Homam Zucchetto', Priority = 30 },
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Merman\'s Harness', Priority = 15 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = 'Resentment Cape',
        Waist = { Name = 'Powerful Rope', Priority = 30 },
        Legs = { Name = 'Merman\'s Subligar', Priority = 15 },
        Feet = { Name = 'Mmn. Leggings', Priority = 15 },
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {
        Head = 'Optical Hat',
        Neck = 'Evasion Torque',
        Ear1 = 'Musical Earring',
        Ear2 = 'Novia Earring',
        Body = { Name = 'Scp. Harness +1', Priority = 20 },
        Hands = { Name = 'War Gloves +1', Priority = 20 },
        Ring1 = 'Breeze Ring',
        Ring2 = 'Nimble Ring',
        Back = 'Boxer\'s Mantle',
        Waist = { Name = 'Scouter\'s Rope', Priority = -5 },
        Legs = 'Raven Hose',
        Feet = 'Dance Shoes +1',
    },
    Override = { -- An additional override set explicitly to be used for sets such as crafting, HELM, fishing, or any other special sets such as DRK 2HR, MNK Counter etc. n.b. Any unused Resist or Evasion set can be used similarly.
        Body = 'Field Tunica',
        Hands = 'Field Gloves',
        Legs = 'Field Hose',
        Feet = 'Field Boots'
    },

    Precast = {
        Ear2 = { Name = 'Loquac. Earring', Priority = 10 },
        Legs = { Name = 'Homam Cosciales', Priority = 30 },
    },
    SIRD = { -- Override sets (Resistance / Evasion) take precedence if in use.
        Head = 'Optical Hat',
        Neck = 'Evasion Torque',
        Ear1 = 'Musical Earring',
        Ear2 = 'Novia Earring',
        Body = { Name = 'Scp. Harness +1', Priority = 20 },
        Hands = { Name = 'War Gloves +1', Priority = 20 },
        Ring1 = 'Breeze Ring',
        Ring2 = 'Nimble Ring',
        Back = 'Boxer\'s Mantle',
        Waist = { Name = 'Scouter\'s Rope', Priority = -5 },
        Legs = 'Raven Hose',
        Feet = 'Dance Shoes +1',
    },
    Haste = {
        Head = { Name = 'Homam Zucchetto', Priority = 30 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 10 },
        Body = 'Rapparee Harness',
        Hands = { Name = 'Dusk Gloves +1', Priority = 20 },
        Waist = 'Sonic Belt',
        Legs = { Name = 'Homam Cosciales', Priority = 30 },
        Feet = { Name = 'Homam Gambieras', Priority = 30 },
    },

    TP_LowAcc = {
        Head = { Name = 'Homam Zucchetto', Priority = 30 },
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Rapparee Harness', Priority = -2 },
        Hands = { Name = 'Dusk Gloves +1', Priority = 20 },
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
        Back = 'Forager\'s Mantle',
        Waist = { Name = 'Sonic Belt', Priority = 2 },
        Legs = { Name = 'Homam Cosciales', Priority = 30 },
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 20 }
    },
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {
        Head = 'Maat\'s Cap',
    },
    TP_HighAcc = {
        Body = { Name = 'Homam Corazza', Priority = 30 },
        Ring1 = { Name = 'Toreador\'s Ring', Priority = 20 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 20 },
        Feet = { Name = 'Homam Gambieras', Priority = 30 }
    },
    TP_NIN = {
        Ear2 = 'Stealth Earring',
    },

    -- Note that these sets are for naked SA/TA/SATAs without WS
    SA = {
        Head = 'Maat\'s Cap',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Pixie Earring',
        Body = 'Dragon Harness +1',
        Hands = { Name = 'Dusk Gloves +1', Priority = 20 },
        Ring1 = 'Thunder Ring',
        Ring2 = 'Adroit Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Dusk Trousers +1', Priority = 20 },
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 20 },
    },
    TA = {
        Head = 'Maat\'s Cap',
        Neck = 'Hope Torque',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'Dragon Harness +1',
        Hands = { Name = 'Rog. Armlets +1', Priority = 20 },
        Ring1 = 'Breeze Ring',
        Ring2 = 'Nimble Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Sonic Belt',
        Legs = { Name = 'Dusk Trousers +1', Priority = 20 },
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 20 },
    },
    SATA = {
        Head = 'Maat\'s Cap',
        Neck = 'Love Torque',
        Ear1 = 'Pixie Earring',
        Ear2 = 'Drone Earring',
        Body = 'Dragon Harness +1',
        Hands = { Name = 'Rog. Armlets +1', Priority = 20 },
        Ring1 = 'Thunder Ring',
        Ring2 = 'Adroit Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Dusk Trousers +1', Priority = 20 },
        Feet = { Name = 'Drn. Leggings +1', Priority = 20 },
    },

    -- The following demonstrates layering of WS sets that should cover all debatable major WS combinations
    WS = {
        Head = 'Maat\'s Cap',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dragon Harness +1',
        Hands = { Name = 'Hct. Mittens +1', Priority = 20 },
        Ring1 = 'Thunder Ring',
        Ring2 = 'Adroit Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Hct. Subligar +1', Priority = 20 },
        Feet = { Name = 'Hct. Leggings +1', Priority = 20 },
    },
    WS_HighAcc = {
        Body = { Name = 'Hct. Harness +1', Priority = 20 },
        Ring1 = { Name = 'Toreador\'s Ring', Priority = 20 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 20 },
        Waist = 'Life Belt',
    },

    WS_Evisceration = {},
    WS_DancingEdge = {},
    WS_SharkBite = {
        Feet = 'Drn. Leggings +1',
    },
    WS_MercyStroke = {
        Head = { Name = 'Hecatomb Cap +1', Priority = 20 },
        Ear2 = 'Triumph Earring',
        Body = { Name = 'Hct. Harness +1', Priority = 20 },
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
        Waist = 'Warwolf Belt',
    },
    WS_EnergyDrain = {
        Head = { Name = 'Hecatomb Cap +1', Priority = 20 },
        Ear2 = 'Triumph Earring',
        Body = { Name = 'Hct. Harness +1', Priority = 20 },
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
        Waist = 'Warwolf Belt',
    },

    -- The following are applied on both SA WS and SATA WS
    WS_SA = {
        Feet = { Name = 'Hct. Leggings +1', Priority = 20 },
    },
    WS_SA_SharkBite = {
        Ear2 = 'Pixie Earring',
        Feet = 'Drn. Leggings +1',
    },
    WS_SA_MercyStroke = {
        Ear2 = 'Pixie Earring',
    },
    WS_SA_EnergyDrain = {
        Ear2 = 'Pixie Earring',
        Ring1 = 'Thunder Ring',
        Ring2 = 'Adroit Ring',
    },

    WS_SATA_SharkBite = {
        Hands = { Name = 'Rogue\'s Armlets +1', Priority = 20 },
    },

    -- The following are only applied on TA WS and are NOT applied on SATA WS
    WS_TA = {
        Feet = 'Drn. Leggings +1',
    },
    WS_TA_SharkBite = {
        Ear2 = 'Drone Earring',
        Hands = { Name = 'Rogue\'s Armlets +1', Priority = 20 },
        Ring1 = 'Breeze Ring',
        Ring2 = 'Nimble Ring',
        Waist = { Name = 'Scouter\'s Rope', Priority = -5 },
    },
    WS_TA_MercyStroke = {
        Ear2 = 'Drone Earring',
        Hands = { Name = 'Hct. Mittens +1', Priority = 20 },
    },
    WS_TA_EnergyDrain = {
        Ear2 = 'Drone Earring',
        Ring1 = 'Breeze Ring',
        Ring2 = 'Nimble Ring',
    },

    WS_Cyclone = {
        Head = 'Maat\'s Cap',
        Neck = 'Prudence Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Blue Cotehard. +1',
        Hands = { Name = 'Hct. Mittens +1', Priority = 20 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Assassin\'s Cape',
        Waist = 'Ryl.Kgt. Belt',
        Legs = { Name = 'Hct. Subligar +1', Priority = 20 },
        Feet = { Name = 'Hct. Leggings +1', Priority = 20 },
    },

    Flee = {
        Feet = 'Rogue\'s Poulaines',
    },
    Hide = {
        Body = { Name = 'Rogue\'s Vest', Priority = 20 },
    },
    Mug = {
        Head = { Name = 'Asn. Bonnet +1', Priority = 20 },
        Legs = { Name = 'Asn. Culottes +1', Priority = 20 },
    },
    TH = {
        Neck = 'Nanaa\'s Charm',
        Hands = { Name = 'Asn. Armlets +1', Priority = 20 },
    },
    Steal_HPDown = {
        Head = 'Optical Hat',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Musical Earring',
        Ear2 = 'Novia Earring',
        Body = 'Rapparee Harness',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Ether Ring', Priority = 5 },
        Back = 'Boxer\'s Mantle',
        Waist = { Name = 'Scouter\'s Rope', Priority = -5 },
        Legs = 'Raven Hose',
        Feet = 'Dance Shoes +1',
    },
    Steal = { -- 1225 + 55 + 326 -> 1280 -> 1204 / 1606
        Head = { Name = 'Rog. Bonnet +1', Priority = 20 },
        Neck = 'Rabbit Charm',
        Ear1 = { Name = 'Cassie Earring', Priority = 15 },
        Ear2 = { Name = 'Pigeon Earring +1', Priority = 20 },
        Body = { Name = 'Homam Corazza', Priority = 30 },
        Hands = 'Thief\'s Kote',
        Ring1 = 'Rogue\'s Ring',
        Ring2 = { Name = 'Bomb Queen Ring', Priority = 20 },
        Back = { Name = 'Gigant Mantle', Priority = 20 },
        Waist = { Name = 'Powerful Rope', Priority = 30 },
        Legs = { Name = 'Asn. Culottes +1', Priority = 20 },
        Feet = { Name = 'Rogue\'s Poulaines', Priority = 20 },
    },

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {
        Range = 'Ziska\'s Crossbow',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'Dragon Harness +1',
        Hands = 'Dragon Mittens +1',
        Ring1 = 'Behemoth Ring +1',
        Ring2 = 'Behemoth Ring +1',
        Back = 'Jaeger Mantle',
        Waist = { Name = 'Scouter\'s Rope', Priority = -5 },
        Legs = { Name = 'Dusk Trousers +1', Priority = 20 },
        Feet = { Name = 'Homam Gambieras', Priority = 30 },
    },
    Ranged_INT = {
        Head = 'Maat\'s Cap',
        Neck = 'Prudence Torque',
        Ear1 = 'Omn. Earring',
        Ear2 = 'Omn. Earring',
        Body = { Name = 'Blue Cotehard. +1', Priority = 5 },
        Hands = 'Engineer\'s Gloves',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = { Name = 'Fed. Army Mantle', Priority = 10 },
        Waist = 'Ryl.Kgt. Belt',
        Feet = 'Mountain Gaiters',
    },

    None = { -- Default range / ammo equipment while idle
        Range = 'displaced',
        Ammo = 'Bomb Core',
    },
    None_RA = { -- Used for ranged attacks when None set is being used instead of the bolt sets defined below
        Range = 'displaced',
        Ammo = 'Dart',
    },
    Acid = {
        Ammo = 'Acid Bolt',
    },
    Sleep = {
        Ammo = 'Sleep Bolt',
    },
    Bloody = {
        Ammo = 'Bloody Bolt',
    },
    Blind = {
        Ammo = 'Blind Bolt',
    },
    Venom = {
        Ammo = 'Venom Bolt',
    },

    LockSet1 = { -- Slug Shot THF 2H Zerg
        Head = { Name = 'Hecatomb Cap +1', Priority = 20 },
        Ear1 = 'Triumph Earring',
        Ear2 = 'Drone Earring',
        Body = { Name = 'Hct. Harness +1', Priority = 20 },
        Hands = { Name = 'Hct. Mittens +1', Priority = 20 },
        Ring1 = 'Triumph Ring',
        Ring2 = 'Nimble Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Warwolf Belt',
        Legs = 'Republic Subligar',
        Feet = { Name = 'Hct. Leggings +1', Priority = 20 },
    },
    LockSet2 = {},
    LockSet3 = {},

    Weapon_Loadout_1 = {
        Main = 'Blau Dolch',
        Sub = 'X\'s Knife',
    },
    Weapon_Loadout_2 = {
        Main = 'Blau Dolch',
        Sub = 'Sirocco Kukri',
    },
    Weapon_Loadout_3 = {
        Main = 'Blau Dolch',
        Sub = 'Viking Shield',
    },

    VileElixir = {
        Head = { Name = 'Homam Zucchetto', Priority = 30 },
        Neck = 'Shield Pendant',
        Ear1 = { Name = 'Cassie Earring', Priority = 15 },
        Ear2 = { Name = 'Pigeon Earring +1', Priority = 20 },
        Body = { Name = 'Homam Corazza', Priority = 30 },
        Hands = { Name = 'Feronia\'s Bangles', Priority = 20 },
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 20 },
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = { Name = 'Gigant Mantle', Priority = 20 },
        Waist = { Name = 'Powerful Rope', Priority = 30 },
        Legs = { Name = 'Dusk Trousers +1', Priority = 20 },
        Feet = { Name = 'Homam Gambieras', Priority = 30 },
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

sets.evasion_master_casters_mitts = evasion_master_casters_mitts
sets.wind_ring = wind_ring
profile.Sets = gcmelee.AppendSets(sets)

local ammo = T{'aacid','asleep','abloody','ablind','avenom','anone'}

local AmmoTable1 = {
    [1] = 'None',
    [2] = 'Acid',
    [3] = 'Sleep',
    [4] = 'Bloody',
    [5] = 'Blind',
    [6] = 'Venom',
}
local AmmoTable2 = {
    ['none'] = 1,
    ['acid'] = 2,
    ['sleep'] = 3,
    ['bloody'] = 4,
    ['blind'] = 5,
    ['venom'] = 6,
}

local saOverride = 0
local taOverride = 0
local taggedMobs = {}

actionpacket = gFunc.LoadFile('common\\actionpacket.lua')

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Flee') then
        gFunc.EquipSet(sets.Flee)
    elseif (action.Name == 'Hide') then
        gFunc.EquipSet(sets.Hide)
    elseif (action.Name == 'Steal') then
        gFunc.ForceEquipSet(sets.Steal_HPDown)
        gFunc.EquipSet(sets.Steal)
    elseif (action.Name == 'Mug') then
        gFunc.EquipSet(sets.Mug)
    elseif (action.Name == 'Sneak Attack') then
        saOverride = os.clock() + 2
    elseif (action.Name == 'Trick Attack') then
        taOverride = os.clock() + 2
    end

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.getRangedSet = function()
    local rangedSet = gFunc.Combine(sets.Preshot, sets.Ranged)

    if (gcdisplay.GetCycle('Ammo') == 'Bloody') then
        rangedSet = gFunc.Combine(rangedSet, sets.Ranged_INT)
    elseif (gcdisplay.GetCycle('Ammo') == 'None') then
        return sets.None_RA
    end

    return gFunc.Combine(rangedSet, sets[gcdisplay.GetCycle('Ammo')])
end

profile.HandlePreshot = function()
    gcmelee.DoPreshot(sets.Preshot, profile.getRangedSet(), snapShotValue)
end

profile.HandleMidshot = function()
    gcmelee.DoMidshot(sets, profile.getRangedSet())
    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local action = gData.GetAction()
    if (action.Name == 'Evisceration') then
        gFunc.EquipSet(sets.WS_Evisceration)
    elseif (action.Name == 'Shark Bite') then
        gFunc.EquipSet(sets.WS_SharkBite)
    elseif (action.Name == 'Dancing Edge') then
        gFunc.EquipSet(sets.WS_DancingEdge)
    elseif (action.Name == 'Mercy Stroke') then
        gFunc.EquipSet(sets.WS_MercyStroke)
    elseif (action.Name == 'Energy Drain') then
        gFunc.EquipSet(sets.WS_EnergyDrain)
    end

    local sa = gData.GetBuffCount('Sneak Attack')
    local ta = gData.GetBuffCount('Trick Attack')

    if (sa == 1) or (os.clock() < saOverride) then
        gFunc.EquipSet(sets.WS_SA)
        if (action.Name == 'Shark Bite') then
            gFunc.EquipSet(sets.WS_SA_SharkBite)
        elseif (action.Name == 'Mercy Stroke') then
            gFunc.EquipSet(sets.WS_SA_MercyStroke)
        elseif (action.Name == 'Energy Drain') then
            gFunc.EquipSet(sets.WS_SA_EnergyDrain)
        end
    end

    if (sa == 1 and ta == 1) or (os.clock() < saOverride and os.clock() < taOverride) then
        if (action.Name == 'Shark Bite') then
            gFunc.EquipSet(sets.WS_SATA_SharkBite)
        end
    elseif (ta == 1) or (os.clock() < taOverride) then
        gFunc.EquipSet(sets.WS_TA)
        if (action.Name == 'Shark Bite') then
            gFunc.EquipSet(sets.WS_TA_SharkBite)
        elseif (action.Name == 'Mercy Stroke') then
            gFunc.EquipSet(sets.WS_TA_MercyStroke)
        elseif (action.Name == 'Energy Drain') then
            gFunc.EquipSet(sets.WS_TA_EnergyDrain)
        end
    end

    if (action.Name == 'Cyclone') then
        gFunc.EquipSet(sets.WS_Cyclone)
    end

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.OnLoad = function()
    gcinclude.SetAlias(ammo)
    gcdisplay.CreateCycle('Ammo', AmmoTable1)
    gcinclude.SetAlias(T{'ammo'})
    gcinclude.SetAlias(T{'th'})
    gcdisplay.CreateCycle('TH', {[1] = 'Auto', [2] = 'On', [3] = 'Off'})
    gcmelee.Load()
    profile.SetMacroBook()
    profile.WatchTreasureHunter()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(ammo)
    gcinclude.ClearAlias(T{'ammo'})
    gcinclude.ClearAlias(T{'th'})
    ashita.events.unregister('packet_in', 'watch_treasure_hunter');
end

profile.HandleCommand = function(args)
    if (args[1] == 'th') then
        gcdisplay.AdvanceCycle('TH')
        gcinclude.Message('TH', gcdisplay.GetCycle('TH'))
    elseif (args[1] == 'ammo') then
        gcdisplay.AdvanceCycle('Ammo')
        gcinclude.Message('Ammo', gcdisplay.GetCycle('Ammo'))
    elseif (ammo:contains(args[1])) then
        gcdisplay.SetCycleIndex('Ammo', AmmoTable2[args[1]:sub(2)])
        gcinclude.Message('Ammo', gcdisplay.GetCycle('Ammo'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)

    local player = gData.GetPlayer()
    if (player.SubJob == 'NIN' and player.Status == 'Engaged') then
        local sub = gData.GetEquipment().Sub
        if (sub ~= nil) then
            if (sub.Resource.Slots == 3) then -- if this is a 1h weapon
                gFunc.EquipSet('TP_NIN')
            end
        end
    end

    gFunc.EquipSet(sets[gcdisplay.GetCycle('Ammo')])

    gcmelee.DoDefaultOverride()

    if (gcdisplay.IdleSet == 'Evasion') then
        if (conquest:GetOutsideControl()) then
            gFunc.EquipSet('evasion_master_casters_mitts')
        end

        local environment = gData.GetEnvironment()
        if (environment.DayElement == 'Wind' and player.HP <= windRingMaxHP) then
            gFunc.EquipSet(sets.wind_ring)
        end
    end

    local sa = gData.GetBuffCount('Sneak Attack')
    local ta = gData.GetBuffCount('Trick Attack')

    if (sa == 1 and ta == 1) or (os.clock() < saOverride and os.clock() < taOverride) then
        gFunc.EquipSet(sets.SATA)
    elseif (sa == 1) or (os.clock() < saOverride) then
        gFunc.EquipSet(sets.SA)
    elseif (ta == 1) or (os.clock() < taOverride) then
        gFunc.EquipSet(sets.TA)
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))

    if (player.Status == 'Engaged' and profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local action = gData.GetAction()
    if (action.Skill ~= 'Ninjutsu' and profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.NeedTH = function()
    if (gcdisplay.GetCycle('TH') == 'Auto') then
        local targetId
        local actionTarget = gData.GetActionTarget()

        if (actionTarget ~= nil) then
            targetId = actionTarget.Id
        else
            local targetIndex = gData.GetTargetIndex()
            if (targetIndex == 0) then
                return false
            end

            targetId = AshitaCore:GetMemoryManager():GetEntity():GetServerId(targetIndex)
        end

        if bit.band(targetId, 0xFF000000) ~= 0 then  --isMob
            return taggedMobs[targetId] == nil
        end

        return false
    end

    return gcdisplay.GetCycle('TH') == 'On'
end

profile.WatchTreasureHunter = function()
    ashita.events.register('packet_in', 'watch_treasure_hunter', function(e)
        local playerEntity = GetPlayerEntity();
        if (not playerEntity) then
            return
        end

        if (e.id == 0x28) then
            local type = {
                [1] = true, -- Attack
                [2] = true, -- Ranged Attack
                [3] = true, -- Ability
                [4] = true,
                [6] = true -- Also ability? (Provoke)
            };
            local packet = actionpacket:parse(e);
            if (packet.UserId == playerEntity.ServerId) then
                if (type[packet.Type]) then
                    local reaction = {
                        [0] = true, -- Spell Hit / ???
                        [8] = true, -- Attack Hit/Miss
                        [9] = true, -- Legacy
                        [16] = true, -- Range Attack Hit / Provoke ?
                        [17] = true, -- Range Attack Miss
                    }
                    for _, target in ipairs(packet.Targets) do
                        for i = 1, #target.Actions do
                            local action = target.Actions[1]
                            if bit.band(target.Id, 0xFF000000) ~= 0 then -- isMob, also triggers on NPC but it's benign
                                if (packet.Type == 3 or reaction[action.Reaction]) and target.Id then
                                    taggedMobs[target.Id] = true;
                                end
                            end
                        end
                    end
                end
            end
        elseif (e.id == 0x29) then
            local deathMes = T { 6, 20, 97, 113, 406, 605, 646 };
            -- Mob died, clear from table
            local message = struct.unpack('i2', e.data, 0x18 + 1);
            if (deathMes:contains(message)) then
                local target = struct.unpack('i4', e.data, 0x08 + 1);
                taggedMobs[target] = nil;
            end
        elseif (e.id == 0x0A or e.id == 0x0B) then
            -- Changed zone, clear all TH
            taggedMobs = {};
        end
    end)
end

return profile
