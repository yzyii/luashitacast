-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local fenrirs_earring = { -- Not used for RNG at all
    Ear2 = 'Fenrir\'s Earring',
}
local muscle_belt = {
    Waist = 'Muscle Belt +1',
}
local garden_bangles = {
    Hands = 'Garden Bangles',
}
local presidential_hairpin = {
    -- Head = 'President. Hairpin',
}
local dream_ribbon = {
    Head = 'Dream Ribbon',
}

-- Set this to true to confirm that actually read the README.md and set up the equipment listed above correctly
local i_can_read_and_follow_instructions_test = false

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcinclude = gFunc.LoadFile('common\\gcinclude-rag.lua')

local gcmelee = {}

local MuscleBeltJobs = T{ 'WAR','MNK','THF','BST','NIN' }
local GardenBanglesJobs = T{ 'MNK','THF','DRK','RNG' }
local PresidentialHairpinJobs = T{  'MNK','THF','BST','NIN','DRG' }

local isDPS = true
local lag = false

local TpVariantTable = {
    [1] = 'LowAcc',
    [2] = 'HighAcc',
}

local tp_variant = 1

local WeaponOverrideTable = {
    [1] = '1',
    [2] = '2',
    [3] = '3',
}

local weapon_override = 1

local lastIdleSetBeforeEngaged = ''

local SurvivalSpells = T{ 'Utsusemi: Ichi','Utsusemi: Ni','Blink','Aquaveil','Stoneskin' }

local AliasList = T{
    'tpset','tp','mode','dps','lag','weapon','wl'
}

local utsuBuffs = T{
    [66] = 1,
    [444] = 2,
    [445] = 3,
    [446] = 4, 
}

function gcmelee.SetIsDPS(isDPSVal)
    isDPS = isDPSVal
end

function gcmelee.Load()
    gcinclude.SetAlias(AliasList)
    gcinclude.Load()
end

function gcmelee.Unload()
    gcinclude.Unload()
    gcinclude.ClearAlias(AliasList)
end

