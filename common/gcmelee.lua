-- The period of time prior to midcast (spell) completion upon which equipment will swap.
-- 400 milliseconds is provided as a default conservative value which is typically sufficient worldwide but this value can be increased if your internet is completely and consistently shit.
local minimumBuffer = 0.4

-- Change this value to 0.4 if you do not use PacketFlow
local packetDelay = 0.25

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

-- Set this to true to confirm that you actually read the README.md and set up the equipment and settings listed above correctly
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

local WeaponOverrideIndexes = {
    ['1'] = 1,
    ['2'] = 2,
    ['3'] = 3,
}

local weapon_override = 1

local lastIdleSetBeforeEngaged = ''

local SurvivalSpells = T{ 'Utsusemi: Ichi','Utsusemi: Ni','Blink','Aquaveil','Stoneskin' }

local AliasList = T{
    'tpset','tp','mode','dps','lag','weapon','wl','addhp','sethp','resethp',
}

local utsuBuffs = T{
    [66] = 1,
    [444] = 2,
    [445] = 3,
    [446] = 4,
}

local setHP = 0
local addHP = 0

local ver_loaded = nil

function gcmelee.SetIsDPS(isDPSVal)
    isDPS = isDPSVal
end

function gcmelee.GetIsDPS()
    return isDPS
end

function gcmelee.Load(version)
    ver_loaded = version
    gcinclude.SetAlias(AliasList)
    gcmelee.RetryLoad()
end

function gcmelee.RetryLoad()
    local player = gData.GetPlayer()
    if (player.MainJob ~= 'NON') then
        gcinclude.Load(gcmelee.GetVer())

        if (ver_loaded ~= gcmelee.GetVer()) then
            print(chat.header('GCMelee'):append(chat.message('Version mismatch found. Read the README.md')))
        end
    else
        gcmelee.RetryLoad:once(1)
    end
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
        if (args[2] ~= nil) then
            local cycleIndex = WeaponOverrideIndexes[args[2]]
            if (cycleIndex ~= nil) then
                weapon_override = cycleIndex
            end
        else
            weapon_override = weapon_override + 1
            if (weapon_override > #WeaponOverrideIndexes) then
                weapon_override = 1
            end
        end
        gcinclude.Message('Weapon Loadout', tostring(weapon_override))
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
    elseif (args[1] == 'addhp') then
        if (tonumber(args[2]) ~= nil) then
            addHP = tonumber(args[2])
            gcinclude.Message('Add HP', args[2])
        else
            gcinclude.Message('Add HP', addHP)
        end
    elseif (args[1] == 'sethp') then
        if (tonumber(args[2]) ~= nil) then
            setHP = tonumber(args[2])
            gcinclude.Message('Set HP', args[2])
        else
            gcinclude.Message('Set HP', setHP)
        end
    elseif (args[1] == 'resethp') then
        setHP = 0
        addHP = 0
        print(chat.header('Ashitacast'):append(chat.message('Reset HP')))
    end
end

function gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)
    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    gcinclude.DoDefaultIdle()

    if (player.Status == 'Idle') then
        if (player.HPP < 50) then
            if (MuscleBeltJobs:contains(player.MainJob)) then gFunc.EquipSet('muscle_belt') end
        end
        if (setHP > 0 and player.HP < setHP + addHP) or (setHP == 0 and player.HP < max_hp_in_idle_with_regen_gear_equipped + addHP) then
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
                elseif player.MainJob == 'DRG' then
                    spiritSurge = gData.GetBuffCount('Spirit Surge') > 0
                    if (spiritSurge) then
                        gFunc.EquipSet('TP_2H_Haste')
                        if (mjollnirHaste) then
                            gFunc.EquipSet('TP_2H_Mjollnir_Haste')
                        end
                    end
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

    if (not gcinclude.horizon_safe_mode) then
        if (player.MainJob == 'PLD' or player.MainJob == 'NIN' or (player.MainJob == 'DRK' and gcdisplay.GetToggle('Hate'))) then
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
    gcinclude.DoDefaultOverride(true)

    if (isDPS) then
        gFunc.EquipSet('Weapon_Loadout_' .. tostring(weapon_override))
    end
end

