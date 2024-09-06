-- TODO probably upon request, DRK tanking. Feel free to DM me.

local use_chaos_burgeonet_for_tp_during_souleater = true

local profile = {}

local fastCastValue = 0.02 -- 2% from gear

local sets = {
    Idle = {
        Main = 'Tredecim Scythe',
        Ammo = 'Bomb Core',
        Neck = 'Parade Gorget',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Vampire Cloak',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Blood Greaves',
    },
    IdleALT = {},
    Resting = {
        Neck = 'Paisley Scarf',
        Ear2 = 'Sanative Earring',
    },
    Town = {
        Main = 'Tredecim Scythe',
        Ammo = 'Bomb Core',
        Head = 'Homam Zucchetto',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Abyssal Earring',
        Body = 'Haubergeon',
        Hands = 'Homam Manopolas',
        Ring1 = 'Blitz Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Homam Gambieras',
    },
    Movement = {
        Hands = 'Homam Manopolas',
        Legs = 'Blood Cuisses',
    },

    DT = {
        Main = 'Tredecim Scythe',
        Ammo = 'Bomb Core',
        Head = 'Darksteel Cap +1',
        Neck = 'Evasion Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    MDT = { -- Shell IV provides 23% MDT
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = { -- Use this set for your zerg set. See README.md
        Ammo = 'Happy Egg',
        Head = 'Homam Zucchetto',
        Neck = 'Shield Pendant',
        Ear1 = 'Wyvern Earring',
        Ear2 = 'Bloodbead Earring',
        Body = 'Gloom Breastplate',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Blitz Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Gigant Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },

    Precast = {
        Ear1 = 'Loquac. Earring',
    },
    SIRD = {
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Magnetic Earring', -- 8
        Ear2 = 'Knightly Earring', -- 9
        Waist = 'Silver Obi +1', -- 8
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = { -- Used for Utsusemi and Stun cooldown
        Head = 'Homam Zucchetto',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Blitz Ring',
        Waist = 'Sonic Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Main = 'Tredecim Scythe',
        Ammo = 'Bomb Core',
        Head = 'Homam Zucchetto',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Abyssal Earring',
        Body = 'Haubergeon',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Blitz Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    TP_HighAcc = {},

    WS = {
        Main = 'Tredecim Scythe',
        Ammo = 'Bomb Core',
        Head = 'Chaos Burgeonet',
        Neck = 'Snow Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Abyssal Earring',
        Body = 'Haubergeon',
        Hands = 'Chaos Gauntlets',
        Ring1 = 'Triumph Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Black Cuisses',
        Feet = 'Chaos Sollerets',
    },
    WS_Guillotine = {},
    WS_SpinningSlash = {},
    WS_CrossReaper = {},

    WeaponBash = {
        Hands = 'Chaos Gauntlets',
    },
    ArcaneCircle = {
        Feet = 'Chaos Sollerets',
    },
    SoulEater = {
        Head = 'Chaos Burgeonet',
    },
    Nuke = {},
    Enfeebling = {},
    Drain = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Chaos Burgeonet',
        Neck = 'Dark Torque',
        Ear1 = 'Dark Earring',
        Ear2 = 'Abyssal Earring',
        Body = 'Black Cotehardie',
        Hands = 'Blood Fng. Gnt.',
        Ring1 = 'Omniscient Ring',
        Ring2 = 'Overlord\'s Ring',
        Back = 'Merciful Cape',
        Waist = 'Sonic Belt',
        Legs = 'Abyss Flanchard',
        Feet = 'Mountain Gaiters',
    },
    Absorb = {
        Ring2 = 'Snow Ring',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 4')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

local NukeObiTable = {
    ['Fire'] = 'Karin Obi',
    ['Earth'] = 'Dorin Obi',
    ['Water'] = 'Suirin Obi',
    ['Wind'] = 'Furin Obi',
    ['Ice'] = 'Hyorin Obi',
    ['Thunder'] = 'Rairin Obi',
    ['Dark'] = 'Anrin Obi'
}

local NukeObiOwnedTable = {
    ['Fire'] = karin_obi,
    ['Earth'] = dorin_obi,
    ['Water'] = suirin_obi,
    ['Wind'] = furin_obi,
    ['Ice'] = hyorin_obi,
    ['Thunder'] = rairin_obi,
    ['Dark'] = anrin_obi
}

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

    -- Assumes you are using Evasion set as your zerg set.
    if (gcdisplay.IdleSet == 'Evasion') then
        gFunc.EquipSet(sets.Evasion)
    end

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
        end

        if (ObiCheck(action)) then
            local obi = NukeObiTable[action.Element]
            local obiOwned = NukeObiOwnedTable[action.Element]
            if (obiOwned) then
                gFunc.Equip('Waist', obi)
            end
        end

        if (string.contains(action.Name, 'Stun')) then
            gFunc.EquipSet(sets.Haste)
        end
    end
end

function ObiCheck(action)
    local element = action.Element
    local environment = gData.GetEnvironment()
    local weakElement = WeakElementTable[element]

    if environment.WeatherElement == element then
        return environment.Weather:match('x2') or environment.DayElement ~= weakElement
    end

    return environment.DayElement == element and environment.WeatherElement ~= weakElement
end

return profile
