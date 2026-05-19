local profile = {}

local fastCastValue = 0.02 -- 0% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

-- Disabled on horizon_safe_mode
local shinobiRingForced = true -- Default /sring value
local shinobiRingMaxHP = 983

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local fire_staff = {
    Main = 'Vulcan\'s Staff',
}
local earth_staff = {
    Main = 'Terra\'s Staff',
}
local water_staff = {
    Main = 'Neptune\'s Staff',
}
local wind_staff = {
    Main = 'Auster\'s Staff',
}
local ice_staff = {
    Main = 'Aquilo\'s Staff',
}
local thunder_staff = {
    Main = 'Jupiter\'s Staff',
}
local light_staff = {
    Main = 'Apollo\'s Staff',
}
local dark_staff = {
    Main = 'Pluto\'s Staff',
}

local karin_obi = {
    Waist = 'Karin Obi',
}
local dorin_obi = {
    -- Waist = 'Dorin Obi',
}
local suirin_obi = {
    -- Waist = 'Suirin Obi',
}
local furin_obi = {
    -- Waist = 'Furin Obi',
}
local hyorin_obi = {
    Waist = 'Hyorin Obi',
}
local rairin_obi = {
    Waist = 'Rairin Obi',
}
local korin_obi = {
    Waist = 'Korin Obi',
}
local anrin_obi = {
    Waist = 'Anrin obi',
}

local shinobi_ring = {
    Ring2 = 'Shinobi Ring',
}
local koga_tekko = {
    -- Hands = 'Koga Tekko',
}
local koga_tekko_plus_one = {
    Hands = 'Kog. Tekko +1',
}
local uggalepih_pendant = {
    Neck = { Name = 'Uggalepih Pendant', Priority = 10 },
}
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}
local fenrirs_stone = { -- Used for Evasion at night
    Ammo = 'Fenrir\'s Stone',
}
local koga_hakama = {
    -- Legs = { Name = 'Koga Hakama', Priority = 20 },
}
local koga_hakama_plus_one = {
    Legs = { Name = 'Kog. Hakama +1', Priority = 20 },
}
local koga_kyahan = {
    -- Feet = 'Koga Kyahan',
}
local koga_kyahan_plus_one = {
    Feet = 'Kog. Kyahan +1',
}
local ninja_kyahan = {
    -- Feet = { Name = 'Ninja Kyahan', Priority = 20 },
}
local ninja_kyahan_plus_one = {
    Feet = { Name = 'Nin. Kyahan +1', Priority = 20 },
}
local blue_cotehardie = {
    -- Body = { Name = 'Blue Cotehardie', Priority = 5 },
}
local blue_cotehardie_plus_one = {
    Body = { Name = 'Blue Cotehard. +1', Priority = 5 },
}
local resentment_cape = {
    Back = 'Resentment Cape',
}

local windRingMaxHP = 0
local wind_ring = {
    -- Ring2 = 'Wind Ring',
}
local bat_earrings = { -- Disabled on horizon_safe_mode
    Ear1 = 'Bat Earring',
    Ear2 = 'Bat Earring',
}

