local profile = {}

local fastCastValue = 0.00 -- 0% from gear

-- Replace these with '' if you do not have them
local temple_gaiters = 'Temple Gaiters'
local temple_gloves = 'Temple Gloves'
local temple_cyclas = 'Temple Cyclas'
local temple_crown = 'Temple Crown'

local melee_gaiters = 'Melee Gaiters'
local melee_gloves = 'Melee Gloves'

local sets = {
    Idle = {
        Main = 'Wagh Baghnakhs',
        Ammo = 'Tiphia Sting',
        Head = 'Panther Mask',
        Neck = 'Peacock Amulet',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Scp. Harness +1',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Brown Belt',
        Legs = 'Temple Hose',
        Feet = 'Fuma Kyahan',
    },
    IdleALT = {},
    Resting = {
        Body = 'Melee Cyclas',
	},
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
        Head = 'Panther Mask',
        Neck = 'Peacock Amulet',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Scp. Harness +1',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Brown Belt',
        Legs = 'Temple Hose',
        Feet = 'Fuma Kyahan',
    },
    TP_HighAcc = {
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Scp. Harness +1',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Brown Belt',
        Legs = 'Temple Hose',
        Feet = 'Fuma Kyahan',
    },

    TP_Focus = {
        Head = 'Panther Mask',
        Neck = 'Peacock Amulet',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Scp. Harness +1',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Brown Belt',
        Legs = 'Temple Hose',
        Feet = 'Fuma Kyahan',
    },

    WS = {
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ring1 = 'Victory Ring',
        Ring2 = 'Victory Ring',
        Feet = 'Fed. Kyahan',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 2')
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
    if (action.Name == 'Counterstance' and melee_gaiters ~= '') then
        gFunc.Equip('Feet', melee_gaiters)
    end
    if (action.Name == 'Chakra' and melee_gloves ~= '') then
        gFunc.Equip('Hands', melee_gloves)
    end

    -- TODO Jump Logic
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)
    -- TODO WS Logic
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

    local focus = gData.GetBuffCount('Focus')
    if (focus == 1 and gcdisplay.IdleSet == 'LowAcc') then
        gFunc.EquipSet(sets.TP_Focus)
    end

    -- TODO Counter Kampfer and SJ Logic
    gcmelee.DoDefaultOverride()
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
end

return profile
