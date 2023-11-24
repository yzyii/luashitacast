--[[
    This is provided purely as an example template. Only very basic sanity testing has been done.
]]

local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = nil -- The Max MP you have when /blm in your idle set

local minstrels_earring = true
local minstrels_earring_slot = 'Ear2'

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
    Yellow = { -- Fast Cast Gear will override this at times when the spell cast is too short.
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
    },

    Sing_Buff = {
    },
    Sing_Debuff = {
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

gcmage = gFunc.LoadFile('common\\gcmage.lua')

profile.OnLoad = function()
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
end

profile.HandleCommand = function(args)
    gcmage.DoCommands(args)
end

profile.HandleDefault = function()
    gcmage.DoDefault(ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP)

    local player = gData.GetPlayer()
    if (minstrels_earring and player.HPP <= 25) then
        gFunc.Equip(minstrels_earring_slot, 'Minstrel\'s Earring')
    end
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP)

    if (action.Type == 'Bard Song') then
        if string.match(action.Name, 'Valor') then
            gFunc.Equip('Range', 'Cornette +1');
            gFunc.EquipSet(sets.Sing_Buff);
        elseif string.match(action.Name, 'March') then
            gFunc.Equip('Range', 'Faerie Piccolo');
            gFunc.EquipSet(sets.Sing_Buff);
        elseif string.match(action.Name, 'Madrigal') then
            gFunc.Equip('Range', 'Traversiere +1');
            gFunc.EquipSet(sets.Sing_Buff);
        elseif string.match(action.Name, 'Elegy') then
            gFunc.Equip('Range', 'Horn +1');
            gFunc.Equip('Main', 'Terra\'s Staff');
            gFunc.EquipSet(sets.Sing_Debuff);
        elseif (string.match(action.Name, 'Lullaby')) or (action.Name == 'Magic Finale') or (string.match(action.Name, 'Requiem')) then
            if (action.Name == 'Horde Lullaby' or action.Name == 'Foe Lullaby') then
                gFunc.Equip('Main', 'Apollo\'s Staff');
                gFunc.Equip('Range', 'Mary\'s Horn');
            else
                gFunc.Equip('Main', 'Apollo\'s Staff');
                gFunc.Equip('Range', 'Flute +1');
            end
            gFunc.EquipSet(sets.Sing_Debuff);
        elseif (action.Name == 'Chocobo Mazurka') or (string.match(action.Name, 'Paeon')) then
            gFunc.Equip('Range', 'Ebony Harp');
        else
            gFunc.Equip('Range', 'Crumhorn +1');
        end
    end
end

return profile