local sets = {
    Idle = {
        Main = 'Auster\'s Staff',
        Sub = 'displaced',
        Range = { Name = 'Ungur Boomerang', Priority = 20 },
        Ammo = 'displaced',
        Head = { Name = 'Nin. Hatsuburi +1', Priority = 20 },
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Novia Earring',
        Ear2 = 'Triton Earring',
        Body = { Name = 'Scp. Harness +1', Priority = 20 },
        Hands = 'Rasetsu Tekko +1',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = 'Boxer\'s Mantle',
        Waist = { Name = 'Scouter\'s Rope', Priority = -5 },
        Legs = 'Arhat\'s Hakama +1',
        Feet = 'Dance Shoes +1',
    },
    IdleALT = {
        Main = 'Auster\'s Staff',
        Sub = 'displaced',
        Range = { Name = 'Ungur Boomerang', Priority = 20 },
        Ammo = 'displaced',
        Head = { Name = 'Nin. Hatsuburi +1', Priority = 20 },
        Neck = 'Evasion Torque',
        Ear1 = 'Novia Earring',
        Ear2 = 'Triton Earring',
        Body = { Name = 'Scp. Harness +1', Priority = 20 },
        Hands = 'Rasetsu Tekko +1',
        Ring1 = 'Nimble Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = 'Boxer\'s Mantle',
        Waist = { Name = 'Scouter\'s Rope', Priority = -5 },
        Legs = 'Arhat\'s Hakama +1',
        Feet = 'Dance Shoes +1',
    },
    IdleDT = {
        Main = 'Terra\'s Staff',
        Head = 'Arhat\'s Jinpachi +1',
        Body = 'Arhat\'s Gi +1',
        Hands = 'Dst. Mittens +1',
        Back = 'Shadow Mantle',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleALTDT = {
        Main = 'Terra\'s Staff',
        Head = 'Arhat\'s Jinpachi +1',
        Body = 'Arhat\'s Gi +1',
        Ring1 = 'Jelly Ring',
        Back = 'Shadow Mantle',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    Resting = {
        Body = 'Nomad\'s Tunica',
        Neck = { Name = 'Paisley Scarf', Priority = 20 },
        Ear1 = 'Sanative Earring',
        Ear2 = 'Relaxing Earring',
        Hands = 'Nomad\'s Gloves',
        Legs = 'Nomad\'s Hose',
        Feet = 'Nomad\'s Boots',
    },
    Town = {},
    Movement = {},
    Movement_TP = {
        Hands = { Name = 'Ninja Tekko +1', Priority = 20 },
        Feet = { Name = 'Fuma Sune-Ate', Priority = 20 },
    },

    DT = {
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Head = 'Arhat\'s Jinpachi +1',
        Body = 'Arhat\'s Gi +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = 'Shadow Mantle',
        Legs = 'Dst. Subligar +1',
        Feet = { Name = 'Nin. Kyahan +1', Priority = 20 },
    },
    MDT = {
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Range = 'displaced',
        Ammo = 'Phtm. Tathlum',
        Head = 'Arhat\'s Jinpachi +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Arhat\'s Gi +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = 'Gramary Cape',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    FireRes = {
        Main = 'Neptune\'s Staff', -- 20
        Sub = 'displaced',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 10 },
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Triumph Earring', -- 11
        Ear2 = 'Triumph Earring', -- 11
        Body = { Name = 'Republic Harness', Priority = 20 }, -- 5
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
        Sub = 'displaced',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 10 },
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Omn. Earring', -- 11
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Tundra Jerkin', -- 7
        Hands = 'Hailst. Tekko +1', -- 12
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
        Back = 'Aurora Mantle +1', -- 8
        Waist = 'Fire Belt', -- 20
        Legs = 'Feral Trousers', -- 6
        Feet = 'Feral Ledelsens', -- 4
    },
    LightningRes = {
        Main = 'Terra\'s Staff', -- 20
        Sub = 'displaced',
        Range = 'Lightning Bow +1', -- 7
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = { Name = 'Flora Cotehardie', Priority = 5 }, -- 5
        Hands = 'Soil Tekko +1', -- 2
        Ring1 = 'Adroit Ring', -- 10
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Lightning Mantle', -- 6
        Waist = 'Earth Belt', -- 20
        Legs = 'Byakko\'s Haidate', -- 50
        Feet = 'Soil Kyahan +1' -- 2
    },
    EarthRes = {
        Main = 'Auster\'s Staff', -- 20
        Sub = 'displaced',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 10 },
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Beak Jerkin +1', -- 7
        Hands = 'Beak Gloves +1', -- 4
        Ring1 = 'Robust Ring', -- 10
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Beak Mantle +1', -- 7
        Waist = 'Wind Belt', -- 20
        Legs = 'Beak Trousers +1', -- 7
        Feet = 'Fed. Kyahan', -- 6
    },
    WindRes = {
        Main = 'Aquilo\'s Staff', -- 20
        Sub = 'displaced',
        Range = { Name = 'Ungur Boomerang', Priority = 30 }, -- 8
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Omn. Earring', -- 11
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Tundra Jerkin', -- 7
        Hands = { Name = 'Seiryu\'s Kote', Priority = 20 },
        Ring1 = 'Nimble Ring', -- 10
        Ring2 = 'Malgust Ring', -- 10
        Back = 'Aurora Mantle +1', -- 8
        Waist = 'Ice Belt', -- 20
        Legs = { Name = 'Yasha Hakama +1', Priority = 20 },
        Feet = { Name = 'Republic Leggings', Priority = 30 }, -- 3
    },
    WaterRes = {
        Main = 'Jupiter\'s Staff', -- 20
        Sub = 'displaced',
        Range = 'Pirate\'s Gun +1', -- 9
        Ammo = 'displaced',
        Head = { Name = 'Genbu\'s Kabuto', Priority = 20 }, -- 50
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = { Name = 'Scp. Harness +1', Priority = 20 }, -- 20
        Hands = { Name = 'Scp. Mittens +1', Priority = 20 }, -- 7
        Ring1 = 'Communion Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = 'Wolf Mantle +1', -- 3
        Waist = 'Lightning Belt', -- 20
        Legs = { Name = 'Scp. Subligar +1', Priority = 20 }, -- 7
        Feet = { Name = 'Scp. Leggings +1', Priority = 20 }, -- 7
    },
    Evasion = {
        Main = 'Auster\'s Staff',
        Sub = 'displaced',
        Range = { Name = 'Ungur Boomerang', Priority = 20 },
        Ammo = 'displaced',
        Head = { Name = 'Nin. Hatsuburi +1', Priority = 20 },
        Neck = 'Evasion Torque',
        Ear1 = 'Novia Earring',
        Ear2 = 'Triton Earring',
        Body = { Name = 'Scp. Harness +1', Priority = 20 },
        Hands = 'Rasetsu Tekko +1',
        Ring1 = 'Nimble Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = 'Boxer\'s Mantle',
        Waist = { Name = 'Scouter\'s Rope', Priority = -5 },
        Legs = 'Arhat\'s Hakama +1',
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
    },
    SIRD = { -- Override sets (Resistance / Evasion) take precedence if in use.
        Main = 'Nikkariaoe', -- 25
        Sub = 'Republic Dagger',
        Head = 'Yasha Jinpachi +1', -- 5
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Novia Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 10 }, -- 8
        Body = 'Yasha Samue +1', -- 11
        Hands = 'Yasha Tekko +1', -- 4
        Ring1 = 'Nimble Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = 'Shadow Mantle',
        Waist = 'Druid\'s Rope', -- 10
        Legs = { Name = 'Yasha Hakama +1', Priority = 20 }, -- 3
        Feet = { Name = 'Yasha Sune-Ate +1', Priority = 20 }, -- 6
    },
    Haste = {
        Head = 'Panther Mask +1',
        Ear2 = 'Loquac. Earring',
        Hands = { Name = 'Dusk Gloves +1', Priority = 20 },
        Back = 'Shadow Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 20 }
    },

    Hate = {
        Ammo = 'Nokizaru Shuriken',
        Head = 'Yasha Jinpachi +1',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Eris\' Earring +1',
        Ear2 = 'Eris\' Earring +1',
        Body = 'Yasha Samue +1',
        Hands = 'Yasha Tekko +1',
        Ring1 = 'Mermaid Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 20 },
        Back = 'Toreador\'s Cape',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Yasha Hakama +1', Priority = 20 },
        Feet = { Name = 'Yasha Sune-Ate +1', Priority = 20 },
    },
    NinDebuff = {},
    NinElemental = {},
    NinElemental_Accuracy = {},
    DrkDarkMagic = {},
    DrkDarkMagic_DrainAspir = {},

    Enhancing = {
        Neck = 'Enhancing Torque',
        Back = { Name = 'Merciful Cape', Priority = 10 },
    },
    Stoneskin = {
        Main = 'Faith Baghnakhs',
        Sub = 'displaced',
        Ammo = 'Nokizaru Shuriken',
        Head = 'Maat\'s Cap',
        Neck = 'Stone Gorget',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = { Name = 'Kirin\'s Osode', Priority = 10 },
        Hands = { Name = 'Dusk Gloves +1', Priority = 20 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Ryl. Army Mantle',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Suzaku\'s Sune-Ate',
    },
    Cure = {}, -- Defaults to Hate
    Cheat_C3HPDown = {
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Ammo = { Name = 'Tiphia Sting', Priority = -5 },
        Head = 'Arhat\'s Jinpachi +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Novia Earring',
        Ear2 = 'Triton Earring',
        Body = 'Arhat\'s Gi +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Serket Ring', Priority = 5 },
        Back = 'Shadow Mantle',
        Waist = { Name = 'Scouter\'s Rope', Priority = -5 },
        Legs = 'Dst. Subligar +1',
        Feet = { Name = 'Shr. Sune-Ate +1', Priority = -5 },
    },
    Cheat_C3HPUp = {}, -- Defaults to Hate
    Flash = {}, -- Defaults to Haste

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {},
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {},

    WS = {},
    WS_HighAcc = {},

    WS_BladeJin = {},
    WS_BladeKu = {},

    Weapon_Loadout_1 = {},
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},

    ShinobiRingHPDown = { -- Set to force HP to or below shinobiRingMaxHP
        Ammo = { Name = 'Tiphia Sting', Priority = -5 },
        Head = { Name = 'Shr.Znr.Kabuto', Priority = -5 },
        Neck = { Name = 'Star Necklace', Priority = 5 },
        Ear1 = 'Novia Earring',
        Ear2 = 'Triton Earring',
        Body = { Name = 'Flora Cotehardie', Priority = 5 },
        Hands = 'Dst. Mittens +1',
        Ring1 = { Name = 'Ether Ring', Priority = 5 },
        Ring2 = { Name = 'Serket Ring', Priority = 5 },
        Back = 'Shadow Mantle',
        Waist = { Name = 'Scouter\'s Rope', Priority = -5 },
        Legs = { Name = 'Shura Haidate', Priority = -5 },
        Feet = { Name = 'Shr. Sune-Ate +1', Priority = -5 },
    },

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {},

    VileElixir = {},
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