function gcmelee.DoCommands(args)
    if not (AliasList:contains(args[1])) then
        gcinclude.DoCommands(args)
        do return end
    end

    if (args[1] == 'tpset' or args[1] == 'tp' or args[1] == 'mode') then
        tp_variant = tp_variant + 1
        if (tp_variant > #TpVariantTable) then
            tp_variant = 1
        end
        gcinclude.Message('TP Set', TpVariantTable[tp_variant])
    elseif (args[1] == 'weapon' or args[1] == 'wl') then
        weapon_override = weapon_override + 1
        if (weapon_override > #WeaponOverrideTable) then
            weapon_override = 1
        end
        gcinclude.Message('Weapon Loadout', WeaponOverrideTable[weapon_override])
    elseif (args[1] == 'dps') then
        isDPS = not isDPS
        gcinclude.Message('DPS Mode', isDPS)
        if (not isDPS) then
            gcinclude.ToggleIdleSet('Normal')
            lastIdleSetBeforeEngaged = ''
        end
    elseif (args[1] == 'lag') then
        lag = not lag
        gcinclude.Message('[Note: Midcast Delays are disabled if Lag is true] Lag', lag)
    end
end

function gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)
    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    gcinclude.DoDefaultIdle()

    if (not gcinclude.horizon_safe_mode) then
        if (player.MainJob == 'PLD' or player.MainJob == 'NIN' or player.MainJob == 'DRK') then
            if (player.SubJob == 'NIN' or player.MainJob == 'NIN') then
                local function GetShadowCount()
                    for buffId, shadowCount in pairs(utsuBuffs) do
                        if (gData.GetBuffCount(buffId) > 0) then
                            return shadowCount
                        end
                    end

                    return 0
                end
                if (GetShadowCount() == 0) then
                    gFunc.EquipSet('IdleDT')
                    if (gcdisplay.IdleSet == 'Alternate') then gFunc.EquipSet('IdleALTDT') end
                end
            end
        end
    end

    if (player.Status == 'Idle') then
        if (player.HPP < 50) then
            if (MuscleBeltJobs:contains(player.MainJob)) then gFunc.EquipSet('muscle_belt') end
        end
        if (player.HP < max_hp_in_idle_with_regen_gear_equipped) then
            local environment = gData.GetEnvironment()
            if (environment.Time >= 6 and environment.Time < 18) then
                if (GardenBanglesJobs:contains(player.MainJob)) then gFunc.EquipSet('garden_bangles') end
            end
            if (conquest:GetOutsideControl()) then
                if (PresidentialHairpinJobs:contains(player.MainJob)) then gFunc.EquipSet('presidential_hairpin') end
            end
            gFunc.EquipSet('dream_ribbon')
        end
    end

    if (player.Status == 'Idle') then
        if (player.HPP < 50) then
            gFunc.EquipSet('muscle_belt')
        end
        if (player.HP < max_hp_in_idle_with_regen_gear_equipped) then
            if (conquest:GetOutsideControl()) then
                gFunc.EquipSet('presidential_hairpin')
            end
            gFunc.EquipSet('dream_ribbon')
        end
    end


    if (isDPS) then
        if (gcdisplay.IdleSet == 'Normal' or gcdisplay.IdleSet == 'Alternate' or gcdisplay.IdleSet == 'LowAcc' or gcdisplay.IdleSet == 'HighAcc') then
            if (player.Status == 'Engaged') then
                if (lastIdleSetBeforeEngaged == '') then
                    lastIdleSetBeforeEngaged = gcdisplay.IdleSet
                end
                if (gcdisplay.IdleSet ~= TpVariantTable[tp_variant]) then
                    gcinclude.ToggleIdleSet(TpVariantTable[tp_variant])
                end

                gFunc.EquipSet('TP_LowAcc')
                if (player.MainJob ~= 'RNG') then
                    if (environment.Time >= 6 and environment.Time < 18) then
                        gFunc.EquipSet('fenrirs_earring')
                    end
                end

                local aftermath = gData.GetBuffCount('Aftermath') > 0
                local mjollnirHaste = gData.GetBuffCount(580) > 0 -- Horizon Mjollnir Haste Buff

                if aftermath then
                    gFunc.EquipSet('TP_Aftermath')
                end
                if mjollnirHaste then
                    gFunc.EquipSet('TP_Mjollnir_Haste')
                end
                if player.MainJob == 'DRK' and aftermath and mjollnirHaste then
                    gFunc.EquipSet('TP_Aftermath_Mjollnir_Haste')
                end
                if (gcdisplay.IdleSet == 'HighAcc') then
                    gFunc.EquipSet('TP_HighAcc')
                end
            end
            if (player.Status == 'Idle' and lastIdleSetBeforeEngaged ~= '') then
                gcinclude.ToggleIdleSet(lastIdleSetBeforeEngaged)
                lastIdleSetBeforeEngaged = ''
            end
        end
    end
end

function gcmelee.DoFenrirsEarring()
    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    if (isDPS) then
        if (player.MainJob ~= 'RNG') then
            if (environment.Time >= 6 and environment.Time < 18) then
                gFunc.EquipSet('fenrirs_earring')
            end
        end
    end
end

function gcmelee.DoDefaultOverride()
    if (isDPS) then
        gFunc.EquipSet('Weapon_Loadout_' .. WeaponOverrideTable[weapon_override])
    end
    gcinclude.DoDefaultOverride(true)
end

function gcmelee.DoPrecast(fastCastValue)
    if (not i_can_read_and_follow_instructions_test) then
        print(chat.header('GCMelee'):append(chat.message('Failed to follow instructions. Read the README.md')))
    end

    gFunc.EquipSet('Precast')
    if (not lag) then
        return gcmelee.SetupMidcastDelay(fastCastValue)
    end

    return 0
end

function gcmelee.SetupMidcastDelay(fastCastValue)
    local player = gData.GetPlayer()
    local action = gData.GetAction()
    local castTime = action.CastTime

    local hasso = gData.GetBuffCount('Hasso')
    local seigan = gData.GetBuffCount('Seigan')
    local castTimeMod = 1
    if (hasso == 1 or seigan == 1) then
        castTimeMod = 1.5
    end

    if (action.Skill == 'Divine Magic' and action.Name == 'Banish III') then
        castTime = 3000
    end

    if (player.SubJob == 'RDM') then
         fastCastValue = fastCastValue + 0.15 -- Fast Cast Trait
    end
    local minimumBuffer = 0.4 -- Can be lowered to 0.1 if you want
    local packetDelay = 0.25 -- Change this to 0.4 if you do not use PacketFlow
    local castDelay = ((castTime * castTimeMod * (1 - fastCastValue)) / 1000) - minimumBuffer
    if (castDelay >= packetDelay) then
        gFunc.SetMidDelay(castDelay)
    end

    -- print(chat.header('DEBUG'):append(chat.message('Cast delay is ' .. castDelay)))

    return castDelay - 0.4
end

function gcmelee.DoMidcast(sets)
    if (not lag) then
        gcmelee.SetupInterimEquipSet(sets)
    end
    gFunc.EquipSet('Haste')
end

function gcmelee.SetupInterimEquipSet(sets)
    local action = gData.GetAction()

    gFunc.InterimEquipSet(sets.DT)

    if (SurvivalSpells:contains(action.Name)) then
        gFunc.InterimEquipSet(sets.SIRD)
    end

    if (gcdisplay.IdleSet == 'MDT') then gFunc.InterimEquipSet(sets.MDT) end
    if (gcdisplay.IdleSet == 'FireRes') then gFunc.InterimEquipSet(sets.FireRes) end
    if (gcdisplay.IdleSet == 'IceRes') then gFunc.InterimEquipSet(sets.IceRes) end
    if (gcdisplay.IdleSet == 'LightningRes') then gFunc.InterimEquipSet(sets.LightningRes) end
    if (gcdisplay.IdleSet == 'EarthRes') then gFunc.InterimEquipSet(sets.EarthRes) end
end

function gcmelee.DoWS()
    if (not i_can_read_and_follow_instructions_test) then
        print(chat.header('GCMelee'):append(chat.message('Failed to follow instructions. Read the README.md')))
    end

    gFunc.EquipSet('WS')
    if (TpVariantTable[tp_variant] == 'HighAcc') then
        gFunc.EquipSet('WS_HighAcc')
    end

    gcmelee.DoFenrirsEarring()
end

function gcmelee.GetAccuracyMode()
    return TpVariantTable[tp_variant]
end

function gcmelee.DoAbility()
    if (not i_can_read_and_follow_instructions_test) then
        print(chat.header('GCMelee'):append(chat.message('Failed to follow instructions. Read the README.md')))
    end

    gcinclude.DoAbility()
end

function gcmelee.AppendSets(sets)
    sets.fenrirs_earring = fenrirs_earring
    sets.muscle_belt = muscle_belt
    sets.garden_bangles = garden_bangles
    sets.presidential_hairpin = presidential_hairpin
    sets.dream_ribbon = dream_ribbon

    return gcinclude.AppendSets(sets)
end

return gcmelee
