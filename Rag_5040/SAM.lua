local profile = {}

local fastCastValue = 0.02 -- 0% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local using_both_amano_and_yoichi = false
local using_both_amano_and_yoichi_special_arrow = {
    Ammo = 'T.K. Arrow',
}

local sets = {
    Idle = {
        Head = 'Arh. Jinpachi +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Arhat\'s Gi +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Shadow Mantle',
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = 'Gavial Cuisses +1',
        Feet = 'Gavial Greaves +1',
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
    Movement = {},
    Movement_TP = {
        Hands = { Name = 'Bandomusha Kote', Priority = 60 },
        Feet  = { Name = 'Fuma Sune-Ate', Priority = 60 },
    },

    DT = {
        Head = 'Arh. Jinpachi +1',
        Body = 'Arhat\'s Gi +1',
        Hands = 'Dst. Mittens +1',
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
        Ear2 = { Name = 'Loquac. Earring', Priority = 50 },
    },
    SIRD = { -- Override sets (Resistance / Evasion) take precedence if in use.
        Head = 'Arh. Jinpachi +1',
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 }, -- 8
        Body = 'Arhat\'s Gi +1',
        Hands = 'Gavial Fng.Gnt. +1',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Shadow Mantle',
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = 'Gavial Cuisses +1',
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = {
        Head = 'Ace\'s Helm',
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 },
    },

    TP_LowAcc = {
        Head = 'Ace\'s Helm',
        Neck = 'Justice Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Haubergeon +1',
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring1 = 'Rajas Ring',
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Back = 'Forager\'s Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 },
    },
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {
        Head = { Name = 'Sao. Kabuto +1', Priority = 60 },
        Neck = 'Peacock Amulet',
        Hands = 'Noritsune Kote',
        Ring1 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Waist = 'Life Belt',
        Feet = { Name = 'Shr. Sune-Ate +1', Priority = -20 },
    },
    TP_DRG = {
        Head = 'Maat\'s Cap',
        Ear2 = 'Wyvern Earring',
    },
    TP_THF = {
        Ear2 = 'Pilferer\'s Earring',
    },

    Weapon_Loadout_1 = {
        Main = 'Onimaru',
        Range = 'Ifrit\'s Bow',
        Ammo  = 'Kabura Arrow',
    },
    Weapon_Loadout_2 = {
        Main = 'Leviathan\'s Couse',
        Range = 'displaced',
        Ammo = { Name = 'Tiphia Sting', Priority = -20 },
        Neck = 'Love Torque',
        Hands = 'Hachiman Kote +1',
    },
    Weapon_Loadout_3 = {},

    WS = {
        Head = 'Maat\'s Cap',
        Neck = 'Justice Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Triumph Earring',
        Body = { Name = 'Kirin\'s Osode', Priority = 50 },
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 60 },
        Ring1 = 'Rajas Ring',
        Ring2 = 'Triumph Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Shura Haidate +1', Priority = -20 },
        Feet = 'Hmn. Sune-Ate +1',
    },
    WS_HighAcc = {},

    WS_Yukikaze = {
        Neck = 'Snow Gorget',
        Body = 'Hmn. Domaru +1',
        Hands = 'Hachiman Kote +1',
    },
    WS_Gekko = {
        Neck = 'Snow Gorget',
        Body = 'Hmn. Domaru +1',
        Hands = 'Hachiman Kote +1',
    },
    WS_Kasha = {
        Neck = 'Light Gorget',
        Body = 'Hmn. Domaru +1',
        Hands = 'Hachiman Kote +1',
    },
    WS_Kaiten = {
        Body = { Name = 'Byrnie +1', Priority = 60 },
        Hands = 'Hachiman Kote +1',
    },
    WS_Jinpu = {
        Neck = 'Soil Gorget',
        Ear2 = 'Novio Earring',
        Body = 'Haubergeon +1',
        Hands = { Name = 'Bandomusha Kote', Priority = 60 },
    },
    WS_PentaThrust = {
        Head = { Name = 'Sao. Kabuto +1', Priority = 60 },
        Neck = 'Love Torque',
        Ear2 = 'Merman\'s Earring',
        Body = 'Haubergeon +1',
        Hands = { Name = 'Bandomusha Kote', Priority = 60 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Waist = 'Sao. Koshi-ate',
        Legs = 'Byakko\'s Haidate',
        Feet = { Name = 'Sao. Sune-ate +1', Priority = 60 },
    },
    WS_NamasArrow = {
        Neck  = 'Light Gorget',
        Ear1  = 'Triumph Earring',
        Hands = { Name = 'Seiryu\'s Kote', Priority = 60 },
        Back  = 'Amemet Mantle +1',
    },

    WS_2H = {
        Body = { Name = 'Kirin\'s Osode', Priority = 50 },
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 60 },
        Feet = 'Rutter Sabatons',
    },
    WS_2H_Kaiten = {
        Body = { Name = 'Byrnie +1', Priority = 60 },
    },
    WS_2H_Jinpu = {
        Body = 'Haubergeon +1',
        Hands = { Name = 'Bandomusha Kote', Priority = 60 },
    },
    WS_2H_PentaThrust = {
        Body = 'Haubergeon +1',
        Hands = { Name = 'Bandomusha Kote', Priority = 60 },
        Feet = { Name = 'Sao. Sune-ate +1', Priority = 60 },
    },
    WS_2H_NamasArrow = {
        Hands = { Name = 'Seiryu\'s Kote', Priority = 60 },
    },

    Meditate = {
        Head = { Name = 'Myochin Kabuto', Priority = 60 },
        Hands = { Name = 'Sao. Kote +1', Priority = 60 },
    },
    WardingCircle = {
        Head = { Name = 'Myochin Kabuto', Priority = 60 },
    },

    Jump = {
        Head = 'Maat\'s Cap',
        Neck = 'Justice Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Robust Earring',
        Body = { Name = 'Kirin\'s Osode', Priority = 50 },
        Hands = { Name = 'Bandomusha Kote', Priority = 60 },
        Ring1 = 'Rajas Ring',
        Ring2 = 'Robust Ring',
        Back = 'Wyvern Mantle',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Shura Haidate +1', Priority = -20 },
        Feet = 'Rutter Sabatons',
    },
    HighJump = {
        Ear2 = 'Merman\'s Earring',
        Body = 'Haubergeon +1',
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
    },

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    VileElixir = {
        Head = { Name = 'Genbu\'s Kabuto', Priority = 60 },
        Neck = { Name = 'Shield Pendant', Priority = 20 },
        Ear1 = { Name = 'Pigeon Earring +1', Priority = 60 },
        Ear2 = { Name = 'Pigeon Earring +1', Priority = 60 },
        Body = { Name = 'Saotome Domaru', Priority = 60 },
        Hands = { Name = 'Seiryu\'s Kote', Priority = 60 },
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Ring2 = { Name = 'Bloodbead Ring', Priority = 40 },
        Back = { Name = 'Gigant Mantle', Priority = 60 },
        Waist = { Name = 'Powerful Rope', Priority = 60 },
        Legs = { Name = 'Dusk Trousers +1', Priority = 60 },
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 },
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