sets.fire_staff = fire_staff
sets.earth_staff = earth_staff
sets.water_staff = water_staff
sets.wind_staff = wind_staff
sets.ice_staff = ice_staff
sets.thunder_staff = thunder_staff
sets.light_staff = light_staff
sets.dark_staff = dark_staff
sets.karin_obi = karin_obi
sets.dorin_obi = dorin_obi
sets.suirin_obi = suirin_obi
sets.furin_obi = furin_obi
sets.hyorin_obi = hyorin_obi
sets.rairin_obi = rairin_obi
sets.korin_obi = korin_obi
sets.anrin_obi = anrin_obi
sets.shinobi_ring = shinobi_ring
sets.koga_tekko = koga_tekko
sets.koga_tekko_plus_one = koga_tekko_plus_one
sets.uggalepih_pendant = uggalepih_pendant
sets.warlocks_mantle = warlocks_mantle
sets.fenrirs_stone = fenrirs_stone
sets.koga_hakama = koga_hakama
sets.koga_hakama_plus_one = koga_hakama_plus_one
sets.koga_kyahan = koga_kyahan
sets.koga_kyahan_plus_one = koga_kyahan_plus_one
sets.ninja_kyahan = ninja_kyahan
sets.ninja_kyahan_plus_one = ninja_kyahan_plus_one
sets.blue_cotehardie = blue_cotehardie
sets.blue_cotehardie_plus_one = blue_cotehardie_plus_one
sets.resentment_cape = resentment_cape
sets.wind_ring = wind_ring
sets.bat_earrings = bat_earrings
profile.Sets = gcmelee.AppendSets(sets)

