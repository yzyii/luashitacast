local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

-- The following is provided as a convenient saved setting over using the /sethp command. HP will fluctuate with SJ and usage of the command for this is required.
local max_hp_in_idle_with_regen_gear_equipped = 0 -- Set this to 0 if you do not wish to ever use regen gear.

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local unicorn_leggings = {
    Feet = { Name = 'Ucn. Leggings +1', Priority = 60 },
}

local sets = {
    Idle = {
        Head = 'Darksteel Cap +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1',
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Shadow Mantle',
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = {},
    Resting = {
        Neck = { Name = 'Pch. Collar', Priority = 70 },
        Ear1 = 'Sanative Earring',
        Body = 'Nomad\'s Tunica',
        Hands = 'Nomad\'s Gloves',
        Legs = 'Nomad\'s Hose',
        Feet = 'Nomad\'s Boots',
    },
    Town = {},
    Movement = {},
    Movement_TP = {
        Hands = 'Armada Mufflers',
        Feet = 'Armada Sollerets',
    },

    DT = {
        Head = 'Darksteel Cap +1',
        Body = 'Dst. Harness +1',
        Hands = 'Heavy Gauntlets',
        Ring2 = 'Jelly Ring',
        Back = 'Shadow Mantle',
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
        Ring2 = 'Merman\'s Ring',
        Legs = 'Coral Cuisses +1',
        Feet = 'Coral Greaves +1',
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    LightningRes_NoBarthunder = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},
    Override = { -- An additional override set explicitly to be used for sets such as crafting, HELM, fishing, or any other special sets such as DRK 2HR, MNK Counter etc. n.b. Any unused Resist or Evasion set can be used similarly.
        Body = 'Field Tunica',
        Hands = 'Field Gloves',
        Legs = 'Field Hose',
        Feet = 'Field Boots'
    },

    Precast = {
        Ear2 = { Name = 'Loquac. Earring', Priority = 50 },
    },
    SIRD = { -- Override sets (Resistance / Evasion) take precedence if in use.
        Head = 'Darksteel Cap +1',
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 }, -- 8
        Body = 'Dst. Harness +1',
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Shadow Mantle',
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = 'Dst. Subligar +1',
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = {
        Head = 'Panther Mask +1',
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring2 = 'Blitz Ring',
        Back = 'Shadow Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 },
    },

    TP_LowAcc = {
        Head = 'Panther Mask +1',
        Neck = 'Fortitude Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Assault Earring',
        Body = 'Armada Hauberk',
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring1 = 'Rajas Ring',
        Ring2 = 'Blitz Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 },
    },
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {
        Hands = 'Armada Mufflers',
    },
    TP_HighAcc = {
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Hands = 'Armada Mufflers',
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Back = 'Settler\'s Cape',
        Waist = 'Life Belt',
        Feet = 'Armada Sollerets',
    },
    TP_Aggressor = {
        Head = 'Panther Mask +1',
        Neck = 'Fortitude Torque',
        Ring2 = 'Blitz Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Sonic Belt',
    },
    TP_NIN = { -- Equips iff using 1h weapon in Sub
        Ear2 = 'Stealth Earring',
    },
    TP_SAM = { -- Equips iff not using Raging Rush
        Ear2 = 'Attila\'s Earring',
    },
    TP_DRG = {
        Head = 'Maat\'s Cap',
        Ear2 = 'Wyvern Earring',
    },
    TP_THF = {
        Ear2 = 'Pilferer\'s Earring',
    },

    Weapon_Loadout_1 = {
        Main = 'Martial Bhuj',
        Ammo = 'Bomb Core'
    },
    Weapon_Loadout_2 = {
        Main = 'Byakko\'s Axe',
        Ammo = 'Bomb Core'
    },
    Weapon_Loadout_3 = {
        Main = 'Martial Axe',
        Sub = 'Maneater',
        Ammo = 'Bomb Core',
        Neck = 'Temp. Torque',
    },

    WS = {
        Head = { Name = 'Hecatomb Cap +1', Priority = 60 },
        Neck = 'Fortitude Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Triumph Earring',
        Body = { Name = 'Kirin\'s Osode', Priority = 50 },
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 60 },
        Ring1 = 'Rajas Ring',
        Ring2 = 'Triumph Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'War. Cuisses +1',
        Feet = { Name = 'Hct. Leggings +1', Priority = 60 },
    },
    WS_HighAcc = {},

    WS_RagingRush = {
        Neck = 'Snow Gorget',
        Ear2 = 'Assault Earring',
        Body = 'Armada Hauberk',
        Hands = { Name = 'Hct. Mittens +1', Priority = 60 },
        Legs = 'Byakko\'s Haidate',
    },
    WS_SteelCyclone = {
        Neck = 'Snow Gorget',
    },
    WS_ShieldBreak = {
        Neck = 'Snow Gorget',
    },
    WS_ArmorBreak = {
        Neck = 'Thunder Gorget',
    },
    WS_FullBreak = {
        Neck = 'Snow Gorget',
    },
    WS_MetatronTorment = {
        Neck = 'Thunder Gorget',
    },
    WS_Rampage = {
        Neck = 'Temp. Torque',
        Ear2 = 'Assault Earring',
        Body = 'Armada Hauberk',
        Hands = { Name = 'Hct. Mittens +1', Priority = 60 },
        Legs = 'Byakko\'s Haidate',
    },
    WS_Decimation = {
        Neck = 'Temp. Torque',
        Ear2 = 'Assault Earring',
        Body = 'Armada Hauberk',
        Waist = 'Warrior\'s Stone',
    },

    WS_2H = {
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 60 },
        Legs = 'War. Cuisses +1',
    },
    WS_2H_RagingRush = {
        Waist = 'Warrior\'s Stone',
    },
    WS_2H_Rampage = {
        Waist = 'Warrior\'s Stone',
    },

    Warcry = {
        Head = 'Warrior\'s Mask ',
    },
    Provoke = {},

    Jump = {
        Head = 'Maat\'s Cap',
        Neck = 'Fortitude Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Robust Earring',
        Body = { Name = 'Kirin\'s Osode', Priority = 50 },
        Hands = { Name = 'Hct. Mittens +1', Priority = 60 },
        Ring1 = 'Rajas Ring',
        Ring2 = 'Robust Ring',
        Back = 'Wyvern Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'War. Cuisses +1',
        Feet = { Name = 'Hct. Leggings +1', Priority = 60 },
    },
    HighJump = {
        Ear2 = 'Merman\'s Earring',
        Body = 'Haubergeon +1',
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
    },

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {
        Ammo = 'Dart',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    VileElixir = {
        Head = { Name = 'Genbu\'s Kabuto', Priority = 60 },
        Neck = { Name = 'Shield Pendant', Priority = 20 },
        Ear1 = { Name = 'Pigeon Earring +1', Priority = 60 },
        Ear2 = { Name = 'Pigeon Earring +1', Priority = 60 },
        Body = { Name = 'Kaiser Cuirass', Priority = 60 },
        Hands = { Name = 'Seiryu\'s Kote', Priority = 60 },
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Ring2 = { Name = 'Bloodbead Ring', Priority = 40 },
        Back = { Name = 'Gigant Mantle', Priority = 60 },
        Waist = { Name = 'Powerful Rope', Priority = 60 },
        Legs = { Name = 'Kaiser Diechlings', Priority = 60 },
        Feet = { Name = 'Ucn. Leggings +1', Priority = 60 },
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

sets.unicorn_leggings = unicorn_leggings
profile.Sets = gcmelee.AppendSets(sets)

local usedRagingRush = false

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Warcry') then
        gFunc.EquipSet(sets.Warcry)
    elseif (action.Name == 'Provoke') then
        gFunc.EquipSet(sets.Provoke)
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

    usedRagingRush = false

    local action = gData.GetAction()
    if (action.Name == 'Raging Rush') then
        gFunc.EquipSet(sets.WS_RagingRush)
        usedRagingRush = true
    elseif (action.Name == 'Steel Cyclone') then
        gFunc.EquipSet(sets.WS_SteelCyclone)
    elseif (action.Name == 'Shield Break') then
        gFunc.EquipSet(sets.WS_ShieldBreak)
    elseif (action.Name == 'Armor Break') then
        gFunc.EquipSet(sets.WS_ArmorBreak)
    elseif (action.Name == 'Full Break') then
        gFunc.EquipSet(sets.WS_FullBreak)
    elseif (action.Name == 'Metatron Torment') then
        gFunc.EquipSet(sets.WS_MetatronTorment)
    elseif (action.Name == 'Rampage') then
        gFunc.EquipSet(sets.WS_Rampage)
    elseif (action.Name == 'Decimation') then
        gFunc.EquipSet(sets.WS_Decimation)
    end

    local mightyStrikes = gData.GetBuffCount('Mighty Strikes')
    if (mightyStrikes > 0) then
        gFunc.EquipSet(sets.WS_2H)
        if (action.Name == 'Raging Rush') then
            gFunc.EquipSet(sets.WS_2H_RagingRush)
        elseif (action.Name == 'Rampage') then
            gFunc.EquipSet(sets.WS_2H_Rampage)
        end
    end
end

profile.OnLoad = function()
    gcmelee.Load(3.00)
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
end

profile.HandleCommand = function(args)
    gcmelee.DoCommands(args)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)

    local player = gData.GetPlayer()
    if (player.Status == 'Engaged') then
        local aggressor = gData.GetBuffCount('Aggressor')
        if (aggressor == 1 and gcdisplay.IdleSet == 'LowAcc') then
            gFunc.EquipSet(sets.TP_Aggressor)
        end

        if (player.SubJob == 'SAM' and not usedRagingRush) then
            gFunc.EquipSet(sets.TP_SAM)
        elseif (player.SubJob == 'NIN') then
            local sub = gData.GetEquipment().Sub
            if (sub ~= nil) then
                if (sub.Resource.Slots == 3) then -- if this is a 1h weapon
                    gFunc.EquipSet(sets.TP_NIN)
                end
            end
        elseif (player.SubJob == 'DRG') then
            gFunc.EquipSet(sets.TP_DRG)
        elseif (player.SubJob == 'THF') then
            gFunc.EquipSet(sets.TP_THF)
        end

        if (player.HPP > 75) then
            gFunc.EquipSet(sets.unicorn_leggings)
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

    local player = gData.GetPlayer()
    if (player.HPP > 75) then
        gFunc.EquipSet(sets.unicorn_leggings)
    end
end

return profile
