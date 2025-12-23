local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set. Note: Do NOT include cure clogs / ruckes rung here.

local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = nil -- The Max MP you have when /blm in your idle set
local drkSJMaxMP = nil -- The Max MP you have when /drk in your idle set

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}
local virology_ring = {
    Ring2 = 'Virology Ring',
}
local republic_circlet = {
    -- Head = 'Republic Circlet',
}
local cure_clogs = {
    -- Feet = 'Cure Clogs',
}
local ruckes_rung = {
    -- Main = 'Rucke\'s Rung',
}
local medicine_ring = {
    -- Ring1 = 'Medicine Ring',
}
local mjollnir = {
    -- Main = 'Mjollnir',
}
local asklepios = { -- Used for Cures with Mjollnir when /NIN
    -- Sub = 'Asklepios',
}

local sets = {
    Idle = {},
    IdleALT = {},
    IdleMaxMP = {},
    Resting = {},
    Town = {},
    Movement = {},

    DT = {},
    DTNight = {},
    MDT = {},
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {},
    Casting = { -- Default SIRD used for Idle sets
    },
    SIRD = { -- Used on Stoneskin, Blink, Aquaveil and Utsusemi casts regardless of Override set. If you wish to remain in FireRes etc. during casts, leave empty.
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
    },
    ConserveMP = {},

    Hate = { -- Switches to this set when casting Sleep, Blind, Dispel, Bind, Flash and Cures on other players if /hate is toggled on
    },
    Cheat_C3HPDown = {},
    Cheat_C4HPDown = {},
    Cheat_HPUp = {},

    Yellow = {},
    Cure = {},
    Cure5 = {},
    Regen = {
        Body = 'Cleric\'s Bliaut',
    },
    Barspell = {},
    Cursna = {},

    Enhancing = {},
    Stoneskin = {},
    Spikes = {},

    Enfeebling = {},
    EnfeeblingMND = {},
    EnfeeblingINT = {},
    EnfeeblingACC = {},

    Divine = {},
    Banish = {},
    Dark = {},

    Nuke = {},
    NukeACC = {},
    NukeDOT = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP = {},
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {},
    TP_NIN = {},

    WS = {},
    WS_HighAcc = {},
    WS_Randgrith = {},

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

gcmage = gFunc.LoadFile('common\\gcmage.lua')

sets.warlocks_mantle = warlocks_mantle
sets.virology_ring = virology_ring
sets.republic_circlet = republic_circlet
sets.cure_clogs = cure_clogs
sets.ruckes_rung = ruckes_rung
sets.medicine_ring = medicine_ring
sets.mjollnir = mjollnir
sets.asklepios = asklepios
profile.Sets = gcmage.AppendSets(sets)

profile.HandleAbility = function()
    gcmage.DoAbility()
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)
    if (gcdisplay.GetCycle('TP') == 'HighAcc') then
        gFunc.EquipSet('WS_HighAcc')
    end

    local action = gData.GetAction()
    if (action.Name == 'Randgrith') then
        gFunc.EquipSet(sets.WS_Randgrith)
    end

    gcmage.DoFenrirsEarring()
end

profile.OnLoad = function()
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
end

profile.HandleCommand = function(args)
    gcmage.DoCommands(args, sets)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmage.DoDefault(ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, drkSJMaxMP)

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == 'RDM' and warlocks_mantle.Back) then
        gcmage.DoPrecast(sets, fastCastValue + 0.02)
        gFunc.EquipSet('warlocks_mantle')
    else
        gcmage.DoPrecast(sets, fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, drkSJMaxMP)

    local action = gData.GetAction()
    if (action.Skill == 'Enhancing Magic') then
        if (string.match(action.Name, 'Regen')) then
            gFunc.EquipSet('Regen')
        elseif (string.match(action.Name, 'Bar')) then
            gFunc.EquipSet('Barspell')
        end
    elseif (string.match(action.Name, 'Banish')
        or string.match(action.Name, 'Holy')
        or (string.match(action.Name, 'Cure') and gData.GetActionTarget().Type == 'Monster')
    ) then
        if (republic_circlet.Head) then
            if (conquest:GetInsideControl()) then
                print(chat.header('LAC - WHM'):append(chat.message('In Region - Using Republic Circlet')))
                gFunc.EquipSet('republic_circlet')
            end
        end
    elseif (string.match(action.Name, '.*na$') or (action.Name == 'Erase')) then
        gFunc.EquipSet('virology_ring')
    end
end

return profile
