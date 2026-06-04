local profile = {}

local fastCastValue = 0.04 -- 4% from gear listed in Precast set not including carbuncles cuffs or evokers boots
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

local cureMP = 947 -- Cure set max MP

-- Disabled on horizon_safe_mode
local conjurersRingForced = false -- Default /cring value
local conjurersRingMaxHP = 737

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}
local carbuncle_mitts = {
    Hands = { Name = 'Carbuncle Mitts', Priority = 50 },
}
local yinyang_robe = {
    Body = { Name = 'Yinyang Robe', Priority = 50 },
}
local summoners_doublet = {
    Body = { Name = 'Smn. Doublet +1', Priority = 50 },
}
local summoners_horn = {
    Head = { Name = 'Summoner\'s Horn', Priority = 50 },
}
local conjurers_ring = {
    Ring1 = 'Conjurer\'s Ring',
}
local bahamuts_staff = {
    Main = { Name = 'Bahamut\'s Staff', Priority = 50 },
}

-- Disabled on horizon_safe_mode
local conjurers_earring_hp_threshold = 334 -- HP at which Conjurer's Earring set is equipped
local conjurers_earring = { -- 1339
    Main = 'Terra\'s Staff',
    Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
    Head = 'Dream Ribbon',
    Neck = { Name = 'Shield Pendant', Priority = 20 },
    Ear1 = { Name = 'Cassie Earring', Priority = 20 },
    Ear2 = 'Conjurer\'s Earring',
    Body = { Name = 'Justaucorps +1', Priority = 60 },
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
        Head = 'Dream Ribbon',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Yinyang Robe', Priority = 50 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Umbra Cape',
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = { Name = 'Evk. Spats +1', Priority = 50 },
        Feet = { Name = 'Herald\'s Gaiters', Priority = 50 },
    },
    IdleALT = {},
    IdleMaxMP = {
        Head = { Name = 'Summoner\'s Horn', Priority = 50 },
        Neck = { Name = 'Uggalepih Pendant', Priority = 50 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Hands = { Name = 'Smn. Bracers +1', Priority = 50 },
        Ring1 = { Name = 'Serket Ring', Priority = 10 },
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Mahatma Cape', Priority = 50 },
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
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    Town = {},
    Movement = {
        Feet = { Name = 'Herald\'s Gaiters', Priority = 50 },
    },
    Movement_TP = {},

    Perpetuation = {
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Summoner\'s Horn', Priority = 50 },
        Neck = 'Jeweled Collar +1',
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = 'Penance Robe',
        Hands = 'Nashira Gages',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Evoker\'s Ring', Priority = 50 },
        Back = 'Shadow Mantle',
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = { Name = 'Evk. Spats +1', Priority = 50 },
        Feet = { Name = 'Evk. Pigaches +1', Priority = 50 },
    },
    Perpetuation_Spirits = { -- For maximizing summoning skill with spirits out if you wish. Note that this set is entirely pointless on Horizon due to spirit cooldown being checked only at BP.
    },

    DT = {
        Main = 'Terra\'s Staff',
        Head = 'Dream Ribbon',
        Neck = 'Jeweled Collar +1',
        Ring1 = 'Jelly Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Umbra Cape',
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
        Body = { Name = 'Dalmatica', Priority = 10 },
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Malflame Ring', -- 10
        Back = { Name = 'Hexerei Cape', Priority = 50 },
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
        Body = { Name = 'Flora Cotehardie', Priority = 10 }, -- 5
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Adroit Ring', -- 10
        Ring2 = 'Malflash Ring', -- 10
        Back = { Name = 'Hexerei Cape', Priority = 50 },
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
        Body = 'Gaia Doublet +1', -- 12
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Robust Ring', -- 10
        Ring2 = 'Maldust Ring', -- 10
        Back = { Name = 'Blue Cape +1', Priority = 30 }, -- 7
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
        Back = { Name = 'Blue Cape +1', Priority = 30 }, -- 7
        Waist = 'Lightning Belt', -- 20
        Legs = 'Frog Trousers', -- 7
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
        Ring2 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Feet = { Name = 'Rostrum Pumps', Priority = 10 },
    },
    Precast_Summoning = {
        Hands = 'Carbuncle\'s Cuffs',
        Feet = { Name = 'Evoker\'s Boots', Priority = 50 },
    },
    SIRD = { -- Override sets (Resistance / Evasion) take precedence if in use.
        Neck = 'Willpower Torque', -- 5
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 }, -- 8
        Back = 'Shadow Mantle',
        Waist = 'Druid\'s Rope', -- 10
    },
    SIRD_NIN = {
    },
    Haste = {
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Hands = 'Nashira Gages',
        Back = 'Shadow Mantle',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
    },
    ConserveMP = {
        Ammo = { Name = 'Dream Sand', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Back = 'Maledictor\'s Shawl',
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
        Body = 'Nashira Manteel',
        Back = { Name = 'Altruistic Cape', Priority = 50 },
        Legs = 'Druid\'s Slops',
    },

    Enhancing = {
        Ammo = { Name = 'Dream Sand', Priority = 50 },
        Neck = 'Enhancing Torque',
        Ear1 = 'Augment. Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Hands = 'Nashira Gages',
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
    },
    Stoneskin = {
        Main = 'Kirin\'s Pole',
        Head = 'Maat\'s Cap',
        Neck = 'Stone Gorget',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Dvt. Mitts +1', Priority = 50 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = { Name = 'Prism Cape', Priority = 70 },
        Waist = { Name = 'Penitent\'s Rope', Priority = -10 },
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Mahatma Pigaches', Priority = 10 },
    },
    Spikes = {
        Main = 'Kirin\'s Pole',
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

    BP_Delay = {
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Summoner\'s Horn', Priority = 50 },
        Neck = 'Benign Necklace',
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = 'Novia Earring',
        Body = { Name = 'Yinyang Robe', Priority = 50 },
        Hands = { Name = 'Smn. Bracers +1', Priority = 50 },
        Ring1 = { Name = 'Serene Ring', Priority = 10 },
        Ring2 = { Name = 'Serene Ring', Priority = 10 },
        Back = { Name = 'Mahatma Cape', Priority = 50 },
        Waist = { Name = 'Penitent\'s Rope', Priority = -10 },
        Legs = { Name = 'Summoner\'s Spats', Priority = 50 },
        Feet = { Name = 'Summoner\'s Pgch.', Priority = 50 },
    },

    BP = {
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Evk. Horn +1', Priority = 50 },
        Neck = 'Smn. Torque',
        Ear1 = 'Smn. Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = 'Shep. Doublet',
        Hands = { Name = 'Smn. Bracers +1', Priority = 50 },
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Evoker\'s Ring', Priority = 50 },
        Back = { Name = 'Astute Cape', Priority = 50 },
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = 'Penance Slops',
        Feet = 'Nashira Crackows',
    },
    BP_Spirit = {
        Legs = { Name = 'Summoner\'s Spats', Priority = 50 },
    },
    BP_Magical = {
        Head = 'Buffalo Helm',
    },
    BP_Magical_Potency = {
        -- Feet = 'Shep. Boots', -- Increases damage at the cost of accuracy
    },
    BP_Physical = {
        Legs = { Name = 'Evk. Spats +1', Priority = 50 },
        -- Feet = 'Summoner\'s Pgch.', -- Increases damage at the cost of accuracy
    },
    BP_Physical_Crit = {
        Body = { Name = 'Smn. Doublet +1', Priority = 50 },
    },
    BP_Hybrid = {
        -- Feet = 'Shep. Boots', -- Increases damage at the cost of accuracy
    },
    BP_Healing = { -- This set is pointless unless your server penalizes healing BPs by attributing amount healed enmity to you.
    },

    TP = {},
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {},

    Weapon_Loadout_1 = {},
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},

    WS = {},
    WS_HighAcc = {},

    ConjurersRingHPDown = { -- Set to force HP below conjurersRingMaxHP. Note that /WHM provides regen so this is preferably at least 10 or more below. -- 730
        Main = 'Terra\'s Staff',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 50 },
        Head = { Name = 'Zenith Crown +1', Priority = 10 },
        Neck = { Name = 'Uggalepih Pendant', Priority = 50 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = { Name = 'Yinyang Robe', Priority = 50 },
        Hands = { Name = 'Zenith Mitts +1', Priority = 10 },
        Ring1 = { Name = 'Serket Ring', Priority = 10 },
        Ring2 = 'Shadow Ring',
        Back = 'Shadow Mantle',
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = { Name = 'Evk. Spats +1', Priority = 50 },
        Feet = { Name = 'Rostrum Pumps', Priority = 10 },
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
        Ring1 = { Name = 'Serket Ring', Priority = 10 },
        Ring2 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Back = { Name = 'Summoner\'s Cape', Priority = 50 },
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
        Legs = { Name = 'Evk. Spats +1', Priority = 50 },
        Feet = { Name = 'Evk. Pigaches +1', Priority = 50 },
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
sets.carbuncle_mitts = carbuncle_mitts
sets.yinyang_robe = yinyang_robe
sets.summoners_doublet = summoners_doublet
sets.summoners_horn = summoners_horn
sets.conjurers_ring = conjurers_ring
sets.bahamuts_staff = bahamuts_staff
sets.conjurers_earring = conjurers_earring
profile.Sets = gcmage.AppendSets(sets)

-- Includes Chaotic Strike and Shock Strike in SmnSkill to maximize stun chance
local SmnSkill = T{'Shining Ruby','Glittering Ruby','Crimson Howl','Inferno Howl','Frost Armor','Crystal Blessing','Aerial Armor','Hastega II','Fleet Wind','Hastega','Earthen Ward','Earthen Armor','Rolling Thunder','Lightning Armor','Soothing Current','Ecliptic Growl','Heavenward Howl','Ecliptic Howl','Noctoshield','Dream Shroud','Altana\'s Favor','Reraise','Reraise II','Reraise III','Raise','Raise II','Raise III','Wind\'s Blessing','Spring Water','Shock Strike','Chaotic Strike'}
local SmnHealing = T{'Healing Ruby','Healing Ruby II','Whispering Wind'}
local SmnMagical = T{'Searing Light','Meteorite','Holy Mist','Inferno','Fire II','Fire IV','Meteor Strike','Conflag Strike','Diamond Dust','Blizzard II','Blizzard IV','Heavenly Strike','Aerial Blast','Aero II','Aero IV','Wind Blade','Earthen Fury','Stone II','Stone IV','Geocrush','Judgement Bolt','Thunder II','Thunder IV','Thunderstorm','Thunderspark','Tidal Wave','Water II','Water IV','Grand Fall','Howling Moon','Lunar Bay','Ruinous Omen','Somnolence','Nether Blast','Night Terror','Level ? Holy'}
local SmnEnfeebling = T{'Diamond Storm','Sleepga','Shock Squall','Slowga','Tidal Roar','Pavor Nocturnus','Ultimate Terror','Nightmare','Mewing Lullaby','Eerie Eye'}
local SmnHybrid = T{'Flaming Crush','Burning Strike'}
local SmnCrit = T{'Predator Claws','Claw'}

local nextConjurersRingCheck = 0

profile.HandleAbility = function()
    gcmage.DoAbility()

    local action = gData.GetAction()
    if (string.match(action.Type, 'Blood')) then
        gFunc.EquipSet('BP_Delay')
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
    gcmage.DoFenrirsEarring()
end

profile.OnLoad = function()
    if (not gcinclude.horizon_safe_mode) then
        gcinclude.SetAlias(T{'cring'})
        gcdisplay.CreateToggle('C-Ring', conjurersRingForced)
    end

    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()

    if (not gcinclude.horizon_safe_mode) then
        gcinclude.ClearAlias(T{'cring'})
    end
end

profile.HandleCommand = function(args)
    if (args[1] == 'cring') then
        gcdisplay.AdvanceToggle('C-Ring')
        gcinclude.Message('Conjurer\'s Ring', gcdisplay.GetToggle('C-Ring'))
    else
        gcmage.DoCommands(args, sets)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer()
    local petAction = gData.GetPetAction()

    local isSpirit = false
    if (gData.GetPet() ~= nil) then
        isSpirit = string.match(gData.GetPet().Name, 'Spirit')
    end

    if (petAction ~= nil) then
        gFunc.EquipSet('BP')

        if (SmnSkill:contains(petAction.Name)) then
            -- Do Nothing
        elseif (isSpirit) then
            gFunc.EquipSet(sets.BP_Spirit)
        elseif (SmnMagical:contains(petAction.Name)) then
            gFunc.EquipSet(sets.BP_Magical)
            gFunc.EquipSet(sets.BP_Magical_Potency)
        elseif (SmnHybrid:contains(petAction.Name)) then
            gFunc.EquipSet(sets.BP_Physical)
            gFunc.EquipSet(sets.BP_Hybrid)
        elseif (SmnHealing:contains(petAction.Name)) then
            gFunc.EquipSet(sets.BP_Healing)
        elseif (SmnEnfeebling:contains(petAction.Name)) then
            gFunc.EquipSet(sets.BP_Magical)
        else
            gFunc.EquipSet(sets.BP_Physical)
            if (SmnCrit:contains(petAction.Name)) then
                gFunc.EquipSet(sets.BP_Physical_Crit)
            end
        end
    else
        if (not gcinclude.horizon_safe_mode) then
            if (gcdisplay.GetToggle('C-Ring') and player.HP >= conjurersRingMaxHP and gData.GetPet()) then
                local time = os.clock()
                if (time > nextConjurersRingCheck) then
                    nextConjurersRingCheck = time + 3 -- only recheck again after 3 seconds to prevent spam
                    gFunc.ForceEquipSet('ConjurersRingHPDown')
                    gFunc.ForceEquipSet('Perpetuation')
                end
            end
        end

        gcmage.DoDefault(sets, nil, nil, nil, nil, nil)

        if (not gcinclude.horizon_safe_mode) then
            if (player.HP <= conjurers_earring_hp_threshold) then
                gFunc.EquipSet('conjurers_earring')
            end
        end

        gcmage.DoDefaultOverride()
    end
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

    local action = gData.GetAction()
    if (action.Skill == 'Summoning') then
        gFunc.EquipSet('Precast_Summoning')
    end
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, cureMP, cureMP, cureMP, cureMP, cureMP)
end

return profile
