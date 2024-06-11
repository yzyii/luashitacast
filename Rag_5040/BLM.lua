local profile = {}

local fastCastValue = 0.04 -- 4% from gear listed in Precast set

local ninSJNukeMaxMP = 709 -- The Max MP you have when /nin in your nuking set
local whmSJNukeMaxMP = 787 -- The Max MP you have when /whm in your nuking set
local rdmSJNukeMaxMP = 768 -- The Max MP you have when /rdm in your nuking set

local warlocks_mantle = true -- Don't add 2% to fastCastValue to this as it is SJ dependant
local republic_circlet = false

local opuntia_hoop = true
local opuntia_hoop_slot = 'Ring1'

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Head = 'Genie Tiara',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Sorcerer\'s Coat',
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Igqira Lappas',
        Feet = 'Herald\'s Gaiters',
    },
    IdleALT = {},
    IdleMaxMP = {
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Back = 'Merciful Cape',
    },
    Resting = {
        Main = 'Pluto\'s Staff',
        Head = 'Hydra Beret',
        Neck = 'Checkered Scarf',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Hydra Gloves',
        Ring1 = 'Serket Ring',
        Back = 'Errant Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Baron\'s Slops',
        -- Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    Town = {
        Main = 'Terra\'s Staff',
        Head = 'Sorcerer\'s Petas.',
        Body = 'Sorcerer\'s Coat',
        Legs = 'Src. Tonban +1',
        Feet = 'Herald\'s Gaiters',
    },
    Movement = {
        Feet = 'Herald\'s Gaiters',
    },

    DT = {
        Main = 'Terra\'s Staff',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Head = 'Genie Tiara',
        Body = 'Sorcerer\'s Coat',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Legs = 'Igqira Lappas',
        Back = 'Umbra Cape',
    },
    DTNight = {
        Main = 'Terra\'s Staff',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Head = 'Genie Tiara',
        Body = 'Sorcerer\'s Coat',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Legs = 'Igqira Lappas',
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
        Legs = 'Igqira Lappas',
        Back = 'Hexerei Cape', -- 3
    },
    FireRes = {
        Main = 'Neptune\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Water Belt', -- 20
        Feet = 'Power Sandals', -- 7
        Legs = 'Igqira Lappas',
    },
    IceRes = {
        Main = 'Vulcan\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Diamond Earring', -- 10
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
        Back = 'Aurora Mantle', -- 7
        Waist = 'Fire Belt', -- 20
        Legs = 'Igqira Lappas',
    },
    LightningRes = {
        Main = 'Terra\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Ring1 = 'Spinel Ring', -- 9
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Earth Belt', -- 20
        Legs = 'Igqira Lappas',
    },
    EarthRes = {
        Main = 'Auster\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Ring1 = 'Robust Ring', -- 10
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Wind Belt', -- 20
        Legs = 'Igqira Lappas',
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
        Back = 'Aurora Mantle', -- 7
        Waist = 'Ice Belt', -- 20
        Legs = 'Igqira Lappas',
    },
    WaterRes = {
        Main = 'Jupiter\'s Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Ring1 = 'Communion Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Lightning Belt', -- 20
        Legs = 'Igqira Lappas',
    },
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
    Yellow = { -- This will override Precast if /lag is turned on or the spell casting time is too short. e.g. Tier 1: "Stone"
        Head = 'Zenith Crown',
        Neck = 'Checkered Scarf',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Merman\'s Earring',
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Ether Ring',
        Ring2 = 'Serket Ring',
        Waist = 'Penitent\'s Rope',
        Feet = 'Rostrum Pumps',
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Head = 'Nashira Turban', -- 2
        Ear1 = 'Loquac. Earring',
        Body = 'Nashira Manteel', -- 3
        Hands = 'Nashira Gages', -- 1
        Waist = 'Swift Belt', -- 4
        Legs = 'Nashira Seraweels', -- 2
        Feet = 'Nashira Crackows', -- 1
    },
    ConserveMP = {
        Ear2 = 'Magnetic Earring',
        Body = 'Igqira Weskit',
        Feet = 'Src. Sabots +1',
    },

    Cure = {
        Ammo = 'Hedgehog Bomb', -- 1
        Head = 'Hydra Beret', -- 8
        Neck = 'Benign Necklace', -- 2
        Ear1 = 'Novia Earring', -- 7
        Ear2 = 'Magnetic Earring',
        Body = 'Hydra Doublet', -- 9
        Hands = 'Hydra Gloves', -- 5
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Errant Cape', -- 5
        Waist = 'Penitent\'s Rope', -- 3
        Legs = 'Mahatma Slops', -- 4
        -- Legs = 'Hydra Brais', -- 6
        Feet = 'Hydra Gaiters', -- 3
    },
    Cursna = {
        Back = 'Altruistic Cape',
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
        Ring2 = 'Communion Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Mahatma Pigaches',
    },
    Stoneskin = {
        Neck = 'Stone Gorget',
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
        Ring2 = 'Omniscient Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Src. Sabots +1',
    },

    Enfeebling = {
        Head = 'Genie Tiara',
        Neck = 'Enfeebling Torque',
        Body = 'Wzd. Coat +1',
        Legs = 'Igqira Lappas',
    },
    EnfeeblingMND = {
        Ammo = 'Hedgehog Bomb',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Waist = 'Penitent\'s Rope',
        Feet = 'Mahatma Pigaches',
    },
    EnfeeblingINT = {
        Ammo = 'Phtm. Tathlum',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        Hands = 'Mahatma Cuffs',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Waist = 'Sorcerer\'s Belt',
        Feet = 'Src. Sabots +1',
    },
    EnfeeblingACC = {
        Ear2 = 'Enfeebling Earring',
        Back = 'Altruistic Cape',
    },

    Divine = {},
    Dark = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Dark Earring',
        Body = 'Nashira Manteel',
        Hands = 'Src. Gloves +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Merciful Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Wzd. Tonban +1',
        Feet = 'Igqira Huaraches',
    },
    Stun = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear1 = 'Loquac. Earring',
        Body = 'Nashira Manteel',
        Hands = 'Nashira Gages',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Merciful Cape',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Nashira Crackows',
    },

    Nuke = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Demon Helm +1',
        Neck = 'Prudence Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Igqira Weskit',
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Prism Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Src. Sabots +1',
    },
    NukeHNM = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Demon Helm +1',
        Neck = 'Prudence Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Wzd. Gloves +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Prism Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Src. Sabots +1',
    },
    NukeACC = {
        Head = 'Sorcerer\'s Petas.',
        Neck = 'Elemental Torque',
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
        Hands = 'Wzd. Gloves +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Prism Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Src. Sabots +1',
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
        Ring1 = 'Eremite\'s Ring',
        Ring2 = 'Eremite\'s Ring',
        Back = 'Black Cape',
        Waist = 'Druid\'s Rope',
        Legs = 'Seer\'s Slacks',
        Feet = 'Mannequin Pumps',
    },
    LockSet2 = {},
    LockSet3 = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 10')

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 //stun')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 //dia')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('common\\gcmage.lua')

