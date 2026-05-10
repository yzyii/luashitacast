local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local myochin_kabuto = {
    Head = 'Myochin Kabuto',
}
local saotome_kote = {
    Hands = 'Saotome Kote',
}

local sets = {
    Idle = {},
    IdleALT = {},
    Resting = {},
    Town = {},
    Movement = {},
    Movement_TP = {},

    DT = {},
    MDT = {},
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},
    Override = { -- An additional override set explicitly to be used for sets such as crafting, HELM, fishing, or any other special sets such as DRK 2HR, MNK Counter etc. n.b. Any unused Resist or Evasion set can be used similarly.
        Body = 'Field Tunica',
        Hands = 'Field Gloves',
        Legs = 'Field Hose',
        Feet = 'Field Boots'
    },

    Precast = {},
    SIRD = { -- Override sets (Resistance / Evasion) take precedence if in use.
    },
    Haste = {
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {},
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {},

    SJ_DRG = {
        Head = 'Maat\'s Cap',
        Ear2 = 'Wyvern Earring',
    },
    SJ_THF = {
        Ear2 = 'Pilferer\'s Earring',
    },

    WS = {
        Head  = 'Maat\'s Cap',
        Neck  = 'Justice Torque',
        Ear1  = 'Triumph Earring',
        Ear2  = 'Brutal Earring',
        Body  = { Name = 'Kirin\'s Osode', Priority = 10 }
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 20 },
        Ring1 = 'Rajas Ring',
        Ring2 = 'Triumph Ring',
        Back  = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs  = { Name = 'Shura Haidate +1', Priority = -5 },
        Feet  = 'Hmn. Sune-Ate +1',
    },
    WS_HighAcc = {},
    WS_Yukikaze = {
        Neck  = 'Snow Gorget',
        Body  = 'Hmn. Domaru +1',
        Hands = 'Hachiman Kote +1',
    },
    WS_Gekko = {
        Neck  = 'Snow Gorget',
        Body  = 'Hmn. Domaru +1',
        Hands = 'Hachiman Kote +1',
    },
    WS_Kasha = {
        Neck  = 'Light Gorget',
        Body  = 'Hmn. Domaru +1',
        Hands = 'Hachiman Kote +1',
    },
    WS_Kaiten = {
        Neck  = 'Light Gorget',
        Body  = { Name = 'Byrnie +1', Priority = 20 },
        Hands = 'Hachiman Kote +1',
    },
    WS_Jinpu = {
        Neck  = 'Soil Gorget',
        Ear1  = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body  = 'Haubergeon +1',
        Hands = { Name = 'Bandomusha Kote', Priority = 20 },
    },
    WS_2H = {
        Body  = { Name = 'Kirin\'s Osode', Priority = 10 }
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 20 },
        Feet  = 'Rutter Sabatons',
    },
    WS_2H_Kaiten = {
        Body  = { Name = 'Byrnie +1', Priority = 20 },
    },
    WS_2H_Jinpu = {
        Body  = 'Haubergeon +1',
        Hands = { Name = 'Bandomusha Kote', Priority = 20 },
    },

    Weapon_Loadout_1 = {},
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},

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

sets.myochin_kabuto = myochin_kabuto
sets.saotome_kote = saotome_kote
profile.Sets = gcmelee.AppendSets(sets)

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Meditate') then
        gFunc.EquipSet('myochin_kabuto')
        gFunc.EquipSet('saotome_kote')
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
    if (action.Name == 'Tachi: Yukikaze') then
        gFunc.EquipSet(sets.WS_Yukikaze)
    elseif (action.Name == 'Tachi: Gekko') then
        gFunc.EquipSet(sets.WS_Gekko)
    elseif (action.Name == 'Tachi: Kasha') then
        gFunc.EquipSet(sets.WS_Kasha)
    elseif (action.Name == 'Tachi: Kaiten') then
        gFunc.EquipSet(sets.WS_Kaiten)
    elseif (action.Name == 'Tachi: Jinpu') then
        gFunc.EquipSet(sets.WS_Jinpu)
    end

    local meikyo = gData.GetBuffCount('Meikyo Shisui')
    if (meikyo > 0) then
        gFunc.EquipSet(sets.WS_2H)
        if (action.Name == 'Tachi: Kaiten') then
            gFunc.EquipSet(sets.WS_2H_Kaiten)
        elseif (action.Name == 'Tachi: Jinpu') then
            gFunc.EquipSet(sets.WS_2H_Jinpu)
        end
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
    if (player.Status == 'Engaged') then
        if (player.SubJob == 'DRG') then
            gFunc.EquipSet(sets.SJ_DRG)
        elseif (player.SubJob == 'THF') then
            gFunc.EquipSet(sets.SJ_THF)
        end
    end

    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
end

return profile