function gcmelee.DoPreshot(preshotSet, rangedSet, snapShotValue)
    local fset = gFunc.Combine(rangedSet, preshotSet)

    gFunc.EquipSet(fset)

    if (not lag) then
        local rangedString = fset.Range
        if (rangedString == nil or rangedString == 'displaced' or rangedString == 'empty' or rangedString == 'remove'or rangedString == '') then
            rangedString = fset.Ammo
        end

        if (rangedString ~= nil and rangedString ~= 'displaced' and rangedString ~= 'empty' and rangedString ~= 'remove'and rangedString ~= '') then
            local item = AshitaCore:GetResourceManager():GetItemByName(rangedString, 0)
            if (item ~= nil) then
                local delay = item.Delay

                -- print(chat.header('Ashitacast'):append(chat.message('Delay is ' .. tostring(delay))))

                local player = gData.GetPlayer()
                if (player.MainJob == 'RNG' or player.SubJob == "RNG") then
                    gFunc.SetMidDelay(0)
                    return
                end

                local shotTime = (delay * 1000) / 120

                local shotDelay = ((shotTime * (1 - snapShotValue)) / 1000) - minimumBuffer
                if (shotDelay >= packetDelay) then
                    gFunc.SetMidDelay(shotDelay)
                end
            else
                print(chat.header('GCMelee'):append(chat.message('Ranged weapons not filled out correctly. Unable to calculate delay for interim set usage.')))
                gFunc.SetMidDelay(0)
                gFunc.SetMidDelay(shotDelay)
            end
        else
            print(chat.header('GCMelee'):append(chat.message('Ranged weapons not filled out correctly. Unable to calculate delay for interim set usage.')))
            gFunc.SetMidDelay(0)
            gFunc.SetMidDelay(shotDelay)
        end
    end
end

function gcmelee.DoMidshot(sets, rangedSet)
    gFunc.EquipSet(rangedSet)

    if (not lag) then
        gcmelee.SetupInterimEquipSet(sets, true)
    end
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

    local castDelay = ((castTime * castTimeMod * (1 - fastCastValue)) / 1000) - minimumBuffer
    if (castDelay >= packetDelay) then
        gFunc.SetMidDelay(castDelay)
        gcinclude.DoCancel(action, castDelay - minimumBuffer)
    end

    -- print(chat.header('DEBUG'):append(chat.message('Cast delay is ' .. castDelay)))

    return castDelay - 0.4
end

function gcmelee.DoMidcast(sets)
    if (not lag) then
        gcmelee.SetupInterimEquipSet(sets, false)
    end
    gFunc.EquipSet('Haste')

    if (isDPS) then
        gFunc.EquipSet('Weapon_Loadout_' .. tostring(weapon_override))
    end
end

function gcmelee.SetupInterimEquipSet(sets, isRanged)
    local interimSet = sets.SIRD

    local action = gData.GetAction()
    if (not SurvivalSpells:contains(action.Name)) then
        interimSet = sets.DT
    end

    if (gcdisplay.IdleSet == 'DT') then interimSet = sets.DT end
    if (gcdisplay.IdleSet == 'MDT') then interimSet = sets.MDT end
    if (gcdisplay.IdleSet == 'FireRes') then interimSet = sets.FireRes end
    if (gcdisplay.IdleSet == 'IceRes') then interimSet = sets.IceRes end
    if (gcdisplay.IdleSet == 'LightningRes') then interimSet = sets.LightningRes end
    if (gcdisplay.IdleSet == 'EarthRes') then interimSet = sets.EarthRes end
    if (gcdisplay.IdleSet == 'WindRes') then interimSet = sets.WindRes end
    if (gcdisplay.IdleSet == 'WaterRes') then interimSet = sets.WaterRes end
    if (gcdisplay.IdleSet == 'Evasion') then interimSet = sets.Evasion end
    if (gcdisplay.IdleSet == 'Override') then interimSet = sets.Override end

    if (isDPS) then
        local wlString = 'Weapon_Loadout_' .. tostring(weapon_override)
        interimSet = gFunc.Combine(interimSet, sets[wlString])
    end

    if (isRanged) then
        local ignoreRA = {
            Range = 'ignore',
            Ammo = 'ignore',
        }
        interimSet = gFunc.Combine(interimSet, ignoreRA)
    end

    gFunc.InterimEquipSet(interimSet)
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

function gcmelee.GetVer()
    return 3.00
end

return gcmelee
