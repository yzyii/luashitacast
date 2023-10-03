--[[
    This is provided purely as an example template. Only very basic sanity testing has been done.
]]

local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local sets = {
    Idle = {
        Main = 'Impact Knuckles',
        Ammo = 'Happy Egg',
        Head = 'Mrc.Cpt. Headgear',
        Neck = 'Spike Necklace',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Power Gi',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Venerer Ring',
        Ring2 = 'Courage Ring',
        Back = '',
        Waist = 'Purple Belt',
        Legs = 'Republic Subligar',
        Feet = 'Fed. Kyahan',
    },
    IdleALT = {},
    Resting = {},
    Town = {},
    Movement = {},

    DT = {},
    MDT = { -- Shell IV provides 23% MDT
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},

    Precast = {},
    SIRD = { -- 102% to Cap
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

	TP_LowAcc = {
        Main = 'Impact Knuckles',
        Ammo = 'Happy Egg',
        Head = 'Mrc.Cpt. Headgear',
        Neck = 'Spike Necklace',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Power Gi',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Venerer Ring',
        Ring2 = 'Courage Ring',
        Back = '',
        Waist = 'Purple Belt',
        Legs = 'Republic Subligar',
        Feet = 'Fed. Kyahan',
    },
    TP_HighAcc = {
        Main = 'Impact Knuckles',
        Ammo = 'Happy Egg',
        Head = 'Mrc.Cpt. Headgear',
        Neck = 'Spike Necklace',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Power Gi',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Venerer Ring',
        Ring2 = 'Courage Ring',
        Back = '',
        Waist = 'Purple Belt',
        Legs = 'Republic Subligar',
        Feet = 'Fed. Kyahan',
    },

    WS = {
        Head = 'Mrc.Cpt. Headgear',
        Neck = 'Spike Necklace',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Power Gi',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Courage Ring',
        Ring2 = 'Courage Ring',
        Back = '',
        Waist = 'Purple Belt',
        Legs = 'Republic Subligar',
        Feet = 'Fed. Kyahan',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

profile.HandleAbility = function()
    -- You may add logic here
end

profile.HandleItem = function()
    -- You may add logic here
end

profile.HandlePreshot = function()
    -- You may add logic here
end

profile.HandleMidshot = function()
    -- You may add logic here
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)
    -- You may add logic here
end

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.OnLoad = function()
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
end

profile.HandleCommand = function(args)
    gcmelee.DoCommands(args)
end

profile.HandleDefault = function()
    gcmelee.DoDefault()
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
end

return profile
