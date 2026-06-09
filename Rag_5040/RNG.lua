local profile = {}

local fastCastValue = 0.02 -- 0% from gear listed in Precast set

-- The following is provided as a convenient saved setting over using the /sethp command. HP will fluctuate with SJ and usage of the command for this is required.
local max_hp_in_idle_with_regen_gear_equipped = 0 -- Set this to 0 if you do not wish to ever use regen gear.

-- Populate these correctly otherwise ammo protection will not work
local yoichinoyumi = false
local special_ammo = 'Carapace Bullet'
local buffer_ranged_attack = 7 -- Time taken for ranged attacks in seconds. Suggested that 7 is used for guns and 6 for bows.
local buffer_ja_ws = 2

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local rng_fenrirs_earring = { -- Used always if active
    Ear2 = 'Fenrir\'s Earring',
}
local rng_fire_ring = { -- Used if active and Ranged is in Attack mode
    Ring2 = 'Fire Ring',
}

local sets = {
    Idle = {
        Head = 'Dream Ribbon',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Coral Scale Mail +1',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = 'Scout\'s belt',
        Legs = { Name = 'Blood Cuisses', Priority = 70 },
        Feet = 'Coral Greaves +1',
    },
    IdleALT = {},
    Resting = {
        Neck = { Name = 'Paisley Scarf', Priority = 60 },
        Ear1 = 'Sanative Earring',
        Body = 'Nomad\'s Tunica',
        Hands = 'Nomad\'s Gloves',
        Legs = 'Nomad\'s Hose',
        Feet = 'Nomad\'s Boots',
    },
    Town = {},
    Movement = {
        Legs = { Name = 'Blood Cuisses', Priority = 70 },
    },
    Movement_TP = {},

    DT = {
        Ring1 = 'Jelly Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
    },
    MDT = {
        Head = 'Coral Visor +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Coral Scale Mail +1',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Gramary Cape',
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
    },
    SIRD = { -- Override sets (Resistance / Evasion) take precedence if in use.
        Neck = 'Willpower Torque', -- 5
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 }, -- 8
        Back = 'Shadow Mantle',
        Waist = 'Druid\'s Rope', -- 10
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = {
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Waist = 'Sonic Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 },
    },

    TP_LowAcc = {},
    TP_Aftermath = {}, -- This can be ignored since the UnlimitedShot set will already equip for Namas Arrow Aftermaths
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {},

    Weapon_Loadout_1 = {
        Main = 'Vulcan\'s Staff',
        Sub = 'displaced',
        Range = 'Hellfire +1',
        Ammo = 'Silver Bullet',
    },
    Weapon_Loadout_2 = {
        Main = 'Vulcan\'s Staff',
        Sub = 'displaced',
        Range = 'Culverin +1',
        Ammo = 'Cannon Shell',
    },
    Weapon_Loadout_3 = {
        Main = 'Apollo\'s Staff',
        Sub = 'displaced',
        Range = 'Machine Crossbow',
        Ammo = 'Holy Bolt',
        Head = 'Maat\'s Cap',
        Neck = 'Faith Torque',
        Ear1 = 'Novia Earring',
        Ear2 = 'Cmn. Earring',
        Body = { Name = 'Kirin\'s Osode', Priority = 50 },
	    Hands = { Name = 'Blood Fng. Gnt.', Priority = 70 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Jaeger Mantle',
        Waist = 'Scout\'s Belt',
        Legs = { Name = 'Htr. Braccae +1', Priority = 60 },
        Feet = 'Suzaku\'s Sune-Ate',
    },

    WS = { -- Technically could be used as the base set for Ranged WS but is probably best used for Melee WS instead e.g. Decimation.
    },
    WS_HighAcc = { -- Note that this will only be used for Melee WS when HighAcc tp mode is being used.
    },

    Preshot = {
		Head = { Name = 'Htr. Beret +1', Priority = 60 },
		Body = { Name = 'Sct. Jerkin +1', Priority = 60 },
    },
    Ranged_ATK = {
        Head = 'Maat\'s Cap',
        Neck = 'Hope Torque',
        Ear1 = 'Triumph Earring',
        Ear2 = 'Triumph Earring',
	    Body = { Name = 'Kirin\'s Osode', Priority = 50 },
	    Hands = { Name = 'Blood Fng. Gnt.', Priority = 70 },
	    Ring1 = 'Rajas Ring',
	    Ring2 = 'Triumph Ring',
	    Back = 'Amemet Mantle +1',
        Waist = 'Scout\'s Belt',
        Legs = { Name = 'Sct. Braccae +1', Priority = 60 },
        Feet = { Name = 'Sct. Socks +1', Priority = 60 },
    },
    Ranged_ACC = {
        Head = 'Optical Hat',
        Ear1 = 'Drone Earring',
	    Body = { Name = 'Htr. Jerkin +1', Priority = 60 },
        Hands = { Name = 'Seiryu\'s Kote', Priority = 60 },
        Ring2 = 'Behemoth Ring +1',
        Back = 'Jaeger Mantle',
        Feet = { Name = 'Htr. Socks +1', Priority = 60 },
    },
    Ranged_HNM = {
        Head = { Name = 'Sct. Beret +1', Priority = 60 },
        Ear1 = 'Novia Earring',
        Body = { Name = 'Sct. Jerkin +1', Priority = 60 },
        Legs = { Name = 'Sct. Braccae +1', Priority = 60 },
        Feet = { Name = 'Sct. Socks +1', Priority = 60 },
    },

    WS_Ranged_ATK = {
        Head = 'Maat\'s Cap',
        Neck = 'Hope Torque',
        Ear1 = 'Triumph Earring',
        Ear2 = 'Triumph Earring',
	    Body = { Name = 'Kirin\'s Osode', Priority = 50 },
	    Hands = { Name = 'Blood Fng. Gnt.', Priority = 70 },
	    Ring1 = 'Rajas Ring',
	    Ring2 = 'Triumph Ring',
	    Back = 'Amemet Mantle +1',
        Waist = 'Scout\'s Belt',
        Legs = { Name = 'Htr. Braccae +1', Priority = 60 },
        Feet = { Name = 'Sct. Socks +1', Priority = 60 },
    },
    WS_Ranged_ACC = {
        Head = 'Optical Hat',
        Neck = 'Breeze Gorget',
        Ear1 = 'Drone Earring',
	    Body = { Name = 'Htr. Jerkin +1', Priority = 60 },
        Hands = { Name = 'Seiryu\'s Kote', Priority = 60 },
        Ring1 = 'Behemoth Ring +1',
        Ring2 = 'Behemoth Ring +1',
        Back = 'Jaeger Mantle',
        Legs = { Name = 'Sct. Braccae +1', Priority = 60 },
        Feet = { Name = 'Htr. Socks +1', Priority = 60 },
    },
    WS_Ranged_HNM = {
        Head = { Name = 'Sct. Beret +1', Priority = 60 },
        Ear1 = 'Novia Earring',
        Body = { Name = 'Sct. Jerkin +1', Priority = 60 },
        Legs = { Name = 'Sct. Braccae +1', Priority = 60 },
        Feet = { Name = 'Sct. Socks +1', Priority = 60 },
    },

    WS_HeavyShot = {
        Neck = 'Light Gorget',
    },
    WS_Detonator = {
        Neck = 'Light Gorget',
    },
    WS_SlugShot = {
        Hands = { Name = 'Seiryu\'s Kote', Priority = 60 },
        Ring2 = 'Behemoth Ring +1',
        Back = 'Jaeger Mantle',
        Legs = { Name = 'Sct. Braccae +1', Priority = 60 },
    },
    WS_Coronach = {
        Head = 'Maat\'s Cap',
        Neck = 'Breeze Gorget',
        Ear1 = 'Triumph Earring',
	    Body = { Name = 'Kirin\'s Osode', Priority = 50 },
	    Hands = { Name = 'Blood Fng. Gnt.', Priority = 70 },
	    Ring1 = 'Rajas Ring',
	    Ring2 = 'Triumph Ring',
	    Back = 'Amemet Mantle +1',
        Waist = 'Scout\'s Belt',
        Legs = { Name = 'Htr. Braccae +1', Priority = 60 },
        Feet = { Name = 'Sct. Socks +1', Priority = 60 },
    },
    WS_ArchingArrow = {
        Neck = 'Light Gorget',
    },
    WS_EmpyrealArrow = {
        Neck = 'Light Gorget',
    },
    WS_Sidewinder = {
        Hands = { Name = 'Seiryu\'s Kote', Priority = 60 },
        Ring2 = 'Behemoth Ring +1',
        Back = 'Jaeger Mantle',
        Legs = { Name = 'Sct. Braccae +1', Priority = 60 },
    },
    WS_NamasArrow = {
        Ammo = special_ammo,
        Head = 'Maat\'s Cap',
        Neck = 'Breeze Gorget',
        Ear1 = 'Triumph Earring',
	    Body = { Name = 'Kirin\'s Osode', Priority = 50 },
	    Hands = { Name = 'Blood Fng. Gnt.', Priority = 70 },
	    Ring1 = 'Rajas Ring',
	    Ring2 = 'Triumph Ring',
	    Back = 'Amemet Mantle +1',
        Waist = 'Scout\'s Belt',
        Legs = { Name = 'Htr. Braccae +1', Priority = 60 },
        Feet = { Name = 'Sct. Socks +1', Priority = 60 },
    },

    WS_SJ_SAM = { -- If Brutal or similar is required for Store TP on WS
    },

    EagleEyeShot = {
        Head = 'Maat\'s Cap',
        Neck = 'Justice Torque',
        Ear1 = 'Triumph Earring',
        Ear2 = 'Triumph Earring',
	    Body = { Name = 'Kirin\'s Osode', Priority = 50 },
	    Hands = { Name = 'Blood Fng. Gnt.', Priority = 70 },
	    Ring1 = 'Rajas Ring',
	    Ring2 = 'Triumph Ring',
	    Back = 'Amemet Mantle +1',
        Waist = 'Scout\'s Belt',
        Legs = 'Garrison Hose',
        Feet = { Name = 'Sct. Socks +1', Priority = 60 },
    },
    Barrage = {
        Hands = { Name = 'Htr. Bracers +1', Priority = 60 },
        -- Ring2 = 'Sharpshooter\'s Ring',
    },
    Scavenge = {
        Feet = { Name = 'Htr. Socks +1', Priority = 60 },
    },
    Shadowbind = {
        Hands = { Name = 'Htr. Bracers +1', Priority = 60 },
    },
    Camouflage = {
	    Body = { Name = 'Htr. Jerkin +1', Priority = 60 },
    },
    Sharpshot = {
        Legs = { Name = 'Htr. Braccae +1', Priority = 60 },
    },
    UnlimitedShot = { -- Used for Namas Arrow Aftermath as well as Unlimited Shot. You do not need to edit this.
        Ammo = special_ammo,
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    VileElixir = {
        Head = { Name = 'Genbu\'s Kabuto', Priority = 60 },
        Neck = { Name = 'Shield Pendant', Priority = 20 },
        Ear1 = { Name = 'Pigeon Earring +1', Priority = 60 },
        Ear2 = { Name = 'Cassie Earring', Priority = 20 },
        Body = { Name = 'Blood Scale Mail', Priority = 70 },
        Hands = { Name = 'Seiryu\'s Kote', Priority = 60 },
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Ring2 = { Name = 'Bloodbead Ring', Priority = 40 },
        Back = { Name = 'Gigant Mantle', Priority = 60 },
        Waist = { Name = 'Powerful Rope', Priority = 60 },
        Legs = { Name = 'Dusk Trousers +1', Priority = 60 },
        Feet = { Name = 'Root Sabots', Priority = 60 },
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

sets.rng_fenrirs_earring = rng_fenrirs_earring
sets.rng_fire_ring = rng_fire_ring
profile.Sets = gcmelee.AppendSets(sets)

local DistanceWS = T{'Flaming Arrow','Piercing Arrow','Dulling Arrow','Sidewinder','Blast Arrow','Arching Arrow','Empyreal Arrow','Refulgent Arrow','Apex Arrow','Namas Arrow','Jishnu\'s Randiance','Hot Shot','Split Shot','Sniper Shot','Slug Shot','Blast Shot','Heavy Shot','Detonator','Numbing Shot','Last Stand','Coronach','Wildfire','Trueflight','Leaden Salute','Myrkr','Dagan','Moonlight','Starlight'};

local UTC_PTR = 0

local get_utcstamp = function()
    local ptr = UTC_PTR
    if (ptr == 0) then
        UTC_PTR = ashita.memory.find('FFXiMain.dll', 0, '8B0D????????8B410C8B49108D04808D04808D04808D04C1C3', 2, 0);
        if (UTC_PTR == 0) then
            return 0x7FFFFFFF;
        end
        ptr = UTC_PTR
    end

    -- double dereference the pointer to get the correct address
    ptr = ashita.memory.read_uint32(ptr);
    ptr = ashita.memory.read_uint32(ptr);
    -- the utcstamp is at offset 0x0C
    return ashita.memory.read_uint32(ptr + 0x0C);
end

local buff_duration = function(raw_duration)
    if (raw_duration == nil) then
        return -1;
    end
    if (raw_duration == 0x7FFFFFFF) then -- INFINITE_DURATION
        return -1;
    end

    local vana_base_stamp = 0x3C307D70;
    --get the time since vanadiel epoch
    local offset = get_utcstamp() - vana_base_stamp;
    --multiply it by 60 to create like terms
    local comparand = offset * 60;
    --get actual time remaining
    local real_duration = raw_duration - comparand;
    --handle the triennial spillover..
    while (real_duration < -2147483648) do
        real_duration = real_duration + 0xFFFFFFFF;
    end

    if real_duration < 1 then
        return 0;
    else
        --convert to seconds..
        return math.ceil(real_duration / 60);
    end
end

local check_special_ammo = function(buffer)
    local unlimitedShot = gData.GetBuffCount('Unlimited Shot') > 0
    local yoichiActive = yoichinoyumi and gData.GetBuffCount('Aftermath') > 0

    if (unlimitedShot or yoichiActive) then -- Check duration left on buffs against buffer
        local buffs = T {};
        local playMgr = AshitaCore:GetMemoryManager():GetPlayer();
        local ids = playMgr:GetStatusIcons();
        local durations = playMgr:GetStatusTimers();
        for i = 1, 32 do
            if ids[i] and ids[i] ~= 255 then
                local name = AshitaCore:GetResourceManager():GetString('buffs.names', ids[i]);
                buffs[name] = durations[i];
            end
        end

        if (unlimitedShot) then
            if (buff_duration(buffs['Unlimited Shot']) >= buffer) then
                return true
            end
        end
        if (yoichiActive) then
            if (buff_duration(buffs['Aftermath']) >= buffer) then
                return true
            end
        end
    end

    return false
end

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Scavenge') then
        gFunc.EquipSet(sets.Scavenge)
    elseif (action.Name == 'Shadowbind') then
        gFunc.EquipSet(sets.Shadowbind)
    elseif (action.Name == 'Camouflage') then
        gFunc.EquipSet(sets.Camouflage)
    elseif (action.Name == 'Sharpshot') then
        gFunc.EquipSet(sets.Sharpshot)
    elseif (action.Name == 'Eagle Eye Shot') then
        gFunc.EquipSet(sets.EagleEyeShot)

        local equipment = gData.GetEquipment()
        if (check_special_ammo(buffer_ja_ws)) then
            gFunc.EquipSet(sets.UnlimitedShot)
        elseif (equipment.Ammo ~= nil and equipment.Ammo.Name == special_ammo) then
            print(chat.header('RNG'):append(chat.message('Action Canceled: Special Ammo Protection')))
            gFunc.CancelAction()
        end
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot)

    local equipment = gData.GetEquipment()
    if (check_special_ammo(buffer_ranged_attack)) then
        gFunc.EquipSet(sets.UnlimitedShot)
    elseif (equipment.Ammo ~= nil and equipment.Ammo.Name == special_ammo) then
        print(chat.header('RNG'):append(chat.message('Action Canceled: Special Ammo Protection')))
        gFunc.CancelAction()
    end
end

profile.HandleMidshot = function()
    local environment = gData.GetEnvironment()

    gFunc.EquipSet(sets.Ranged_ATK)
    if (environment.DayElement == 'Fire') then
        gFunc.EquipSet(sets.rng_fire_ring)
    end
    if (environment.Time < 6 or environment.Time >= 18) then
        gFunc.EquipSet(sets.rng_fenrirs_earring)
    end

    if (gcdisplay.GetCycle('Ranged') == 'Accuracy') then
        gFunc.EquipSet(sets.Ranged_ACC)
    end
    if (gcdisplay.GetToggle('HNM')) then
        gFunc.EquipSet(sets.Ranged_HNM)
    end

    local barrage = gData.GetBuffCount('Barrage')
    if (barrage == 1) then
        gFunc.EquipSet(sets.Barrage)
    end

    if (check_special_ammo(buffer_ranged_attack - 1)) then
        gFunc.EquipSet(sets.UnlimitedShot)
    end
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local player = gData.GetPlayer()
    local action = gData.GetAction()
    local environment = gData.GetEnvironment()

    if (DistanceWS:contains(action.Name)) then
        gFunc.EquipSet(sets.WS_Ranged_ATK)
        if (gcdisplay.GetCycle('Ranged') == 'Attack' and action.Name ~= 'Slug Shot' and action.Name ~= 'Sidewinder') then
            if (environment.DayElement == 'Fire') then
                gFunc.EquipSet(sets.rng_fire_ring)
            end
        end
        if (environment.Time < 6 or environment.Time >= 18) then
            gFunc.EquipSet(sets.rng_fenrirs_earring)
        end

        if (gcdisplay.GetCycle('Ranged') == 'Accuracy') then
            gFunc.EquipSet(sets.WS_Ranged_ACC)
        end
        if (gcdisplay.GetToggle('HNM')) then
            gFunc.EquipSet(sets.WS_Ranged_HNM)
        end
    end

    if (action.Name == 'Namas Arrow') then
        gFunc.EquipSet(sets.WS_NamasArrow)
    else
        if (action.Name == 'Heavy Shot') then
            gFunc.EquipSet(sets.WS_HeavyShot)
        elseif (action.Name == 'Detonator') then
            gFunc.EquipSet(sets.WS_Detonator)
        elseif (action.Name == 'Slug Shot') then
            gFunc.EquipSet(sets.WS_SlugShot)
        elseif (action.Name == 'Coronach') then
            gFunc.EquipSet(sets.WS_Coronach)
        elseif (action.Name == 'Arching Arrow') then
            gFunc.EquipSet(sets.WS_ArchingArrow)
        elseif (action.Name == 'Empyreal Arrow') then
            gFunc.EquipSet(sets.WS_EmpyrealArrow)
        elseif (action.Name == 'Sidewinder') then
            gFunc.EquipSet(sets.WS_Sidewinder)
        end

        local equipment = gData.GetEquipment()
        if (check_special_ammo(buffer_ja_ws)) then
            gFunc.EquipSet(sets.UnlimitedShot)
        elseif (equipment.Ammo ~= nil and equipment.Ammo.Name == special_ammo) then
            print(chat.header('RNG'):append(chat.message('Action Canceled: Special Ammo Protection')))
            gFunc.CancelAction()
        end
    end

    if (player.SubJob == 'SAM') then
        gFunc.EquipSet(sets.WS_SJ_SAM)
    end
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'ranged'})
    gcdisplay.CreateCycle('Ranged', {[1] = 'Attack', [2] = 'Accuracy',})
    gcinclude.SetAlias(T{'hnm'})
    gcdisplay.CreateToggle('HNM', false)
    gcmelee.Load(3.00)
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'ranged'})
    gcinclude.ClearAlias(T{'hnm'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'ranged') then
        gcdisplay.AdvanceCycle('Ranged')
        gcinclude.Message('Ranged', gcdisplay.GetCycle('Ranged'))
    elseif (args[1] == 'hnm') then
        gcdisplay.AdvanceToggle('HNM')
        gcinclude.Message('HNM', gcdisplay.GetToggle('HNM'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)
    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
end

return profile
