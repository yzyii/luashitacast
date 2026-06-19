local profile = {}

local fastCastValue = 0.07 -- 0% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

local petActionEquipmentDelay = 2.50 -- Approx. 3.25 to 3.5 seconds for a Breath to be executed. Do not increase this value beyond ~2.90 to allow for packet delay and the 0.25 sec loop delay on HandleDefault execution.

-- The following is provided as a convenient saved setting over using the /sethp command. HP will fluctuate with SJ and usage of the command for this is required.
local max_hp_in_idle_with_regen_gear_equipped = 0 -- Set this to 0 if you do not wish to ever use regen gear.

-- Define these if you wish to automatically equip PDT sets when /WHM or /RDM
local heal_hp_threshold_whm = 0
local heal_hp_threshold_rdm = 0

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local ethereal_earring = {
    Ear2 = 'Ethereal Earring',
}
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}

local sets = {
    Idle = {
        Head = 'Darksteel Cap +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1',
        Hands = 'Dst Mittens +1',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Shadow Mantle',
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = 'Gavial Cuisses +1',
        Feet = 'Gavial Greaves +1',
    },
    IdleALT = {
        Head = 'Dream Ribbon',
        Body = 'Conte Corazza',
    },
    Resting = {
        Neck = { Name = 'Pch. Collar', Priority = 70 },
        Ear1 = 'Sanative Earring',
        Ear2 = 'Relaxing Earring',
        Body = 'Nomad\'s Tunica',
        Hands = 'Nomad\'s Gloves',
        Legs = 'Nomad\'s Hose',
        Feet = { Name = 'Wym. Greaves +1', Priority = 60 },
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
        Head = 'Darksteel Cap +1',
        Body = 'Dst. Harness +1',
        Hands = 'Dst Mittens +1',
        Ring2 = 'Jelly Ring',
        Back = 'Shadow Mantle',
        Legs = 'Gavial Cuisses +1',
        Feet = 'Gavial Greaves +1',
    },
    MDT = {
        Head = 'Gavial Mask +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Cor. Scale Mail +1',
        Hands = 'Gavial Fng.Gnt. +1',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Merman\'s Ring',
        Legs = 'Coral Cuisses +1',
        Feet = 'Coral Greaves +1',
    },
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

    Precast = {
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Legs = { Name = 'Homam Cosciales', Priority = 70 },
    },
    SIRD = { -- Override sets (Resistance / Evasion) take precedence if in use.
        Neck = 'Willpower Torque', -- 5
        Back = 'Shadow Mantle',
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = {
        Head = 'Ace\'s Helm',
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring1 = 'Blitz Ring',
        Back = 'Shadow Mantle',
        Waist = 'Sonic Belt',
        Legs = { Name = 'Homam Cosciales', Priority = 70 },
        Feet = { Name = 'Homam Gambieras', Priority = 70 },
    },

    TP_LowAcc = {
        Head = 'Ace\'s Helm',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Assault Earring',
        Body = { Name = 'Wym. Mail +1', Priority = 60 },
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring1 = 'Rajas Ring',
        Ring2 = 'Blitz Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Sonic Belt',
        Legs = { Name = 'Homam Cosciales', Priority = 70 },
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 },
    },
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {
        Ring2 = 'Triumph Ring',
        Body = { Name = 'Assault Jerkin', Priority = -20 },
    },
    TP_2H_Haste = {
        Head = 'Maat\'s Cap',
        Body = { Name = 'Assault Jerkin', Priority = -20 },
        Ring2 = 'Triumph Ring',
        Legs = { Name = 'Dusk Trousers +1', Priority = 60 },
    },
    TP_2H_Mjollnir_Haste = {
        Head = 'Maat\'s Cap',
        Body = { Name = 'Assault Jerkin', Priority = -20 },
        Hands = 'Tarasque Mitts +1',
        Ring2 = 'Triumph Ring',
        Legs = { Name = 'Dusk Trousers +1', Priority = 60 },
    },
    TP_HighAcc = {
        Body = { Name = 'Homam Corazza', Priority = 70 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Feet = { Name = 'Homam Gambieras', Priority = 70 }
    },
    TP_THF = {
        Ear2 = 'Pilferer\'s Earring',
    },

    Weapon_Loadout_1 = {
        Main = 'Orichalcum Lance',
        Ammo = { Name = 'Tiphia Sting', Priority = -20 },
    },
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},

    WS = {
        Head = { Name = 'Hecatomb Cap +1', Priority = 60 },
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Assault Earring',
        Body = { Name = 'Hct. Harness +1', Priority = 60 },
        Hands = { Name = 'Hct. Mittens +1', Priority = 60 },
        Ring1 = 'Rajas Ring',
        Ring2 = 'Triumph Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Hct. Subligar +1', Priority = 60 },
        Feet = { Name = 'Hct. Leggings +1', Priority = 60 },
    },
    WS_HighAcc = {
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
    },

    WS_PentaThrust = {},
    WS_WheelingThrust = {
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 60 },
    },
    WS_ImpulseDrive = {
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 60 },
    },
    WS_Skewer = {
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 60 },
    },
    WS_Geirskogul = {},

    MaxHP = {
        Head = { Name = 'Drn. Armet +1', Priority = 60 },
        Neck = { Name = 'Ajase Beads', Priority = 60 },
        Ear1 = { Name = 'Cassie Earring', Priority = 20 },
        Ear2 = { Name = 'Pigeon Earring +1', Priority = 60 },
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 60 },
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Ring2 = { Name = 'Bloodbead Ring', Priority = 40 },
        Back = { Name = 'Gigant Mantle', Priority = 60 },
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = { Name = 'Dusk Trousers +1', Priority = 60 },
        Feet = { Name = 'Homam Gambieras', Priority = 70 },
    },
    HealingBreath_SteadyWing_SpiritLink = {
        Head = { Name = 'Wyrm Armet', Priority = 60 },
        Body = { Name = 'Wym. Mail +1', Priority = 60 },
        Hands = 'Ostreger Mitts',
        Legs = { Name = 'Drn. Brais +1', Priority = 60 },
        Feet = { Name = 'Homam Gambieras', Priority = 70 },
    },

    Stoneskin = {
        Head = { Name = 'Drn. Armet +1', Priority = 60 },
        Neck = 'Stone Gorget',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Ryl. Army Mantle',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Magic Cuisses',
        Feet = { Name = 'Mannequin Pumps', Priority = 50 },
    },

    Jump = {
        Head = 'Maat\'s Cap',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Assault Earring',
        Body = 'Conte Corazza',
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 60 },
        Ring1 = 'Rajas Ring',
        Ring2 = 'Triumph Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Conte Cosciales',
        Feet = { Name = 'Drn. Greaves +1', Priority = 60 },
    },
    Jump_Accuracy = {
        Hands = { Name = 'Hct. Mittens +1', Priority = 60 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
    },
    HighJump = {
        Head = { Name = 'Hecatomb Cap +1', Priority = 60 },
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Assault Earring',
        Body = 'Conte Corazza',
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 60 },
        Ring1 = 'Rajas Ring',
        Ring2 = 'Triumph Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Wym. Brais +1',
        Feet = { Name = 'Hct. Leggings +1', Priority = 60 },
    },
    HighJump_Accuracy = {
        Hands = { Name = 'Hct. Mittens +1', Priority = 60 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
    },

    AncientCircle = {
        Legs = { Name = 'Drn. Brais +1', Priority = 60 },
    },
    CallWyvern = {
        Body = { Name = 'Wym. Mail +1', Priority = 60 },
    },

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {
        Ammo = 'Pebble',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    VileElixir = {
        Head = { Name = 'Wyvern Helm +1', Priority = 60 },
        Neck = { Name = 'Ajase Beads', Priority = 60 },
        Ear1 = { Name = 'Cassie Earring', Priority = 20 },
        Ear2 = { Name = 'Pigeon Earring +1', Priority = 60 },
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 60 },
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Ring2 = { Name = 'Bloodbead Ring', Priority = 40 },
        Back = { Name = 'Gigant Mantle', Priority = 60 },
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = { Name = 'Dusk Trousers +1', Priority = 60 },
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

sets.ethereal_earring = ethereal_earring
sets.warlocks_mantle = warlocks_mantle
profile.Sets = gcmelee.AppendSets(sets)

local petActionDelay = 0

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Steady Wing') then
        gFunc.EquipSet(sets.HealingBreath_SteadyWing_SpiritLink)
    elseif (action.Name == 'Ancient Circle') then
        gFunc.EquipSet(sets.AncientCircle)
    elseif (action.Name == 'Jump') then
        gFunc.EquipSet(sets.Jump)
        if (gcmelee.GetAccuracyMode() == 'HighAcc') then
            gFunc.EquipSet(sets.Jump_Accuracy)
        end
    elseif (action.Name == 'High Jump') then
        gFunc.EquipSet(sets.HighJump)
        if (gcmelee.GetAccuracyMode() == 'HighAcc') then
            gFunc.EquipSet(sets.HighJump_Accuracy)
        end
    elseif (action.Name == 'Call Wyvern') then
        gFunc.EquipSet(sets.CallWyvern)
    elseif (action.Name == 'Spirit Link') then
        gFunc.EquipSet(sets.HealingBreath_SteadyWing_SpiritLink)
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
    if (action.Name == 'Penta Thrust') then
        gFunc.EquipSet(sets.WS_PentaThrust)
    elseif (action.Name == 'Wheeling Thrust') then
        gFunc.EquipSet(sets.WS_WheelingThrust)
    elseif (action.Name == 'Impulse Drive') then
        gFunc.EquipSet(sets.WS_ImpulseDrive)
    elseif (action.Name == 'Skewer') then
        gFunc.EquipSet(sets.WS_Skewer)
    elseif (action.Name == 'Geirskogul') then
        gFunc.EquipSet(sets.WS_Geirskogul)
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
    local isWHM = player.SubJob == 'WHM'
    local isRDM = player.SubJob == 'RDM'
    local isMage = isWHM or isRDM
    local weakened = gData.GetBuffCount('Weakness')

    if (player.Status == 'Engaged') then
        if (player.SubJob == 'THF') then
            gFunc.EquipSet(sets.TP_THF)
        end
    end

    if (isWHM and player.HP <= heal_hp_threshold_whm and weakened < 1) then
        gFunc.EquipSet(sets.DT)
    elseif (isRDM and player.HP <= heal_hp_threshold_rdm and weakened < 1) then
        gFunc.EquipSet(sets.DT)
    end

    if (isMage) then
        gFunc.EquipSet('ethereal_earring')
    end

    gcmelee.DoDefaultOverride()

    local petAction = gData.GetPetAction()
    if (petAction ~= nil and os.clock() - petActionDelay > petActionEquipmentDelay) then
        if (isMage) then
            gFunc.EquipSet(sets.HealingBreath_SteadyWing_SpiritLink)
        end
        return
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == 'RDM' and warlocks_mantle.Back) then
        gcmelee.DoPrecast(fastCastValue + 0.02)
        gFunc.EquipSet('warlocks_mantle')
    else
        gcmelee.DoPrecast(fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local player = gData.GetPlayer()
    local action = gData.GetAction()
    if (player.SubJob == 'WHM' or player.SubJob == 'RDM') then
        if (action.Name == 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin)
        else
            gFunc.EquipSet(sets.MaxHP)
            petActionDelay = os.clock()
        end
    end
end

return profile
