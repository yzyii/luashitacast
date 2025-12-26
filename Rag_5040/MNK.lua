local profile = {}

local fastCastValue = 0.02 -- 2% from gear listed in Precast set

local max_hp_in_idle_with_regen_gear_equipped = 1632 -- You could set this to 0 if you do not wish to ever use regen gear

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local temple_gaiters = {
    Feet = 'Temple Gaiters',
}
local temple_gloves = {
    Hands = 'Temple Gloves',
}
local temple_cyclas = {
    Body = 'Tpl. Cyclas +1',
}
local temple_crown = {
    Head = 'Tpl. Crown +1',
}
local melee_gaiters = {
    Feet = 'Melee Gaiters',
}
local melee_gloves = {
    Hands = 'Mel. Gloves +1',
}
local kampfer_ring = {
    Ring2 = 'Kampfer Ring',
}
local kampfer_earring = {
    Ear2 = 'Kampfer Earring',
}

local sets = {
    Idle = {
        Ammo = 'Tiphia Sting',
        Head = 'Genbu\'s Kabuto',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Mel. Cyclas +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Shadow Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = {},
    Resting = {
        Neck = 'Paisley Scarf',
        Ear2 = 'Sanative Earring',
        Body = 'Mel. Cyclas +1',
        Hands = 'Dst. Mittens +1',
        Back = 'Melee Cape',
        Feet = 'Dst. Leggings +1',
    },
    Town = {
        Head = 'Tpl. Crown +1',
        Body = 'Kirin\'s Osode',
        Hands = 'Mel. Gloves +1',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Melee Gaiters',
    },
    Movement = {
        Feet = 'Herald\'s Gaiters',
    },

    --[[
    8% Base
    5% Merits
    45% Counterstance
    10% Melee Gaiters
    ]]
    DT = {
        Main = 'Cross-Counters', -- 5
        Ammo = 'Fenrir\'s Stone',
        Head = 'Optical Hat',
        Neck = 'Faith Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Avenger\'s Earring', -- 1
        Body = 'Scp. Harness +1',
        Hands = 'Mel. Gloves +1',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Shadow Mantle',
        Waist = 'Black Belt',
        Legs = 'Tpl. Hose +1', -- 3
        Feet = 'Rst. Sune-Ate +1', -- 1
    },
    MDT = {
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Resentment Cape',
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = { -- Currently using this as an alternate HighAcc set for 2H Zergs. See README.md
        Head = 'Maat\'s Cap',
        Neck = 'Faith Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Shura Togi',
        Hands = 'Mel. Gloves +1',
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Black Belt',
        Legs = 'Shura Haidate',
        Feet = 'Dune Boots',
    },

    Precast = {
        Ear1 = 'Loquac. Earring',
    },
    SIRD = { -- Only used for Idle sets and not while Override sets are active
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Shadow Mantle',
        Waist = 'Silver Obi +1', -- 8
        Legs = 'Dst. Subligar +1',
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = { -- Used for Utsusemi cooldown
        Head = 'Panther Mask +1',
        Waist = 'Black Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Fuma Sune-Ate',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Head = 'Panther Mask +1',
        Neck = 'Faith Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Kirin\'s Osode',
        Hands = 'Mel. Gloves +1',
        -- Ring1 = 'Toreador\'s Ring',
        Ring1 = 'Begrudging Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Black Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Fuma Sune-Ate',
    },
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {
        Head = 'Maat\'s Cap',
    },
    TP_HighAcc = {
        Head = 'Maat\'s Cap',
        Body = 'Shura Togi',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
    },
    TP_Focus = {
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
    },

    SJ_DRG = {
        Head = 'Maat\'s Cap',
        Ear2 = 'Wyvern Earring',
    },
    SJ_THF = {
        Ear2 = 'Pilferer\'s Earring',
    },

    WS = {
        Head = 'Maat\'s Cap',
        Neck = 'Thunder Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
        Legs = 'Shura Haidate',
        Feet = 'Shura Sune-Ate',
        Hands = 'Mel. Gloves +1',
        Back = 'Forager\'s Mantle',
        Waist = 'Black Belt',
    },
    WS_HighAcc = {
        -- Ring1 = 'Toreador\'s Ring',
        Ring1 = 'Begrudging Ring',
        Ring2 = 'Toreador\'s Ring',
    },

    WS_AsuranFists = {
        Neck = 'Faith Torque',
        Ear1 = 'Merman\'s Earring',
    },
    WS_DragonKick = {
        Legs = 'Byakko\'s Haidate',
    },
    WS_HowlingFist = {
    },

    Jump = {
        Head = 'Genbu\'s Kabuto',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Robust Earring',
        Ring1 = 'Robust Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Wyvern Mantle',
        Legs = 'Shura Haidate',
        Feet = 'Dune Boots',
    },
    Chakra = {
        Ammo = 'Happy Egg',
        Head = 'Genbu\'s Kabuto',
        Neck = 'Fortitude Torque',
        Ear1 = 'Robust Earring',
        Ear2 = 'Robust Earring',
        Body = 'Tpl. Cyclas +1',
        Ring1 = 'Robust Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Melee Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Mst. Sitabaki +1',
        Feet = 'Power sandals',
    },

    ChiBlast = {
        Head = 'Tpl. Crown +1',
        Neck = 'Faith Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Melee Cape',
        Legs = 'Tpl. Hose +1',
        Waist = 'Reverend Sash',
        Feet = 'Suzaku\'s Sune-Ate',
    },

    HundredFists = {
        Head = 'Maat\'s Cap',
        Neck = 'Faith Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Shura Togi',
        Hands = 'Mel. Gloves +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Black Belt',
        Legs = 'Shura Haidate',
        Feet = 'Dune Boots',
    },

    Weapon_Loadout_1 = {
        Main = 'Destroyers',
    },
    Weapon_Loadout_2 = {
        Main = 'Cross-Counters',
    },
    Weapon_Loadout_3 = {
        Main = 'Faith Baghnakhs',
        Ammo = 'Virtue Stone',
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

sets.temple_gaiters = temple_gaiters
sets.temple_gloves = temple_gloves
sets.temple_cyclas = temple_cyclas
sets.temple_crown = temple_crown
sets.melee_gaiters = melee_gaiters
sets.melee_gloves = melee_gloves

sets.kampfer_ring = kampfer_ring
sets.kampfer_earring = kampfer_earring
profile.Sets = gcmelee.AppendSets(sets)

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()

    if string.match(action.Name, 'Jump') then
        gFunc.EquipSet(sets.Jump)
    elseif (action.Name == 'Chi Blast') then
        gFunc.EquipSet(sets.ChiBlast)
    elseif (action.Name == 'Chakra') then
        gFunc.EquipSet(sets.Chakra)
        gFunc.EquipSet('temple_cyclas')
        gFunc.EquipSet('melee_gloves')
    elseif (action.Name == 'Dodge') then
        gFunc.EquipSet('temple_gaiters')
    elseif (action.Name == 'Boost') then
        gFunc.EquipSet('temple_gloves')
    elseif (action.Name == 'Focus') then
        gFunc.EquipSet('temple_crown')
    elseif (action.Name == 'Counterstance') then
        gFunc.EquipSet('melee_gaiters')
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
    gcmelee.DoWS()

    local action = gData.GetAction()
    local player = gData.GetPlayer()

    if (action.Name == 'Asuran Fists') then
        gFunc.EquipSet(sets.WS_AsuranFists)
    elseif (action.Name == 'Dragon Kick') then
        gFunc.EquipSet(sets.WS_DragonKick)
    elseif (action.Name == 'Howling Fist') then
        gFunc.EquipSet(sets.WS_HowlingFist)
    end
end

profile.OnLoad = function()
    gcmelee.Load()
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
    local focus = gData.GetBuffCount('Focus')
    local hundredFists = gData.GetBuffCount('Hundred Fists')

    if (hundredFists == 1) then
        gFunc.EquipSet(sets.HundredFists)
    end

    if (focus == 1 and gcdisplay.IdleSet == 'LowAcc') then
        gFunc.EquipSet(sets.TP_Focus)
    end

    if (player.Status == 'Engaged') then
        if (player.SubJob == 'DRG') then
            gFunc.EquipSet(sets.SJ_DRG)
        elseif (player.SubJob == 'THF') then
            gFunc.EquipSet(sets.SJ_THF)
        end
    end

    gcmelee.DoDefaultOverride()

    if (gcdisplay.IdleSet == 'DT') then
        if (player.HPP <= 75 and player.TP <= 1000) then
            gFunc.EquipSet('kampfer_ring')
        end
        if (player.HPP <= 25 and player.TP <= 1000) then
            gFunc.EquipSet('kampfer_earring')
        end
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
end

return profile
