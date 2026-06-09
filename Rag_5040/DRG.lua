local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

-- The following is provided as a convenient saved setting over using the /sethp command. HP will fluctuate with SJ and usage of the command for this is required.
local max_hp_in_idle_with_regen_gear_equipped = 0 -- Set this to 0 if you do not wish to ever use regen gear.

-- Define these if you wish to automatically equip PDT sets when /WHM or /RDM
local heal_hp_threshold_whm = 0
local heal_hp_threshold_rdm = 0

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
    Resting = {
        Neck = { Name = 'Pch. Collar', Priority = 70 },
    },
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

    TP_LowAcc = {},
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {},
    TP_2H_Haste = {},
    TP_2H_Mjollnir_Haste = {},
    TP_HighAcc = {},
    TP_THF = {
        Ear2 = 'Pilferer\'s Earring',
    },

    Weapon_Loadout_1 = {},
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},

    WS = {},
    WS_HighAcc = {},

    WS_PentaThrust = {},
    WS_WheelingThrust = {},
    WS_ImpulseDrive = {},
    WS_Skewer = {},
    WS_Geirskogul = {},

    MaxHP = {
        Head = 'Drachen Armet',
    },
    BreathBonus = {
        Head = 'Wyrm Armet',
    },
    BreathBonus_NonMage = {},

    Stoneskin = {},

    AncientCircle = {},
    Jump = {},
    Jump_Accuracy = {},
    HighJump = {},
    HighJump_Accuracy = {},
    SuperJump = {},
    CallWyvern = {},
    SpiritLink = {},

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {
        Ammo = 'Pebble',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

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

sets.ethereal_earring = ethereal_earring
sets.warlocks_mantle = warlocks_mantle
profile.Sets = gcmelee.AppendSets(sets)

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Steady Wing') then
        gFunc.EquipSet(sets.BreathBonus)
    elseif (action.Name == 'Ancient Circle') then
        gFunc.EquipSet(sets.AncientCircle)
    elseif (action.Name == 'Jump') then
        gFunc.EquipSet(sets.Jump)
        if (gcmelee.GetAccuracyMode() == 'HighAcc') then
            gFunc.EquipSet(sets.Jump_Accuracy)
        end
    elseif (action.Name == 'High Jump') then
        gFunc.EquipSet(sets.HighJump)
        if (gcmelee.GetAccuracyMode() == 'HighAcc') then
            gFunc.EquipSet(sets.HighJump_Accuracy)
        end
    elseif (action.Name == 'Super Jump') then
        gFunc.EquipSet(sets.SuperJump)
    elseif (action.Name == 'Call Wyvern') then
        gFunc.EquipSet(sets.CallWyvern)
    elseif (action.Name == 'Spirit Link') then
        gFunc.EquipSet(sets.SpiritLink)
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
    if (action.Name == 'Penta Thrust') then
        gFunc.EquipSet(sets.WS_PentaThrust)
    elseif (action.Name == 'Wheeling Thrust') then
        gFunc.EquipSet(sets.WS_WheelingThrust)
    elseif (action.Name == 'Impulse Drive') then
        gFunc.EquipSet(sets.WS_ImpulseDrive)
    elseif (action.Name == 'Skewer') then
        gFunc.EquipSet(sets.WS_Skewer)
    elseif (action.Name == 'Geirskogul') then
        gFunc.EquipSet(sets.WS_Geirskogul)
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
    local isWHM = player.SubJob == 'WHM'
    local isRDM = player.SubJob == 'RDM'
    local isMage = isWHM or isRDM
    local weakened = gData.GetBuffCount('Weakness')

    if (player.Status == 'Engaged') then
        if (player.SubJob == 'THF') then
            gFunc.EquipSet(sets.TP_THF)
        end
    end

    if (isWHM and player.HP <= heal_hp_threshold_whm and weakened < 1) then
        gFunc.EquipSet(sets.DT)
    elseif (isRDM and player.HP <= heal_hp_threshold_rdm and weakened < 1) then
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
