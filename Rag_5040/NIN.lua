local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

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
    Neck = 'Uggalepih Pendant',
}
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}
local fenrirs_stone = { -- Used for Evasion at night
    Ammo = 'Fenrir\'s Stone',
}
local koga_hakama = {
    -- Legs = 'Koga Hakama',
}
local koga_hakama_plus_one = {
    Legs = 'Kog. Hakama +1',
}

local sets = {
    Idle = {},
    IdleALT = {},
    IdleDT = {},
    IdleALTDT = {},
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

    Hate = {},
    NinDebuff = {},
    NinElemental = {},
    NinElemental_Accuracy = {},
    DrkDarkMagic = {},

    Enhancing = {},
    Cure = {},
    Flash = {}, -- Technically optional since Hate and Haste gear will be equipped by default

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

    Ranged = {},

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
profile.Sets = gcmelee.AppendSets(sets)

local NinDebuffs = T{ 'Kurayami: Ni', 'Hojo: Ni', 'Jubaku: Ichi', 'Dokumori: Ichi', 'Kurayami: Ichi', 'Hojo: Ichi' }
local HateDebuffs = T{ 'Bind', 'Sleep', 'Poison', 'Blind' }
local DrkDarkMagic = T{ 'Stun', 'Aspir', 'Drain', 'Absorb-AGI', 'Absorb-VIT' }
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

profile.HandleAbility = function()
    gcmelee.DoAbility()

    gFunc.EquipSet(sets.Hate)
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Ranged)
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Ranged)
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
    end
    if (environment.Time < 7 or environment.Time >= 17) then
        gFunc.EquipSet('koga_tekko_plus_one')
    end
end

profile.OnLoad = function()
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
end

profile.HandleCommand = function(args)
    if (args[1] == 'nuke') then
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
    gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)

    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

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

    local action = gData.GetAction()
    if (action.Skill == 'Ninjutsu') then
        if (NinDebuffs:contains(action.Name)) then
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
        if (DrkDarkMagic:contains(action.Name)) then
            gFunc.EquipSet(sets.DrkDarkMagic)
        end
        EquipStaffAndObi(action)
    elseif (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing)
    elseif (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure)
    elseif (action.Skill == 'Divine Magic') then
        gFunc.EquipSet(sets.Hate)
        gFunc.EquipSet(sets.Haste)
        gFunc.EquipSet(sets.Flash)
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
    local weakElement = WeakElementTable[element]

    if environment.WeatherElement == element then
        return environment.Weather:match('x2') or environment.DayElement ~= weakElement
    end

    return environment.DayElement == element and environment.WeatherElement ~= weakElement
end

return profile
