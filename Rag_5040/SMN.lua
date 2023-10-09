local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local sets = {
    Idle = {
        Legs = 'Evoker\'s Spats',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Novia Earring',
        Body = 'Austere Robe',
        Ammo = 'Hedgehog Bomb',
        Head = 'Summoner\'s Horn',
        Neck = 'Smn. Torque',
        -- Body = '',
        Hands = 'Nashira Gages',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Evoker\'s Ring',
        Back = 'Blue Cape +1',
        Waist = 'Hierarch Belt',
        -- Legs = '',
        Feet = 'Summoner\'s Pgch.',
    },
    IdleALT = {
        Legs = 'Evoker\'s Spats',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Novia Earring',
        Body = 'Austere Robe',
        Ammo = 'Hedgehog Bomb',
        Head = 'Summoner\'s Horn',
        Neck = 'Smn. Torque',
        -- Body = '',
        Hands = 'Nashira Gages',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Evoker\'s Ring',
        Back = 'Blue Cape +1',
        Waist = 'Hierarch Belt',
        -- Legs = '',
        Feet = 'Summoner\'s Pgch.',
    },
    IdleMaxMP = {
        Legs = 'Evoker\'s Spats',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Novia Earring',
        Body = 'Austere Robe',
        Ammo = 'Hedgehog Bomb',
        Head = 'Summoner\'s Horn',
        Neck = 'Smn. Torque',
        -- Body = '',
        Hands = 'Nashira Gages',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Evoker\'s Ring',
        Back = 'Blue Cape +1',
        Waist = 'Hierarch Belt',
        -- Legs = '',
        Feet = 'Summoner\'s Pgch.',
    },
    Resting = {
        Main = 'Pluto\'s Staff',
        Neck = 'Checkered Scarf',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Mahatma Hpl.',
        Back = 'Blue Cape +1',
        Waist = 'Hierarch Belt',
        Legs = 'Baron\'s Slops',
    },
    Town = {},
    Movement = {},

    DT = {
        Main = 'Terra\'s Staff',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
    },
    DTNight = {
        Main = 'Terra\'s Staff',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
    },
    MDT = { -- Shell IV provides 23% MDT
        Main = 'Terra\'s Staff',
        Head = 'Green Ribbon +1',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring', -- 2
        Ring1 = 'Merman\'s Ring', -- 4
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Hexerei Cape', -- 3
    },
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
    Evasion = {},

    Precast = {
        Ear1 = 'Loquac. Earring',
        Feet = 'Rostrum Pumps',
    },
    Casting = { -- Default Casting Equipment when using Idle sets
        Main = 'Hermit\'s Wand', -- 25
        Sub = 'Hermit\'s Wand', -- 25
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Waist = 'Druid\'s Rope', -- 10
        Feet = 'Mountain Gaiters', -- 5
    },
    SIRD = { -- 102% to Cap, used on Stoneskin, Blink, Aquaveil and Utsusemi casts
        Main = 'Hermit\'s Wand', -- 25
        Sub = 'Hermit\'s Wand', -- 25
        Ammo = 'Hedgehog Bomb',
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Body = 'Raven Jupon',
        Hands = 'Raven Bracers',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Druid\'s Rope', -- 10
        Legs = 'Raven Hose',
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Head = 'Nashira Turban',
        Ear1 = 'Loquac. Earring',
        Hands = 'Nashira Gages',
        Waist = 'Swift Belt',
        -- Legs = 'Nashira Serawheels',
        Feet = 'Nashira Crackows',
    },

    Cure = {
        Ammo = 'Hedgehog Bomb', -- 1
        Head = 'Raven Beret', -- 8
        Neck = 'Jeweled Collar',
        Ear1 = 'Novia Earring', -- 7
        Ear2 = 'Magnetic Earring',
        Body = 'Raven Jupon', -- 9
        Hands = 'Raven Bracers', -- 5
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Errant Cape', -- 5
        Waist = 'Penitent\'s Rope', -- 3
        Legs = 'Raven Hose', -- 6
        Feet = 'Raven Gaiters', -- 5
    },
    Cursna = { -- Not implemented on ASB...
        -- Main = 'Prelatic Pole',
        -- Neck = 'Healing Torque',
        -- Legs = 'Druid\'s Slops',
        -- Back = 'Altruistic Cape',
    },

    Enhancing = {
        Main = 'Kirin\'s Pole',
        Ammo = 'Hedgehog Bomb',
        Head = 'Nashira Turban',
        Neck = 'Enhancing Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Mahatma Pigaches',
    },
    Stoneskin = {
        -- Neck = 'Stone Gorget',
    },
    Spikes = {},

    Enfeebling = {},
    EnfeeblingMND = {},
    EnfeeblingINT = {},
    EnfeeblingACC = {},

    Dark = {},

    Nuke = {},
    NukeACC = {},
    NukeDOT = {},

    LockSet1 = {
        Main = 'Solid Wand',
        Ammo = 'Fortune Egg',
        Head = 'Austere Hat',
        Neck = 'Justice Badge',
        Ear1 = 'Healer\'s Earring',
        Ear2 = 'Morion Earring +1',
        Body = 'Austere Robe',
        Hands = 'Carbuncle Mitts',
        Ring1 = 'Astral Ring',
        Ring2 = 'Ether Ring',
        Back = 'Red Cape +1',
        Waist = 'Druid\'s Rope',
        Legs = 'Custom Slacks',
        Feet = 'Mannequin Pumps',
    },
    LockSet2 = {},
    LockSet3 = {},

    FallbackSub = { -- Used only when you do not have complete staff sets
    },

    BP_Delay = {
        Head = 'Summoner\'s Horn',
        Legs = 'Evoker\'s Spats',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Evoker\'s Ring',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Novia Earring',
        Back = 'Blue Cape +1',
        Body = 'Austere Robe',
        Hands = 'Summoner\'s Brcr.',
        Feet = 'Summoner\'s Pgch.',
        Ammo = 'Hedgehog Bomb',
        Waist = 'Hierarch Belt',
        Neck = 'Smn. Torque',
    },

    BP = {
        Head = 'Evoker\'s Horn',
        Legs = 'Evoker\'s Spats',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Evoker\'s Ring',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Novia Earring',
        Back = 'Blue Cape +1',
        Body = 'Austere Robe',
        Hands = 'Summoner\'s Brcr.',
        Feet = 'Summoner\'s Pgch.',
        Ammo = 'Hedgehog Bomb',
        Waist = 'Hierarch Belt',
        Neck = 'Smn. Torque',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 2')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2')
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
    local petAction = gData.GetPetAction();
    if (petAction ~= nil) then
        gFunc.EquipSet('BP')
    else
        gcmage.DoDefault(nil, nil, nil, nil)
    end
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, nil, nil, nil, nil)
end

profile.HandleAbility = function()
    gcmage.DoAbility()
    gFunc.EquipSet('BP_Delay')
end

return profile
