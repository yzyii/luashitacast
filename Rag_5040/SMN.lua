local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local sets = {
    Idle = {
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Novia Earring',
        Ammo = 'Hedgehog Bomb',
        Head = 'Summoner\'s Horn',
        Neck = 'Smn. Torque',
        Body = 'Yinyang Robe',
        Hands = 'Nashira Gages',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Evoker\'s Ring',
        Back = 'Umbra Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Summoner\'s Spats',
        Feet = 'Evk. Pigaches +1',
    },
    IdleALT = {
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Novia Earring',
        Ammo = 'Hedgehog Bomb',
        Head = 'Summoner\'s Horn',
        Neck = 'Smn. Torque',
        Body = 'Yinyang Robe',
        Hands = 'Nashira Gages',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Evoker\'s Ring',
        Back = 'Umbra Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Summoner\'s Spats',
        Feet = 'Evk. Pigaches +1',
    },
    IdleMaxMP = {
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Novia Earring',
        Ammo = 'Hedgehog Bomb',
        Head = 'Summoner\'s Horn',
        Neck = 'Smn. Torque',
        Body = 'Yinyang Robe',
        Hands = 'Nashira Gages',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Evoker\'s Ring',
        Back = 'Umbra Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Summoner\'s Spats',
        Feet = 'Evk. Pigaches +1',
    },
    Resting = {
        Main = 'Pluto\'s Staff',
        Head = 'Hydra Beret',
        Neck = 'Checkered Scarf',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Mahatma Hpl.',
        Back = 'Errant Cape',
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
        Ear1 = 'Robust Earring', -- 11
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
        Ear1 = 'Robust Earring', -- 11
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
    WaterRes = {
        Main = 'Jupiter\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Ring1 = 'Sapphire Ring', -- 9
        Ring2 = 'Malflood Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Lightning Belt', -- 20
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
        Head = 'Hydra Beret', -- 8
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
    Cursna = {
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

    Divine = {},
    Dark = {},

    Nuke = {},
    NukeACC = {},
    NukeDOT = {},

    LockSet1 = {
        Main = 'Solid Wand',
        Ammo = 'Fortune Egg',
        Head = 'Seer\'s Crown +1',
        Neck = 'Black Neckerchief',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Morion Earring +1',
        Body = 'Ryl.Sqr. Robe',
        Hands = 'Carbuncle Mitts',
        Ring1 = 'Kshama Ring No.5',
        Ring2 = 'Ether Ring',
        Back = 'Red Cape +1',
        Waist = 'Druid\'s Rope',
        Legs = 'Seer\'s Slacks',
        Feet = 'Custom M Boots',
    },
    LockSet2 = {},
    LockSet3 = {},

    FallbackSub = { -- Used only when you do not have complete staff sets
    },

    BP_Delay = {
        Head = 'Summoner\'s Horn',
        Legs = 'Summoner\'s Spats',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Evoker\'s Ring',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Novia Earring',
        Back = 'Errant Cape',
        Body = 'Yinyang Robe',
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
        Back = 'Errant Cape',
        Body = 'Summoner\'s Dblt.',
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

profile.HandleAbility = function()
    gcmage.DoAbility()
    gFunc.EquipSet('BP_Delay')
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    -- You may add logic here
end

profile.HandleMidshot = function()
    -- You may add logic here
end

profile.HandleWeaponskill = function()
    -- You may add logic here
end

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
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, nil, nil, nil, nil)
end

return profile
