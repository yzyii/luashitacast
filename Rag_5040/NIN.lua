local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local shinobi_ring = true
local shinobi_ring_slot = 'Ring2'

local koga_tekko = false
local koga_tekko_plus_one = true

local uggalepih_pendant = true

-- Leave as '' if you do not have the staff.
local fire_staff = 'Vulcan\'s Staff'
local earth_staff = 'Terra\'s Staff'
local water_staff = 'Neptune\'s Staff'
local wind_staff = 'Auster\'s Staff'
local ice_staff = 'Aquilo\'s Staff'
local thunder_staff = 'Jupiter\'s Staff'

local sets = {
    Idle = {},
    IdleALT = {},
    Resting = {},
    Town = {},
    Movement = {},

    DT = {},
    MDT = { -- Shell IV provides 23% MDT
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {},
    SIRD = { -- 102% to Cap
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    Hate = {},
    NinDebuff = {},
    NinElemental = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {},
    TP_HighAcc = {},
    WS = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

local NinDebuffs = T{ 'Kurayami: Ni', 'Hojo: Ni', 'Jubaku: Ichi', 'Dokumori: Ichi' }
local DrkDebuffs = T{ 'Bind', 'Sleep', 'Poison' }
local NinElemental = T{ 'Hyoton: Ni', 'Katon: Ni', 'Huton: Ni', 'Doton: Ni', 'Raiton: Ni', 'Suiton: Ni' }

local ElementalStaffTable = {
    ['Fire'] = fire_staff,
    ['Earth'] = earth_staff,
    ['Water'] = water_staff,
    ['Wind'] = wind_staff,
    ['Ice'] = ice_staff,
    ['Thunder'] = thunder_staff,
}

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.HandleAbility = function()
    gFunc.EquipSet(sets.Hate)
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    -- You may add logic here
end

profile.HandleMidshot = function()
    -- You may add logic here
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)

    local environment = gData.GetEnvironment()
    if (koga_tekko and (environment.Time < 6 or environment.Time >= 18)) then
        gFunc.Equip('Hands', 'Koga Tekko')
    end
    if (koga_tekko_plus_one and (environment.Time < 7 or environment.Time >= 17)) then
        gFunc.Equip('Hands', 'Kog. Tekko +1')
    end

    gcmelee.DoFenrirsEarring()
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
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    if (player.Status == 'Engaged') then
        if (shinobi_ring and player.HPP <= 75 and player.TP <= 1000) then
            gFunc.Equip(shinobi_ring_slot, 'Shinobi Ring')
        end
        if (koga_tekko and (environment.Time < 6 or environment.Time >= 18)) then
            gFunc.Equip('Hands', 'Koga Tekko')
        end
        if (koga_tekko_plus_one and (environment.Time < 7 or environment.Time >= 17)) then
            gFunc.Equip('Hands', 'Kog. Tekko +1')
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

    local action = gData.GetAction()
    if (action.Skill == 'Ninjutsu') then
        if (NinDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.NinDebuff)
        elseif (NinElemental:contains(action.Name)) then
            gFunc.EquipSet(sets.NinElemental)
            if (action.MppAftercast < 51) and uggalepih_pendant then
                gFunc.Equip('Neck', 'Uggalepih Pendant')
            end
            local staff = ElementalStaffTable[action.Element]
            if staff ~= '' then
                gFunc.Equip('Main', staff)
            end
        end
    elseif (action.Skill == 'Enfeebling Magic') then
        if (DrkDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.Hate)
        end
    end
end

return profile
