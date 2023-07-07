local profile = {};

local fastCastValue = 0.04 -- 4% from gear

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Body = 'Sorcerer\'s Coat',
        Ring2 = 'Sattva Ring',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Ethereal Earring',
        Back = 'Umbra Cape',
        Feet = 'Rostrum Pumps',
    },
    Resting = {
        Main = 'Pluto\'s Staff',
        Body = 'Sorcerer\'s Coat',
        Waist = 'Hierarch Belt',
        Legs = 'Baron\'s Slops',
    },
    Town = {},
    DT = {},
    MDT = {},
    Movement = {},
    SIRD = {},
    Haste = {},
    FireRes = {},
    IceRes = {},
    Hate = {},

    Precast = {
        Ear1 = 'Loquac. Earring',
        Feet = 'Rostrum Pumps',
    },

    Cure = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Errant Hat',
        Neck = 'Healing Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Errant Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Custom Slacks',
        Feet = 'Mahatma Pigaches',
    },
    Cursna = { -- Healing Magic
        Neck = 'Healing Torque',
        Legs = 'Druid\'s Slops',
    },

    Enhancing = {
        Main = 'Kirin\'s Pole',
        Ammo = 'Phtm. Tathlum',
        Head = 'Errant Hat',
        Neck = 'Enhancing Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Custom Slacks',
        Feet = 'Mahatma Pigaches',
    },
    Stoneskin = { -- Enhancing Skill and MND
    },

    Enfeebling = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Igqira Tiara',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Wizard\'s Coat',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Igqira Lappas',
        Feet = 'Mahatma Pigaches',
    },
    FallbackEnfeeblingSub = {}, -- Used only when you do not have complete staff sets

    Dark = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Demon Helm +1',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        Body = 'Mahatma Hpl.',
        Hands = 'Sorcerer\'s Gloves',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Wizard\'s Tonban',
        Feet = 'Rostrum Pumps',
    },

    Nuke = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Demon Helm +1',
        Neck = 'Elemental Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Igqira Weskit',
        Hands = 'Wizard\'s Gloves',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Rostrum Pumps',
    },
    NukeACC = { -- Also used for Elemental DoTs
    };
    FallbackNukeSub = {}, -- Used only when you do not have complete staff sets
    
    WHMSJ = { -- Used for -enmity on Curing
        Ear2 = 'Healer\'s Earring',
    };
    
    TP = {},
};
profile.Sets = sets;

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 10');
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcdisplay = gFunc.LoadFile('common\\gcdisplayrag.lua');
gcinclude = gFunc.LoadFile('common\\gcincluderag.lua');
gcmage = gFunc.LoadFile('common\\gcmage.lua');

profile.OnLoad = function()
    gcinclude.Load();
    profile.SetMacroBook();
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.DoCommands(args);
end

profile.HandleDefault = function()
    gcinclude.DoDefault();
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue);
end

profile.HandleMidcast = function()
    gcmage.DoMidcast();
end

return profile;