sets.using_both_amano_and_yoichi_special_arrow = using_both_amano_and_yoichi_special_arrow
profile.Sets = gcmelee.AppendSets(sets)

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Meditate') then
        gFunc.EquipSet(sets.Meditate)
    elseif (action.Name == 'Warding Circle') then
        gFunc.EquipSet(sets.WardingCircle)
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

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local action = gData.GetAction()
    if (action.Name == 'Tachi: Yukikaze') then
        gFunc.EquipSet(sets.WS_Yukikaze)
    elseif (action.Name == 'Tachi: Gekko') then
        gFunc.EquipSet(sets.WS_Gekko)
    elseif (action.Name == 'Tachi: Kasha') then
        gFunc.EquipSet(sets.WS_Kasha)
    elseif (action.Name == 'Tachi: Kaiten') then
        gFunc.EquipSet(sets.WS_Kaiten)
    elseif (action.Name == 'Tachi: Jinpu') then
        gFunc.EquipSet(sets.WS_Jinpu)
    elseif (action.Name == 'Penta Thrust') then
        gFunc.EquipSet(sets.WS_PentaThrust)
    elseif (action.Name == 'Namas Arrow') then
        gFunc.EquipSet(sets.WS_NamasArrow)
    end

    local meikyo = gData.GetBuffCount('Meikyo Shisui')
    if (meikyo > 0) then
        gFunc.EquipSet(sets.WS_2H)
        if (action.Name == 'Tachi: Kaiten') then
            gFunc.EquipSet(sets.WS_2H_Kaiten)
        elseif (action.Name == 'Tachi: Jinpu') then
            gFunc.EquipSet(sets.WS_2H_Jinpu)
        elseif (action.Name == 'Penta Thrust') then
            gFunc.EquipSet(sets.WS_2H_PentaThrust)
        elseif (action.Name == 'Namas Arrow') then
            gFunc.EquipSet(sets.WS_2H_NamasArrow)
        end
    end

    if (using_both_amano_and_yoichi) then
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

        local DURATION_OF_1K_AFTERMATH_IN_SECONDS = 20

        if (buff_duration(buffs['Aftermath']) < DURATION_OF_1K_AFTERMATH_IN_SECONDS and action.Name == 'Namas Arrow') then
            gFunc.EquipSet(sets.using_both_amano_and_yoichi_special_arrow)
        end
    end
end

profile.OnLoad = function()
    gcmelee.Load()
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
        if (player.SubJob == 'DRG') then
            gFunc.EquipSet(sets.TP_DRG)
        elseif (player.SubJob == 'THF') then
            gFunc.EquipSet(sets.TP_THF)
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
end

return profile
