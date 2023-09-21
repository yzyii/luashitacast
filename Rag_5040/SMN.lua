local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local sets = {
    Idle = {
        Head = 'Austere Hat',
        Legs = 'Evoker\'s Spats',
        Ring1 = 'Serket Ring',
        Ring2 = 'Ether Ring',
        Ear1 = 'Healer\'s Earring',
        Ear2 = 'Morion Earring +1',
        Back = 'Red Cape +1',
        Body = 'Austere Robe',
        Hands = 'Austere Cuffs',
        Feet = 'Mannequin Pumps',
        Ammo = 'Fortune Egg',
        Waist = 'Druid\'s Rope',
        Neck = 'Smn. Torque',

        --Ammo = 'Hedgehog Bomb',
        -- Head = 'Summoner\'s Horn',
        -- Neck = 'Smn. Torque',
        -- Ear1 = '',
        -- Ear2 = '',
        -- Body = '',
        --Hands = 'Summoner\'s Brcr.',
        -- Ring1 = 'Serket Ring',
        --Ring2 = 'Evoker\'s Ring',
        -- Back = 'Blue Cape +1',
        --Waist = 'Hierarch Belt',
        -- Legs = '',
        -- Feet = 'Summoner\'s Pgch.',
    },
    IdleALT = {},
    IdleMaxMP = {},
    Resting = {
        Main = 'Pluto\'s Staff',
        Neck = 'Checkered Scarf',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Loquac. Earring',
        -- Ear2 = 'Magnetic Earring', -- 8
        Body = 'Mahatma Hpl.',
        Back = 'Blue Cape +1',
        Waist = 'Hierarch Belt',
        Legs = 'Baron\'s Slops',
    },
    Town = {},
    Movement = {},

    DT = {},
    DTNight = {},
    MDT = { -- Shell IV provides 23% MDT
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

    Precast = {
        Ear1 = 'Loquac. Earring',
        Feet = 'Rostrum Pumps',
    },
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
        Head = 'Austere Hat',
        Legs = 'Evoker\'s Spats',
        Ring1 = 'Serket Ring',
        Ring2 = 'Ether Ring',
        Ear1 = 'Healer\'s Earring',
        Ear2 = 'Morion Earring +1',
        Back = 'Red Cape +1',
        Body = 'Austere Robe',
        Hands = 'Austere Cuffs',
        Feet = 'Mannequin Pumps',
        Ammo = 'Fortune Egg',
        Waist = 'Druid\'s Rope',
        Neck = 'Smn. Torque',
    },

    BP = {
        Head = 'Evoker\'s Horn',
        Legs = 'Evoker\'s Spats',
        Ring1 = 'Serket Ring',
        Ring2 = 'Ether Ring',
        Ear1 = 'Healer\'s Earring',
        Ear2 = 'Morion Earring +1',
        Back = 'Red Cape +1',
        Body = 'Austere Robe',
        Hands = 'Austere Cuffs',
        Feet = 'Mannequin Pumps',
        Ammo = 'Fortune Egg',
        Waist = 'Druid\'s Rope',
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