local nextShinobiRingCheck = 0

local NinDebuffs = T{ 'Kurayami: Ni', 'Hojo: Ni', 'Jubaku: Ichi', 'Dokumori: Ichi', 'Kurayami: Ichi', 'Hojo: Ichi' }
local HateDebuffs = T{ 'Bind', 'Sleep', 'Poison', 'Blind' }
local NinElemental = T{
    'Hyoton: Ni', 'Katon: Ni', 'Huton: Ni', 'Doton: Ni', 'Raiton: Ni', 'Suiton: Ni',
    'Hyoton: Ichi', 'Katon: Ichi', 'Huton: Ichi', 'Doton: Ichi', 'Raiton: Ichi', 'Suiton: Ichi',
    'Hyoton: San', 'Katon: San', 'Huton: San', 'Doton: San', 'Raiton: San', 'Suiton: San'
}

local ElementalStaffTable = {
    ['Fire'] = 'fire_staff',
    ['Earth'] = 'earth_staff',
    ['Water'] = 'water_staff',
    ['Wind'] = 'wind_staff',
    ['Ice'] = 'ice_staff',
    ['Thunder'] = 'thunder_staff',
    ['Light'] = 'light_staff',
    ['Dark'] = 'dark_staff'
}

local NukeObiOwnedTable = {
    ['Fire'] = 'karin_obi',
    ['Earth'] = 'dorin_obi',
    ['Water'] = 'suirin_obi',
    ['Wind'] = 'furin_obi',
    ['Ice'] = 'hyorin_obi',
    ['Thunder'] = 'rairin_obi',
    ['Light'] = 'korin_obi',
    ['Dark'] = 'anrin_obi'
}

