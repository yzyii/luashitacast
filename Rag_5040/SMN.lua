local profile = {};

local fastCastValue = 0.00 -- 0% from gear

local sets = {
    Idle = {
        Head = 'Austere Hat',
        --Head = 'Traveler\'s Hat',
        Legs = 'Custom Slacks',
        Ring1 = 'Serket Ring',
        Ring2 = 'Ether Ring',
        --Ring1 = 'Saintly Ring',
        --Ring2 = 'Saintly Ring',
        Ear1 = 'Healer\'s Earring',
        Ear2 = 'Morion Earring +1',
        Back = 'Red Cape +1',
        Body = 'Austere Robe',
        Hands = 'Austere Cuffs',
        --Hands = 'Seer\'s Mitts +1',
        Feet = 'Mannequin Pumps',
        Ammo = 'Fortune Egg',
        Waist = 'Druid\'s Rope',
        Neck = 'Justice Badge',
    },
    IdleALT = {},
    Resting = {
        Main = 'Pluto\'s Staff',
        Body = 'Seer\'s Tunic',
    },
    Town = {},
    DT = {},
    DTNight = {},
    MDT = { -- Shell IV provides 23% MDT
    },
    Movement = {},
    SIRD = { -- 102% to Cap
    },
    Haste = {},
    FireRes = {
        Main = 'Neptune\'s Staff', -- 20
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Feet = 'Power Sandals', -- 7
        Back = 'Hexerei Cape',
        Ring1 = 'Ruby Ring', -- 9
        Waist = 'Water Belt', -- 20
        Ring2 = 'Malflame Ring', -- 10
    },
    IceRes = {
        Main = 'Vulcan\'s Staff', -- 20
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Diamond Earring', -- 10
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Fire Belt', -- 20
        Ring1 = 'Diamond Ring', -- 9
        Ring2 = 'Malfrost Ring', -- 10
    },
    LightningRes = {
        Main = 'Terra\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Back = 'Hexerei Cape',
        Ear1 = 'Topaz Earring', -- 10
        Ear2 = 'Topaz Earring', -- 10
        Waist = 'Earth Belt', -- 20
        Ring1 = 'Spinel Ring', -- 9
        Ring2 = 'Malflash Ring', -- 10
    },
    EarthRes = {
        Ring2 = 'Maldust Ring', -- 10
        Main = 'Auster\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Back = 'Hexerei Cape',
        Ear1 = 'Topaz Earring', -- 10
        Ear2 = 'Topaz Earring', -- 10
        Waist = 'Wind Belt', -- 20
        Ring1 = 'Topaz Ring', -- 9
    },
    WindRes = {
        Ring2 = 'Malgust Ring', -- 10
        Main = 'Aquilo\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Back = 'Hexerei Cape',
        Hands = 'Mage\'s Cuffs', -- 5
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Diamond Earring', -- 10
        Waist = 'Ice Belt', -- 20
        Ring1 = 'Emerald Ring', -- 9
    },

    Precast = {
        -- Ear1 = 'Loquac. Earring',
        -- Feet = 'Rostrum Pumps',
    },

    Cure = {
    },
    Cursna = { -- Healing Magic
    },

    Enhancing = {
    },
    Stoneskin = { -- Enhancing Skill and MND
    },

    Enfeebling = {
    },
    EnfeeblingMND = {
    },
    EnfeeblingINT = {
    },

    Dark = {
    },

    Nuke = {
    },
    NukeACC = {
    },
    NukeDOT = {},

    TP = {},
    
    FallbackSub = { -- Used only when you do not have complete staff sets
    },
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
    gcmage.DoMidcast(sets);
end

return profile;
