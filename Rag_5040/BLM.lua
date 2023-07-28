local profile = {};

local fastCastValue = 0.04 -- 4% from gear

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Body = 'Sorcerer\'s Coat',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Back = 'Umbra Cape',
    },
    IdleALT = {
        Main = 'Terra\'s Staff',
        Body = 'Sorcerer\'s Coat',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Sattva Ring',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Back = 'Hexerei Cape',
    },
    Resting = {
        Main = 'Pluto\'s Staff',
        Body = 'Mahatma Hpl.',
        Waist = 'Hierarch Belt',
        Legs = 'Baron\'s Slops',
        Neck = 'Checkered Scarf',
        Ear1 = 'Relaxing Earring',
    },
    Town = {},
    DT = {
        Main = 'Terra\'s Staff',
        Body = 'Sorcerer\'s Coat',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Back = 'Umbra Cape',
    },
    MDT = { -- Shell IV provides 23% MDT
        Main = 'Terra\'s Staff',
        Body = 'Sorcerer\'s Coat',
        Head = 'Green Ribbon +1',
        Neck = 'Jeweled Collar',
        Back = 'Hexerei Cape', -- 3
        Ring2 = 'Sattva Ring', -- 5
        Ring1 = 'Merman\'s Ring', -- 4
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring', -- 2
    },
    Movement = {},
    SIRD = { -- 102% to Cap
        Body = 'Sorcerer\'s Coat',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Sattva Ring',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Back = 'Umbra Cape',
        Main = 'Hermit\'s Wand', -- 25
        Sub = 'Hermit\'s Wand', -- 25
        Head = 'Nashira Turban', -- 10
        Waist = 'Heko Obi +1', -- 8
        Feet = 'Wizard\'s Sabots', -- 20
        Neck = 'Willpower Torque', -- 5
        -- Waist = 'Druid\'s Rope', -- +2
    },
    Haste = {
        Ear1 = 'Loquac. Earring',
        Hands = 'Nashira Gages',
        Waist = 'Swift Belt',
        Feet = 'Nashira Crackows',
        -- Legs = 'Nashira Serawheels',
    },
    FireRes = {
        Body = 'Sorcerer\'s Coat',
        Main = 'Neptune\'s Staff', -- 20
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Feet = 'Power Sandals', -- 7
        Ring2 = 'Sattva Ring',
        Back = 'Hexerei Cape',
        Ring1 = 'Ruby Ring', -- 9
        Waist = 'Water Belt', -- 20
        -- Ring1 = 'Malflame Ring', -- 10
    },
    IceRes = {
        Body = 'Sorcerer\'s Coat',
        Main = 'Vulcan\'s Staff', -- 20
        Ear1 = 'Ruby Earring', -- 10
        Ear2 = 'Ruby Earring', -- 10
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ring2 = 'Sattva Ring',
        Back = 'Hexerei Cape',
        Waist = 'Fire Belt', -- 20
        Ring1 = 'Diamond Ring', -- 9
        -- Ring2 = 'Malfrost Ring', -- 10
    },
    LightningRes = {
        Body = 'Sorcerer\'s Coat',
        Main = 'Terra\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ring2 = 'Sattva Ring',
        Back = 'Hexerei Cape',
        Ear1 = 'Topaz Earring', -- 10
        Ear2 = 'Topaz Earring', -- 10
        Waist = 'Earth Belt', -- 20
        Ring1 = 'Spinel Ring', -- 9
        -- Ring2 = 'Malflash Ring', -- 10
    },
    EarthRes = {
        Body = 'Sorcerer\'s Coat',
        Ring1 = 'Maldust Ring', -- 10
        Main = 'Auster\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Back = 'Hexerei Cape',
        Ear1 = 'Topaz Earring', -- 10
        Ear2 = 'Topaz Earring', -- 10
        Waist = 'Wind Belt', -- 20
        Ring2 = 'Topaz Ring', -- 9
    },

    Precast = {
        Ear1 = 'Loquac. Earring',
        Feet = 'Rostrum Pumps',
    },

    Cure = {
        Ammo = 'Hedgehog Bomb', -- 1
        Head = 'Errant Hat', -- 5
        Neck = 'Healing Torque',
        Ear1 = 'Novia Earring', -- 7
        Ear2 = 'Cmn. Earring',
        Body = 'Mahatma Hpl.', -- 4
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Errant Cape', -- 5
        Waist = 'Penitent\'s Rope', -- 3
        Legs = 'Mahatma Slops', -- 4
        Feet = 'Mahatma Pigaches', -- 3
        Hands = 'Errant Cuffs', -- 2
    },
    Cursna = { -- Healing Magic
        Neck = 'Healing Torque',
        Legs = 'Druid\'s Slops',
        Main = 'Prelatic Pole',
        -- Back = 'Altruistic Cape',
    },

    Enhancing = {
        Main = 'Kirin\'s Pole',
        Ammo = 'Hedgehog Bomb',
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
        Legs = 'Mahatma Slops',
        Feet = 'Mahatma Pigaches',
    },
    Stoneskin = { -- Enhancing Skill and MND
        -- Neck = 'Stone Gorget',
    },

    Enfeebling = {
        Ammo = 'Hedgehog Bomb',
        Head = 'Igqira Tiara',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Wizard\'s Coat',
        Hands = 'Nashira Gages',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Prism Cape',
        Waist = 'Swift Belt',
        Legs = 'Igqira Lappas',
        Feet = 'Mahatma Pigaches',
        -- Back = 'Altruistic Cape',
        -- Ear2 = 'Enfeebling Earring',
    },
    EnfeeblingMND = {
        Hands = 'Dvt. Mitts +1',
        Waist = 'Penitent\'s Rope',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
    },
    EnfeeblingINT = {
        Ammo = 'Phtm. Tathlum',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Waist = 'Sorcerer\'s Belt',
        Feet = 'Rostrum Pumps',
        Hands = 'Errant Cuffs',
    },
    FallbackEnfeeblingSub = {}, -- Used only when you do not have complete staff sets

    Dark = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        Body = 'Mahatma Hpl.',
        Hands = 'Src. Gloves +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Wizard\'s Tonban',
        Feet = 'Nashira Crackows',
        -- Back = 'Merciful Cape',
        -- Ear2 = 'Dark Earring',
        -- Body = 'Nashira Manteel',
        -- Feet = 'Igqira Huaraches',
    },

    Nuke = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Demon Helm +1',
        Neck = 'Elemental Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Igqira Weskit',
        Hands = 'Wizard\'s Gloves',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Rostrum Pumps',
        -- Hands = 'Zenith Mitts',
    },
    NukeACC = {
        Hands = 'Wizard\'s Gloves',
    },
    NukeDOT = {},
    --[[
    NukeDOT = {
        Main = 'Kirin\'s Pole',
        Ammo = 'Phtm. Tathlum',
        Head = 'Demon Helm +1',
        -- Neck = 'Prudence Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        Body = 'Mahatma Hpl.',
        Hands = 'Errant Cuffs',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Rostrum Pumps',
    },
    ]]
    FallbackNukeSub = {}, -- Used only when you do not have complete staff sets

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
    gcmage.DoMidcast(sets);
end

return profile;