profile.HandleAbility = function()
    -- You may add logic here
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

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmage.DoDefault(ninSJNukeMaxMP, whmSJNukeMaxMP, nil, rdmSJNukeMaxMP)

    local spikes = gData.GetBuffCount('Blaze Spikes') + gData.GetBuffCount('Shock Spikes') + gData.GetBuffCount('Ice Spikes')
    if (opuntia_hoop and spikes > 0) then
        gFunc.Equip(opuntia_hoop_slot, 'Opuntia Hoop')
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == "RDM" and warlocks_mantle) then
        gcmage.DoPrecast(fastCastValue + 0.02)
        gFunc.Equip('Back', 'Warlock\'s Mantle')
    else
        gcmage.DoPrecast(fastCastValue)
    end
end

local ElementalDebuffs = T{ 'Burn','Rasp','Drown','Choke','Frost','Shock' }

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJNukeMaxMP, whmSJNukeMaxMP, nil, rdmSJNukeMaxMP)

    local action = gData.GetAction()
    if (republic_circlet == true) then
        if (action.Skill == 'Elemental Magic' and gcdisplay.GetCycle('Mode') == 'Potency') then
            if (not ElementalDebuffs:contains(action.Name)) then
                if (conquest:GetInsideControl()) then
                    print(chat.header('GCMage'):append(chat.message('In Region - Using Republic Circlet')))
                    gFunc.Equip('Head', 'Republic Circlet')
                end
            end
        end
    end
end

return profile
