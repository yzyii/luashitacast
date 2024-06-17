local use_chaos_burgeonet_for_tp_during_souleater = false

local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local sets = {
    Idle = {
        Main = 'Horror Voulge',
        Ammo = 'Orphic Egg',
        Head = 'Alumine Salade',
        Neck = 'Peacock Amulet',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Alumine Haubert',
        Hands = 'Alumine Moufles',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Ram Mantle +1',
        Waist = 'Tilt Belt',
        Legs = 'Alumine Brayettes',
        Feet = 'Alumine Sollerets',
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
    Evasion = {}, -- Use this set for your zerg set. See README.md

    Precast = {},
    SIRD = { -- 102% to Cap
    },
    Haste = { -- Used for Utsusemi and Stun cooldown
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Main = 'Horror Voulge',
        Ammo = 'Orphic Egg',
        Head = 'Alumine Salade',
        Neck = 'Peacock Amulet',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Alumine Haubert',
        Hands = 'Alumine Moufles',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Ram Mantle +1',
        Waist = 'Tilt Belt',
        Legs = 'Alumine Brayettes',
        Feet = 'Alumine Sollerets',
    },
    TP_HighAcc = {},

    WS = {
        Main = 'Horror Voulge',
        Ammo = 'Orphic Egg',
        Head = 'Alumine Salade',
        Neck = 'Spike Necklace',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Alumine Haubert',
        Hands = 'Alumine Moufles',
        Ring1 = 'Puissance Ring',
        Ring2 = 'Puissance Ring',
        Back = 'Ram Mantle +1',
        Waist = 'Swordbelt +1',
        Legs = 'Alumine Brayettes',
        Feet = 'Alumine Sollerets',
    },
    WS_Guillotine = {},
    WS_SpinningSlash = {},
    WS_CrossReaper = {},

    WeaponBash = {},
    ArcaneCircle = {},
    SoulEater = {},
    Nuke = {},
    Enfeebling = {},
    Drain = {},
    Absorb = {},
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
    if (action.Name == 'Weapon Bash') then
        gFunc.EquipSet(sets.WeaponBash)
    elseif (action.Name == 'Arcane Circle') then
        gFunc.EquipSet(sets.ArcaneCircle)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
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

    local action = gData.GetAction()
    if (action.Name == 'Guillotine') then
        gFunc.EquipSet(sets.WS_Guillotine)
    elseif (action.Name == 'Spinning Slash') then
        gFunc.EquipSet(sets.WS_SpinningSlash)
    elseif (action.Name == 'Cross Reaper') then
        gFunc.EquipSet(sets.WS_CrossReaper)
    end

    -- Assumes you are using Evasion set as your zerg set.
    if (gcdisplay.IdleSet == 'Evasion') then
        gFunc.EquipSet(sets.Evasion)
    end

    local souleater = gData.GetBuffCount('Souleater')
    if (souleater > 0) then
        gFunc.EquipSet(sets.SoulEater)
    end

    gcmelee.DoFenrirsEarring()
end

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

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
    -- You may add logic here
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    local souleater = gData.GetBuffCount('Souleater')
    if (souleater > 0 and player.Status == 'Engaged' and use_chaos_burgeonet_for_tp_during_souleater) then
        gFunc.EquipSet(sets.SoulEater)
    end

    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
    -- You may add logic here
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local action = gData.GetAction()
    if (action.Skill == 'Elemental Magic') then
        gFunc.EquipSet(sets.Nuke)
    elseif (action.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Enfeebling)
    elseif (action.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.Drain)
        if (string.contains(action.Name, 'Absorb')) then
            gFunc.EquipSet(sets.Absorb)
        elseif (string.contains(action.Name, 'Stun')) then
            gFunc.EquipSet(sets.Haste)
        end
    end
end

return profile
