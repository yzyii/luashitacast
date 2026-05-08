local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local windRingMaxHP = 0
local wind_ring = {
    -- Ring2 = 'Wind Ring',
}
local evasion_master_casters_mitts = {
    -- Hands = 'Mst.Cst. Mitts',
}

local sets = {
    Idle = {},
    IdleALT = {},
    Resting = {},
    Town = {},
    Movement = {},
    Movement_TP = {},

    DT = {},
    MDT = {},
    FireRes = {},
    IceRes = {},
    LightningRes = {},
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

    Precast = {},
    SIRD = { -- Only used for Idle sets and not while Override sets are active
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {},
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {},
    TP_NIN = {},

    -- Note that these sets are for naked SA/TA/SATAs without WS
    SA = {},
    TA = {},
    SATA = {},

    -- The following demonstrates layering of WS sets that should cover all debatable major WS combinations
    WS = {
        Head = 'Maat\'s Cap',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dragon Harness +1',
        Hands = { Name = 'Hct. Mittens +1', Priority = 20 },
        Ring1 = 'Thunder Ring',
        Ring2 = 'Adroit Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Hct. Subligar +1', Priority = 20 },
        Feet = { Name = 'Hct. Leggings +1', Priority = 20 },
    },
    WS_HighAcc = {
        Body = { Name = 'Hct. Harness +1', Priority = 20 },
        Ring1 = { Name = 'Toreador\'s Ring', Priority = 20 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 20 },
        Waist = 'Life Belt',
    },

    WS_Evisceration = {},
    WS_DancingEdge = {},
    WS_SharkBite = {
        Feet = 'Drn. Leggings +1',
    },
    WS_MercyStroke = {
        Head = { Name = 'Hecatomb Cap +1', Priority = 20 },
        Ear2 = 'Triumph Earring',
        Body = { Name = 'Hct. Harness +1', Priority = 20 },
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
        Waist = 'Warwolf Belt',
    },
    WS_EnergyDrain = {
        Head = { Name = 'Hecatomb Cap +1', Priority = 20 },
        Ear2 = 'Triumph Earring',
        Body = { Name = 'Hct. Harness +1', Priority = 20 },
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
        Waist = 'Warwolf Belt',
    },

    -- The following are applied on both SA WS and SATA WS
    -- The following are applied on both SA WS and SATA WS
    WS_SA = {
        Feet = { Name = 'Hct. Leggings +1', Priority = 20 },
    },
    WS_SA_SharkBite = {
        Ear2 = 'Pixie Earring',
        Feet = 'Drn. Leggings +1',
    },
    WS_SA_MercyStroke = {
        Ear2 = 'Pixie Earring',
    },
    WS_SA_EnergyDrain = {
        Ear2 = 'Pixie Earring',
        Ring1 = 'Thunder Ring',
        Ring2 = 'Adroit Ring',
    },

    WS_SATA_SharkBite = {
        Hands = { Name = 'Rogue\'s Armlets +1', Priority = 20 },
    },

    -- The following are only applied on TA WS and are NOT applied on SATA WS
    WS_TA = {
        Feet = 'Drn. Leggings +1',
    },
    WS_TA_SharkBite = {
        Ear2 = 'Drone Earring',
        Hands = { Name = 'Rogue\'s Armlets +1', Priority = 20 },
        Ring1 = 'Breeze Ring',
        Ring2 = 'Nimble Ring',
        Waist = { Name = 'Scouter\'s Rope', Priority = -5 },
    },
    WS_TA_MercyStroke = {
        Ear2 = 'Drone Earring',
    },
    WS_TA_EnergyDrain = {
        Ear2 = 'Drone Earring',
        Ring1 = 'Breeze Ring',
        Ring2 = 'Nimble Ring',
    },

    WS_Cyclone = {
        Head = 'Maat\'s Cap',
        Neck = 'Prudence Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Blue Cotehard. +1',
        Hands = { Name = 'Hct. Mittens +1', Priority = 20 },
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Assassin\'s Cape',
        Waist = 'Ryl.Kgt. Belt',
        Legs = { Name = 'Hct. Subligar +1', Priority = 20 },
        Feet = { Name = 'Hct. Leggings +1', Priority = 20 },
    },

    Flee = {},
    Hide = {},
	Steal_HPDown = {},
    Steal = {},
    Mug = {},

    TH = {},

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {},
    Ranged_INT = {},

    None = { -- Default range / ammo equipment while idle
        -- Range = 'displaced',
        -- Ammo = 'Bomb Core',
    },
    None_RA = { -- Used for ranged attacks when None set is being used instead of the bolt sets defined below
        -- Range = 'displaced',
        -- Ammo = 'Pebble',
    },
    Acid = {
        Ammo = 'Acid Bolt',
    },
    Sleep = {
        Ammo = 'Sleep Bolt',
    },
    Bloody = {
        Ammo = 'Bloody Bolt',
    },
    Blind = {
        Ammo = 'Blind Bolt',
    },
    Venom = {
        Ammo = 'Venom Bolt',
    },

    Weapon_Loadout_1 = { -- Slug Shot THF 2H Zerg
        Head = { Name = 'Hecatomb Cap +1', Priority = 20 },
        Ear1 = 'Triumph Earring',
        Ear2 = 'Drone Earring',
        Body = { Name = 'Hct. Harness +1', Priority = 20 },
        Hands = { Name = 'Hct. Mittens +1', Priority = 20 },
        Ring1 = 'Triumph Ring',
        Ring2 = 'Nimble Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Warwolf Belt',
        Legs = 'Republic Subligar',
        Feet = { Name = 'Hct. Leggings +1', Priority = 20 },
    },
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},

    VileElixir = {},
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

