local profile = {};

local fastCastValue = 0.32 -- 20% from traits 12% from gear

local sets = {
    Idle = {
        Head = 'Duelist\'s Chapeau',
        Main = 'Terra\'s Staff',
        Legs = 'Blood Cuisses',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Ethereal Earring',
        Back = 'Umbra Cape',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Feet = 'Dst. Leggings +1',
        Ammo = 'Hedgehog Bomb',
        Waist = 'Warwolf Belt',
        Neck = 'Dark Torque',
    },
    IdleALT = {
        Head = 'Duelist\'s Chapeau',
        Main = 'Terra\'s Staff',
        Legs = 'Blood Cuisses',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Sattva Ring',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Back = 'Hexerei Cape',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Feet = 'Dst. Leggings +1',
        Ammo = 'Hedgehog Bomb',
        Waist = 'Warwolf Belt',
        Neck = 'Dark Torque',
    },
    Casting = {
        Head = 'Duelist\'s Chapeau',
        Main = 'Terra\'s Staff',
        Legs = 'Blood Cuisses',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Ethereal Earring',
        Back = 'Umbra Cape',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Feet = 'Dst. Leggings +1',
        Ammo = 'Hedgehog Bomb',
        Waist = 'Heko Obi +1',
        Neck = 'Willpower Torque',
    },
    Resting = {
        Head = 'Duelist\'s Chapeau',
        Main = 'Pluto\'s Staff',
        Body = 'Mahatma Hpl.',
        Waist = 'Duelist\'s Belt',
        Legs = 'Baron\'s Slops',
        Neck = 'Checkered Scarf',
        Ear1 = 'Relaxing Earring',
    },
    Town = {
        Body = 'Mahatma Hpl.',
    },
    DT = {
        Main = 'Terra\'s Staff', -- 20
        Head = 'Darksteel Cap +1', -- 2
        Body = 'Dst. Harness +1', -- 4
        Hands = 'Dst. Mittens +1', -- 2
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Umbra Cape', -- 6
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Ethereal Earring',
        Legs = 'Dst. Subligar +1', -- 3
        Feet = 'Dst. Leggings +1', -- 2
        Ammo = 'Hedgehog Bomb',
        Waist = 'Warwolf Belt',
        Neck = 'Willpower Torque',
        Ring1 = 'Jelly Ring', -- 5
    },
    MDT = { -- Shell IV provides 23% MDT
        Main = 'Mythic Wand +1',
        Sub = 'Numinous Shield',
        Head = 'Green Ribbon +1',
        Neck = 'Jeweled Collar',
        Legs = 'Blood Cuisses',
        Back = 'Hexerei Cape', -- 3
        Ring2 = 'Sattva Ring', -- 5
        Ring1 = 'Merman\'s Ring', -- 4
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring', -- 2
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Feet = 'Dst. Leggings +1',
        Ammo = 'Hedgehog Bomb',
        Waist = 'Warwolf Belt',
        -- Body = 'Coral Scale Mail +1', -- 4
        -- Hands = 'Coral Finger Gauntlets +1', -- 2
        -- Legs = 'Coral Cuisses +1', -- 3
        -- Feet = 'Coral Greaves +1', -- 2
        -- Feet = 'Crimson Greaves',
    },
    Movement = {
        Head = 'Duelist\'s Chapeau',
        Legs = 'Blood Cuisses',
    },
    SIRD = { -- 102% to Cap
        Legs = 'Dst. Subligar +1',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Ethereal Earring',
        Back = 'Umbra Cape',
        Hands = 'Dst. Mittens +1',
        Ammo = 'Hedgehog Bomb',
        Main = 'Hermit\'s Wand', -- 25
        Sub = 'Hermit\'s Wand', -- 25
        Head = 'Nashira Turban', -- 10
        Body = 'Warlock\'s Tabard', -- 10
        Waist = 'Heko Obi +1', -- 8
        Feet = 'Mountain Gaiters', -- 5
        Neck = 'Willpower Torque', -- 5
        -- Waist = 'Druid\'s Rope', -- +2
    },
    Haste = {
        Head = 'Warlock\'s Chapeau',
        Ear1 = 'Loquac. Earring',
        Hands = 'Nashira Gages',
        Waist = 'Swift Belt',
        Feet = 'Nashira Crackows',
        -- Body = 'Duelist\'s Tabard',
        -- Legs = 'Nashira Serawheels',
    },
    FireRes = { -- 143
        Ring1 = 'Merman\'s Ring',
        Ammo = 'Hedgehog Bomb',
        Main = 'Neptune\'s Staff', -- 20
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Body = 'Scorpion Breastplate', -- 9
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Power Sandals', -- 7
        Ring2 = 'Sattva Ring',
        Back = 'Hexerei Cape',
        Hands = 'Scorpion Gauntlets', -- 5
        -- Ring1 = 'Malflame Ring', -- 10
        -- Ring2 = 'Ruby Ring', -- 9
        Waist = 'Water Belt', -- 20
    },
    IceRes = { -- 141
        Ring1 = 'Merman\'s Ring',
        Ammo = 'Hedgehog Bomb',
        Feet = 'Dst. Leggings +1',
        Main = 'Vulcan\'s Staff', -- 20
        Ear1 = 'Ruby Earring', -- 10
        Ear2 = 'Ruby Earring', -- 10
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Back = 'Ram Mantle +1', -- 6
        Body = 'Feral Jerkin', -- 6
        Hands = 'Feral Gloves', -- 4
        Legs = 'Feral Trousers', -- 6
        Ring2 = 'Sattva Ring',
        -- Feet = 'Crimson Greaves', -- 20
        Waist = 'Fire Belt', -- 20
        -- Ring1 = 'Malfrost Ring', -- 10
        -- Ring2 = 'Diamond Ring', -- 9
    },
    LightningRes = { -- 132
        Ring1 = 'Merman\'s Ring',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Feet = 'Dst. Leggings +1',
        Main = 'Terra\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Legs = 'Blood Cuisses', -- 21
        Ring2 = 'Sattva Ring',
        Back = 'Lightning Mantle', -- 6
        Range = 'Lightning Bow', -- 6
        Ammo = '',
        Ear1 = 'Topaz Earring', -- 10
        Ear2 = 'Topaz Earring', -- 10
        Waist = 'Earth Belt', -- 20
        -- Ring1 = 'Malflash Ring', -- 10
        -- Ring2 = 'Spinel Ring', -- 9
    },
    EarthRes = { -- 137
        Ring1 = 'Maldust Ring', -- 10
        Feet = 'Dst. Leggings +1',
        Main = 'Auster\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ring2 = 'Sattva Ring',
        -- Body = 'Beak Jerkin +1', -- 7
        -- Hands = 'Beak Gloves +1', -- 4
        -- Legs = 'Beak Trousers +1', -- 7
        -- Feet = 'Crimson Greaves', -- 20
        Ear1 = 'Topaz Earring', -- 10
        Ear2 = 'Topaz Earring', -- 10
        Waist = 'Wind Belt', -- 20
        -- Ring2 = 'Topaz Ring', -- 9
    },
    Hate = {
        Ring1 = 'Mermaid Ring', -- 2
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Ethereal Earring',
        Neck = 'Harmonia\'s Torque', -- 3
        Waist = 'Warwolf Belt', -- 3
        Ring2 = 'Sattva Ring', -- 5
        Hands = 'Nashira Gages',
        Body = 'Dst. Harness +1',
        Back = 'Prism Cape',
        Legs = 'Dst. Subligar +1',
        Ammo = 'Phtm. Tathlum',
        Head = 'Baron\'s Chapeau', -- 2
        Feet = 'Heroic Boots', -- 1
        -- Ear1 = 'Eris\' Earring +1', -- 3
        -- Ear2 = 'Eris\' Earring +1', -- 3
        -- Body = 'Duelist\'s Tabard',
        -- Legs = 'Nashira Serawheels',
    },

    Precast = {
        Head = 'Warlock\'s Chapeau',
        Ear1 = 'Loquac. Earring',
        -- Body = 'Duelist\'s Tabard',
    },

    Cure = {
        Neck = 'Healing Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Errant Cape', -- 5
        Waist = 'Penitent\'s Rope', -- 3
        Ammo = 'Hedgehog Bomb', -- 1
        Head = 'Raven Beret', -- 8
        Body = 'Raven Jupon', -- 9
        Hands = 'Raven Bracers', -- 5
        Legs = 'Raven Hose', -- 6
        Feet = 'Raven Gaiters', -- 5
        -- Ear1 = 'Novia Earring', -- 7
    },
    Cursna = { -- Healing Magic
        Neck = 'Healing Torque',
        Legs = 'Warlock\'s Tights',
        Main = 'Prelatic Pole',
        -- Back = 'Altruistic Cape',
        -- Body = 'Duelist\'s Tabard',
    },

    Enhancing = {
        Main = 'Mythic Wand +1',
        Sub = 'Numinous Shield',
        Head = 'Errant Hat',
        Neck = 'Enhancing Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Duelist\'s Gloves',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Warlock\'s Tights',
        Feet = 'Mahatma Pigaches',
        Ammo = 'Hedgehog Bomb',
        -- Back = 'Merciful Cape',
    },
    Stoneskin = { -- Enhancing Skill and MND
        -- Neck = 'Stone Gorget',
    },

    Enfeebling = {
        Head = 'Duelist\'s Chapeau',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Warlock\'s Tabard',
        Hands = 'Nashira Gages',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Prism Cape',
        Waist = 'Swift Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Mahatma Pigaches',
        Ammo = 'Hedgehog Bomb',
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
        Hands = 'Duelist\'s Gloves',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Waist = 'Penitent\'s Rope',
        Feet = 'Wise Pigaches',
    },
    FallbackEnfeeblingSub = {}, -- Used only when you do not have complete staff sets

    Dark = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        Body = 'Mahatma Hpl.',
        Hands = 'Nashira Gages',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Nashira Crackows',
        -- Back = 'Merciful Cape',
        -- Ear2 = 'Dark Earring',
        -- Hands = 'Blood Fng. Gnt.',
        -- Body = 'Nashira Manteel',
    },

    Nuke = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Warlock\'s Chapeau',
        Neck = 'Elemental Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Duelist\'s Gloves',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Wise Pigaches',
        -- Feet = 'Duelist\'s Boots',
        -- Hands = 'Zenith Mitts',
    },
    NukeACC = {
        Legs = 'Duelist\'s Tights',
        Hands = 'Duelist\'s Gloves',
        Feet = 'Wise Pigaches',
        -- Back = 'Merciful Cape',
    };
    NukeDOT = {
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        Legs = 'Duelist\'s Tights',
        Hands = 'Duelist\'s Gloves',
        Feet = 'Wise Pigaches',
        -- Back = 'Merciful Cape',
    };
    FallbackNukeSub = {}, -- Used only when you do not have complete staff sets

    TP = {
        Main = 'Martial Anelace',
        Sub = 'Numinous Shield',
        -- Main = 'Joyeuse',
        -- Sub = 'Genbu\'s Shield',
    },

    Convert = { -- Type /vert to equip this set and /lock your gear at the same time.
        Main = 'Apollo\'s Staff',
        Head = 'Faerie Hairpin',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Geist Earring',
        Body = 'Black Cotehardie',
        Hands = 'Duelist\'s Gloves',
        Ring1 = 'Ether Ring',
        Ring2 = 'Astral Ring',
        Back = 'Errant Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Mahatma Pigaches',
        Ammo = 'Hedgehog Bomb',
    },
    ConvertOOR = { -- Out of Region Convert Set
        Main = 'Apollo\'s Staff',
        Head = 'Faerie Hairpin',
        Neck = 'Rep.Gold Medal',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Geist Earring',
        Body = 'Black Cotehardie',
        Hands = 'Duelist\'s Gloves',
        Ring1 = 'Ether Ring',
        Ring2 = 'Astral Ring',
        Back = 'Errant Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Mahatma Pigaches',
        Ammo = 'Hedgehog Bomb',
    },
};
profile.Sets = sets;

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
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
