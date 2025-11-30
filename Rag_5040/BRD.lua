local profile = {}

local fastCastValue = 0.04 -- Only include Fast Cast e.g. Loquacious Earring, Rostrum Pumps
local fastCastValueSong = 0.37 -- Only include Song Spellcasting Time e.g. Minstrel's Ring, Sha'ir Manteel

local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = 188 -- The Max MP you have when /whm in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = nil -- The Max MP you have when /blm in your idle set

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        -- Range = 'Mythic Harp +1',
        Ammo = 'Pebble',
        Head = 'displaced',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Royal Cloak',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = { Name = 'Ocean Rope', Priority = 100 },
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = {
        Main = 'Terra\'s Staff',
        -- Range = 'Mythic Harp +1',
        Ammo = 'Pebble',
        Head = 'Dream Ribbon',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = { Name = 'Ocean Rope', Priority = 100 },
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleMaxMP = {},
    Resting = {
        Main = 'Pluto\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Head = 'Hydra Beret',
        Neck = 'Pch. Collar',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Hydra Gloves',
        Ring1 = "Shadow Ring",
        Ring2 = "Merman's Ring",
        Back = 'Mahatma Cape',
        Waist = { Name = 'Ocean Rope', Priority = 100 },
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    Town = {},
    Movement = {},

    DT = {
		Main = 'Terra\'s Staff',
        Head = 'Darksteel Cap +1',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Back = 'Umbra Cape',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    DTNight = {},
    MDT = { -- Shell IV provides 23% MDT
        Main = 'Terra\'s Staff',
        Head = 'Black Ribbon',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring', -- 2
        Body = 'Mahatma Hpl.',
        Hands = 'Merman\'s Bangles', -- 2
        Ring1 = 'Shadow Ring',
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Hexerei Cape', -- 3
        Waist = { Name = 'Ocean Rope', Priority = 100 },
        Legs = 'Byakko\'s Haidate',
        Feet = 'Suzaku\'s Sune-ate',
    },
    FireRes = {
        Main = 'Neptune\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Mahatma Hpl.',
        Hands = 'Tarasque Mitts +1', -- 6
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Dino Mantle', -- 4
        Waist = 'Water Belt', -- 20
        Legs = 'Dst. Subligar +1',
        Feet = 'Suzaku\'s Sune-ate', -- 50
    },
    IceRes = {},
    LightningRes = {
        Main = 'Terra\'s Staff', -- 20
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Dst. Harness +1',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Spinel Ring', -- 9
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Lightning Mantle', -- 6
        Waist = 'Earth Belt', -- 20
        Legs = 'Byakko\'s Haidate', -- 50
        Feet = 'Dst. Leggings +1',
    },
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast_Songs_HPDown = { -- This set will equip even before precast for songs in case you require HP Down equipment to trigger Minstrel's Ring
    },
    Precast = {
       Ear2 = 'Loquac. Earring',
       Feet = 'Rostrum Pumps',
    },
    Precast_Songs = { -- 395
        Main = 'Tutelary', -- 30
 		Sub = 'Genbu\'s Shield',
        Ammo = 'Happy Egg',
        Head = 'Genbu\'s Kabuto', -- 50
        Neck = 'Pch. Collar', -- 10
        Ear1 = 'Loquac. Earring',
        Ear2 = { Name = 'Cassie Earring', Priority = -100 }, -- 50
        Body = 'Sha\'ir Manteel',
        Hands = 'Seiryu\'s Kote', -- 50
        Ring1 = 'Minstrel\'s Ring',
        Ring2 = 'Bomb Queen Ring', -- 75
        Back = 'Gigant Mantle', -- 80
        Waist = 'Ocean Sash', -- 45
        Legs = 'Dusk Trousers', -- 35
        Feet = 'Rostrum Pumps', -- -30
    },
    Casting = { -- Default Casting Equipment when using Idle sets
        Main = 'Terra\'s Staff',
        -- Range = 'Mythic Harp +1',
        Ammo = 'Pebble',
        Head = 'Dream Ribbon',
        Neck = 'Willpower Torque', -- 5
        Ear1 = { Name = 'Loquac. Earring', Priority = 100 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 100 }, -- 8
        Body = 'Dst. Harness +1',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = { Name = 'Silver Obi +1', Priority = -100 }, -- 8
        Legs = 'Dst. Subligar +1',
        Feet = 'Mountain Gaiters', -- 5
    },
    SIRD = { -- 102% to Cap, used on Stoneskin, Blink, Aquaveil and Utsusemi casts
        Neck = 'Willpower Torque', -- 5
        Ear1 = { Name = 'Loquac. Earring', Priority = 100 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 100 }, -- 8
        Waist = { Name = 'Silver Obi +1', Priority = -100 }, -- 8
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Range = 'Angel Lyre', -- 2
		-- Head = 'Sheikh Turban', -- 2
        Body = { Name = 'Sha\'ir Manteel', Priority = 10 }, -- 2
        Ear1 = { Name = 'Loquac. Earring', Priority = 100 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 100 },
        Hands = 'Dusk Gloves +1', -- 4
        Waist = 'Sonic Belt', -- 6
        Legs = 'Byakko\'s Haidate', -- 5
        Feet = 'Dusk Ledelsens +1', -- 3
    },
    ConserveMP = {
        Ammo = 'Dream Sand',
        Ear2 = 'Magnetic Earring',
    },

    Sing_Default = { -- Primarily Wind / Debuff by Default
        -- Range = 'Mythic Harp +1',
        Range = 'Military Harp',
        Head = 'Brd. Roundlet +1',
        Neck = 'Wind Torque',
        Ear1 = 'Singing Earring',
        Ear2 = 'Musical Earring',
        Body = { Name = 'Sha\'ir Manteel', Priority = 10 },
        Hands = 'Chl. Cuffs +1',
        Ring1 = 'Heavens Ring',
        Ring2 = 'Heavens Ring',
        Back = { Name = 'Astute Cape', Priority = 100 },
        Waist = 'Gleeman\'s Belt',
        Legs = 'Chl. Cannions +1',
        Feet = { Name = 'Sha\'ir Crackows', Priority = 10 },
    },
    Sing_Buff = {
        Main = 'Chanter\'s Staff',
        Body = 'Minstrel\'s Coat',
        Waist = { Name = 'Ocean Rope', Priority = 100 },
        Feet = 'Dusk Ledelsens +1',
    },
    Sing_Debuff = {
        Body = 'Mahatma Hpl.',
    },

    Sing_Recast = {
        Hands = 'Sheikh Gages',
    },

    Sing_Ballad_Large = {
        -- Range = 'Balladeer\'s Harp',
        Range = 'Military Harp',
    },
    Sing_Ballad_Small = {
        -- Range = 'Balladeer\'s Harp',
        Range = 'Cornette +2',
    },
    Sing_Paeon = {
        Range = 'Ebony Harp +2',
    },
    Sing_Mazurka = {
        -- Range = 'Harlequin\'s Horn',
    },
    Sing_Minuet = {
        Range = 'Cornette +2',
    },
    Sing_March = {
        Range = 'Faerie Piccolo',
    },
    Sing_Madrigal = {
        Range = 'Traversiere +2',
    },
    Sing_Elegy = {
        Range = 'Horn +1',
    },
    Sing_Lullaby = {
        Range = 'Nursemaid\'s Harp',
        Neck = 'String Torque',
        Body = 'Chl. Jstcorps +1',
        Legs = "Mahatma Slops",
    },
    Sing_HordeLullaby_Large = {
        Range = 'Nursemaid\'s Harp',
        Neck = 'String Torque',
        Body = 'Chl. Jstcorps +1',
        Legs = "Mahatma Slops",
    },
    Sing_HordeLullaby_Small = {
        -- Range = 'Mary\'s Horn',
        Range = 'Nursemaid\'s Harp',
        Neck = 'String Torque',
        Body = 'Chl. Jstcorps +1',
        Legs = "Mahatma Slops",
    },
    Sing_Finale = {
        Range = 'Military Harp',
        Neck = 'String Torque',
        Body = 'Chl. Jstcorps +1',
        Legs = "Mahatma Slops",
    },
    Sing_Requiem = {
        Range = 'Hamelin Flute',
    },
    Sing_Carol = {
        Range = 'Crumhorn +1',
    },
    Sing_Mambo = {
        -- Range = 'Gemshorn +1',
    },
    Sing_Prelude = {
        -- Range = 'Angel\'s Flute +1',
    },
    Sing_Threnody = {
        Range = 'Sorrowful Harp',
        Neck = 'String Torque',
        Body = 'Chl. Jstcorps +1',
        Legs = "Mahatma Slops",
    },
    Sing_Hymnus = {
        Range = 'Angel Lyre',
    },
    Sing_Etude = {
        -- Range = 'Mythic Harp +1',
        -- Neck = 'String Torque',
        -- Body = 'Chl. Jstcorps +1',
    },
    Sing_Minne = {
        -- Range = 'Harp +1',
        -- Neck = 'String Torque',
        -- Body = 'Chl. Jstcorps +1',
    },

    Cure = { -- TODO: Check Cure Caps
        Main = 'Apollo\'s Staff',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 100 },
        Head = 'Hydra Beret', -- 8
        -- Neck = 'Faith Torque',
        Neck = 'Benign Necklace', -- 2
        Ear1 = 'Novia Earring', -- 7
        Ear2 = { Name = 'Magnetic Earring', Priority = 100 },
        --Body = 'Mahatma Hpl.', -- 4
        Body = { Name = 'Hydra Doublet', Priority = 100 }, -- 9
        Hands = 'Hydra Gloves', -- 5
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = { Name = 'Mahatma Cape', Priority = 100 }, -- 5
        Waist = 'Penitent\'s Rope', -- 3
        -- Legs = 'Mahatma Slops', -- 4
        Legs = 'Hydra Brais', -- 6
        -- Feet = 'Suzaku\'s Sune-ate',
        Feet = 'Hydra Gaiters', -- 5
    },
    Cursna = {
        Back = 'Altruistic Cape',
    },

    Enhancing = {},
    Stoneskin = { -- TODO: Check Stoneskin Caps
        Main = 'Chanter\'s Staff',
		Ammo = "Dream Sand",
        Head = 'Maat\'s Cap',
        Neck = 'Stone Gorget',
        -- Ear1 = { Name = 'Loquac. Earring', Priority = 100 },
        -- Ear2 = { Name = 'Magnetic Earring', Priority = 100 },
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Mahatma Hpl.',
        Hands = { Name = 'Dvt. Mitts +1', Priority = 100 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Suzaku\'s Sune-ate',
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

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP = {},
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {},
    TP_NIN = {},
    WS = {},
    WS_HighAcc = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    -- AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    -- AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('common\\gcmage.lua')

profile.HandleAbility = function()
    gcmage.DoAbility()
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)
    if (gcdisplay.GetCycle('TP') == 'HighAcc') then
        gFunc.EquipSet('WS_HighAcc')
    end
    gcmage.DoFenrirsEarring()
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'sballad','shorde','srecast'})
    gcdisplay.CreateToggle('SmallBallad', false)
    gcdisplay.CreateToggle('SmallHorde', false)
    gcdisplay.CreateToggle('SleepRecast', true)
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
    gcinclude.ClearAlias(T{'sballad','shorde','srecast'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'sballad') then
        gcdisplay.AdvanceToggle('SmallBallad')
        gcinclude.Message('SmallBallad', gcdisplay.GetToggle('SmallBallad'))
    elseif (args[1] == 'shorde') then
        gcdisplay.AdvanceToggle('SmallHorde')
        gcinclude.Message('SmallHorde', gcdisplay.GetToggle('SmallHorde'))
    elseif (args[1] == 'srecast') then
        gcdisplay.AdvanceToggle('SleepRecast')
        gcinclude.Message('SleepRecast', gcdisplay.GetToggle('SleepRecast'))
    else
        gcmage.DoCommands(args, sets)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmage.DoDefault(ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, rdmSJMaxMP, nil)

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local action = gData.GetAction()
    if (action.Type == 'Bard Song') then
        gFunc.ForceEquipSet('Precast_Songs_HPDown')
        gFunc.EquipSet(sets.Precast_Songs)
        local totalFastCast = 1 - (1 - fastCastValueSong) * (1 - fastCastValue)
        gcmage.DoPrecast(totalFastCast)
    else
        gcmage.DoPrecast(fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, rdmSJMaxMP, nil)

    local action = gData.GetAction()
    if (action.Type == 'Bard Song') then
        gFunc.EquipSet(sets.Sing_Default)

        if string.match(action.Name, 'Threnody') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Threnody)
        elseif string.match(action.Name, 'Elegy') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Elegy)
        elseif string.match(action.Name, 'Foe Lullaby') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Lullaby)
            if (gcdisplay.GetToggle('SleepRecast')) then
                gFunc.EquipSet(sets.Sing_Recast)
            end
        elseif string.match(action.Name, 'Horde Lullaby') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_HordeLullaby_Large)
            if (gcdisplay.GetToggle('SmallHorde')) then
                gFunc.EquipSet(sets.Sing_HordeLullaby_Small)
            end
            if (gcdisplay.GetToggle('SleepRecast')) then
                gFunc.EquipSet(sets.Sing_Recast)
            end
        elseif (action.Name == 'Magic Finale') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Finale)
        elseif string.match(action.Name, 'Requiem') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Requiem)
        elseif string.match(action.Name, 'Carol') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Carol)
        elseif string.match(action.Name, 'Ballad') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Haste)
            gFunc.EquipSet(sets.Sing_Recast)
            gFunc.EquipSet(sets.Sing_Ballad_Large)
            if (gcdisplay.GetToggle('SmallBallad')) then
                gFunc.EquipSet(sets.Sing_Ballad_Small)
            end
        elseif string.match(action.Name, 'Minuet') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Minuet)
        elseif string.match(action.Name, 'March') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_March)
        elseif string.match(action.Name, 'Madrigal') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Madrigal)
        elseif string.match(action.Name, 'Mambo') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Mambo)
        elseif string.match(action.Name, 'Prelude') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Prelude)
        elseif string.match(action.Name, 'Hymnus') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Haste)
            gFunc.EquipSet(sets.Sing_Recast)
            gFunc.EquipSet(sets.Sing_Hymnus)
        elseif (action.Name == 'Chocobo Mazurka') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Mazurka)
        elseif string.match(action.Name, 'Paeon') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Paeon)
        elseif string.match(action.Name, 'Etude') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Etude)
        elseif string.match(action.Name, 'Minne') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Minne)
        end
    end
end

return profile
