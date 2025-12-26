local profile = {}

local fastCastValue = 0.07 -- 7% from gear listed in Precast set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

local use_chaos_burgeonet_for_tp_during_souleater = true

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local karin_obi = {
    Waist = 'Karin Obi',
}
local dorin_obi = {
    -- Waist = 'Dorin Obi',
}
local suirin_obi = {
    -- Waist = 'Suirin Obi',
}
local furin_obi = {
    -- Waist = 'Furin Obi',
}
local hyorin_obi = {
    Waist = 'Hyorin Obi',
}
local rairin_obi = {
    Waist = 'Rairin Obi',
}
local korin_obi = {
    Waist = 'Korin Obi',
}
local anrin_obi = {
    Waist = 'Anrin obi',
}

local parade_gorget = {
    Neck = 'Parade Gorget',
}
local fenrirs_stone = {
    Ammo = 'Fenrir\'s Stone',
}

local sets = {
    Idle = {
        Main = 'Tredecim Scythe',
        Ammo = 'Bomb Core',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Vampire Cloak',
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = 'Shadow Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = { -- 1365
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Range = 'Rosenbogen',
        Ammo = 'displaced',
        Head = 'displaced',
        Body = 'Vampire Cloak',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Cassie Earring', Priority = 100 },
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = 'Shadow Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleDT = {
        Head = 'Darksteel Cap +1', -- 2
        Neck = 'Evasion Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1', -- 4
        Hands = 'Heavy Gauntlets', -- 3
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = { Name = 'Sattva Ring', Priority = 100 }, -- 5
        Back = 'Shadow Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Dst. Subligar +1', -- 3
        Feet = 'Dst. Leggings +1', -- 2
    },
    IdleALTDT = { -- 1365
        Head = 'Darksteel Cap +1', -- 2
        Neck = 'Evasion Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Cassie Earring', Priority = 100 },
        Body = 'Dst. Harness +1', -- 4
        Hands = 'Heavy Gauntlets', -- 3
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = { Name = 'Sattva Ring', Priority = 100 }, -- 5
        Back = 'Shadow Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Dst. Subligar +1', -- 3
        Feet = 'Dst. Leggings +1', -- 2
    },
    Resting = {
        Neck = 'Paisley Scarf',
        Ear2 = 'Sanative Earring',
    },
    Town = {},
    Movement = {
        Hands = 'Homam Manopolas',
        Legs = 'Blood Cuisses',
    },

    DT = {
        Head = 'Darksteel Cap +1', -- 2
        Neck = 'Evasion Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Cassie Earring', Priority = 100 },
        Body = 'Dst. Harness +1', -- 4
        Hands = 'Heavy Gauntlets', -- 3
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = { Name = 'Sattva Ring', Priority = 100 }, -- 5
        Back = 'Shadow Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Dst. Subligar +1', -- 3
        Feet = 'Dst. Leggings +1', -- 2
    },
    MDT = {
        Head = 'Darksteel Cap +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring', -- 2
        Body = 'Cor. Scale Mail +1', -- 4
        Hands = 'Coral Fng. Gnt. +1', -- 2
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 }, -- 5
        Back = 'Resentment Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Coral Cuisses +1', -- 3
        Feet = 'Coral Greaves +1', -- 2
    },
    FireRes = {
        Main = 'Neptune\'s Staff', -- 20
        Sub = 'displaced',
        Range = 'Rosenbogen',
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Tarasque Mitts +1', -- 6
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Dino Mantle', -- 4
        Waist = 'Water Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Power Sandals', -- 7
    },
    IceRes = {
        Main = 'Vulcan\'s Staff', -- 20
        Sub = 'displaced',
        Range = 'Rosenbogen',
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Feral Gloves', -- 4
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
        Back = 'Ram Mantle +1', -- 6
        Waist = 'Fire Belt', -- 20
        Legs = 'Feral Trousers', -- 6
        Feet = 'Blood Greaves', -- 21
    },
    LightningRes = {
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Range = 'Lightning Bow +1', -- 7
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Spinel Ring', -- 9
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Gaia Mantle +1', -- 12
        Waist = 'Earth Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Dst. Leggings +1',
    },
    EarthRes = {
        Main = 'Auster\'s Staff', -- 20
        Sub = 'displaced',
        Range = 'Rosenbogen',
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Robust Ring', -- 10
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Gaia Mantle +1', -- 10
        Waist = 'Wind Belt', -- 20
        Legs = 'Beak Trousers +1', -- 7
        Feet = 'Blood Greaves', -- 21
    },
    WindRes = {
        Main = 'Aquilo\'s Staff', -- 20
        Sub = 'displaced',
        Range = 'Rosenbogen',
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Emerald Ring', -- 9
        Ring2 = 'Malgust Ring', -- 10
        Back = 'Shadow Mantle',
        Waist = 'Ice Belt', -- 20
        Legs = 'Coral Cuisses +1',
        Feet = 'Blood Greaves', -- 21
    },
    WaterRes = {
        Main = 'Jupiter\'s Staff', -- 20
        Sub = 'displaced',
        Range = 'Rosenbogen',
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Coral Fng. Gnt. +1', -- 4
        Ring1 = 'Communion Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = 'Shadow Mantle',
        Waist = 'Lightning Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Coral Greaves +1', -- 4
    },
    Evasion = { -- Currently using this as a set for 2H Zergs. See README.md
        Main = 'Octave Club',
        Sub = 'Wyvern Targe',
        Ammo = 'Happy Egg',
        Head = 'Homam Zucchetto',
        Neck = 'Shield Pendant',
        Ear1 = 'Wyvern Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Gloom Breastplate',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Gigant Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },

    Precast = {
        Ear1 = 'Loquac. Earring',
        Legs = 'Homam Cosciales',
    },
    SIRD = { -- Only used for Idle sets and not while Override sets are active
        Head = { Name = 'Aegishjalmr', Priority = 100 },
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Magnetic Earring', -- 8
        Ear2 = 'Knightly Earring', -- 9
        Legs = { Name = 'Homam Cosciales', Priority = 100 },
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = { -- Used for Utsusemi and Stun cooldown
        Head = { Name = 'Ace\'s Helm', Priority = -1 },
        Body = 'Dst. Harness +1',
        Hands = { Name = 'Dusk Gloves +1', Priority = 100 },
        Waist = 'Sonic Belt',
        Legs = { Name = 'Homam Cosciales', Priority = 100 },
        Feet = { Name = 'Homam Gambieras', Priority = 100 },
    },

    Hate = {
        Main = 'Octave Club', -- lul
        Sub = 'Koenig Shield', -- 3
        Head = { Name = 'Aegishjalmr', Priority = 100 },
        Neck = 'Harmonia\'s Torque', -- 3
        Ear1 = 'Hades Earring +1', -- 2
        Ear2 = { Name = 'Cassie Earring', Priority = 100 },
        Body = { Name = 'Hydra Haubert', Priority = -100 }, -- 9
        Hands = { Name = 'Hydra Moufles', Priority = -100 }, -- 6
        Ring1 = 'Mermaid Ring', -- 2
        Ring2 = { Name = 'Sattva Ring', Priority = 100 }, -- 5
        Back = { Name = 'Gigant Mantle', Priority = 100 },
        Waist = 'Warwolf Belt', -- 3
        Legs = { Name = 'Hydra Brayettes', Priority = -100 }, -- 6
        Feet = { Name = 'Hydra Sollerets', Priority = -100 }, -- 4
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Head = 'Ace\'s Helm',
        Neck = 'Justice Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Abyssal Earring',
        Body = 'Haubergeon +1',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {},
    TP_Aftermath_Mjollnir_Haste = {},
    TP_HighAcc = {
        Neck = 'Peacock Amulet',
        Back = 'Abyss Cape',
    },

    WS = {
        Head = 'Maat\'s Cap',
        Neck = 'Snow Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Abyssal Earring',
        Body = 'Haubergeon +1',
        Hands = 'Chs. Gauntlets +1',
        Ring1 = 'Triumph Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Onyx Cuisses',
        Feet = 'Chs. Sollerets +1',
    },
    WS_HighAcc = {},

    WS_Guillotine = {},
    WS_SpinningSlash = {},
    WS_CrossReaper = {},

    WeaponBash = {
        Hands = 'Chs. Gauntlets +1',
    },
    ArcaneCircle = {
        Feet = 'Chs. Sollerets +1',
    },
    SoulEater = {
        Head = 'Chs. Burgeonet +1',
    },
    Nuke = {},
    Enfeebling = {},
    Drain = {
        Ammo = 'Phtm. Tathlum',
        Head = { Name = 'Chs. Burgeonet +1', Priority = 100 },
        Neck = 'Dark Torque',
        Ear1 = 'Dark Earring',
        Ear2 = 'Abyssal Earring',
        Body = 'Dst. Harness +1',
        Hands = { Name = 'Blood Fng. Gnt.', Priority = 100 },
        Ring1 = 'Omniscient Ring',
        Ring2 = 'Overlord\'s Ring',
        Back = 'Merciful Cape',
        Waist = 'Sonic Belt',
        Legs = 'Abs. Flanchard +1',
        Feet = 'Mountain Gaiters',
    },
    Absorb = {
        Ring2 = 'Snow Ring',
    },

    Weapon_Loadout_1 = {
        Main = 'Tredecim Scythe',
        Ammo = 'Bomb Core',
    },
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},
}

