local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local parade_gorget = true
local gallant_leggings = true
local valor_coronet = true
local valor_gauntlets = true
local valor_leggings = true

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
    Evasion = {},

    Precast = {},
    SIRD = { -- 102% to Cap
    },
    Haste = {},

    Hate = {},
    Cheat_C3HPDown = {},
    Cheat_C4HPDown = {},
    Cheat_HPUp = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    WS = {},
    WS_Spirits = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

profile.HandleAbility = function()
    gFunc.EquipSet(sets.Hate);

    local action = gData.GetAction()

    if (action.Name == 'Holy Circle' and gallant_leggings) then
        gFunc.Equip('Legs', 'Gallant Leggings')
    elseif (action.Name == 'Rampart' and valor_coronet) then
        gFunc.Equip('Head', 'Valor Coronet')
    elseif (action.Name == 'Shield Bash' and valor_gauntlets) then
        gFunc.Equip('Hands', 'Valor Gauntlets')
    elseif (action.Name == 'Sentinel' and valor_leggings) then
        gFunc.Equip('Legs', 'Valor Leggings')
    end
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)

    if (action.Name == 'Spirits Within') then
        gFunc.EquipSet(sets.WS_Spirits)
    end
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

    local player = gData.GetPlayer()
    if (parade_gorget and player.HPP >= 85) then
        gFunc.Equip('Neck', 'Parade Gorget')
    end

    gcmelee.DoDefaultOverride()
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
        gFunc.EquipSet(sets.Hate);
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
