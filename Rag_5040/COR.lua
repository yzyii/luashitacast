local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set

-- The following is provided as a convenient saved setting over using the /sethp command. HP will fluctuate with SJ and usage of the command for this is required.
local max_hp_in_idle_with_regen_gear_equipped = 0 -- Set this to 0 if you do not wish to ever use regen gear.

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local rng_fenrirs_earring = { -- Used always if active
    Ear2 = 'Fenrir\'s Earring',
}
local luzafs_ring = {
    Ring2 = 'Luzaf\'s Ring',
}
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}
local uggalepih_pendant = {
    Neck = { Name = 'Uggalepih Pendant', Priority = 50 },
}
local republic_circlet = {
    Head = 'Republic Circlet',
}

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
    LightningRes_NoBarthunder = {},
    LightningRes_WithBarthunderCarol = {},
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
    Haste = {},

    TP_LowAcc = {},
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {},

    Weapon_Loadout_1 = {},
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},

    WS = { -- Technically could be used as the base set for Ranged WS but is probably best used for Melee WS instead e.g. Evisceration.
    },
    WS_HighAcc = { -- Note that this will only be used for Melee WS when HighAcc tp mode is being used.
    },
    WS_Evisceration = {},
    WS_Vorpal = {},
    WS_Savage = {},

    Preshot = {},
    Ranged_ATK = {},
    Ranged_ACC = {},

    WS_Ranged_ATK = {},
    WS_Ranged_ACC = {},

    WS_HeavyShot = {},
    WS_Detonator = {},
    WS_SlugShot = {},
    WS_Leaden_Salute = {},

    PhantomRoll = {
        Head = 'Comm. Tricorne',
    },
    RandomDeal = {
        Body = 'Commodore Frac',
    },

    QuickDraw_DMG = {},
    QuickDraw_ACC = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    VileElixir = {},

    WeaponBash = {
        Main = 'Terra\'s Staff',
    },

    Cure = {},
    Enhancing = {},
    Stoneskin = {},
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

sets.rng_fenrirs_earring = rng_fenrirs_earring
sets.luzafs_ring = luzafs_ring
sets.warlocks_mantle = warlocks_mantle
sets.uggalepih_pendant = uggalepih_pendant
sets.republic_circlet = republic_circlet
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
profile.Sets = gcmelee.AppendSets(sets)

local DistanceWS = T{'Flaming Arrow','Piercing Arrow','Dulling Arrow','Sidewinder','Blast Arrow','Arching Arrow','Empyreal Arrow','Refulgent Arrow','Apex Arrow','Namas Arrow','Jishnu\'s Randiance','Hot Shot','Split Shot','Sniper Shot','Slug Shot','Blast Shot','Heavy Shot','Detonator','Numbing Shot','Last Stand','Coronach','Wildfire','Trueflight','Leaden Salute','Myrkr','Dagan','Moonlight','Starlight'};
local PhantomRolls = T{'Corsair\'s Roll','Ninja Roll','Hunter\'s Roll','Chaos Roll','Magus\'s Roll','Healer\'s Roll','Puppet Roll','Choral Roll','Monk\'s Roll','Beast Roll','Samurai Roll','Evoker\'s Roll','Rogue\'s Roll','Warlock\'s Roll','Fighter\'s Roll','Drachen Roll','Gallant\'s Roll','Wizard\'s Roll','Dancer\'s Roll','Scholar\'s Roll','Bolter\'s Roll','Caster\'s Roll','Courser\'s Roll','Blitzer\'s Roll','Tactician\'s Roll','Allies\' Roll','Miser\'s Roll','Companion\'s Roll','Avenger\'s Roll','Naturalist\'s Roll','Runeist\'s Roll'};
local QuickDraws = T{'Fire Shot','Ice Shot','Wind Shot','Earth Shot','Thunder Shot','Water Shot','Light Shot','Dark Shot',}

local QuickDrawElement = {
    ['Fire Shot'] = 'Fire',
    ['Ice Shot'] = 'Ice',
    ['Wind Shot'] = 'Wind',
    ['Earth Shot'] = 'Earth',
    ['Thunder Shot'] = 'Thunder',
    ['Water Shot'] = 'Water',
    ['Light Shot'] = 'Light',
    ['Dark Shot'] = 'Dark',
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

    local action = gData.GetAction()

    if (PhantomRolls:contains(action.Name) or (action.Name == 'Double-Up')) then
        gFunc.EquipSet(sets.PhantomRoll)
        if (gcdisplay.GetToggle('Luzaf')) then
            gFunc.EquipSet(sets.luzafs_ring)
        end
    elseif (action.Name == 'Random Deal') then
        gFunc.EquipSet(sets.RandomDeal)
    elseif (QuickDraws:contains(action.Name)) then
        gFunc.EquipSet(sets.QuickDraw_DMG)

        local player = gData.GetPlayer()
        if (player.MPP < 51 and player.MaxMP > 0) then
            gFunc.EquipSet(sets.uggalepih_pendant)
        end
        if (conquest:GetInsideControl()) then
            print(chat.header('LAC - COR'):append(chat.message('In Region - Using Republic Circlet')))
            gFunc.EquipSet(sets.republic_circlet)
        end

        if (action.Name == 'Light Shot' or action.Name == 'Dark Shot' or gcdisplay.GetCycle('Quick Draw') == 'Accuracy') then
           gFunc.EquipSet(sets.QuickDraw_ACC)
        end

        local element = QuickDrawElement[action.Name]
        EquipStaffAndObi(element)
    end

    gcmelee.DoWeaponBash()
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot)
end