profile.SetMacroBook = function()
    -- AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    -- AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

sets.karin_obi = karin_obi
sets.dorin_obi = dorin_obi
sets.suirin_obi = suirin_obi
sets.furin_obi = furin_obi
sets.hyorin_obi = hyorin_obi
sets.rairin_obi = rairin_obi
sets.korin_obi = korin_obi
sets.anrin_obi = anrin_obi
sets.parade_gorget = parade_gorget
sets.fenrirs_stone = fenrirs_stone
profile.Sets = gcmelee.AppendSets(sets)

local NukeObiOwnedTable = {
    ['Fire'] = 'karin_obi',
    ['Earth'] = 'dorin_obi',
    ['Water'] = 'suirin_obi',
    ['Wind'] = 'furin_obi',
    ['Ice'] = 'hyorin_obi',
    ['Thunder'] = 'rairin_obi',
    ['Light'] = 'korin_obi',
    ['Dark'] = 'anrin_obi'
}

local WeakElementTable = {
    ['Fire'] = 'Water',
    ['Earth'] = 'Wind',
    ['Water'] = 'Thunder',
    ['Wind'] = 'Ice',
    ['Ice'] = 'Fire',
    ['Thunder'] = 'Earth',
    ['Light'] = 'Dark',
    ['Dark'] = 'Light'
}

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()

    if (gcdisplay.GetToggle('Hate')) then
        gFunc.EquipSet(sets.Hate)
    end

    if (action.Name == 'Weapon Bash') then
        gFunc.EquipSet(sets.WeaponBash)
    elseif (action.Name == 'Arcane Circle') then
        gFunc.EquipSet(sets.ArcaneCircle)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

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
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'hate'})
    gcdisplay.CreateToggle('Hate', false)
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'hate'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'hate') then
        gcdisplay.AdvanceToggle('Hate')
        gcinclude.Message('Hate', gcdisplay.GetToggle('Hate'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)

    local player = gData.GetPlayer()
    local souleater = gData.GetBuffCount('Souleater')
    if (souleater > 0 and player.Status == 'Engaged' and use_chaos_burgeonet_for_tp_during_souleater) then
        gFunc.EquipSet(sets.SoulEater)
    end

    if (player.Status == 'Idle') then
        if (player.HPP >= 85) then
            gFunc.EquipSet('parade_gorget')
        end
    end

    local environment = gData.GetEnvironment()

    gcmelee.DoDefaultOverride()
    if (gcdisplay.IdleSet == 'Evasion' and (environment.Time >= 6 and environment.Time < 18)) then
        gFunc.EquipSet('fenrirs_stone')
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
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
    end

    if (ObiCheck(action)) then
        local obiOwned = NukeObiOwnedTable[action.Element]
        gFunc.EquipSet(obiOwned)
    end

    if (action.Skill ~= 'Ninjutsu' and gcdisplay.GetToggle('Hate')) then
        gFunc.EquipSet(sets.Hate)
    end

    if (string.contains(action.Name, 'Stun')) then
        gFunc.EquipSet(sets.Haste)
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