profile.HandleAbility = function()
    gcmelee.DoAbility()

    gFunc.EquipSet(sets.Hate)
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
    if (action.Name == 'Blade: Jin') then
        gFunc.EquipSet(sets.WS_BladeJin)
    elseif (action.Name == 'Blade: Ku') then
        gFunc.EquipSet(sets.WS_BladeKu)
    end

    local environment = gData.GetEnvironment()
    if (environment.Time < 6 or environment.Time >= 18) then
        gFunc.EquipSet('koga_tekko')
        gFunc.EquipSet('koga_kyahan')
    end
    if (environment.Time < 7 or environment.Time >= 17) then
        gFunc.EquipSet('koga_tekko_plus_one')
        gFunc.EquipSet('koga_kyahan_plus_one')
    end
end

profile.OnLoad = function()
    if (not gcinclude.horizon_safe_mode) then
        gcinclude.SetAlias(T{'sring'})
        gcdisplay.CreateToggle('S-Ring', shinobiRingForced)
    else
        gcinclude.SetAlias(T{'bat'})
        gcdisplay.CreateToggle('Bat', false)
    end

    gcinclude.SetAlias(T{'nuke'})
    gcdisplay.CreateCycle('Nuke', {[1] = 'Potency', [2] = 'Accuracy',})
    gcinclude.SetAlias(T{'staff'})
    gcdisplay.CreateCycle('Staff', {[1] = 'Enabled', [2] = 'Disabled',})
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'nuke'})
    gcinclude.ClearAlias(T{'staff'})

    if (not gcinclude.horizon_safe_mode) then
        gcinclude.ClearAlias(T{'sring'})
    else
        gcinclude.ClearAlias(T{'bat'})
    end
end

