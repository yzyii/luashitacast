local profile = {}

local fastCastValue = 0.04 -- Only include Fast Cast e.g. Loquacious Earring, Rostrum Pumps
local fastCastValueSong = 0.37 -- Only include Song Spellcasting Time e.g. Minstrel's Ring, Sha'ir Manteel

local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = nil -- The Max MP you have when /whm in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = nil -- The Max MP you have when /blm in your idle set

local minstrels_earring = true
local minstrels_earring_slot = 'Ear2'

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Range = 'Mythic Harp +1',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Royal Cloak',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Scouter\'s Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = {
        Main = 'Terra\'s Staff',
        Range = 'Mythic Harp +1',
        Neck = 'Checkered Scarf',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Head = 'Crow Beret',
        Body = 'Crow Jupon',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Scouter\'s Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleMaxMP = {},
    Resting = {
        Main = 'Pluto\'s Staff',
        Head = 'Crow Beret',
        Neck = 'Checkered Scarf',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Errant Hpl.',
        Back = 'Errant Cape',
        Legs = 'Baron\'s Slops',
    },
    Town = {},
    Movement = {},

    DT = {},
    DTNight = {},
    MDT = { -- Shell IV provides 23% MDT
    },
    FireRes = {
        Main = 'Neptune\'s Staff',
        Head = 'Green Ribbon +1',
        Neck = 'Enfeebling Torque',
        Body = 'Dst. Harness +1',
        Ear1 = 'Ruby Earring',
        Ear2 = 'Ruby Earring',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Malflame Ring',
        Feet = 'Suzaku\'s Sune-ate',
    },
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {
       Ear2 = 'Loquac. Earring',
       Feet = 'Rostrum Pumps',
    },
    Precast_Songs = {
        Main = 'Tutelary',
        Sub = 'She-slime Shield',
        Ammo = 'Happy Egg',
        Head = 'Genbu\'s Kabuto',
        Neck = 'Bird Whistle',
        Ear1 = 'Pigeon Earring',
        Ear2 = 'Loquac. Earring',
        Body = 'Sha\'ir Manteel',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Minstrel\'s Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Gigant Mantle',
        Waist = 'Powerful Rope',
        Legs = 'Bard\'s Cannions',
        Feet = 'Rostrum Pumps',
    },
    Casting = { -- Default Casting Equipment when using Idle sets
        Main = 'Terra\'s Staff',
        Range = 'Mythic Harp +1',
        Neck = 'Evasion Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Head = 'Darksteel Cap +1',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Powerful Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    SIRD = { -- 102% to Cap, used on Stoneskin, Blink, Aquaveil and Utsusemi casts
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Body = 'Sha\'ir Manteel',
        Ear1 = 'Magnetic Earring',
        Hands = 'Dusk Gloves',
        Waist = 'Swift Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens',
    },
    ConserveMP = {
        Ear2 = 'Magnetic Earring',
    },

    Sing_Default = {
        Head = 'Bard\'s Roundlet',
        Neck = 'Wind Torque',
        Ear1 = 'Singing Earring',
        Ear2 = 'Musical Earring',
        Hands = 'Chl. Cuffs +1',
        Legs = 'Chl. Cannions +1',
        Back = 'Astute Cape',
    },
    Sing_Buff = {
        Main = 'Chanter\'s Staff',
        Body = 'Minstrel\'s Coat',
    },
    Sing_Debuff = {
        Body = 'Kirin\'s Osode',
        Ring1 = 'Heavens Ring',
        Ring2 = 'Heavens Ring',
        Waist = 'Corsette +1',
        Feet = 'Sha\'ir Crackows',
    },

    Sing_Ballad_Large = {
        Range = 'Mythic Harp +1',
    },
    Sing_Ballad_Small = {
        Range = 'Horn +1',
    },
    Sing_Paeon = {
        Range = 'Ebony Harp +1',
        Neck = 'String Torque',
    },
    Sing_Mazurka = {
        Range = 'Ebony Harp +1',
        Neck = 'String Torque',
    },
    Sing_Minuet = {
        Range = 'Cornette +1',
    },
    Sing_March = {
        Range = 'Faerie Piccolo',
    },
    Sing_Madrigal = {
        Range = 'Traversiere +2',
    },
    Sing_Elegy = {
        Range = 'Horn +1',
        Main = 'Terra\'s Staff',
    },
    Sing_Lullaby = {
        Range = 'Nursemaid\'s Harp',
        Main = 'Apollo\'s Staff',
        Legs = 'Mahatma Slops',
    },
    Sing_HordeLullaby_Large = {
        Range = 'Nursemaid\'s Harp',
        Main = 'Apollo\'s Staff',
        Neck = 'String Torque',
        Legs = 'Mahatma Slops',
    },
    Sing_HordeLullaby_Small = {
        Range = 'Nursemaid\'s Harp',
        Main = 'Apollo\'s Staff',
        Neck = 'String Torque',
        Legs = 'Mahatma Slops',
    },
    Sing_SleepRecast = {
    },
    Sing_FinaleRequiem = {
        Range = 'Hamelin Flute',
        Main = 'Apollo\'s Staff',
    },
    Sing_Carol = {
        Range = 'Crumhorn +1',
    },
    Sing_Mambo = {
        Range = 'Gemshorn +1',
    },
    Sing_Prelude = {
        Range = 'Angel\'s Flute +1',
    },
    Sing_Threnody = {
        Range = 'Sorrowful Harp',
        Neck = 'String Torque',
        Legs = 'Mahatma Slops',
    },
    Sing_Hymnus = {
        Range = 'Angel Lyre',
    },

    Cure = {
        Main = 'Apollo\'s Staff',
        Head = 'Crow Beret',
        Neck = 'Justice Badge',
        Ear1 = 'Magnetic Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Crow Jupon',
        Hands = 'Crow Bracers',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Crow Hose',
        Feet = 'Crow Gaiters',
    },
    Cursna = {},

    Enhancing = {
        Ear1 = 'Magnetic Earring',
    },
    Stoneskin = {
        Main = 'Chanter\'s Staff',
        Head = 'Crow Beret',
        Neck = 'Stone Gorget',
        Ear1 = 'Magnetic Earring',
        Ear2 = 'Geist Earring',
        Body = 'Kirin\'s Osode',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
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
    TP_NIN = {},
    WS = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 9')
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
    gFunc.EquipSet(sets.WS)
end

profile.OnLoad = function()
    gcmage.Load()
    profile.SetMacroBook()

    gcinclude.SetAlias(T{'sballad','shorde','srecast'})
    local function createToggle()
        gcdisplay.CreateToggle('SmallBallad', false)
        gcdisplay.CreateToggle('SmallHorde', false)
        gcdisplay.CreateToggle('SleepRecast', false)
    end
    createToggle:once(2)
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
        gcmage.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmage.DoDefault(ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, rdmSJMaxMP)

    local player = gData.GetPlayer()
    if (minstrels_earring and player.HPP <= 25) then
        gFunc.Equip(minstrels_earring_slot, 'Minstrel\'s Earring')
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local action = gData.GetAction()
    if (action.Type == 'Bard Song') then
        gFunc.EquipSet(sets.Precast_Songs)
        local totalFastCast = 1 - (1 - fastCastValueSong) * (1 - fastCastValue)
        gcmage.DoPrecast(totalFastCast)
    else
        gcmage.DoPrecast(fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, rdmSJMaxMP)

    gFunc.EquipSet(sets.Sing_Default)

    local action = gData.GetAction()
    if (action.Type == 'Bard Song') then
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
                gFunc.EquipSet(sets.Sing_SleepRecast)
            end
        elseif string.match(action.Name, 'Horde Lullaby') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_HordeLullaby_Large)
            if (gcdisplay.GetToggle('SmallHorde')) then
                gFunc.EquipSet(sets.Sing_HordeLullaby_Small)
            end
            if (gcdisplay.GetToggle('SleepRecast')) then
                gFunc.EquipSet(sets.Sing_SleepRecast)
            end
        elseif (action.Name == 'Magic Finale') or string.match(action.Name, 'Requiem') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_FinaleRequiem)
        elseif string.match(action.Name, 'Carol') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Carol)
        elseif string.match(action.Name, 'Ballad') then
            gFunc.EquipSet(sets.Sing_Buff)
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
            gFunc.EquipSet(sets.Sing_Hymnus)
        elseif (action.Name == 'Chocobo Mazurka') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Mazurka)
        elseif string.match(action.Name, 'Paeon') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Paeon)
        end
    end
end

return profile
