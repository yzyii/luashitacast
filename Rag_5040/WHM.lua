local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set. Note: Do NOT include cure clogs / ruckes rung here.

local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = nil -- The Max MP you have when /blm in your idle set

local virology_ring = true
local virology_ring_slot = 'Ring2'

local republic_circlet = false

local sets = {
    Idle = {},
    IdleALT = {},
    IdleMaxMP = {},
    Resting = {},
    Town = {},
    Movement = {},

    DT = {},
    DTNight = {},
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
    Casting = { -- Default Casting Equipment when using Idle sets
    },
    SIRD = { -- Used on Stoneskin, Blink, Aquaveil and Utsusemi casts
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
    },
    ConserveMP = {},

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
}
profile.Sets = sets

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
    gcmage.DoDefault(ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, nil)

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, nil)

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
        gFunc.EquipSet('Banish')
        if (republic_circlet == true and conquest:GetInsideControl()) then
            print(chat.header('LAC - WHM'):append(chat.message('In Region - Using Republic Circlet')))
            gFunc.Equip('Head', 'Republic Circlet')
        end
    elseif virology_ring and (string.match(action.Name, '.*na$') or (action.Name == 'Erase')) then
        gFunc.Equip(virology_ring_slot, 'Virology Ring')
    end
end

return profile
