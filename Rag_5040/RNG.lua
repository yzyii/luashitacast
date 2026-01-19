local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

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
        Ammo = 'Silver Bullet',
    },
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

    Precast = {},
    SIRD = { -- Only used for Idle sets and not while Override sets are active
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    Preshot = {},

    TP_LowAcc = {
        Ammo = 'Silver Bullet',
    },
    TP_Aftermath = {}, -- This can be ignored since the UnlimitedShot set will already equip for Aftermaths
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {},

    Ranged_ACC = {},
    Ranged_ATK = {},

    EagleEyeShot = {},

    Barrage = {},
    Scavenge = {},
    Shadowbind = {},
    Camouflage = {},
    Sharpshot = {},
    UnlimitedShot = { -- Used for Namas Arrow Aftermath as well as Unlimited Shot. You do not need to edit this.
        Ammo = special_ammo,
    },

    WS = { -- Technically could be used as the base set for Ranged WS but is probably best used for Melee WS instead e.g. Decimation.
    },
    WS_HighAcc = { -- Note that this will only be used for Melee WS when HighAcc tp mode is being used.
    },
    
    WS_Ranged_ACC = {},
    WS_Ranged_ATK = {},

    WS_SlugShot = {},
    WS_Coronach = {},
    WS_Sidewinder = {},
    WS_NamasArrow = { -- Unable to verify myself on Horizon but Namas Arrow should not use your ammo on use and therefore your special_ammo should be included in this set.
        Ammo = special_ammo,
    },

    WS_SJ_SAM = { -- If Brutal or similar is required for Store TP on WS
    },

    Weapon_Loadout_1 = {},
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

    gFunc.EquipSet(sets.Ranged_ACC)
    if (gcdisplay.GetCycle('Ranged') == 'Attack') then
        gFunc.EquipSet(sets.Ranged_ATK)
        if (environment.DayElement == 'Fire') then
            gFunc.EquipSet(sets.rng_fire_ring)
        end
    end

    if (environment.Time < 6 or environment.Time >= 18) then
        gFunc.EquipSet(sets.fenrirs_earring)
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
        gFunc.EquipSet(sets.WS_Ranged_ACC)
        if (gcdisplay.GetCycle('Ranged') == 'Attack') then
            gFunc.EquipSet(sets.WS_Ranged_ATK)
        end
    end

    if (action.Name == 'Namas Arrow') then
        gFunc.EquipSet(sets.WS_NamasArrow)
    else
        if (action.Name == 'Slug Shot') then
            gFunc.EquipSet(sets.WS_SlugShot)
        elseif (action.Name == 'Coronach') then
            gFunc.EquipSet(sets.WS_Coronach)
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

    if (gcdisplay.GetCycle('Ranged') == 'Attack' and action.Name ~= 'Slug Shot' and action.Name ~= 'Sidewinder') then
        if (environment.DayElement == 'Fire') then
            gFunc.EquipSet(sets.rng_fire_ring)
        end
    end
    if (environment.Time < 6 or environment.Time >= 18) then
        gFunc.EquipSet(sets.fenrirs_earring)
    end

    if (player.SubJob == 'SAM') then
        gFunc.EquipSet(sets.WS_SJ_SAM)
    end
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'ranged'})
    gcdisplay.CreateCycle('Ranged', {[1] = 'Accuracy', [2] = 'Attack',})
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'ranged'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'ranged') then
        gcdisplay.AdvanceCycle('Ranged')
        gcinclude.Message('Ranged', gcdisplay.GetCycle('Ranged'))
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
