local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set

 -- Rudimentary protection for attempting to avoid losing arrows except if Unlimited Shot or Namas Arrow Aftermath is active
local yoichinoyumi = false
local special_ammo = 'Carapace Bullet'

local sets = {
    Idle = {
        Ammo = 'Silver Bullet',
    },
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

    Preshot = {},

    TP_LowAcc = {
        Ammo = 'Silver Bullet',
    },
    TP_Aftermath = {}, -- This can be ignored since the UnlimitedShot set will already equip for Aftermaths
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {},

    Ranged_ACC = {},
    Ranged_ATK = {},

    EagleEyeShot = {},

    Barrage = {},
    Scavenge = {},
    Shadowbind = {},
    Camouflage = {},
    Sharpshot = {},
    UnlimitedShot = { -- Used for Namas Arrow Aftermath as well as Unlimited Shot
        Ammo = special_ammo,
    },

    WS = {},
    WS_HighAcc = {},

    WS_SlugShot = {},
    WS_Coronach = {},

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

profile.Sets = gcmelee.AppendSets(sets)

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Scavenge') then
        gFunc.EquipSet(sets.Scavenge)
    elseif (action.Name == 'Shadowbind') then
        gFunc.EquipSet(sets.Shadowbind)
    elseif (action.Name == 'Camouflage') then
        gFunc.EquipSet(sets.Camouflage)
    elseif (action.Name == 'Sharpshot') then
        gFunc.EquipSet(sets.Sharpshot)
    elseif (action.Name == 'Eagle Eye Shot') then
        gFunc.EquipSet(sets.EagleEyeShot)

        local equipment = gData.GetEquipment()
        local unlimitedShot = gData.GetBuffCount('Unlimited Shot') > 0
        local yoichiActive = yoichinoyumi and gData.GetBuffCount('Aftermath') > 0

        if (unlimitedShot or yoichiActive) then
            gFunc.EquipSet(sets.UnlimitedShot)
        elseif (equipment.Ammo ~= nil and equipment.Ammo.Name == special_ammo) then
            print(chat.header('RNG'):append(chat.message('Action Canceled: Special Ammo Protection')))
            gFunc.CancelAction()
        end
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot)

    local equipment = gData.GetEquipment()
    local unlimitedShot = gData.GetBuffCount('Unlimited Shot') > 0
    local yoichiActive = yoichinoyumi and gData.GetBuffCount('Aftermath') > 0

    if (unlimitedShot or yoichiActive) then
        gFunc.EquipSet(sets.UnlimitedShot)
    end
    if (unlimitedShot == 0 and equipment.Ammo ~= nil and equipment.Ammo.Name == special_ammo) then
        print(chat.header('RNG'):append(chat.message('Action Canceled: Special Ammo Protection')))
        gFunc.CancelAction()
    end
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Ranged_ACC)
    if (gcdisplay.GetCycle('Ranged') == 'Attack') then
        gFunc.EquipSet(sets.Ranged_ATK)
    end

    local barrage = gData.GetBuffCount('Barrage')
    if (barrage == 1) then
        gFunc.EquipSet(sets.Barrage)
    end

    local unlimitedShot = gData.GetBuffCount('Unlimited Shot') > 0
    local yoichiActive = yoichinoyumi and gData.GetBuffCount('Aftermath') > 0

    if (unlimitedShot or yoichiActive) then
        gFunc.EquipSet(sets.UnlimitedShot)
    end
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local equipment = gData.GetEquipment()
    local unlimitedShot = gData.GetBuffCount('Unlimited Shot') > 0
    local yoichiActive = yoichinoyumi and gData.GetBuffCount('Aftermath') > 0

    if (unlimitedShot or yoichiActive) then
        gFunc.EquipSet(sets.UnlimitedShot)
    elseif (equipment.Ammo ~= nil and equipment.Ammo.Name == special_ammo) then
        print(chat.header('RNG'):append(chat.message('Action Canceled: Special Ammo Protection')))
        gFunc.CancelAction()
    end

    local action = gData.GetAction()
    if (action.Name == 'Slug Shot') then
        gFunc.EquipSet(sets.WS_SlugShot)
    elseif (action.Name == 'Coronach') then
        gFunc.EquipSet(sets.WS_Coronach)
    end
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'ranged'})
    gcdisplay.CreateCycle('Ranged', {[1] = 'Accuracy', [2] = 'Attack',})
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'ranged'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'ranged') then
        gcdisplay.AdvanceCycle('Ranged')
        gcinclude.Message('Ranged', gcdisplay.GetCycle('Ranged'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()
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
