local profile = {};

local fastCastValue = 0.32 -- 20% from traits 12% from gear

local ninSJMaxMP = 605 -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = 683 -- The Max MP you have when /whm in your idle set
local blmSJMaxMP = 702 -- The Max MP you have when /blm in your idle set

local sets = {
    Idle = {
        Head = 'Dls. Chapeau +1',
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
        Head = 'Dls. Chapeau +1',
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
    IdleMaxMP = {
        Head = 'Dls. Chapeau +1',
        Main = 'Terra\'s Staff',
        Legs = 'Blood Cuisses',
        Ring1 = 'Serket Ring',
        Ring2 = 'Sattva Ring',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Ethereal Earring',
        Back = 'Umbra Cape',
        Body = 'Mahatma Hpl.',
        Hands = 'Blood Fng. Gnt.',
        Feet = 'Blood Greaves',
        Ammo = 'Hedgehog Bomb',
        Waist = 'Hierarch Belt',
        Neck = 'Uggalepih Pendant',
    },
    Precast = {
        Head = 'Wlk. Chapeau +1',
        Ear1 = 'Loquac. Earring',
        -- Body = 'Duelist\'s Tabard',
    },
    Casting = { -- Default Casting Equipment when using Idle sets
        Head = 'Dls. Chapeau +1',
        Ear1 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1',
        Waist = 'Druid\'s Rope',
        Neck = 'Willpower Torque',
    },
    Resting = {
        Head = 'Dls. Chapeau +1',
        Main = 'Pluto\'s Staff',
        Body = 'Mahatma Hpl.',
        Waist = 'Duelist\'s Belt',
        Legs = 'Baron\'s Slops',
        Neck = 'Checkered Scarf',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Relaxing Earring',
        Back = 'Errant Cape',
    },
    Town = {
    },
    DT = {
        Main = 'Terra\'s Staff', -- 20
        Head = 'Dls. Chapeau +1',
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
    DTNight = {
        Head = 'Dls. Chapeau +1',
        Main = 'Terra\'s Staff', -- 20
        Legs = 'Blood Cuisses',
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = 'Sattva Ring', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Ethereal Earring',
        Back = 'Umbra Cape', -- 12
        Body = 'Dst. Harness +1', -- 4
        Hands = 'Dst. Mittens +1', -- 2
        Feet = 'Dst. Leggings +1', -- 2
        Ammo = 'Hedgehog Bomb',
        Waist = 'Warwolf Belt',
        Neck = 'Dark Torque',
    },
    MDT = { -- Shell IV provides 23% MDT
        Main = 'Mythic Wand +1',
        Sub = 'Nms. Shield +1',
        Head = 'Dls. Chapeau +1',
        Neck = 'Jeweled Collar',
        Back = 'Hexerei Cape', -- 3
        Ring2 = 'Sattva Ring', -- 5
        Ring1 = 'Merman\'s Ring', -- 4
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring', -- 2
        Ammo = 'Hedgehog Bomb',
        Waist = 'Warwolf Belt',
        Body = 'Cor. Scale Mail +1', -- 4
        Hands = 'Coral Fng. Gnt. +1', -- 1
        Legs = 'Coral Cuisses +1', -- 3
        Feet = 'Coral Greaves +1', -- 2
    },
    Movement = {
        Head = 'Dls. Chapeau +1',
        Legs = 'Blood Cuisses',
    },
    SIRD = { -- 102% to Cap, used on Stoneskin, Blink, Aquaveil and Utsusemi casts
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
        Waist = 'Druid\'s Rope', -- 10
        Feet = 'Mountain Gaiters', -- 5
        Neck = 'Willpower Torque', -- 5
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Head = 'Wlk. Chapeau +1',
        Ear1 = 'Loquac. Earring',
        Hands = 'Dusk Gloves',
        Waist = 'Swift Belt',
        Feet = 'Nashira Crackows',
        -- Body = 'Duelist\'s Tabard',
        -- Legs = 'Nashira Serawheels',
    },
    FireRes = { -- 143
        Ammo = 'Hedgehog Bomb',
        Main = 'Neptune\'s Staff', -- 20
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Body = 'Scp. Breastplate', -- 9
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Power Sandals', -- 7
        Back = 'Hexerei Cape',
        Hands = 'Scp. Gauntlets', -- 5
        Ring2 = 'Malflame Ring', -- 10
        Ring1 = 'Ruby Ring', -- 9
        Waist = 'Water Belt', -- 20
    },
    IceRes = { -- 141
        Ammo = 'Hedgehog Bomb',
        Feet = 'Dst. Leggings +1',
        Main = 'Vulcan\'s Staff', -- 20
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Diamond Earring', -- 10
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Back = 'Tundra Mantle', -- 5
        Body = 'Northern Jerkin', -- 6
        Hands = 'Feral Gloves', -- 4
        Legs = 'Feral Trousers', -- 6
        Feet = 'Blood Greaves', -- 21
        Waist = 'Fire Belt', -- 20
        Ring2 = 'Malfrost Ring', -- 10
        Ring1 = 'Diamond Ring', -- 9
    },
    LightningRes = { -- 133
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Feet = 'Dst. Leggings +1',
        Main = 'Terra\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Legs = 'Blood Cuisses', -- 21
        Back = 'Lightning Mantle', -- 6
        Range = 'Lightning Bow +1', -- 7
        Ammo = '',
        Ear1 = 'Topaz Earring', -- 10
        Ear2 = 'Topaz Earring', -- 10
        Waist = 'Earth Belt', -- 20
        Ring2 = 'Malflash Ring', -- 10
        Ring1 = 'Spinel Ring', -- 9
    },
    EarthRes = { -- 144
        Ring2 = 'Maldust Ring', -- 10
        Feet = 'Dst. Leggings +1',
        Main = 'Auster\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Body = 'Gaia Doublet', -- 10
        Back = 'Beak Mantle +1',
        Hands = 'Dst. Mittens +1',
        Legs = 'Beak Trousers +1', -- 7
        Feet = 'Blood Greaves', -- 21
        Ear1 = 'Topaz Earring', -- 10
        Ear2 = 'Topaz Earring', -- 10
        Waist = 'Wind Belt', -- 20
        Ring1 = 'Topaz Ring', -- 9
    },
    WindRes = { -- 136
        Legs = 'Dst. Subligar +1',
        Ring2 = 'Malgust Ring', -- 10
        Main = 'Aquilo\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Body = 'Northern Jerkin', -- 6
        Back = 'Tundra Mantle', -- 5
        Hands = 'Mage\'s Cuffs', -- 5
        Feet = 'Blood Greaves', -- 21
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Diamond Earring', -- 10
        Waist = 'Ice Belt', -- 20
        Ring1 = 'Emerald Ring', -- 9
    },

    Hate = { -- Switches to this set when casting Sleep, Blind, Dispel and Bind if /hate is toggled on
        Ring1 = 'Mermaid Ring', -- 2
        Neck = 'Harmonia\'s Torque', -- 3
        Waist = 'Warwolf Belt', -- 3
        Ring2 = 'Sattva Ring', -- 5
        Hands = 'Dusk Gloves',
        Body = 'Dst. Harness +1',
        Back = 'Prism Cape',
        Legs = 'Blood Cuisses',
        Ammo = 'Phtm. Tathlum',
        Head = 'Baron\'s Chapeau', -- 2
        Feet = 'Heroic Boots', -- 1
        Ear1 = 'Eris\' Earring', -- 2
        Ear2 = 'Eris\' Earring', -- 2
        -- Body = 'Duelist\'s Tabard',
        -- Legs = 'Nashira Serawheels',
    },
    C3HPDown = {
        Neck = 'Checkered Scarf',
        Ear2 = 'Merman\'s Earring',
    },
    C4HPDown = {
        Neck = 'Checkered Scarf',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Hands = 'Mahatma Cuffs', -- Replace with Zenith Cuffs
        Ring2 = 'Serket Ring',
        Waist = 'Penitent\'s Rope',
        Legs = 'Zenith Slacks', -- Replace with Darksteel Subligar
        Feet = 'Dst. Leggings +1', -- Replace with Mahatma Pigaches
    },
    HPUp = {
        Ring1 = 'Bomb Queen Ring',
        Neck = 'Harmonia\'s Torque', -- 3
        Waist = 'Warwolf Belt', -- 3
        Ring2 = 'Sattva Ring', -- 5
        Hands = 'Blood Fng. Gnt.',
        Body = 'Ogre Jerkin +1',
        Back = 'Gigant Mantle',
        Legs = 'Blood Cuisses',
        Ammo = 'Phtm. Tathlum',
        Head = 'Baron\'s Chapeau', -- 2
        Feet = 'Heroic Boots', -- 1
        Ear1 = 'Eris\' Earring', -- 2
        Ear2 = 'Eris\' Earring', -- 2
    },

    Cure = {
        Neck = 'Healing Torque',
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
        Ear1 = 'Novia Earring', -- 7
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
        Sub = 'Nms. Shield +1',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Enhancing Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Blood Fng. Gnt.',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Sattva Ring',
        Waist = 'Swift Belt',
        Legs = 'Warlock\'s Tights',
        Feet = 'Nashira Crackows',
        Ammo = 'Hedgehog Bomb',
        Back = 'Merciful Cape',
    },
    Stoneskin = { -- Enhancing Skill and MND
        -- Neck = 'Stone Gorget',
    },

    Enfeebling = { -- Base Set, not actually used for anything beyond Dia. Probably not actually relevant unless I build a toggle to maximize M.Acc over stats with options like Balrahn's Ring
        Head = 'Dls. Chapeau +1',
        Neck = 'Enfeebling Torque',
        Body = 'Warlock\'s Tabard',
        Hands = 'Nashira Gages',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        -- Back = 'Altruistic Cape',
        -- Ear2 = 'Enfeebling Earring',
    },
    EnfeeblingMND = {
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Hands = 'Dvt. Mitts +1',
        Feet = 'Mahatma Pigaches',
        Ammo = 'Hedgehog Bomb',
    },
    EnfeeblingINT = {
        Ammo = 'Phtm. Tathlum',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        Hands = 'Mahatma Cuffs',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Feet = 'Wise Pigaches',
    },

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
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Nashira Crackows',
        Back = 'Merciful Cape',
        -- Ear2 = 'Dark Earring',
        Hands = 'Blood Fng. Gnt.',
        -- Body = 'Nashira Manteel',
    },

    Nuke = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Elemental Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Mahatma Cuffs',
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
        Hands = 'Mahatma Cuffs',
        Feet = 'Nashira Crackows',
        Back = 'Merciful Cape',
    };
    NukeDOT = {
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        Legs = 'Duelist\'s Tights',
        Hands = 'Mahatma Cuffs',
        Feet = 'Wise Pigaches',
        Back = 'Merciful Cape',
    };

    Convert = { -- Type /vert to equip this set and /lock your gear at the same time.
        Main = 'Apollo\'s Staff',
        Head = 'Faerie Hairpin',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Blue Cotehardie',
        Hands = 'Blood Fng. Gnt.',
        Ring1 = 'Ether Ring',
        Ring2 = 'Serket Ring',
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
        Ear2 = 'Morion Earring +1',
        Body = 'Blue Cotehardie',
        Hands = 'Blood Fng. Gnt.',
        Ring1 = 'Ether Ring',
        Ring2 = 'Serket Ring',
        Back = 'Errant Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Blood Greaves',
        Ammo = 'Hedgehog Bomb',
    },

    Stun = { -- Type /csstun to equip this set and /lock your gear at the same time.
        Main = 'Jupiter\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        Body = 'Mahatma Hpl.',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Nashira Crackows',
        Back = 'Merciful Cape',
        Hands = 'Blood Fng. Gnt.',
        -- Ear2 = 'Dark Earring',
        -- Body = 'Nashira Manteel',
    },

    TP = {
        Main = 'Joyeuse',
        Sub = 'Nms. Shield +1',
        Range = 'Lightning Bow +1',
        Ammo = '',
        Head = 'Dls. Chapeau +1',
        -- Head = 'Walahra Turban', -- 4
        -- Neck = 'PCC',
        Ear1 = 'Merman\'s Earring',
        -- Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        -- Body = 'Nashira Manteel', -- 3
        Hands = 'Dusk Gloves', -- 3
        -- Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Sattva Ring',
        -- Back = 'Forager's Mantle',
        Waist = 'Swift Belt', -- 4
        -- Legs = 'Nashira Serawheels', -- 2
        Feet = 'Nashira Crackows', -- Dusk 2
        -- Sub = 'Genbu\'s Shield',
    },

    WS = {
        -- Head = 'Optical Hat',
        Ear1 = 'Merman\'s Earring',
        -- Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        -- Neck = 'PCC',
        Body = 'Blue Cotehardie',
        Hands = 'Ogre Gloves +1',
        Ring1 = 'Ruby Ring',
        -- Ring2 = 'Flame Ring',
        -- Back = 'Forager's Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Duelist\'s Tights',
        -- Legs = 'Dusk Trousers',
        -- Feet = 'Rutter Sabatons',
    },
    WS_Soil = {
        -- Neck = 'Soil Gorget',
    },
    WS_Spirits = {
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Sattva Ring',
        Hands = 'Blood Fng. Gnt.',
        Body = 'Ogre Jerkin +1',
        Back = 'Gigant Mantle',
        Legs = 'Blood Cuisses',
        Head = 'Dls. Chapeau +1',
        Feet = 'Blood Greaves',
        Ear2 = 'Ethereal Earring',
    },

    FallbackSub = { -- Used only when you do not have complete staff sets
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
    gcinclude.DoDefault(ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, 10000);
    gcmage.DoDefault();
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue);
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, 10000);
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();

    gFunc.EquipSet(sets.WS);

    if (action.Name == 'Savage Blade') or (action.Name == 'Vorpal Blade') or (action.Name == 'Swift Blade') then
        gFunc.EquipSet(sets.WS_Soil);
    elseif (action.Name == 'Spirits Within') then
        gFunc.EquipSet(sets.WS_Spirits);
    end
end

return profile;
