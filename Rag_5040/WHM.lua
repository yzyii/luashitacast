--[[
    This is provided purely as an example template. Only very basic sanity testing has been done.
]]

local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = nil -- The Max MP you have when /blm in your idle set

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
    SIRD = { -- 102% to Cap, used on Stoneskin, Blink, Aquaveil and Utsusemi casts
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
    },

    Cure = {},
    Cursna = {},

    Enhancing = {},
    Stoneskin = {},
    Spikes = {},

    Enfeebling = {},
    EnfeeblingMND = {},
    EnfeeblingINT = {},
    EnfeeblingACC = {},

    Dark = {},

    Nuke = {},
    NukeACC = {},
    NukeDOT = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    FallbackSub = { -- Used only when you do not have complete staff sets
    },
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

profile.HandleAbility = function()
    -- You may add logic here
end

profile.HandleItem = function()
    -- You may add logic here
end

profile.HandlePreshot = function()
    -- You may add logic here
end

profile.HandleMidshot = function()
    -- You may add logic here
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)
    -- You may add logic here
end

gcmage = gFunc.LoadFile('common\\gcmage.lua')

profile.OnLoad = function()
    gcmage.Load()
    profile.SetMacroBook()
    -- You may add logic here
end

profile.OnUnload = function()
    gcmage.Unload()
    -- You may add logic here
end

profile.HandleCommand = function(args)
    gcmage.DoCommands(args)
    -- You may add logic here
end

profile.HandleDefault = function()
    gcmage.DoDefault(ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP)
    -- You may add logic here
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)
    -- You may add logic here
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP)
    -- You may add logic here
end

return profile
