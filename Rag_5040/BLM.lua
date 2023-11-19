local profile = {}

local fastCastValue = 0.04 -- 4% from gear

local ninSJNukeMaxMP = 749 -- The Max MP you have when /nin in your nuking set
local whmSJNukeMaxMP = 827 -- The Max MP you have when /whm in your nuking set
local rdmSJNukeMaxMP = 808 -- The Max MP you have when /rdm in your nuking set

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Head = 'Sorcerer\'s Petas.',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Sorcerer\'s Coat',
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Sorcerer\'s Tonban',
        Feet = 'Rostrum Pumps',
    },
    IdleALT = {
        Main = 'Terra\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Head = 'Sorcerer\'s Petas.',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Sorcerer\'s Coat',
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Sorcerer\'s Tonban',
        Feet = 'Rostrum Pumps',
    },
    IdleMaxMP = {
        Main = 'Terra\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Head = 'Sorcerer\'s Petas.',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Sorcerer\'s Coat',
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Sorcerer\'s Tonban',
        Feet = 'Rostrum Pumps',
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
        Body = 'Sorcerer\'s Coat',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
    },
    DTNight = {
        Main = 'Terra\'s Staff',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Sorcerer\'s Coat',
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
        Body = 'Sorcerer\'s Coat',
        Ring1 = 'Merman\'s Ring', -- 4
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Hexerei Cape', -- 3
    },
    FireRes = {
        Main = 'Neptune\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Ring1 = 'Ruby Ring', -- 9
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Water Belt', -- 20
        Feet = 'Power Sandals', -- 7
    },
    IceRes = {
        Main = 'Vulcan\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Diamond Earring', -- 10
        Ring1 = 'Diamond Ring', -- 9
        Ring2 = 'Malfrost Ring', -- 10
        Back = 'Blue Cape +1', -- 7
        Waist = 'Fire Belt', -- 20
    },
    LightningRes = {
        Main = 'Terra\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Topaz Earring', -- 10
        Ear2 = 'Topaz Earring', -- 10
        Ring1 = 'Spinel Ring', -- 9
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Earth Belt', -- 20
    },
    EarthRes = {
        Main = 'Auster\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Topaz Earring', -- 10
        Ear2 = 'Topaz Earring', -- 10
        Ring1 = 'Topaz Ring', -- 9
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Blue Cape +1', -- 7
        Waist = 'Wind Belt', -- 20
    },
    WindRes = {
        Main = 'Aquilo\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Diamond Earring', -- 10
        Hands = 'Mage\'s Cuffs', -- 5
        Ring1 = 'Emerald Ring', -- 9
        Ring2 = 'Malgust Ring', -- 10
        Back = 'Blue Cape +1', -- 7
        Waist = 'Ice Belt', -- 20
    },
    WaterRes = {},
    Evasion = {},

    Precast = {
        Ear1 = 'Loquac. Earring',
        Feet = 'Rostrum Pumps',
    },
    Casting = {
        Main = 'Hermit\'s Wand', -- 25
        Sub = 'Hermit\'s Wand', -- 25
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Waist = 'Druid\'s Rope', -- 10
        Feet = 'Wizard\'s Sabots', -- 20
    },
    SIRD = { -- 102% to Cap, used on Stoneskin, Blink, Aquaveil and Utsusemi casts
        Main = 'Hermit\'s Wand', -- 25
        Sub = 'Hermit\'s Wand', -- 25
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Waist = 'Druid\'s Rope', -- 10
        Feet = 'Wizard\'s Sabots', -- 20
    },
    Yellow = { -- Fast Cast Gear will override this at times when the spell cast is too short.
        Head = 'Faerie Hairpin',
        Neck = 'Checkered Scarf',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Merman\'s Earring',
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Ether Ring',
        Ring2 = 'Serket Ring',
        Back = 'Blue Cape +1',
        Waist = 'Penitent\'s Rope',
        Feet = 'Rostrum Pumps',
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
        Head = 'Nashira Turban', -- 5
        Neck = 'Jeweled Collar',
        Ear1 = 'Novia Earring', -- 7
        Ear2 = 'Magnetic Earring',
        Body = 'Mahatma Hpl.', -- 4
        Hands = 'Dvt. Mitts +1', -- 3
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Errant Cape', -- 5
        Waist = 'Penitent\'s Rope', -- 3
        Legs = 'Mahatma Slops', -- 4
        Feet = 'Mahatma Pigaches', -- 3
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
    Spikes = {
        Main = 'Kirin\'s Pole',
        Ammo = 'Phtm. Tathlum',
        Head = 'Demon Helm +1',
        Neck = 'Enhancing Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Src. Sabots +1',
    },

    Enfeebling = {
        Head = 'Igqira Tiara',
        Neck = 'Enfeebling Torque',
        Ear2 = 'Enfeebling Earring',
        Body = 'Wizard\'s Coat',
        Back = 'Prism Cape',
        -- Back = 'Altruistic Cape',
        Legs = 'Igqira Lappas',
    },
    EnfeeblingMND = {
        Ammo = 'Hedgehog Bomb',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Waist = 'Penitent\'s Rope',
        Feet = 'Mahatma Pigaches',
    },
    EnfeeblingINT = {
        Ammo = 'Phtm. Tathlum',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        Hands = 'Mahatma Cuffs',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Waist = 'Sorcerer\'s Belt',
        Feet = 'Rostrum Pumps',
    },
    EnfeeblingACC = {},

    Dark = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        -- Ear2 = 'Dark Earring',
        Body = 'Mahatma Hpl.',
        -- Body = 'Nashira Manteel',
        Hands = 'Src. Gloves +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Merciful Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Wizard\'s Tonban',
        Feet = 'Nashira Crackows',
        -- Feet = 'Igqira Huaraches',
    },

    Nuke = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Demon Helm +1',
        Neck = 'Elemental Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Igqira Weskit',
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Src. Sabots +1',
    },
    NukeACC = {
        Head = 'Sorcerer\'s Petas.',
        Hands = 'Wzd. Gloves +1',
        Back = 'Merciful Cape',
        Feet = 'Nashira Crackows',
    },
    NukeDOT = {
        Main = 'Kirin\'s Pole',
        Ammo = 'Phtm. Tathlum',
        Head = 'Demon Helm +1',
        Neck = 'Prudence Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        Body = 'Mahatma Hpl.',
        Hands = 'Mahatma Cuffs',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Rostrum Pumps',
    },
    MB = {
        Hands = 'Src. Gloves +1',
    },

    LockSet1 = {
        Main = 'Solid Wand',
        Ammo = 'Morion Tathlum',
        Head = 'Seer\'s Crown +1',
        Neck = 'Black Neckerchief',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Morion Earring +1',
        Body = 'Ryl.Sqr. Robe',
        Hands = 'Seer\'s Mitts +1',
        Ring1 = 'Kshama Ring No.5',
        Ring2 = 'Eremite\'s Ring',
        Back = 'Red Cape +1',
        Waist = 'Druid\'s Rope',
        Legs = 'Seer\'s Slacks',
        Feet = 'Custom M Boots',
    },
    LockSet2 = {},
    LockSet3 = {},

    FallbackSub = { -- Used only when you do not have complete staff sets
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 10')
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
    gcmage.DoDefault(ninSJNukeMaxMP, whmSJNukeMaxMP, nil, rdmSJNukeMaxMP)
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJNukeMaxMP, whmSJNukeMaxMP, nil, rdmSJNukeMaxMP)
end

return profile
