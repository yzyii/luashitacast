local profile = {}

local fastCastValue = 0.02 -- 2% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

-- The following is provided as a convenient saved setting over using the /sethp command. HP will fluctuate with SJ and usage of the command for this is required.
local max_hp_in_idle_with_regen_gear_equipped = 0 -- Set this to 0 if you do not wish to ever use regen gear.

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local kampfer_ring = {
    Ring2 = 'Kampfer Ring',
    Hands = 'Rasetsu Tekko +1',
    Legs = 'Byakko\'s Haidate',
}
local kampfer_earring = {
    Ear1 = 'Brutal Earring',
    Ear2 = 'Kampfer Earring',
    Hands = { Name = 'Mel. Gloves +1', Priority = 60 },
    Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
    Legs = 'Byakko\'s Haidate',
}
local shadow_mantle = {
    Back = 'Shadow Mantle',
}

local sets = {
    Idle = {
        Head = 'Arh. Jinpachi +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Arhat\'s Gi +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = 'Black Belt',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = {
        Head = 'Arh. Jinpachi +1',
        Neck = { Name = 'Evasion Torque', Priority = 60 },
        Ear1 = 'Novia Earring',
        Ear2 = 'Triton Earring',
        Body = 'Arhat\'s Gi +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = 'Black Belt',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    Resting = {
        Head = { Name = 'Tpl. Crown +1', Priority = 60 },
        Neck = { Name = 'Paisley Scarf', Priority = 60 },
        Ear2 = 'Sanative Earring',
        Body = { Name = 'Mel. Cyclas +1', Priority = 60 },
        Hands = 'Nomad\'s Gloves',
        Back = 'Melee Cape',
        Legs = 'Nomad\'s Hose',
        Feet = 'Nomad\'s Boots',
    },
    Town = {},
    Movement = {
        Feet = { Name = 'Herald\'s Gaiters', Priority = 50 },
    },
    Movement_TP = {},

    DT = { -- Counter set
        Head = 'Panther Mask +1',
        Neck = 'Faith Torque',
        Ear1 = 'Avenger\'s Earring',
        Ear2 = 'Avenger\'s Earring',
        Body = { Name = 'Shura Togi +1', Priority = -20 },
        Hands = { Name = 'Mel. Gloves +1', Priority = 60 },
        Ring1 = { Name = 'Sattva Ring', Priority = 60 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = 'Black Belt',
        Legs = { Name = 'Tpl. Hose +1', Priority = 60 },
        Feet = { Name = 'Fuma Sune-Ate', Priority = 60 },
    },
    MDT = {
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    LightningRes_NoBarthunder = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = { -- An alternate Counter set that adds additional survivability at the cost of haste / damage
        Head = 'Optical Hat',
        Neck = 'Faith Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Avenger\'s Earring',
        Body = { Name = 'Scp. Harness +1', Priority = 60 },
        Hands = { Name = 'Mel. Gloves +1', Priority = 60 },
        Ring1 = { Name = 'Sattva Ring', Priority = 60 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = 'Black Belt',
        Legs = { Name = 'Tpl. Hose +1', Priority = 60 },
        Feet = 'Rst. Sune-Ate +1',
    },
    Override = { -- An additional override set explicitly to be used for sets such as crafting, HELM, fishing, or any other special sets such as DRK 2HR, MNK Counter etc. n.b. Any unused Resist or Evasion set can be used similarly.
        Body = 'Field Tunica',
        Hands = 'Field Gloves',
        Legs = 'Field Hose',
        Feet = 'Field Boots'
    },

    Precast = {
        Ear2 = { Name = 'Loquac. Earring', Priority = 50 },
    },
    SIRD = { -- Override sets (Resistance / Evasion) take precedence if in use.
        Neck = 'Willpower Torque', -- 5
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 }, -- 8
        Waist = 'Silver Obi +1', -- 8
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = {
        Head = 'Panther Mask +1',
        Waist = 'Black Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = { Name = 'Fuma Sune-Ate', Priority = 60 },
    },

    TP_LowAcc = {
        Head = 'Panther Mask +1',
        Neck = 'Faith Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Kirin\'s Osode', Priority = 50 },
        Hands = { Name = 'Bandomusha Kote', Priority = 60 },
        Ring1 = 'Begrudging Ring',
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Back = 'Forager\'s Mantle',
        Waist = 'Black Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = { Name = 'Fuma Sune-Ate', Priority = 60 },
    },
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {
        Head = 'Maat\'s Cap',
    },
    TP_HighAcc = {
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Body = { Name = 'Shura Togi +1', Priority = -20 },
        Hands = 'Noritsune Kote',
        Ring1 = { Name = 'Toreador\'s Ring', Priority = 60 },
    },
    TP_Focus = {
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
    },
    TP_DRG = {
        Head = 'Maat\'s Cap',
        Ear2 = 'Wyvern Earring',
    },
    TP_THF = {
        Ear2 = 'Pilferer\'s Earring',
    },

    Weapon_Loadout_1 = {
        Main = 'Destroyers',
        Ammo = { Name = 'Tiphia Sting', Priority = -20 },
    },
    Weapon_Loadout_2 = {
        Main = 'Cross-Counters',
        Ammo = { Name = 'Tiphia Sting', Priority = -20 },
    },
    Weapon_Loadout_3 = {
        Main = 'Faith Baghnakhs',
        Ammo = 'Virtue Stone',
    },

    WS = {
        Head = 'Maat\'s Cap',
        Neck = 'Thunder Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Kirin\'s Osode', Priority = 50 },
        Hands = { Name = 'Bandomusha Kote', Priority = 60 },
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Black Belt',
        Legs = { Name = 'Shura Haidate +1', Priority = -20 },
        Feet = { Name = 'Shr. Sune-Ate +1', Priority = -20 },
    },
    WS_HighAcc = {
        Body = { Name = 'Shura Togi +1', Priority = -20 },
        Hands = 'Noritsune Kote',
        Ring1 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
    },

    WS_AsuranFists = {
        Neck = 'Faith Torque',
        Ear1 = 'Merman\'s Earring',
    },
    WS_DragonKick = {},
    WS_HowlingFist = {},
    WS_RagingFists = {},
    WS_FinalHeaven = {},

    Jump = {
        Head = 'Maat\'s Cap',
        Neck = 'Faith Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Robust Earring',
        Body = { Name = 'Kirin\'s Osode', Priority = 50 },
        Hands = { Name = 'Bandomusha Kote', Priority = 60 },
        Ring1 = 'Robust Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Wyvern Mantle',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Shura Haidate +1', Priority = -20 },
        Feet = 'Dune Boots',
    },
    HighJump = {
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Shura Togi +1', Priority = -20 },
        Ring1 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Waist = 'Black Belt',
    },
    Chakra = {
        Ammo = { Name = 'Happy Egg', Priority = 60 },
        Head = { Name = 'Genbu\'s Kabuto', Priority = 60 },
        Neck = 'Fortitude Torque',
        Ear1 = 'Robust Earring',
        Ear2 = 'Robust Earring',
        Body = { Name = 'Tpl. Cyclas +1', Priority = 60 },
        Hands = { Name = 'Mel. Gloves +1', Priority = 60 },
        Ring1 = 'Robust Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Melee Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Mst. Sitabaki +1',
        Feet = 'Power sandals',
    },
    ChiBlast = {
        Head = { Name = 'Tpl. Crown +1', Priority = 60 },
        Neck = 'Faith Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Hands = { Name = 'Dvt. Mitts +1', Priority = 50 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Melee Cape',
        Legs = { Name = 'Tpl. Hose +1', Priority = 60 },
        Waist = 'Reverend Sash',
        Feet = 'Suzaku\'s Sune-Ate',
    },
    Dodge = {
        Feet = { Name = 'Tpl. Gaiters +1', Priority = 60 },
    },
    Boost = {
        Hands = { Name = 'Temple Gloves', Priority = 60 },
    },
    Focus = {
        Head = { Name = 'Tpl. Crown +1', Priority = 60 },
    },
    Counterstance = {
        Feet = { Name = 'Melee Gaiters', Priority = 60 },
    },

    HundredFists = {
        Head = 'Maat\'s Cap',
        Neck = 'Faith Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = { Name = 'Shura Togi +1', Priority = -20 },
        Hands = { Name = 'Bandomusha Kote', Priority = 60 },
        Ring1 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Back = 'Forager\'s Mantle',
        Waist = 'Black Belt',
        Legs = { Name = 'Shura Haidate +1', Priority = -20 },
        Feet = 'Dune Boots',
    },
    HundredFists_Focus = {
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
    },

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {
        Ammo = 'Pebble',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    VileElixir = {
        Head = { Name = 'Genbu\'s Kabuto', Priority = 60 },
        Neck = { Name = 'Shield Pendant', Priority = 20 },
        Ear1 = { Name = 'Pigeon Earring +1', Priority = 60 },
        Ear2 = { Name = 'Pigeon Earring +1', Priority = 60 },
        Body = { Name = 'Mel. Cyclas +1', Priority = 60 },
        Hands = { Name = 'Seiryu\'s Kote', Priority = 60 },
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Ring2 = { Name = 'Bloodbead Ring', Priority = 40 },
        Back = { Name = 'Gigant Mantle', Priority = 60 },
        Waist = { Name = 'Powerful Rope', Priority = 60 },
        Legs = { Name = 'Tpl. Hose +1', Priority = 60 },
        Feet = { Name = 'Melee Gaiters', Priority = 60 },
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

sets.kampfer_ring = kampfer_ring
sets.kampfer_earring = kampfer_earring
sets.shadow_mantle = shadow_mantle
profile.Sets = gcmelee.AppendSets(sets)

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Chi Blast') then
        gFunc.EquipSet(sets.ChiBlast)
    elseif (action.Name == 'Chakra') then
        gFunc.EquipSet(sets.Chakra)
        local environment = gData.GetEnvironment()
        if (environment.DayElement == 'Dark') then
            gFunc.EquipSet('shadow_mantle')
        end
    elseif (action.Name == 'Dodge') then
        gFunc.EquipSet(sets.Dodge)
    elseif (action.Name == 'Boost') then
        gFunc.EquipSet(sets.Boost)
    elseif (action.Name == 'Focus') then
        gFunc.EquipSet(sets.Focus)
    elseif (action.Name == 'Counterstance') then
        gFunc.EquipSet(sets.Counterstance)
    elseif (action.Name == 'Jump') then
        gFunc.EquipSet(sets.Jump)
    elseif (action.Name == 'High Jump') then
        gFunc.EquipSet(sets.Jump)
        gFunc.EquipSet(sets.HighJump)
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
    if (action.Name == 'Asuran Fists') then
        gFunc.EquipSet(sets.WS_AsuranFists)
    elseif (action.Name == 'Dragon Kick') then
        gFunc.EquipSet(sets.WS_DragonKick)
    elseif (action.Name == 'Howling Fist') then
        gFunc.EquipSet(sets.WS_HowlingFist)
    elseif (action.Name == 'Raging Fists') then
        gFunc.EquipSet(sets.WS_RagingFists)
    elseif (action.Name == 'Final Heaven') then
        gFunc.EquipSet(sets.WS_FinalHeaven)
    end
end

profile.OnLoad = function()
    gcmelee.Load(3.00)
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

    if (focus == 1 and gcdisplay.IdleSet == 'LowAcc') then
        gFunc.EquipSet(sets.TP_Focus)
    end

    if (player.Status == 'Engaged') then
        if (player.SubJob == 'DRG') then
            gFunc.EquipSet(sets.TP_DRG)
        elseif (player.SubJob == 'THF') then
            gFunc.EquipSet(sets.TP_THF)
        end
    end

    if (hundredFists == 1) then
        gFunc.EquipSet(sets.HundredFists)
        if (focus == 1 and gcdisplay.IdleSet == 'LowAcc') then
            gFunc.EquipSet(sets.HundredFists_Focus)
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
