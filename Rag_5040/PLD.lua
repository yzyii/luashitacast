local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local parade_gorget = true

local hercules_ring = true
local hercules_ring_slot = 'Ring2'

-- Replace these with '' if you do not have them
local gallant_coronet = 'Gallant Coronet'
local gallant_leggings = 'Gallant Leggings'
local valor_coronet = 'Valor Coronet'
local valor_surcoat = 'Valor Surcoat'
local valor_gauntlets = 'Valor Gauntlets'
local valor_leggings = 'Valor Leggings'

local sets = {
    Idle = {},
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
    },
    Haste = {},
    Haste_Ichi = {},

    Hate = {},
    Hate_Flash = {},
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
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
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
        if (gallant_coronet ~= '') then
            gFunc.Equip('Head', gallant_coronet)
        end
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
        if (gallant_coronet ~= '') then
            gFunc.Equip('Head', gallant_coronet)
        end
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
        gFunc.EquipSet(sets.Hate)
        if (action.Name == 'Flash') then
            gFunc.EquipSet(sets.Hate_Flash)
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
