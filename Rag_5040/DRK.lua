local profile = {}

local fastCastValue = 0.07 -- 7% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

local use_chaos_burgeonet_for_tp_during_souleater = false

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
local fenrirs_stone = { -- Used on /evasion for Zergs. See Evasion set / README.md
    Ammo = 'Fenrir\'s Stone',
}

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Range = { Name = 'Rosenbogen', Priority = 60 },
        Ammo = 'displaced',
        Head = 'displaced',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Vampire Cloak',
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = {
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Range = { Name = 'Rosenbogen', Priority = 60 },
        Ammo = 'displaced',
        Head = 'displaced',
        Body = 'Vampire Cloak',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Cassie Earring', Priority = 20 },
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleDT = { -- Disabled on horizon_safe_mode
        Head = 'Darksteel Cap +1',
        Neck = { Name = 'Evasion Torque', Priority = 60 },
        Body = 'Dst. Harness +1',
        Ring1 = 'Jelly Ring',
    },
    IdleALTDT = { -- Disabled on horizon_safe_mode
        Head = 'Darksteel Cap +1',
        Neck = { Name = 'Evasion Torque', Priority = 60 },
        Body = 'Dst. Harness +1',
        Ring1 = 'Jelly Ring',
    },
    Resting = {
        Main = 'Pluto\'s Staff',
        Sub = 'displaced',
        Neck = { Name = 'Pch. Collar', Priority = 70 },
        Ear1 = 'Relaxing Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = 'Nomad\'s Tunica',
        Hands = 'Nomad\'s Gloves',
        Legs = 'Nomad\'s Hose',
        Feet = 'Nomad\'s Boots',
    },
    Town = {},
    Movement = {
        Legs = { Name = 'Blood Cuisses', Priority = 70 },
    },
    Movement_TP = {
        Hands = { Name = 'Homam Manopolas', Priority = 70 },
        Feet = { Name = 'Homam Gambieras', Priority = 70 },
    },

    DT = {
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Head = 'Darksteel Cap +1',
        Neck = { Name = 'Evasion Torque', Priority = 60 },
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Cassie Earring', Priority = 20 },
        Body = 'Dst. Harness +1', 
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Jelly Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    MDT = {
        Head = 'Coral Visor +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Cor. Scale Mail +1',
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Gigant Mantle', Priority = 60 },
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = 'Coral Cuisses +1',
        Feet = 'Coral Greaves +1',
    },
    FireRes = {
        Main = 'Neptune\'s Staff', -- 20
        Sub = 'displaced',
        Range = { Name = 'Rosenbogen', Priority = 60 },
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Triumph Earring', -- 11
        Ear2 = 'Triumph Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Tarasque Mitts +1', -- 6
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Dino Mantle', -- 4
        Waist = 'Water Belt', -- 20
        Legs = { Name = 'Blood Cuisses', Priority = 70 }, -- 21
        Feet = 'Power Sandals', -- 7
    },
    IceRes = {
        Main = 'Vulcan\'s Staff', -- 20
        Sub = 'displaced',
        Range = { Name = 'Rosenbogen', Priority = 60 },
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Omn. Earring', -- 11
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Feral Gloves', -- 4
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
        Back = 'Ram Mantle +1', -- 6
        Waist = 'Fire Belt', -- 20
        Legs = 'Feral Trousers', -- 6
        Feet = { Name = 'Blood Greaves', Priority = 70 }, -- 21
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
        Hands = { Name = 'Feronia\'s Bangles', Priority = 60 },
        Ring1 = 'Adroit Ring', -- 10
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Gaia Mantle +1', -- 12
        Waist = 'Earth Belt', -- 20
        Legs = { Name = 'Blood Cuisses', Priority = 70 }, -- 21
        Feet = { Name = 'Root Sabots', Priority = 60 },
    },
    EarthRes = {
        Main = 'Auster\'s Staff', -- 20
        Sub = 'displaced',
        Range = { Name = 'Rosenbogen', Priority = 60 },
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Sand Gloves', -- 11
        Ring1 = 'Robust Ring', -- 10
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Gaia Mantle +1', -- 10
        Waist = 'Wind Belt', -- 20
        Legs = 'Beak Trousers +1', -- 7
        Feet = { Name = 'Blood Greaves', Priority = 70 }, -- 21
    },
    WindRes = {
        Main = 'Aquilo\'s Staff', -- 20
        Sub = 'displaced',
        Range = { Name = 'Rosenbogen', Priority = 60 },
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Omn. Earring', -- 11
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Mage\'s Cuffs', -- 5
        Ring1 = 'Nimble Ring', -- 10
        Ring2 = 'Malgust Ring', -- 10
        Back = 'Wolf Mantle +1', -- 3
        Waist = 'Ice Belt', -- 20
        Legs = 'Mythril Cuisses +1', -- 3
        Feet = { Name = 'Blood Greaves', Priority = 70 }, -- 21
    },
    WaterRes = {
        Main = 'Jupiter\'s Staff', -- 20
        Sub = 'displaced',
        Range = { Name = 'Rosenbogen', Priority = 60 },
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = { Name = 'Scp. Mittens +1', Priority = 60 }, -- 7
        Ring1 = 'Communion Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = 'Wolf Mantle +1', -- 3
        Waist = 'Lightning Belt', -- 20
        Legs = { Name = 'Blood Cuisses', Priority = 70 }, -- 21
        Feet = { Name = 'Scp. Leggings +1', Priority = 60 }, -- 7
    },
    Evasion = { -- Currently using this as a set for 2H Zergs. See README.md
        Main = 'Octave Club',
        Sub = 'Wyvern Targe',
        Range = 'displaced',
        Ammo = { Name = 'Happy Egg', Priority = 60 },
        Head = { Name = 'Homam Zucchetto', Priority = 70 },
        Neck = { Name = 'Shield Pendant', Priority = 20 },
        Ear1 = 'Wyvern Earring',
        Ear2 = { Name = 'Cassie Earring', Priority = 20 },
        Body = 'Gloom Breastplate',
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Gigant Mantle', Priority = 60 },
        Waist = 'Sonic Belt',
        Legs = { Name = 'Homam Cosciales', Priority = 70 },
        Feet = { Name = 'Homam Gambieras', Priority = 70 },
    },
    Override = { -- An additional override set explicitly to be used for sets such as crafting, HELM, fishing, or any other special sets such as DRK 2HR, MNK Counter etc. n.b. Any unused Resist or Evasion set can be used similarly.
        Body = 'Field Tunica',
        Hands = 'Field Gloves',
        Legs = 'Field Hose',
        Feet = 'Field Boots'
    },

    Precast = {
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Legs = { Name = 'Homam Cosciales', Priority = 70 },
    },
    SIRD = { -- Override sets (Resistance / Evasion) take precedence if in use.
        Head = { Name = 'Aegishjalmr', Priority = 100 },
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Knightly Earring', -- 9
        Ear2 = { Name = 'Magnetic Earring', Priority = 1 }, -- 8
        Body = 'Dst. Harness +1',
        Back = 'Shadow Mantle',
        Legs = { Name = 'Homam Cosciales', Priority = 70 },
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = {
        Head = { Name = 'Ace\'s Helm', Priority = -100 },
        Neck = 'Willpower Torque',
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = 'Dst. Harness +1',
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring1 = 'Blitz Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = 'Sonic Belt',
        Legs = { Name = 'Homam Cosciales', Priority = 70 },
        Feet = { Name = 'Homam Gambieras', Priority = 70 },
    },
    Haste_Stun = {
        Main = 'Jupiter\'s Staff',
        Sub = 'displaced',
        Range = 'displaced',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Neck = 'Dark Torque',
        Ear2 = 'Dark Earring',
        Body = { Name = 'Demon\'s Harness', Priority = 10 },
        Ring2 = 'Omniscient Ring',
        Back = { Name = 'Merciful Cape', Priority = 50 },
    }
    Haste_Hate = {
        Main = 'Octave Club',
        Sub = 'Koenig Shield',
        Neck = 'Harmonia\'s Torque',
        Ear1 = { Name = 'Hades Earring +1', Priority = 50 },
        Ear2 = { Name = 'Cassie Earring', Priority = 20 },
        Body = { Name = 'Hydra Haubert', Priority = -100 },
        Back = 'Resentment Cape',
    },

    Hate = {
        Main = 'Octave Club',
        Sub = 'Koenig Shield',
        Head = { Name = 'Aegishjalmr', Priority = 60 },
        Neck = 'Harmonia\'s Torque',
        Ear1 = { Name = 'Hades Earring +1', Priority = 50 },
        Ear2 = { Name = 'Cassie Earring', Priority = 20 },
        Body = { Name = 'Hydra Haubert', Priority = -100 },
        Hands = { Name = 'Hydra Moufles', Priority = -100 },
        Ring1 = 'Mermaid Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Gigant Mantle', Priority = 60 },
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Hydra Brayettes', Priority = -100 },
        Feet = { Name = 'Hydra Sollerets', Priority = -100 },
    },

    TP_LowAcc = {
        Head = 'Ace\'s Helm',
        Neck = 'Justice Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Assault Earring',
        Body = 'Armada Hauberk',
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring1 = 'Triumph Ring',
        Ring2 = 'Blitz Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Sonic Belt',
        Legs = { Name = 'Homam Cosciales', Priority = 70 },
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 },
    },
    TP_Aftermath = {
        Head = 'Horus\'s Helm',
        Hands = 'Armada Mufflers',
        Ring2 = 'Triumph Ring',
        Legs = { Name = 'Armada Breeches', Priority = -10 },
        Feet = { Name = 'Armada Sollerets', Priority = -20 },
    },
    TP_Mjollnir_Haste = {
        Ring2 = 'Triumph Ring',
    },
    TP_Aftermath_Mjollnir_Haste = {
        Head = 'Maat\'s Cap',
        Legs = 'Onyx Cuisses',
    },
    TP_HighAcc = {
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Hands = { Name = 'Homam Manopolas', Priority = 70 },
        Ring1 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Back = 'Settler\'s Cape',
        Waist = 'Life Belt',
        Legs = { Name = 'Armada Breeches', Priority = -10 },
        Feet = { Name = 'Homam Gambieras', Priority = 70 }
    },
    TP_DRG = {
        Ear2 = 'Wyvern Earring',
        Ring2 = 'Triumph Ring',
    },
    TP_THF = {
        Ear2 = 'Pilferer\'s Earring',
    },

    Weapon_Loadout_1 = {
        Main = 'Tredecim Scythe',
        Sub = 'displaced',
        Range = 'displaced',
        Ammo = 'Bomb Core',
    },
    Weapon_Loadout_2 = {
        Main = 'Subduer',
        Sub = 'displaced',
        Range = 'displaced',
        Ammo = 'Bomb Core',
    },
    Weapon_Loadout_3 = {},

    WS = {
        Head = { Name = 'Hecatomb Cap +1', Priority = 60 },
        Neck = 'Snow Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Triumph Earring',
        Body = 'Armada Hauberk',
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 60 },
        Ring1 = 'Triumph Ring',
        Ring2 = 'Triumph Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Onyx Cuisses',
        Feet = { Name = 'Chs. Sollerets +1', Priority = 70 },
    },
    WS_HighAcc = {
        Back = 'Abyss Cape',
    },

    WS_Guillotine = {
        Neck = 'Justice Torque',
    },
    WS_CrossReaper = {},
    WS_Catastrophe = {
        Back = 'Forager\'s Mantle',
    },
    WS_SpinningSlash = {
        Neck = 'Breeze Gorget',
        Back = 'Forager\'s Mantle',
        Feet = { Name = 'Hct. Leggings +1', Priority = 60 },
    },
    WS_Scourge = {
        Neck = 'Breeze Gorget',
        Back = 'Forager\'s Mantle',
    },

    WeaponBash = {
        Hands = { Name = 'Chs. Gauntlets +1', Priority = 70 },
    },
    ArcaneCircle = {
        Feet = { Name = 'Chs. Sollerets +1', Priority = 70 },
    },
    SoulEater = {
        Head = { Name = 'Chs. Burgeonet +1', Priority = 70 },
    },

    Jump = {
        Head = 'Maat\'s Cap',
        Neck = 'Justice Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Robust Earring',
        Body = 'Armada Hauberk',
        Hands = { Name = 'Hct. Mittens +1', Priority = 60 },
        Ring1 = 'Rajas Ring',
        Ring2 = 'Robust Ring',
        Back = 'Wyvern Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Onyx Cuisses',
        Feet = { Name = 'Hct. Leggings +1', Priority = 60 },
    },
    HighJump = {
        Ear2 = 'Merman\'s Earring',
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
    },

    Nuke = {},
    Enfeebling = {},
    Drain = {
        Main = 'Pluto\'s Staff',
        Sub = 'displaced',
        Range = 'displaced',
        Ammo = { Name = 'Phtm. Tathlum', Priority = 50 },
        Head = { Name = 'Chs. Burgeonet +1', Priority = 70 },
        Neck = 'Dark Torque',
        Ear1 = 'Dark Earring',
        Ear2 = 'Omn. Earring',
        Body = { Name = 'Demon\'s Harness', Priority = 10 },
        Hands = { Name = 'Blood Fng. Gnt.', Priority = 70 },
        Ring1 = 'Omniscient Ring',
        Ring2 = 'Overlord\'s Ring',
        Back = { Name = 'Merciful Cape', Priority = 50 },
        Waist = 'Sonic Belt',
        Legs = { Name = 'Abs. Flanchard +1', Priority = 70 },
        Feet = 'Mountain Gaiters',
    },
    Absorb = {
        Ring2 = 'Snow Ring',
    },

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {
        Ammo = 'Dart',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    VileElixir = {
        Range = { Name = 'Rosenbogen', Priority = 60 },
        Ammo = 'displaced',
        Head = { Name = 'Homam Zucchetto', Priority = 70 },
        Neck = { Name = 'Pch. Collar', Priority = 70 },
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 },
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Hands = { Name = 'Blood Fng. Gnt.', Priority = 70 },
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = { Name = 'Gigant Mantle', Priority = 60 },
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = { Name = 'Blood Cuisses', Priority = 70 },
        Feet = { Name = 'Homam Gambieras', Priority = 70 },
    },
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
    elseif (action.Name == 'Jump') then
        gFunc.EquipSet(sets.Jump)
    elseif (action.Name == 'High Jump') then
        gFunc.EquipSet(sets.Jump)
        gFunc.EquipSet(sets.HighJump)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    gcmelee.DoPreshot(sets.Preshot, gFunc.Combine(sets.Preshot, sets.Ranged), snapShotValue)
