local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

local heal_hp_threshold_whm = 859
local heal_hp_threshold_rdm = 869

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local ethereal_earring = {
    Ear2 = 'Ethereal Earring',
}
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}

local sets = {
    Idle = {},
    IdleALT = {},
    Resting = {},
    Town = {},
    Movement = {},

    DT = {},
    MDT = {},
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {},
    SIRD = { -- Only used for Idle sets and not while Override sets are active
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {},
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {},

    MaxHP = {
        Head = 'Drachen Armet',
    },
    BreathBonus = {
        Head = 'Wyrm Armet',
    },
    BreathBonus_NonMage = {},
    Stoneskin = {},

    ['Ancient Circle'] = {},
    ['Jump'] = {},
    ['Jump Accuracy'] = {},
    ['High Jump'] = {},
    ['High Jump Accuracy'] = {},
    ['Super Jump'] = {},
    ['Call Wyvern'] = {},
    ['Spirit Link'] = {},

    WS = {},
    WS_HighAcc = {},

    ['Penta Thrust'] = {},
    ['Wheeling Thrust'] = {},
    ['Impulse Drive'] = {},
    ['Skewer'] = {},
    ['Geirskogul'] = {},

    Weapon_Loadout_1 = {},
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},
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

sets.ethereal_earring = ethereal_earring
sets.warlocks_mantle = warlocks_mantle
profile.Sets = gcmelee.AppendSets(sets)

local JobAbilities = T{
    'Jump',
    'High Jump',
    'Super Jump',
    'Spirit Link',
    'Call Wyvern',
    'Ancient Circle',
}

local WeaponSkills = T{
    'Impulse Drive',
    'Wheeling Thrust',
    'Skewer',
    'Penta Thrust',
    'Geirskogul',
}

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Steady Wing') then
        gFunc.EquipSet(sets.BreathBonus)
    elseif (JobAbilities:contains(action.Name)) then
        gFunc.EquipSet(sets[action.Name])
    end

    if (gcmelee.GetAccuracyMode() == 'HighAcc') then
        if (action.Name == 'Jump') then
            gFunc.EquipSet('Jump Accuracy')
        elseif (action.Name == 'High Jump') then
            gFunc.EquipSet('High Jump Accuracy')
        end
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
    if (WeaponSkills:contains(action.Name)) then
      gFunc.EquipSet(sets[action.Name])
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
    local isWHM = player.SubJob == 'WHM'
    local isRDM = player.SubJob == 'RDM'
    local isMage = isWHM or isRDM
    local weakened = gData.GetBuffCount('Weakness')

    if (isWHM and player.HP <= heal_hp_threshold_whm and weakened < 1) then
        gFunc.EquipSet(sets.DT)
    end
    if (isRDM and player.HP <= heal_hp_threshold_rdm and weakened < 1) then
        gFunc.EquipSet(sets.DT)
    end

    if (isMage) then
        gFunc.EquipSet('ethereal_earring')
    end

    gcmelee.DoDefaultOverride()

    local petAction = gData.GetPetAction()
    if (petAction ~= nil) then
        if (isMage) then
            gFunc.EquipSet(sets.BreathBonus)
        else
            gFunc.EquipSet(sets.BreathBonus_NonMage)
        end
        return
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == 'RDM' and warlocks_mantle.Back) then
        gcmelee.DoPrecast(fastCastValue + 0.02)
        gFunc.EquipSet('warlocks_mantle')
    else
        gcmelee.DoPrecast(fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local player = gData.GetPlayer()
    local action = gData.GetAction()
    if (player.SubJob == 'WHM' or player.SubJob == 'RDM') then
        if (action.Name == 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin)
        else
            gFunc.EquipSet(sets.MaxHP)
        end
    end
end

return profile
