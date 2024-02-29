local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local ta_rogue_armlets = true

local sets = {
    Idle = {},
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

    TP_LowAcc = {},
    TP_HighAcc = {},

    WS = {},
    WS_Evisceration = {},
    WS_SharkBite = {},

    SA = {},
    TA = {},
    SATA = {},

    Flee = {},
    Steal = {},
    Mug = {},

    TH = {},

    Ranged = {},
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
    local action = gData.GetAction()
    if (action.Name == 'Flee') then
        gFunc.EquipSet(sets.Flee)
    elseif (action.Name == 'Steal') then
        gFunc.EquipSet(sets.Steal)
    elseif (action.Name == 'Mug') then
        gFunc.EquipSet(sets.Mug)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    -- You may add logic here
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Ranged)
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)

    local action = gData.GetAction()
    if (action.Name == 'Evisceration') then
        gFunc.EquipSet(sets.WS_Evisceration)
    elseif (action.Name == 'Shark Bite') then
        gFunc.EquipSet(sets.WS_SharkBite)
    end

    local ta = gData.GetBuffCount('Trick Attack')
    if (ta == 1) then
        if (ta_rogue_armlets) then
            gFunc.Equip('Hands', 'Rogue\'s Armlets +1')
        end
    end
end

profile.OnLoad = function()
    gcmelee.Load()
    profile.SetMacroBook()

    gcinclude.SetAlias(T{'th'})
    local function createToggle()
        gcdisplay.CreateToggle('TH', false)
    end
    createToggle:once(2)
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'th'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'th') then
        gcdisplay.AdvanceToggle('TH')
        gcinclude.Message('TH', gcdisplay.GetToggle('TH'))
    else
        gcmelee.DoCommands(args)
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()
    gcmelee.DoDefaultOverride()

    if (gcdisplay.GetToggle('TH')) then
        gFunc.EquipSet(sets.TH)
    end

    local sa = gData.GetBuffCount('Sneak Attack')
    local ta = gData.GetBuffCount('Trick Attack')

    if (sa == 1) and (ta == 1) then
        gFunc.EquipSet(sets.SATA)
    elseif (sa == 1) then
        gFunc.EquipSet(sets.SA)
    elseif (ta == 1) then
        gFunc.EquipSet(sets.TA)
    end
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
end

return profile