end

profile.HandleMidshot = function()
    gcmelee.DoMidshot(sets, gFunc.Combine(sets.Preshot, sets.Ranged))
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local action = gData.GetAction()
    if (action.Name == 'Guillotine') then
        gFunc.EquipSet(sets.WS_Guillotine)
    elseif (action.Name == 'Cross Reaper') then
        gFunc.EquipSet(sets.WS_CrossReaper)
    elseif (action.Name == 'Catastrophe') then
        gFunc.EquipSet(sets.WS_Catastrophe)
    elseif (action.Name == 'Spinning Slash') then
        gFunc.EquipSet(sets.WS_SpinningSlash)
    elseif (action.Name == 'Scourge') then
        gFunc.EquipSet(sets.WS_Scourge)
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
    if (player.Status == 'Engaged') then
        if (player.SubJob == 'DRG') then
            gFunc.EquipSet(sets.TP_DRG)
        elseif (player.SubJob == 'THF') then
            gFunc.EquipSet(sets.TP_THF)
        end

        local souleater = gData.GetBuffCount('Souleater')
        if (souleater > 0 and use_chaos_burgeonet_for_tp_during_souleater) then
            gFunc.EquipSet(sets.SoulEater)
        end
    elseif (player.HPP >= 85) then
        gFunc.EquipSet('parade_gorget')
    end

    gcmelee.DoDefaultOverride()

    local environment = gData.GetEnvironment()
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

    if (string.contains(action.Name, 'Stun')) then
        gFunc.EquipSet(sets.Haste)
        gFunc.EquipSet(sets.Haste_Stun)
    end

    if (action.Skill ~= 'Ninjutsu' and gcdisplay.GetToggle('Hate') and action.Name ~= 'Drain') then
        gFunc.EquipSet(sets.Haste)
        gFunc.EquipSet(sets.Haste_Hate)
    end
end

function ObiCheck(action)
    local element = action.Element
    local environment = gData.GetEnvironment()

    return environment.WeatherElement == element or environment.DayElement == element
end

return profile
