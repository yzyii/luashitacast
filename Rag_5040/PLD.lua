local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local parade_gorget = true

local hercules_ring = false
local hercules_ring_slot = 'Ring2'

-- Replace these with '' if you do not have them
local gallant_leggings = ''
local valor_coronet = ''
local valor_gauntlets = ''
local valor_leggings = ''

local sets = {
    Idle = {
        --Head = 'displaced',
        --Body = 'Royal Cloak',
        Head = 'Alumine Salade',
        Body = 'Haubergeon',
        Neck = 'Peacock Amulet',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Hands = 'Enkelados\'s Brc.',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Sattva Ring',
        Back = 'High Brth. Mantle',
        Waist = 'Life Belt',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Gallant Leggings',
    },
    IdleALT = {},
    Resting = {},
    Town = {},
    Movement = {},

    DT = {},
    MDT = {},
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {},
    SIRD = { -- 102% to Cap
        Waist = 'Silver Obi +1',
    },
    Haste = {
        Head = 'Gallant Coronet',
        Ear1 = 'Hospitaler Earring',
        Waist = 'Swift Belt',
        Hands = 'Gallant Gauntlets',
    },
    Haste_Ichi = { -- Optional, provided here only if you wish to mix in SIRD or other stats over max haste
    },

    Hate = {
        Head = 'Gallant Coronet',
        Body = 'Haubergeon',
        Ear1 = 'Hospitaler Earring',
        Hands = 'Gallant Gauntlets',
    },
    Hate_Flash = { -- Optional, provided here only if you wish to mix in haste or other stats over max +enmity
    },
    Cheat_C3HPDown = {},
    Cheat_C4HPDown = {},
    Cheat_HPUp = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {},
    TP_HighAcc = {},

    WS = {},
    WS_Spirits = {},

    Cover = {
        Head = 'Gallant Coronet',
        Body = 'Haubergeon',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 3')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.HandleAbility = function()
    gFunc.EquipSet(sets.Hate)

    local action = gData.GetAction()
    if (action.Name == 'Holy Circle' and gallant_leggings ~= '') then
        gFunc.Equip('Legs', gallant_leggings)
    elseif (action.Name == 'Rampart' and valor_coronet ~= '') then
        gFunc.Equip('Head', valor_coronet)
    elseif (action.Name == 'Shield Bash' and valor_gauntlets ~= '') then
        gFunc.Equip('Hands', valor_gauntlets)
    elseif (action.Name == 'Sentinel' and valor_leggings ~= '') then
        gFunc.Equip('Legs', valor_leggings)
    elseif (action.Name == 'Cover') then
        gFunc.EquipSet(sets.Cover)
        if (valor_surcoat ~= '') then
            gFunc.Equip('Body', valor_surcoat)
        end
    end
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

    local action = gData.GetAction()
    if (action.Name == 'Spirits Within') then
        gFunc.EquipSet(sets.WS_Spirits)
    end
end

profile.OnLoad = function()
    gcmelee.Load()
    gcmelee.SetIsDPS(false)
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

    local player = gData.GetPlayer()
    if (parade_gorget and player.HPP >= 85) then
        gFunc.Equip('Neck', 'Parade Gorget')
    end

    if (hercules_ring and player.HPP <= 50) then
        gFunc.Equip(hercules_ring_slot, 'Hercules\' Ring')
    end

    local cover = gData.GetBuffCount('Cover')
    if (cover >= 1) then
        gFunc.EquipSet(sets.Cover)
        if (valor_surcoat ~= '') then
            gFunc.Equip('Body', valor_surcoat)
        end
    end

    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local target = gData.GetActionTarget()
    local action = gData.GetAction()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

    if (action.Skill ~= 'Ninjutsu') then
        local sentinel = gData.GetBuffCount('Sentinel')
        if (sentinel >= 1) then
            gFunc.EquipSet(sets.Haste)
        else 
            gFunc.EquipSet(sets.Hate)
            if (action.Name == 'Flash') then
                gFunc.EquipSet(sets.Hate_Flash)
            end
        end
    else
        if (action.Name == 'Utusemi: Ichi') then
            gFunc.EquipSet(sets.Haste_Ichi)
        end
    end

    if (target.Name == me) then
        if (action.Name == 'Cure III') then
            gFunc.InterimEquipSet(sets.Cheat_C3HPDown)
            gFunc.EquipSet(sets.Cheat_HPUp)
        elseif (action.Name == 'Cure IV') then
            gFunc.InterimEquipSet(sets.Cheat_C4HPDown)
            gFunc.EquipSet(sets.Cheat_HPUp)
        end
    end
end

return profile