profile.HandleMidshot = function()
    local environment = gData.GetEnvironment()

    gFunc.EquipSet(sets.Ranged_ATK)
    if (environment.Time < 6 or environment.Time >= 18) then
        gFunc.EquipSet(sets.rng_fenrirs_earring)
    end

    if (gcdisplay.GetCycle('Ranged') == 'Accuracy') then
        gFunc.EquipSet(sets.Ranged_ACC)
    end

    gFunc.EquipSet('Weapon_Loadout_' .. gcdisplay.GetCycle('Weapon Loadout'))
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local player = gData.GetPlayer()
    local action = gData.GetAction()
    local environment = gData.GetEnvironment()

    if (DistanceWS:contains(action.Name)) then
        gFunc.EquipSet(sets.WS_Ranged_ATK)
        if (environment.Time < 6 or environment.Time >= 18) then
            gFunc.EquipSet(sets.rng_fenrirs_earring)
        end

        if (gcdisplay.GetCycle('Ranged') == 'Accuracy') then
            gFunc.EquipSet(sets.WS_Ranged_ACC)
        end

        if (action.Name == 'Heavy Shot') then
            gFunc.EquipSet(sets.WS_HeavyShot)
        elseif (action.Name == 'Detonator') then
            gFunc.EquipSet(sets.WS_Detonator)
        elseif (action.Name == 'Slug Shot') then
            gFunc.EquipSet(sets.WS_SlugShot)
        elseif (action.Name == 'Leaden Salute') then
            gFunc.EquipSet(sets.WS_Leaden_Salute)
            if (player.MPP < 51 and player.MaxMP > 0) then
                gFunc.EquipSet(sets.uggalepih_pendant)
            end
            if (conquest:GetInsideControl()) then
                print(chat.header('LAC - COR'):append(chat.message('In Region - Using Republic Circlet')))
                gFunc.EquipSet(sets.republic_circlet)
            end
        end
    else
        if (action.Name == 'Evisceration') then
            gFunc.EquipSet(sets.WS_Evisceration)
        elseif (action.Name == 'Vorpal Blade') then
            gFunc.EquipSet(sets.WS_Vorpal)
        elseif (action.Name == 'Savage Blade') then
            gFunc.EquipSet(sets.WS_Savage)
        end
    end
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'ranged'})
    gcdisplay.CreateCycle('Ranged', {[1] = 'Attack', [2] = 'Accuracy',})
    gcinclude.SetAlias(T{'quickdraw'})
    gcinclude.SetAlias(T{'qd'})
    gcdisplay.CreateCycle('Quick Draw', {[1] = 'Damage', [2] = 'Accuracy',})
    gcinclude.SetAlias(T{'luzaf'})
    gcdisplay.CreateToggle('Luzaf', false)
    gcinclude.SetAlias(T{'staff'})
    gcdisplay.CreateToggle('Staff', false)
    gcmelee.Load(320)
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'ranged'})
    gcinclude.ClearAlias(T{'quickdraw'})
    gcinclude.ClearAlias(T{'qd'})
    gcinclude.ClearAlias(T{'luzaf'})
    gcinclude.ClearAlias(T{'staff'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'ranged') then
        gcdisplay.AdvanceCycle('Ranged')
        gcinclude.Message('Ranged', gcdisplay.GetCycle('Ranged'))
    elseif (args[1] == 'quickdraw' or args[1] == 'qd') then
        gcdisplay.AdvanceCycle('Quick Draw')
        gcinclude.Message('Quick Draw', gcdisplay.GetToggle('Quick Draw'))
    elseif (args[1] == 'luzaf') then
        gcdisplay.AdvanceToggle('Luzaf')
        gcinclude.Message('Luzaf', gcdisplay.GetToggle('Luzaf'))
    elseif (args[1] == 'staff') then
        gcdisplay.AdvanceToggle('Staff')
        gcinclude.Message('Staff', gcdisplay.GetToggle('Staff'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)
    gcmelee.DoDefaultOverride()
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

    local action = gData.GetAction()
    if (string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga')) then
        gFunc.EquipSet(sets.Cure)
        EquipStaffAndObi(action.Element)
    elseif (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing)
        if (action.Name == 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin)
        end
    end
end

function EquipStaffAndObi(element)
    EquipStaff(element)

    if (ObiCheck(element)) then
        local obiOwned = NukeObiOwnedTable[element]
        gFunc.EquipSet(obiOwned)
    end
end

function EquipStaff(element)
    if (gcdisplay.GetToggle('Staff')) then
        local staff = ElementalStaffTable[element]
        gFunc.EquipSet(staff)
    end
end

function ObiCheck(element)
    local environment = gData.GetEnvironment()
    return environment.WeatherElement == element or environment.DayElement == element
end

return profile
