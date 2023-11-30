local profile = {}

local fastCastValue = 0.00 -- 0% from gear

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
        Neck = 'Checkered Scarf',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Vermillion Cloak',
        Hands = 'Errant Cuffs',
        Ring1 = 'Ether Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Scouter\'s Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Errant Pigaches',
    },
    IdleALT = {},
    IdleMaxMP = {},
    Resting = {
        Main = 'Dark Staff',
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
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {},
    Precast_Songs = {
        Main = 'Tutelary',
        Range = 'Mythic Harp +1',
        Head = 'Walkure Mask',
        Neck = 'Shield Pendant',
        Ear1 = 'Physical Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Sha\'ir Manteel',
        Hands = 'Dusk Gloves',
        Ring1 = 'Minstrel\'s Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Gigant Mantle',
        Waist = 'Powerful Rope',
        Legs = 'Custom Slacks',
        Feet = 'Custom M Boots',
    },
    Casting = { -- Default Casting Equipment when using Idle sets
        Main = 'Terra\'s Staff',
        Range = 'Mythic Harp +1',
        Neck = 'Evasion Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Head = 'Darksteel Cap +1',
        Body = 'Crow Jupon',
        Hands = 'Crow Bracers',
        Ring1 = 'Ether Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Powerful Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Crow Gaiters',
    },
    SIRD = { -- 102% to Cap, used on Stoneskin, Blink, Aquaveil and Utsusemi casts
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
    },

    Sing_Buff = {
    },
    Sing_Debuff = {
        Main = 'Terra\'s Staff',
        Head = 'Demon Helm',
        Neck = 'Wind Torque',
        Ear1 = 'Singing Earring',
        Ear2 = 'Melody Earring +1',
        Body = 'Errant Hpl.',
        Hands = 'Choral Cuffs',
        Ring1 = 'Angel\'s Ring',
        Ring2 = 'Angel\'s Ring',
        Back = 'Jester\'s Cape +1',
        Waist = 'Corsette +1',
        Legs = 'Mahatma Slops',
        Feet = 'Dance Shoes',
    },

    Sing_Default = {
        Range = 'Crumhorn +1',
    },
    Sing_PaeonMazurka = {
        Range = 'Ebony Harp',
    },
    Sing_Valor = {
        Range = 'Cornette +1',
    },
    Sing_March = {
        Range = 'Faerie Piccolo',
    },
    Sing_Madrigal = {
        Range = 'Traversiere +1',
    },
    Sing_Elegy = {
        Range = 'Horn +1',
        Main = 'Terra\'s Staff',
    },
    Sing_Lullaby = {
        Range = 'Mary\'s Horn',
        Main = 'Apollo\'s Staff',
    },
    Sing_FinaleRequiem = {
        Range = 'Flute +1',
        Main = 'Apollo\'s Staff',
    },
    Sing_Carol = {
        Range = 'Crumhorn +1',
        Main = 'Terra\'s Staff',
    },
    Sing_Mambo = {
        Range = 'Crumhorn +1',
        Main = 'Terra\'s Staff',
    },
    Sing_Prelude = {
        Range = 'Crumhorn +1',
        Main = 'Terra\'s Staff',
    },
    Sing_Threnody = {
        Range = 'Crumhorn +1',
    },

    Cure = {
        Main = 'Apollo\'s Staff',
        Head = 'Crow Beret',
        Neck = 'Justice Badge',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Crow Jupon',
        Hands = 'Crow Bracers',
        Ring1 = 'Sapphire Ring',
        Ring2 = 'Sapphire Ring',
        Back = 'Mist Silk Cape',
        Waist = 'Powerful Rope',
        Legs = 'Crow Hose',
        Feet = 'Crow Gaiters',
    },
    Cursna = {},

    Enhancing = {},
    Stoneskin = {
        Main = 'Apollo\'s Staff',
        Head = 'Demon Helm',
        Neck = 'Wind Torque',
        Ear1 = 'Singing Earring',
        Ear2 = 'Melody Earring +1',
        Body = 'Errant Hpl.',
        Hands = 'Zealot\'s Mitts',
        Ring1 = 'Sapphire Ring',
        Ring2 = 'Sapphire Ring',
        Back = 'Mist Silk Cape',
        Waist = 'Swift Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Errant Pigaches',
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

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    FallbackSub = { -- Used only when you do not have complete staff sets
    },
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
    gcmage.DoDefault(ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, rdmSJMaxMP)

    local player = gData.GetPlayer()
    if (minstrels_earring and player.HPP <= 25) then
        gFunc.Equip(minstrels_earring_slot, 'Minstrel\'s Earring')
    end
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)

    local action = gData.GetAction()
    if (action.Type == 'Bard Song') then
        gFunc.EquipSet(sets.Precast_Songs)
    end
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, rdmSJMaxMP)

    local action = gData.GetAction()
    if (action.Type == 'Bard Song') then
        if string.match(action.Name, 'Valor') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Valor)
        elseif string.match(action.Name, 'March') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_March)
        elseif string.match(action.Name, 'Madrigal') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Madrigal)
        elseif string.match(action.Name, 'Carol') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Carol)
        elseif string.match(action.Name, 'Mambo') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Mambo)
        elseif string.match(action.Name, 'Prelude') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Prelude)
        elseif string.match(action.Name, 'Threnody') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Threnody)
        elseif string.match(action.Name, 'Elegy') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Elegy)
        elseif string.match(action.Name, 'Lullaby') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Lullaby)
        elseif (action.Name == 'Magic Finale') or string.match(action.Name, 'Requiem') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_FinaleRequiem)
        elseif (action.Name == 'Chocobo Mazurka') or string.match(action.Name, 'Paeon') then
            gFunc.EquipSet(sets.Sing_Paeon)
        else
            gFunc.EquipSet(sets.Sing_Default)
        end
    end
end

return profile