profile.HandleCommand = function(args)
    if (args[1] == 'sring') then
        gcdisplay.AdvanceToggle('S-Ring')
        gcinclude.Message('Shinobi Ring', gcdisplay.GetToggle('S-Ring'))
    elseif (args[1] == 'bat') then
        gcdisplay.AdvanceToggle('Bat')
        gcinclude.Message('Bat', gcdisplay.GetToggle('Bat'))
    elseif (args[1] == 'nuke') then
        gcdisplay.AdvanceCycle('Nuke')
        gcinclude.Message('Nuke', gcdisplay.GetCycle('Nuke'))
    elseif (args[1] == 'staff') then
        gcdisplay.AdvanceCycle('Staff')
        gcinclude.Message('Staff', gcdisplay.GetCycle('Staff'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    if (not gcinclude.horizon_safe_mode) then
        if (gcdisplay.GetToggle('S-Ring') and player.HP > shinobiRingMaxHP and player.Status == 'Engaged') then
            local time = os.clock()
            if (time > nextShinobiRingCheck) then
                nextShinobiRingCheck = time + 2 -- only recheck again after 2 seconds to prevent spam if set up incorrectly
                gFunc.ForceEquipSet('ShinobiRingHPDown')
                local ignoreTP = {
                    Main = 'ignore',
                    Sub = 'ignore',
                    Range = 'ignore',
                    Ammo = 'ignore',
                }
                local dtTP = gFunc.Combine(sets.DT, ignoreTP)
                gFunc.ForceEquipSet(dtTP)
            end
        end
    end

    gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)

    if (player.SubJob == 'RDM' or player.SubJob == 'WHM' or player.SubJob == 'DRK' or player.SubJob == 'PLD') then
        if (player.MP <= 40) then
            gFunc.EquipSet('blue_cotehardie')
        end
        if (player.MP <= 50) then
            gFunc.EquipSet('blue_cotehardie_plus_one')
        end
    end

    if (player.Status == 'Engaged') then
        if (player.HPP <= 75 and player.TP <= 1000) then
            gFunc.EquipSet('shinobi_ring')
        end
        if (environment.Time < 6 or environment.Time >= 18) then
            gFunc.EquipSet('koga_tekko')
        end
        if (environment.Time < 7 or environment.Time >= 17) then
            gFunc.EquipSet('koga_tekko_plus_one')
        end
    end

    gcmelee.DoDefaultOverride()

    if (gcdisplay.IdleSet == 'MDT' and conquest:GetOutsideControl()) then
        gFunc.EquipSet('resentment_cape')
    end

    if (player.IsMoving == true) then
        if (gcdisplay.IdleSet == 'Normal'
            or gcdisplay.IdleSet == 'Alternate'
            or gcdisplay.IdleSet == 'DT'
            or gcdisplay.IdleSet == 'Evasion'
            or player.Status == 'Engaged'
        ) then
            if (environment.Time < 6 or environment.Time >= 18) then
                gFunc.EquipSet('ninja_kyahan')
            end
            if (environment.Time < 7 or environment.Time >= 17) then
                gFunc.EquipSet('ninja_kyahan_plus_one')
            end
        end
    end

    if (gcdisplay.IdleSet == 'Evasion') then
        if (environment.Time < 6 or environment.Time >= 18) then
            gFunc.EquipSet('fenrirs_stone')
        end
        if (environment.Time < 6 or environment.Time >= 18) then
            gFunc.EquipSet('koga_hakama')
        end
        if (environment.Time < 7 or environment.Time >= 17) then
            gFunc.EquipSet('koga_hakama_plus_one')
        end

        if (environment.DayElement == 'Wind' and player.HP <= windRingMaxHP) then
            gFunc.EquipSet(sets.wind_ring)
        end

        if (gcdisplay.GetToggle('Bat')) then
            gFunc.EquipSet('bat_earrings')
        elseif (not gcinclude.horizon_safe_mode) then
            local blindness = gData.GetBuffCount('Blindness')
            if (blindness == 1) then
                gFunc.EquipSet('bat_earrings')
            end
        end
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

    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    if (player.HPP <= 75 and player.TP <= 1000) then
        gFunc.EquipSet('shinobi_ring')
    end
    if (environment.Time < 6 or environment.Time >= 18) then
        gFunc.EquipSet('koga_tekko') -- You can comment this out if you have Dusk Gloves +1 and would prefer +22 HP
    end
    if (environment.Time < 7 or environment.Time >= 17) then
        gFunc.EquipSet('koga_tekko_plus_one') -- You can comment this out if you have Dusk Gloves +1 and would prefer +22 HP
    end

    local target = gData.GetActionTarget()
    local action = gData.GetAction()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

    if (action.Skill == 'Ninjutsu') then
        if (NinDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.Hate)
            gFunc.EquipSet(sets.NinDebuff)
            EquipStaffAndObi(action)
        elseif (NinElemental:contains(action.Name)) then
            gFunc.EquipSet(sets.NinElemental)
            if (gcdisplay.GetCycle('Nuke') == 'Accuracy') then
                gFunc.EquipSet(sets.NinElemental_Accuracy)
            end
            if (action.MppAftercast < 51) then
                gFunc.EquipSet('uggalepih_pendant')
            end
            EquipStaffAndObi(action)
        end
    elseif (action.Skill == 'Enfeebling Magic') then
        if (HateDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.Hate)
        end
        EquipStaff(action)
    elseif (action.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.Hate)
        gFunc.EquipSet(sets.DrkDarkMagic)
        if (action.Name == 'Drain' or action.Name == 'Aspir') then
            gFunc.EquipSet(sets.DrkDarkMagic_DrainAspir)
        end
        EquipStaffAndObi(action)
    elseif (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing)
        if (action.Name == 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin)
        end
    elseif (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Hate)
        gFunc.EquipSet(sets.Cure)

        if (target.Name == me) then
            if (action.Name == 'Cure III') then
                gFunc.EquipSet(sets.Cheat_C3HPUp)
            end
        end
        EquipStaffAndObi(action)
    elseif (action.Skill == 'Divine Magic') then
        gFunc.EquipSet(sets.Hate)
        gFunc.EquipSet(sets.Haste)
        gFunc.EquipSet(sets.Flash)
        EquipStaff(action)
    end
end

function EquipStaffAndObi(action)
    EquipStaff(action)

    if (ObiCheck(action)) then
        local obiOwned = NukeObiOwnedTable[action.Element]
        gFunc.EquipSet(obiOwned)
    end
end

function EquipStaff(action)
    if (gcdisplay.GetCycle('Staff') == 'Enabled') then
        local staff = ElementalStaffTable[action.Element]
        gFunc.EquipSet(staff)
    end
end

function ObiCheck(action)
    local element = action.Element
    local environment = gData.GetEnvironment()

    return environment.WeatherElement == element or environment.DayElement == element
end

return profile