sets.evasion_master_casters_mitts = evasion_master_casters_mitts
sets.wind_ring = wind_ring
profile.Sets = gcmelee.AppendSets(sets)

local ammo = T{'aacid','asleep','abloody','ablind','avenom','anone'}

local AmmoTable1 = {
    [1] = 'None',
    [2] = 'Acid',
    [3] = 'Sleep',
    [4] = 'Bloody',
    [5] = 'Blind',
    [6] = 'Venom',
}
local AmmoTable2 = {
    ['none'] = 1,
    ['acid'] = 2,
    ['sleep'] = 3,
    ['bloody'] = 4,
    ['blind'] = 5,
    ['venom'] = 6,
}

local saOverride = 0
local taOverride = 0
local taggedMobs = {}

actionpacket = gFunc.LoadFile('common\\actionpacket.lua')

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Flee') then
        gFunc.EquipSet(sets.Flee)
    elseif (action.Name == 'Hide') then
        gFunc.EquipSet(sets.Hide)
    elseif (action.Name == 'Steal') then
		gFunc.ForceEquipSet(sets.Steal_HPDown)
        gFunc.EquipSet(sets.Steal)
    elseif (action.Name == 'Mug') then
        gFunc.EquipSet(sets.Mug)
    elseif (action.Name == 'Sneak Attack') then
        saOverride = os.clock() + 2
    elseif (action.Name == 'Trick Attack') then
        taOverride = os.clock() + 2
    end

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.getRangedSet = function()
    local rangedSet = gFunc.Combine(sets.Preshot, sets.Ranged)

    if (gcdisplay.GetCycle('Ammo') == 'Bloody') then
        rangedSet = gFunc.Combine(rangedSet, sets.Ranged_INT)
    elseif (gcdisplay.GetCycle('Ammo') == 'None') then
        return sets.None_RA
    end

    return gFunc.Combine(rangedSet, sets[gcdisplay.GetCycle('Ammo')])
end

profile.HandlePreshot = function()
    gcmelee.DoPreshot(sets.Preshot, profile.getRangedSet(), snapShotValue)
end

profile.HandleMidshot = function()
    gcmelee.DoMidshot(sets, profile.getRangedSet())
    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local action = gData.GetAction()
    if (action.Name == 'Evisceration') then
        gFunc.EquipSet(sets.WS_Evisceration)
    elseif (action.Name == 'Shark Bite') then
        gFunc.EquipSet(sets.WS_SharkBite)
    elseif (action.Name == 'Dancing Edge') then
        gFunc.EquipSet(sets.WS_DancingEdge)
    elseif (action.Name == 'Mercy Stroke') then
        gFunc.EquipSet(sets.WS_MercyStroke)
    elseif (action.Name == 'Energy Drain') then
        gFunc.EquipSet(sets.WS_EnergyDrain)
    end

    local sa = gData.GetBuffCount('Sneak Attack')
    local ta = gData.GetBuffCount('Trick Attack')

    if (sa == 1) or (os.clock() < saOverride) then
        gFunc.EquipSet(sets.WS_SA)
        if (action.Name == 'Shark Bite') then
            gFunc.EquipSet(sets.WS_SA_SharkBite)
        elseif (action.Name == 'Mercy Stroke') then
            gFunc.EquipSet(sets.WS_SA_MercyStroke)
        elseif (action.Name == 'Energy Drain') then
            gFunc.EquipSet(sets.WS_SA_EnergyDrain)
        end
    end

    if (sa == 1 and ta == 1) or (os.clock() < saOverride and os.clock() < taOverride) then
        if (action.Name == 'Shark Bite') then
            gFunc.EquipSet(sets.WS_SATA_SharkBite)
        end
    elseif (ta == 1) or (os.clock() < taOverride) then
        gFunc.EquipSet(sets.WS_TA)
        if (action.Name == 'Shark Bite') then
            gFunc.EquipSet(sets.WS_TA_SharkBite)
        elseif (action.Name == 'Mercy Stroke') then
            gFunc.EquipSet(sets.WS_TA_MercyStroke)
        elseif (action.Name == 'Energy Drain') then
            gFunc.EquipSet(sets.WS_TA_EnergyDrain)
        end
    end

    if (action.Name == 'Cyclone') then
        gFunc.EquipSet(sets.WS_Cyclone)
    end

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.OnLoad = function()
    gcinclude.SetAlias(ammo)
    gcdisplay.CreateCycle('Ammo', AmmoTable1)
    gcinclude.SetAlias(T{'ammo'})
    gcinclude.SetAlias(T{'th'})
    gcdisplay.CreateCycle('TH', {[1] = 'Auto', [2] = 'On', [3] = 'Off'})
    gcmelee.Load()
    profile.SetMacroBook()
    profile.WatchTreasureHunter()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(ammo)
    gcinclude.ClearAlias(T{'ammo'})
    gcinclude.ClearAlias(T{'th'})
    ashita.events.unregister('packet_in', 'watch_treasure_hunter');
