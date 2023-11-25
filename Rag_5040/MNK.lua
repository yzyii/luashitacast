local profile = {}

local fastCastValue = 0.00 -- 0% from gear

-- Replace these with '' if you do not have them
local temple_gaiters = 'Temple Gaiters'
local temple_gloves = 'Temple Gloves'
local temple_cyclas = 'Temple Cyclas'
local temple_crown = 'Temple Crown'

local sets = {
    Idle = {
        Main = 'Spartan Cesti',
        Ammo = 'Tiphia Sting',
        Head = 'Temple Crown',
        Neck = 'Peacock Amulet',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Scp. Harness +1',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Victory Ring',
        Ring2 = 'Victory Ring',
        Back = 'Amemet Mantle +1',
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
    WaterRes = {},
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
        Feet = 'Fuma Kyahan',
    },
    TP_HighAcc = {
        Feet = 'Fuma Kyahan',
    },

    WS = {
        Feet = 'Fed. Kyahan',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

profile.HandleAbility = function()
    local action = gData.GetAction()

    if (action.Name == 'Dodge' and temple_gaiters ~= '') then
        gFunc.Equip('Feet', temple_gaiters)
    end
    if (action.Name == 'Boost' and temple_gloves ~= '') then
        gFunc.Equip('Hands', temple_gloves)
    end
    if (action.Name == 'Chakra' and temple_cyclas ~= '') then
        gFunc.Equip('Body', temple_cyclas)
    end
    if (action.Name == 'Focus' and temple_crown ~= '') then
        gFunc.Equip('Head', temple_crown)
    end
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
