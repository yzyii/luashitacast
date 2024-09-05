-- NIN will lose TP on many actions when switching to Staff.
-- Use "/lac disable Main" to prevent weapon swaps if this is not desired.

local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local shinobi_ring = true
local shinobi_ring_slot = 'Ring2'

local koga_tekko = false
local koga_tekko_plus_one = true

local uggalepih_pendant = true

local fenrirs_stone = true -- Used for Evasion at night

-- Fill this out for which evasion pants to use at night / dusk to dawn
local night_time_eva_pants = ''
local dusk_to_dawn_eva_pants = 'Koga Hakama +1'

-- Leave as '' if you do not have the staff.
local fire_staff = 'Vulcan\'s Staff'
local earth_staff = 'Terra\'s Staff'
local water_staff = 'Neptune\'s Staff'
local wind_staff = 'Auster\'s Staff'
local ice_staff = 'Aquilo\'s Staff'
local thunder_staff = 'Jupiter\'s Staff'
local dark_staff = 'Dark Staff'

-- Set to true if you have the obi
local karin_obi = true
local dorin_obi = false
local suirin_obi = false
local furin_obi = false
local hyorin_obi = true
local rairin_obi = true
local anrin_obi = true

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
    SIRD = {
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    Hate = {},
    NinDebuff = {},
    NinElemental = {},
    DrkDarkMagic = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {},
    TP_HighAcc = {},
    WS = {},
    WS_BladeJin = {},
    WS_BladeKu = {},

    Ranged = {}, -- This won't work for automatically swapping shurikens, only other equipment
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
local DrkDarkMagic = T{ 'Stun', 'Aspir', 'Drain', 'Absorb-AGI', 'Absorb-VIT' }
local NinElemental = T{ 'Hyoton: Ni', 'Katon: Ni', 'Huton: Ni', 'Doton: Ni', 'Raiton: Ni', 'Suiton: Ni' }

local ElementalStaffTable = {
    ['Fire'] = fire_staff,
    ['Earth'] = earth_staff,
    ['Water'] = water_staff,
    ['Wind'] = wind_staff,
    ['Ice'] = ice_staff,
    ['Thunder'] = thunder_staff,
    ['Dark'] = dark_staff
}

local NukeObiTable = {
    ['Fire'] = 'Karin Obi',
    ['Earth'] = 'Dorin Obi',
    ['Water'] = 'Suirin Obi',
    ['Wind'] = 'Furin Obi',
    ['Ice'] = 'Hyorin Obi',
    ['Thunder'] = 'Rairin Obi',
    ['Dark'] = 'Anrin Obi'
}

local NukeObiOwnedTable = {
    ['Fire'] = karin_obi,
    ['Earth'] = dorin_obi,
    ['Water'] = suirin_obi,
    ['Wind'] = furin_obi,
    ['Ice'] = hyorin_obi,
    ['Thunder'] = rairin_obi,
    ['Dark'] = anrin_obi
}

local WeakElementTable = {
    ['Fire'] = 'Water',
    ['Earth'] = 'Wind',
    ['Water'] = 'Thunder',
    ['Wind'] = 'Ice',
    ['Ice'] = 'Fire',
    ['Thunder'] = 'Earth',
    ['Light'] = 'Dark',
    ['Dark'] = 'Light'
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
    gFunc.EquipSet(sets.Ranged)
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)
    local action = gData.GetAction()
    if (action.Name == 'Blade: Jin') then
        gFunc.EquipSet(sets.WS_BladeJin)
    elseif (action.Name == 'Blade: Ku') then
        gFunc.EquipSet(sets.WS_BladeKu)
    end

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

    if (gcdisplay.IdleSet == 'Evasion') then
        if (fenrirs_stone and (environment.Time < 6 or environment.Time >= 18)) then
            gFunc.Equip('Ammo', 'Fenrir\'s Stone')
        end
        if (night_time_eva_pants ~= '' and (environment.Time < 6 or environment.Time >= 18)) then
            gFunc.Equip('Legs', night_time_eva_pants)
        end
        if (dusk_to_dawn_eva_pants ~= '' and (environment.Time < 7 or environment.Time >= 17)) then
            gFunc.Equip('Legs', dusk_to_dawn_eva_pants)
        end
    end

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
            EquipStaffAndObi(action)
        elseif (NinElemental:contains(action.Name)) then
            gFunc.EquipSet(sets.NinElemental)
            if (action.MppAftercast < 51) and uggalepih_pendant then
                gFunc.Equip('Neck', 'Uggalepih Pendant')
            end
            EquipStaffAndObi(action)
        end
    elseif (action.Skill == 'Enfeebling Magic') then
        if (DrkDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.Hate)
        end
        local staff = ElementalStaffTable[action.Element]
        if staff ~= '' then
            gFunc.Equip('Main', staff)
        end
    elseif (action.Skill == 'Dark Magic') then
        if (DrkDarkMagic:contains(action.Name)) then
            gFunc.EquipSet(sets.DrkDarkMagic)
        end
        EquipStaffAndObi(action)
    end
end

function EquipStaffAndObi(action)
    local staff = ElementalStaffTable[action.Element]
    if staff ~= '' then
        gFunc.Equip('Main', staff)
    end

    if (ObiCheck(action)) then
        local obi = NukeObiTable[action.Element]
        local obiOwned = NukeObiOwnedTable[action.Element]
        if (obiOwned) then
            gFunc.Equip('Waist', obi)
        end
    end
end

function ObiCheck(action)
    local element = action.Element
    local environment = gData.GetEnvironment()
    local weakElement = WeakElementTable[element]

    if environment.WeatherElement == element then
        return environment.Weather:match('x2') or environment.DayElement ~= weakElement
    end

    return environment.DayElement == element and environment.WeatherElement ~= weakElement
end

return profile
