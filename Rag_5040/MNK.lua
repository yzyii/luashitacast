local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local sets = {
    Idle = {
        Main = 'T.M. Hooks +2',
        Ammo = 'Orphic Egg',
        Head = 'Mrc.Cpt. Headgear',
        Neck = 'Peacock Amulet',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Jujitsu Gi',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Woodsman Ring',
        Back = '',
        Waist = 'Brown Belt',
        Legs = 'Republic Subligar',
        Feet = 'Fuma Kyahan',
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
    Evasion = {},

    Precast = {},
    SIRD = { -- 102% to Cap
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Main = 'T.M. Hooks +2',
        Ammo = 'Orphic Egg',
        Head = 'Mrc.Cpt. Headgear',
        Neck = 'Peacock Amulet',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Jujitsu Gi',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Woodsman Ring',
        Back = '',
        Waist = 'Brown Belt',
        Legs = 'Republic Subligar',
        Feet = 'Fuma Kyahan',
    },
    TP_HighAcc = {
        Main = 'T.M. Hooks +2',
        Ammo = 'Orphic Egg',
        Head = 'Mrc.Cpt. Headgear',
        Neck = 'Peacock Amulet',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Jujitsu Gi',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Woodsman Ring',
        Back = '',
        Waist = 'Brown Belt',
        Legs = 'Republic Subligar',
        Feet = 'Fuma Kyahan',
    },

    WS = {
        Main = 'T.M. Hooks +2',
        Ammo = 'Orphic Egg',
        Head = 'Mrc.Cpt. Headgear',
        Neck = 'Peacock Amulet',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Jujitsu Gi',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Woodsman Ring',
        Back = '',
        Waist = 'Brown Belt',
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
    -- You may add logic here
end

profile.OnUnload = function()
    gcmelee.Unload()
    -- You may add logic here
end

profile.HandleCommand = function(args)
    gcmelee.DoCommands(args)
    -- You may add logic here
end

profile.HandleDefault = function()
    gcmelee.DoDefault()
    -- You may add logic here
    gcmelee.DoDefaultOverride()
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
    -- You may add logic here
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
    -- You may add logic here
end

return profile