end

profile.HandleCommand = function(args)
    if (args[1] == 'th') then
        gcdisplay.AdvanceCycle('TH')
        gcinclude.Message('TH', gcdisplay.GetCycle('TH'))
    elseif (args[1] == 'ammo') then
        gcdisplay.AdvanceCycle('Ammo')
        gcinclude.Message('Ammo', gcdisplay.GetCycle('Ammo'))
    elseif (ammo:contains(args[1])) then
        gcdisplay.SetCycleIndex('Ammo', AmmoTable2[args[1]:sub(2)])
        gcinclude.Message('Ammo', gcdisplay.GetCycle('Ammo'))
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
    if (player.SubJob == 'NIN' and player.Status == 'Engaged') then
        local sub = gData.GetEquipment().Sub
        if (sub ~= nil) then
            if (sub.Resource.Slots == 3) then -- if this is a 1h weapon
                gFunc.EquipSet('TP_NIN')
            end
        end
    end

    gFunc.EquipSet(sets[gcdisplay.GetCycle('Ammo')])

    gcmelee.DoDefaultOverride()

    if (gcdisplay.IdleSet == 'Evasion') then
        if (conquest:GetOutsideControl()) then
            gFunc.EquipSet('evasion_master_casters_mitts')
        end

        local environment = gData.GetEnvironment()
        if (environment.DayElement == 'Wind' and player.HP <= windRingMaxHP) then
            gFunc.EquipSet(sets.wind_ring)
        end
    end

    local sa = gData.GetBuffCount('Sneak Attack')
    local ta = gData.GetBuffCount('Trick Attack')

    if (sa == 1 and ta == 1) or (os.clock() < saOverride and os.clock() < taOverride) then
        gFunc.EquipSet(sets.SATA)
    elseif (sa == 1) or (os.clock() < saOverride) then
        gFunc.EquipSet(sets.SA)
    elseif (ta == 1) or (os.clock() < taOverride) then
        gFunc.EquipSet(sets.TA)
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))

    if (player.Status == 'Engaged' and profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local action = gData.GetAction()
    if (action.Skill ~= 'Ninjutsu' and profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.NeedTH = function()
    if (gcdisplay.GetCycle('TH') == 'Auto') then
        local targetId
        local actionTarget = gData.GetActionTarget()

        if (actionTarget ~= nil) then
            targetId = actionTarget.Id
        else
            local targetIndex = gData.GetTargetIndex()
            if (targetIndex == 0) then
                return false
            end

            targetId = AshitaCore:GetMemoryManager():GetEntity():GetServerId(targetIndex)
        end

        if bit.band(targetId, 0xFF000000) ~= 0 then  --isMob
            return taggedMobs[targetId] == nil
        end

        return false
    end

    return gcdisplay.GetCycle('TH') == 'On'
end

profile.WatchTreasureHunter = function()
    ashita.events.register('packet_in', 'watch_treasure_hunter', function(e)
        local playerEntity = GetPlayerEntity();
        if (not playerEntity) then
            return
        end

        if (e.id == 0x28) then
            local type = { 
                [1] = true, -- Attack
                [2] = true, -- Ranged Attack
                [3] = true, -- Ability 
                [4] = true, 
                [6] = true -- Also ability? (Provoke)
            };
            local packet = actionpacket:parse(e);
            if (packet.UserId == playerEntity.ServerId) then
                if (type[packet.Type]) then
                    local reaction = { 
                        [0] = true, -- Spell Hit / ???
                        [8] = true, -- Attack Hit/Miss
                        [9] = true, -- Legacy
                        [16] = true, -- Range Attack Hit / Provoke ?
                        [17] = true, -- Range Attack Miss
                    }
                    for _, target in ipairs(packet.Targets) do
                        for i = 1, #target.Actions do
                            local action = target.Actions[1]
                            if bit.band(target.Id, 0xFF000000) ~= 0 then -- isMob, also triggers on NPC but it's benign
                                if (packet.Type == 3 or reaction[action.Reaction]) and target.Id then
                                    taggedMobs[target.Id] = true;
                                end
                            end
                        end
                    end
                end
            end
        elseif (e.id == 0x29) then
            local deathMes = T { 6, 20, 97, 113, 406, 605, 646 };
            -- Mob died, clear from table
            local message = struct.unpack('i2', e.data, 0x18 + 1);
            if (deathMes:contains(message)) then
                local target = struct.unpack('i4', e.data, 0x08 + 1);
                taggedMobs[target] = nil;
            end
        elseif (e.id == 0x0A or e.id == 0x0B) then
            -- Changed zone, clear all TH
            taggedMobs = {};
        end
    end)
end

return profile
