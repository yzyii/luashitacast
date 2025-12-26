-- Set to true if you want messages every time Mst.Cst. Bracelets are used.
local log_conquest = false

-- This uses the BLM-advanced.lua to calculate more precise Yellow sets. Do not use this unless you know what you're doing.
local blm_advanced = false

-- Set to true if you have both Dark Earring and Abyssal earring to turn off Diabolos's Earring override for Dark Magic sets
local dark_and_abyssal_earrings = true

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local claustrum = {
    -- Main = 'Claustrum',
}

local fire_staff = {
    Main = 'Vulcan\'s Staff',
}
local earth_staff = {
    Main = 'Terra\'s Staff',
}
local water_staff = {
    Main = 'Neptune\'s Staff',
}
local wind_staff = {
    Main = 'Auster\'s Staff',
}
local ice_staff = {
    Main = 'Aquilo\'s Staff',
}
local thunder_staff = {
    Main = 'Jupiter\'s Staff',
}
local light_staff = {
    Main = 'Apollo\'s Staff',
}
local dark_staff = {
    Main = 'Pluto\'s Staff',
}

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

local uggalepih_pendant = {
    Neck = 'Uggalepih Pendant',
}
local master_casters_bracelets = {
    Hands = 'Mst.Cst. Bracelets',
}
local wizards_mantle = {
    -- Back = 'Wizard\'s Mantle',
}
local republic_gold_medal = { -- Note: Disabled for BRD
    Neck = 'Rep.Gold Medal',
}
local diabolos_earring = { -- Forces usage of this for NukeACC, EnfeebleACC, and Dark Magic
    -- Ear2 = 'Diabolos\'s Earring',
}
local diabolos_ring = {
    Ring2 = 'Diabolos\'s Ring',
}
local ice_ring = {
    -- Ring2 = 'Ice Ring',
}
local water_ring = {
    -- Ring2 = 'Water Ring',
}
local overlords_ring = {
    Ring1 = 'Overlord\'s Ring',
}

-- For Meleeing on WHM, BRD or RDM. Fenrir's Earring will be prioritised over Diabolos's Earring if using the same slot
local tp_fenrirs_earring = {
    -- Ear2 = 'Fenrir\'s Earring',
}
local tp_diabolos_earring = {
    -- Ear2 = 'Diabolos\'s Earring',
}

-- Set this to true to confirm that actually read the README.md and set up the equipment listed above correctly
local i_can_read_and_follow_instructions_test = false

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcinclude = gFunc.LoadFile('common\\gcinclude-rag.lua')

blmAdvanced = gFunc.LoadFile('common\\BLM-advanced.lua')

local gcmage = {}

local AliasList = T{
    'addmp','setmp','resetmp',
    'mode', -- RDM / WHM / BLM
    'csstun','vert', -- RDM
    'hate', -- RDM / WHM
    'tp', -- RDM / WHM / BRD / SMN
    'yellow', -- BLM / WHM
    'mb','hnm', -- BLM
    'lag',
    'weapon','wl', -- RDM / WHM / BRD / SMN
}

local NoMods = T{
    'Haste','Refresh','Blink','Aquaveil',
    'Regen','Regen II','Regen III',
    'Sneak', 'Invisible','Deodorize',
    'Protect','Protect II','Protect III','Protect IV','Protect V',
    'Protectra','Protectra II','Protectra III','Protectra IV','Protectra V',
    'Shell','Shell II','Shell III','Shell IV','Shell V',
    'Shellra','Shellra II','Shellra III','Shellra IV','Shellra V',
    'Warp', 'Warp II','Escape','Tractor',
    'Raise','Reraise','Reraise II','Reraise III',
    'Poisona','Paralyna','Silena','Blindna','Viruna','Erase',
    'Teleport-Holla','Teleport-Dem','Teleport-Mea',
    'Dia','Dia II','Dia III',
    'Utsusemi: Ichi','Utsusemi: Ni','Tonko: Ichi','Tonko: Ni','Monomi: Ichi'
}

local ElementalDebuffs = T{ 'Burn','Rasp','Drown','Choke','Frost','Shock' }
local EnfeebMNDSpells = T{ 'Paralyze','Slow','Paralyze II','Slow II' }
local EnfeebMNDACCSpells = T{ 'Silence' }
local EnfeebINTSpells = T{ 'Blind','Poison','Poison II','Poisonga','Blind II' }
local EnfeebINTACCSpells = T{ 'Gravity','Bind','Dispel','Sleep','Sleep II','Sleepga','Sleepga II' }
local HateSpells = T{ 'Sleep','Sleep II','Blind','Dispel','Bind' }
local DiabolosPoleSpells = T{ 'Aspir','Drain' }
local SurvivalSpells = T{ 'Utsusemi: Ichi','Utsusemi: Ni','Blink','Aquaveil','Stoneskin' }
local SpikeSpells = T{ 'Blaze Spikes','Shock Spikes','Ice Spikes' }
local CureSpells = T{ 'Cure','Cure II','Cure III','Cure IV','Cure V','Curaga','Curaga II','Curaga III','Curaga IV' }

local ElementalStaffTable = {
    ['Fire'] = 'fire_staff',
    ['Earth'] = 'earth_staff',
    ['Water'] = 'water_staff',
    ['Wind'] = 'wind_staff',
    ['Ice'] = 'ice_staff',
    ['Thunder'] = 'thunder_staff',
    ['Light'] = 'light_staff',
    ['Dark'] = 'dark_staff'
}

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

local setMP = 0
local addMP = 0
local lastSummoningElement = ''
local restingMaxMP = false

local lag = false

local WeaponOverrideTable = {
    [1] = '1',
    [2] = '2',
    [3] = '3',
}

local weapon_override = 1

function gcmage.Load()
    local player = gData.GetPlayer()
    if (player.MainJob ~= 'NON') then
        gcmage.SetVariables()
    else
        gcmage.SetVariables:once(2)
    end

    gcinclude.SetAlias(AliasList)
    gcinclude.Load()
end

function gcmage.Unload()
    gcinclude.Unload()
    gcinclude.ClearAlias(AliasList)
end

function gcmage.SetVariables()
    local player = gData.GetPlayer()

    if (player.MainJob ~= 'BRD' and player.MainJob ~= 'SMN') then
        gcdisplay.CreateCycle('Mode', {[1] = 'Potency', [2] = 'Accuracy',})
    end
    if (player.MainJob ~= 'BLM') then
        gcdisplay.CreateCycle('TP', {[1] = 'Off', [2] = 'LowAcc', [3] = 'HighAcc'})
    end
    if (player.MainJob == 'RDM') then
        gcdisplay.CreateToggle('Hate', false)
    end
    if (player.MainJob == 'BLM') then
        gcdisplay.CreateToggle('Yellow', true)
        gcdisplay.CreateToggle('MB', false)
        gcdisplay.CreateToggle('HNM', false)
    end
    if (player.MainJob == 'WHM') then
        gcdisplay.CreateToggle('Hate', false)
        gcdisplay.CreateToggle('Yellow', false)
    end
end

function gcmage.DoCommands(args, sets)
    if not (AliasList:contains(args[1])) then
        gcinclude.DoCommands(args)
        do return end
    end

    local player = gData.GetPlayer()

    if (args[1] == 'addmp') then
        if (tonumber(args[2]) ~= nil) then
            addMP = tonumber(args[2])
            gcinclude.Message('Add MP', args[2])
        else
            gcinclude.Message('Add MP', addMP)
        end
    elseif (args[1] == 'setmp') then
        if (tonumber(args[2]) ~= nil) then
            setMP = tonumber(args[2])
            gcinclude.Message('Set MP', args[2])
        else
            gcinclude.Message('Set MP', setMP)
        end
    elseif (args[1] == 'resetmp') then
        setMP = 0
        addMP = 0
        print(chat.header('Ashitacast'):append(chat.message('Reset MP')))
    elseif (args[1] == 'mode') then
        gcdisplay.AdvanceCycle('Mode')
        gcinclude.Message('Magic Mode', gcdisplay.GetCycle('Mode'))
    elseif (args[1] == 'tp' and player.MainJob ~= 'BLM') then
        gcdisplay.AdvanceCycle('TP')
        gcinclude.Message('TP Mode', gcdisplay.GetCycle('TP'))
    elseif (args[1] == 'lag') then
        lag =  not lag
        gcinclude.Message('[Note: Midcast Delays are disabled if Lag is true] Lag', lag)
    elseif ((args[1] == 'weapon' or args[1] == 'wl') and player.MainJob ~= 'BLM') then
        weapon_override = weapon_override + 1
        if (weapon_override > #WeaponOverrideTable) then
            weapon_override = 1
        end
        gcinclude.Message('Weapon Loadout', WeaponOverrideTable[weapon_override])
    end

    if (player.MainJob == 'RDM' or player.MainJob == 'WHM') then
        if (args[1] == 'hate') then
            gcdisplay.AdvanceToggle('Hate')
            gcinclude.Message('Hate', gcdisplay.GetToggle('Hate'))
        end
    end

    if (player.MainJob == 'RDM') then
        if (args[1] == 'vert') then
            if (conquest:GetOutsideControl()) then
                print(chat.header('Ashitacast'):append(chat.message('Out of Region - using ConvertOOR set.')))
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac set ConvertOOR')
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all')
            else
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac set Convert')
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all')
            end
            gcdisplay.CreateToggle('Lock', true)
            gcinclude.Message('Equip Lock', gcdisplay.GetToggle('Lock'))
        elseif (args[1] == 'csstun') then
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac set StunACC')
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all')
            gcdisplay.CreateToggle('Lock', true)
            gcinclude.Message('Equip Lock', gcdisplay.GetToggle('Lock'))
        end
    end

    if (player.MainJob == 'BLM' or player.MainJob == 'WHM') then
        if (args[1] == 'yellow') then
            gcdisplay.AdvanceToggle('Yellow')
            gcinclude.Message('Yellow', gcdisplay.GetToggle('Yellow'))
        end
    end

    if (player.MainJob == 'BLM') then
        if (args[1] == 'mb') then
            gcdisplay.AdvanceToggle('MB')
            gcinclude.Message('MB', gcdisplay.GetToggle('MB'))
        elseif (args[1] == 'hnm') then
            gcdisplay.AdvanceToggle('HNM')
            gcinclude.Message('HNM', gcdisplay.GetToggle('HNM'))
        end
    end
end

function gcmage.DoFenrirsEarring()
    local environment = gData.GetEnvironment()

    if (environment.Time >= 6 and environment.Time < 18) then
        gFunc.EquipSet('tp_fenrirs_earring')
    end
end

function gcmage.DoDefault(ninSJMMP, whmSJMMP, blmSJMMP, rdmSJMMP, drkSJMMP)
    gcmage.DoDefault(nil, ninSJMMP, whmSJMMP, blmSJMMP, rdmSJMMP, drkSJMMP)
end

function gcmage.DoDefault(sets, ninSJMMP, whmSJMMP, blmSJMMP, rdmSJMMP, drkSJMMP)
    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    gcinclude.DoDefaultIdle()

    local equipMaxMP = false
    if (gcdisplay.IdleSet == 'Normal' or gcdisplay.IdleSet == 'Alternate') then
        if (setMP > 0) then
            if (player.MP >= setMP + addMP) then
                equipMaxMP = true
            end
        elseif (player.SubJob == 'WHM') and whmSJMMP ~= nil and player.MP >= whmSJMMP + addMP then
            equipMaxMP = true
        elseif (player.SubJob == 'BLM') and blmSJMMP ~= nil and player.MP >= blmSJMMP + addMP then
            equipMaxMP = true
        elseif (player.SubJob == 'RDM') and rdmSJMMP ~= nil and player.MP >= rdmSJMMP + addMP then
            equipMaxMP = true
        elseif (player.SubJob == 'DRK') and drkSJMMP ~= nil and player.MP >= drkSJMMP + addMP then
            equipMaxMP = true
        elseif ninSJMMP ~= nil and player.MP >= ninSJMMP + addMP then
            equipMaxMP = true
        end
    end

    if (equipMaxMP) then
        gFunc.EquipSet('IdleMaxMP')
        if (conquest:GetOutsideControl()) then
            if (player.MainJob ~= 'BRD') then
                gFunc.EquipSet('republic_gold_medal')
            end
        end
    end

    if (player.MainJob == 'SMN') then
        if (lastSummoningElement ~= '' and gData.GetPet()) then
            gFunc.EquipSet('Perpetuation')

            local staff = ElementalStaffTable[lastSummoningElement]
            if (sets.bahamuts_staff.Main) then
                staff = 'bahamuts_staff'
            end
            if (claustrum.Main) then
                staff = 'claustrum'
            end
            gFunc.EquipSet(staff)

            if (player.HPP <= 75 and player.TP < 1000) then
                gFunc.EquipSet('conjurers_ring')
            end

            if (gData.GetPet().Name == 'Carbuncle') then
                gFunc.EquipSet('carbuncle_mitts')
                gFunc.EquipSet('yinyang_robe')
            elseif (lastSummoningElement == environment.DayElement) then
                gFunc.EquipSet('summoners_doublet')
            end
            if (lastSummoningElement == environment.WeatherElement) then
                gFunc.EquipSet('summoners_horn')
            end
        end
    end

    if (player.MainJob == 'RDM' or player.MainJob == 'WHM' or player.MainJob == 'BRD' or player.MainJob == 'SMN') then
        if (gcdisplay.GetCycle('TP') ~= 'Off' and player.Status == 'Engaged') then
            gFunc.EquipSet('TP')
            if (environment.WeatherElement ~= 'Dark') then
                gFunc.EquipSet('tp_diabolos_earring')
            end
            if (environment.Time >= 6 and environment.Time < 18) then
                gFunc.EquipSet('tp_fenrirs_earring')
            end
            if gData.GetBuffCount(580) > 0 then -- Horizon Mjollnir Haste Buff
                gFunc.EquipSet('TP_Mjollnir_Haste')
            end
            if (gcdisplay.GetCycle('TP') == 'HighAcc') then
                gFunc.EquipSet('TP_HighAcc')
            end
            if (player.SubJob == 'NIN') then
                gFunc.EquipSet('TP_NIN')
            end
            if (player.MainJob == 'RDM' and player.HPP <= 75 and player.TP <= 1000) then
                gFunc.EquipSet('tp_fencers_ring')
            end
        end
    end

    gcinclude.DoDefaultOverride(false)

    if (player.Status == 'Resting') then
        lastSummoningElement = ''
        if (player.SubJob == 'BLM') then
            gFunc.EquipSet('wizards_mantle')
        end
        if (player.MPP >= 95 or restingMaxMP) then
            restingMaxMP = true
            gcinclude.DoDefaultIdle()
            gFunc.EquipSet('IdleMaxMP')
            if (conquest:GetOutsideControl()) then
                gFunc.EquipSet('republic_gold_medal')
            end
            if (dark_staff.Main) then
                gFunc.EquipSet('dark_staff')
            end
        end
    else
        restingMaxMP = false
    end

    if (player.MainJob ~= 'BLM' and gcdisplay.GetCycle('TP') ~= 'Off' and (player.Status == 'Engaged' or player.TP > 0)) then
        gFunc.EquipSet('Weapon_Loadout_' .. WeaponOverrideTable[weapon_override])
    end
end

function gcmage.DoPrecast(sets, fastCastValue)
    if (not i_can_read_and_follow_instructions_test) then
        print(chat.header('GCMage'):append(chat.message('Failed to follow instructions. Read the README.md')))
    end

    local chainspell = gData.GetBuffCount('Chainspell')
    local action = gData.GetAction()
    local player = gData.GetPlayer()

    gFunc.EquipSet('Precast')
    if (player.MainJob == 'BRD' and action.Type == 'Bard Song') then
        gFunc.ForceEquipSet('Precast_Songs_HPDown')
        gFunc.EquipSet('Precast_Songs')
    end

    if (chainspell > 0 or lag) then
        if (gcdisplay.GetToggle('Hate') == true) then
            gFunc.EquipSet('Hate')

            local target = gData.GetActionTarget()
            local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

            if (target.Name == me) then
                if (action.Name == 'Cure III') then
                    gFunc.EquipSet('Cheat_C3HPDown')
                elseif (action.Name == 'Cure IV') then
                    gFunc.EquipSet('Cheat_C4HPDown')
                end
            end
        end

        local weakened = gData.GetBuffCount('Weakness')
        if (weakened >= 1) then
            do return end
        end

        local blmYellow = action.Skill == 'Elemental Magic' and player.MainJob == 'BLM' and gcdisplay.GetToggle('Yellow') == true and not ElementalDebuffs:contains(action.Name)
        local whmYellow = action.Skill == 'Healing Magic' and player.MainJob == 'WHM' and gcdisplay.GetToggle('Yellow') == true and CureSpells:contains(action.Name)

        local yellowAdvanced = nil
        if (blmYellow and blm_advanced) then
            yellowAdvanced = blmAdvanced.BuildYellowSet(player.SubJob, ObiCheck(action), gcdisplay.GetToggle('HNM') == true, gcdisplay.GetCycle('Mode') == 'Accuracy') -- note: ObiCheck does not check if obi is owned
        end

        if (blmYellow or whmYellow) then
            local yellow = sets.Yellow
            local yellowHNM = sets.YellowHNM
            if (yellowAdvanced) then
                yellow = yellowAdvanced
                yellowHNM = yellowAdvanced
            end

            if (whmYellow) then
                if (player.MainJob ~= 'BLM' and gcdisplay.GetCycle('TP') ~= 'Off' and (player.Status == 'Engaged' or player.TP > 0)) then
                    local weapon = sets['Weapon_Loadout_' .. WeaponOverrideTable[weapon_override]]
                    yellow = gFunc.Combine(yellow, weapon)
                    yellowHNM = gFunc.Combine(yellowHNM, weapon)
                end
            end

            gFunc.EquipSet(yellow)
            if (gcdisplay.GetToggle('HNM') == true) then
                gFunc.EquipSet(yellowHNM)
            end
        end
    else
        gcmage.SetupMidcastDelay(sets, fastCastValue)
    end

    if (player.MainJob ~= 'BLM' and gcdisplay.GetCycle('TP') ~= 'Off' and (player.Status == 'Engaged' or player.TP > 0)) then
        gFunc.EquipSet('Weapon_Loadout_' .. WeaponOverrideTable[weapon_override])
    end
end

function gcmage.SetupMidcastDelay(sets, fastCastValue)
    local player = gData.GetPlayer()
    local action = gData.GetAction()
    local target = gData.GetActionTarget()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)
    local castTime = action.CastTime

    if (player.SubJob == 'RDM') then
        fastCastValue = fastCastValue + 0.15 -- Fast Cast Trait
    end
    if (player.MainJob == 'WHM') then
        if (string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga')) then
            if (sets.cure_clogs.Feet) then
                fastCastValue = fastCastValue + 0.15 -- Note, this should actually be 0.13 if you own both Rostrum Pumps and Cure Clogs but whatever, close enough.
                gFunc.EquipSet('cure_clogs')
            end
            if (sets.ruckes_rung.Main) then
                fastCastValue = fastCastValue + 0.10
                gFunc.EquipSet('ruckes_rung')
            end
        end
    end
    if (action.Type == 'Bard Song' and string.match(action.Name, 'Prelude')) then
        castTime = 4000
    end
    if (action.Skill == 'Divine Magic' and action.Name == 'Banish III') then
        castTime = 3000
    end
    local minimumBuffer = 0.4 -- Can be lowered to 0.1 if you want
    local packetDelay = 0.25 -- Change this to 0.4 if you do not use PacketFlow
    local castDelay = ((castTime * (1 - fastCastValue)) / 1000) - minimumBuffer
    if (castDelay >= packetDelay) then
        gFunc.SetMidDelay(castDelay)
    end

    local function delayCheat()
        if (gcdisplay.GetToggle('Hate') == true) then
            if (target.Name == me) then
                local isC3 = action.Name == 'Cure III'
                local isC4 = action.Name == 'Cure IV'
                if (isC3 or isC4) then
                    local hpDownC3 = sets.Cheat_C3HPDown
                    local hpDownC4 = sets.Cheat_C4HPDown
                    local hpUp = sets.Cheat_HPUp

                    if (player.MainJob ~= 'BLM' and gcdisplay.GetCycle('TP') ~= 'Off' and (player.Status == 'Engaged' or player.TP > 0)) then
                        local weapon = sets['Weapon_Loadout_' .. WeaponOverrideTable[weapon_override]]
                        hpDownC3 = gFunc.Combine(hpDownC3, weapon)
                        hpDownC4 = gFunc.Combine(hpDownC4, weapon)
                        hpUp = gFunc.Combine(hpUp, weapon)
                    end

                    if (isC3) then
                        gFunc.ForceEquipSet(hpDownC3)
                        gFunc.ForceEquipSet(hpUp)
                    elseif (isC4) then
                        gFunc.ForceEquipSet(hpDownC4)
                        gFunc.ForceEquipSet(hpUp)
                    end
                end
            end
        end
    end

    local cheatDelay = castDelay - 0.4
    if (cheatDelay <= 0) then
        delayCheat()
    else
        delayCheat:once(cheatDelay)
    end

    local weakened = gData.GetBuffCount('Weakness')
    if (weakened >= 1) then
        do return end
    end

    local blmYellow = action.Skill == 'Elemental Magic' and player.MainJob == 'BLM' and gcdisplay.GetToggle('Yellow') == true and not ElementalDebuffs:contains(action.Name)
    local whmYellow = action.Skill == 'Healing Magic' and player.MainJob == 'WHM' and gcdisplay.GetToggle('Yellow') == true and CureSpells:contains(action.Name)

    local yellowAdvanced = nil
    local expectedHP = nil
    if (blmYellow and blm_advanced) then
        expectedHP, yellowAdvanced = blmAdvanced.BuildYellowSet(player.SubJob, ObiCheck(action), gcdisplay.GetToggle('HNM') == true, gcdisplay.GetCycle('Mode') == 'Accuracy') -- note: ObiCheck does not check if obi is owned
    end

    if (expectedHP == nil or (expectedHP and expectedHP < player.HP)) then
        if (blmYellow or whmYellow) then
            -- print(chat.header('DEBUG'):append(chat.message('Equipping Yellow set')))
            local yellow = sets.Yellow
            local yellowHNM = sets.YellowHNM
            if (yellowAdvanced) then
                yellow = yellowAdvanced
                yellowHNM = yellowAdvanced
            end

            if (whmYellow) then
                if (player.MainJob ~= 'BLM' and gcdisplay.GetCycle('TP') ~= 'Off' and (player.Status == 'Engaged' or player.TP > 0)) then
                    local weapon = sets['Weapon_Loadout_' .. WeaponOverrideTable[weapon_override]]
                    yellow = gFunc.Combine(yellow, weapon)
                    yellowHNM = gFunc.Combine(yellowHNM, weapon)
                end
            end

            local function delayYellow()
                gFunc.ForceEquipSet(yellow)
                if (gcdisplay.GetToggle('HNM') == true) then
                    gFunc.ForceEquipSet(yellowHNM)
                end
            end
            local yellowDelay = castDelay - (packetDelay * 2)
            if (yellowDelay <= 0) then
                gFunc.ForceEquipSet(yellow)
                if (gcdisplay.GetToggle('HNM') == true) then
                    gFunc.ForceEquipSet(yellowHNM)
                end
            else
                delayYellow:once(yellowDelay)
            end
        end
    end
    -- print(chat.header('DEBUG'):append(chat.message('Cast delay is ' .. castDelay)))
end

function gcmage.DoMidcast(sets, ninSJMMP, whmSJMMP, blmSJMMP, rdmSJMMP, drkSJMMP)
    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()
    local action = gData.GetAction()
    local isNoModSpell = NoMods:contains(action.Name)
    local chainspell = gData.GetBuffCount('Chainspell')

    local maxMP = 0
    if (setMP > 0) then
        maxMP = setMP + addMP
    elseif (player.SubJob == 'WHM' and whmSJMMP ~= nil) then
        maxMP = whmSJMMP + addMP
    elseif (player.SubJob == 'BLM' and blmSJMMP ~= nil) then
        maxMP = blmSJMMP + addMP
    elseif (player.SubJob == 'RDM' and rdmSJMMP ~= nil) then
        maxMP = rdmSJMMP + addMP
    elseif (player.SubJob == 'DRK' and drkSJMMP ~= nil) then
        maxMP = drkSJMMP + addMP
    elseif (ninSJMMP ~= nil) then
        maxMP = ninSJMMP + addMP
    end

    if (gcmage.ShouldSkipCast(maxMP, isNoModSpell)) then
        do return end
    end

    if (chainspell == 0 and not lag) then
        if not (player.MainJob == 'BLM' and gcdisplay.GetToggle('Extra') and player.MP >= blmSJMMP) then
            gcmage.SetupInterimEquipSet(sets)
        end
    end

    if (action.Skill == 'Enhancing Magic') then
        gcmage.EquipEnhancing(blmSJMMP)
    elseif (action.Skill == 'Healing Magic') then
        gcmage.EquipHealing(maxMP)
    elseif (action.Skill == 'Elemental Magic') then
        gcmage.EquipElemental(maxMP, blmSJMMP)
    elseif (action.Skill == 'Enfeebling Magic') then
        gcmage.EquipEnfeebling()
    elseif (action.Skill == 'Dark Magic') then
        gcmage.EquipDark(maxMP)
    elseif (action.Skill == 'Divine Magic') then
        gcmage.EquipDivine(maxMP)
    elseif (action.Skill == 'Summoning') then
        lastSummoningElement = action.Element
    end

    if (isNoModSpell) then
        gFunc.EquipSet('Haste')
        if (action.Skill ~= 'Ninjutsu') then
            gFunc.EquipSet('ConserveMP')
            if (environment.DayElement == 'Water') and (player.MPP <= 85) then
                if (maxMP == 0 or player.MP < maxMP * 0.85) then
                    gFunc.EquipSet('water_ring')
                end
            end
        end
        gcmage.EquipSneakInvisGear()
    end

    gcmage.EquipStaff()

    if (player.MainJob ~= 'BLM' and gcdisplay.GetCycle('TP') ~= 'Off' and (player.Status == 'Engaged' or player.TP > 0)) then
        gFunc.EquipSet('Weapon_Loadout_' .. WeaponOverrideTable[weapon_override])
    end
end

function gcmage.ShouldSkipCast(maxMP, isNoModSpell)
    local player = gData.GetPlayer()
    local action = gData.GetAction()

    local skipCast_MP = false
    if (gcdisplay.IdleSet == 'Normal' or gcdisplay.IdleSet == 'Alternate') then
        if (maxMP > 0 and player.MP > maxMP) then
            skipCast_MP = true
        end
    end

    local skipCast_Spell = false
    if (isNoModSpell) then
        skipCast_Spell = true
        gcmage.EquipSneakInvisGear()
    end
    if (CureSpells:contains(action.Name)) then
        if (gcdisplay.GetToggle('Hate') == false) then
            skipCast_Spell = true
            gcmage.EquipStaff()
        end
    end

    if (action.Skill ~= 'Ninjutsu' and player.MPP <= 95) then
        gFunc.EquipSet('ConserveMP')
    end

    return skipCast_MP and skipCast_Spell
end

function gcmage.EquipSneakInvisGear()
    local action = gData.GetAction()
    local target = gData.GetActionTarget()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

    if (target.Name == me) then
        if (action.Name == 'Sneak' or string.match(action.Name, 'Monomi')) then
            gFunc.EquipSet('dream_boots')
            gFunc.EquipSet('skulkers_cape')
        elseif (action.Name == 'Invisible' or string.match(action.Name, 'Tonko')) then
            gFunc.EquipSet('dream_mittens')
            gFunc.EquipSet('skulkers_cape')
        end
    end
end

function gcmage.SetupInterimEquipSet(sets)
    local environment = gData.GetEnvironment()
    local player = gData.GetPlayer()
    local action = gData.GetAction()

    local interimSet = sets.Casting

    if (gcdisplay.IdleSet == 'DT') then
        if (environment.Time >= 6 and environment.Time < 18) then
            interimSet = sets.DT
        else
            interimSet = sets.DTNight
        end
    end
    if (gcdisplay.IdleSet == 'MDT') then interimSet = sets.MDT end
    if (gcdisplay.IdleSet == 'FireRes') then interimSet = sets.FireRes end
    if (gcdisplay.IdleSet == 'IceRes') then interimSet = sets.IceRes end
    if (gcdisplay.IdleSet == 'LightningRes') then interimSet = sets.LightningRes end
    if (gcdisplay.IdleSet == 'EarthRes') then interimSet = sets.EarthRes end

    if (SurvivalSpells:contains(action.Name)) then
        interimSet = sets.SIRD
    end

    if (player.MainJob ~= 'BLM' and gcdisplay.GetCycle('TP') ~= 'Off' and (player.Status == 'Engaged' or player.TP > 0)) then
        interimSet = gFunc.Combine(interimSet, sets['Weapon_Loadout_' .. WeaponOverrideTable[weapon_override]])
    end

    gFunc.InterimEquipSet(interimSet)
end

function gcmage.EquipEnhancing(blmNukeExtra)
    local player = gData.GetPlayer()
    local action = gData.GetAction()

    gFunc.EquipSet('Enhancing')
    if (action.Name == 'Stoneskin') then
        gFunc.EquipSet('Stoneskin')

        if (player.MainJob == 'BLM' and gcdisplay.GetToggle('Extra') and player.MP >= blmNukeExtra) then
            gFunc.EquipSet('StoneskinExtra')
        end
    elseif (SpikeSpells:contains(action.Name)) then
        gFunc.EquipSet('Spikes')
    elseif (action.Name == 'Phalanx') then
        if (player.MainJob == 'BLM' and gcdisplay.GetToggle('Extra') and player.MP >= blmNukeExtra) then
            gFunc.EquipSet('PhalanxExtra')
        end
    end
end

function gcmage.EquipHealing(maxMP)
    local player = gData.GetPlayer()
    local action = gData.GetAction()
    local environment = gData.GetEnvironment()
    local target = gData.GetActionTarget()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

    local c5 = false

    gFunc.EquipSet('Cure')
    if (action.Name == 'Cure V' or action.Name == 'Curaga IV') then
        gFunc.EquipSet('Cure5')
        c5 = true
    end
    gcmage.EquipObi(action)
    if (environment.DayElement == 'Water') and player.MPP <= 85 then
        if (maxMP == 0 or player.MP < maxMP * 0.85) then
            gFunc.EquipSet('water_ring')
        end
    end
    if (player.MainJob == 'WHM' and CureSpells:contains(action.Name) and player.TP <= 1000) then
        if (player.HPP <= 75 or gcdisplay.GetToggle('Yellow') == true) then
            gFunc.EquipSet('medicine_ring')
        end
    end
    if (gcdisplay.GetToggle('Hate') == true and not c5) then
        gFunc.EquipSet('Hate')
        if (target.Name == me) then
            if (action.Name == 'Cure III') then
                gFunc.EquipSet('Cheat_HPUp')
            elseif (action.Name == 'Cure IV') then
                gFunc.EquipSet('Cheat_HPUp')
            end
        end
    end
    if (action.Name == 'Cursna') then
        gFunc.EquipSet('Cursna')
    end
    if ((string.match(action.Name, 'Cure') and gData.GetActionTarget().Type == 'Monster')) then
        gFunc.EquipSet('Banish')
        if (action.MppAftercast < 51) then
            if (maxMP == 0 or action.MpAftercast < maxMP * 0.51) then
                gFunc.EquipSet('uggalepih_pendant')
            end
        end
    end
end

function gcmage.EquipElemental(maxMP, blmNukeExtra)
    local action = gData.GetAction()
    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    gFunc.EquipSet('Nuke')
    if (gcdisplay.GetToggle('HNM') == true) then
        gFunc.EquipSet('NukeHNM')
    end
    if (player.MainJob == 'BLM' and gcdisplay.GetToggle('Extra') and player.MP >= blmNukeExtra) then
        gFunc.EquipSet('NukeExtra')
    end

    if (ElementalDebuffs:contains(action.Name)) then
        gFunc.EquipSet('NukeDOT')
    else
        if (gcdisplay.GetCycle('Mode') == 'Accuracy') then
            gFunc.EquipSet('NukeACC')
            if ((player.MainJob == 'RDM') and conquest:GetOutsideControl()) then
                if (log_conquest) then print(chat.header('Ashitacast'):append(chat.message('Out of Region - Using Mst.Cst. Bracelets'))) end
                gFunc.EquipSet('master_casters_bracelets')
            end
            if (environment.WeatherElement == 'Dark') then
                gFunc.EquipSet('diabolos_earring')
            end
            if (environment.DayElement == 'Ice') and player.MPP <= 85 then
                if (maxMP == 0 or player.MP < maxMP * 0.85) then
                    gFunc.EquipSet('ice_ring')
                end
            end
        end
        if (action.MppAftercast < 51) then
            if (maxMP == 0 or action.MpAftercast < maxMP * 0.51) then
                gFunc.EquipSet('uggalepih_pendant')
            end
        end
        if (gcdisplay.GetToggle('MB') == true) then
            gFunc.EquipSet('MB')
            if (gcdisplay.GetToggle('HNM') == true) then
                gFunc.EquipSet('MBHNM')
            end
        end
        gcmage.EquipObi(action)
        if (action.Element == environment.DayElement) and (player.MainJob == 'BLM') then
            gFunc.EquipSet('sorcerers_tonban')
        end
        if (gcdisplay.GetToggle('Yellow') == true and player.TP < 1000) and (player.MainJob == 'BLM') then
            gFunc.EquipSet('sorcerers_ring')
        end
    end
end

function gcmage.EquipEnfeebling()
    local action = gData.GetAction()
    local player = gData.GetPlayer()

    gFunc.EquipSet('Enfeebling')
    if ((player.MainJob ~= 'WHM') and conquest:GetOutsideControl()) then
        if (log_conquest) then print(chat.header('Ashitacast'):append(chat.message('Out of Region - Using Mst.Cst. Bracelets'))) end
        gFunc.EquipSet('master_casters_bracelets')
    end
    if (EnfeebMNDSpells:contains(action.Name)) then
        gFunc.EquipSet('EnfeeblingMND')
    elseif (EnfeebINTSpells:contains(action.Name)) then
        gFunc.EquipSet('EnfeeblingINT')
    elseif (EnfeebINTACCSpells:contains(action.Name)) then
        gFunc.EquipSet('EnfeeblingINT')
        gcmage.EquipEnfeeblingACC(action)
    elseif (EnfeebMNDACCSpells:contains(action.Name)) then
        gFunc.EquipSet('EnfeeblingMND')
        gcmage.EquipEnfeeblingACC(action)
    end
    if (gcdisplay.GetCycle('Mode') == 'Accuracy') then
        gcmage.EquipEnfeeblingACC(action)
    end
    if (gcdisplay.GetToggle('Hate') == true) then
        if (HateSpells:contains(action.Name)) then
            gFunc.EquipSet('Hate')
        end
    end
end

function gcmage.EquipEnfeeblingACC(action)
    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    gFunc.EquipSet('EnfeeblingACC')
    if ((player.MainJob ~= 'WHM') and conquest:GetOutsideControl()) then
        gFunc.EquipSet('master_casters_bracelets')
    end
    if (environment.WeatherElement == 'Dark') then
        gFunc.EquipSet('diabolos_earring')
    end
    gcmage.EquipObi(action)
end

function gcmage.EquipDark(maxMP)
    local environment = gData.GetEnvironment()
    local player = gData.GetPlayer()
    local action = gData.GetAction()

    gFunc.EquipSet('Dark')
    if (player.MainJob == 'BLM' or player.MainJob == 'RDM') and (action.Name == 'Stun') then
        gFunc.EquipSet('Stun')
        local chainspell = gData.GetBuffCount('Chainspell')
        if (chainspell > 0) then
            gFunc.EquipSet('StunACC')
        end
    end

    if (environment.DayElement == 'Dark') then
        if (player.MPP <= 85 and action.Name == 'Drain') then
            if (maxMP == 0 or player.MP < maxMP * 0.85) then
                gFunc.EquipSet('diabolos_ring')
            end
        elseif (player.MPP <= 50 and action.Name == 'Aspir') then
            if (maxMP == 0 or player.MP < maxMP * 0.50) then
                gFunc.EquipSet('diabolos_ring')
            end
        end
    end
    if (DiabolosPoleSpells:contains(action.Name)) then
        gFunc.EquipSet('overlords_ring')
    end
    if (environment.WeatherElement == 'Dark') and (not dark_and_abyssal_earrings) then
        gFunc.EquipSet('diabolos_earring')
    end

    gcmage.EquipObi(action)
end

function gcmage.EquipDivine(maxMP)
    local action = gData.GetAction()

    gFunc.EquipSet('Divine')
    if (gcdisplay.GetToggle('Hate') == true) then
        gFunc.EquipSet('Hate')
    end

    if (string.match(action.Name, 'Banish') or action.Name == 'Holy') then
        gFunc.EquipSet('Divine')
        gFunc.EquipSet('Banish')
        if (action.MppAftercast < 51) then
            if (maxMP == 0 or action.MpAftercast < maxMP * 0.51) then
                gFunc.EquipSet('uggalepih_pendant')
            end
        end
    end

    gcmage.EquipObi(action)
end

function gcmage.EquipStaff()
    local action = gData.GetAction()
    local environment = gData.GetEnvironment()
    local player = gData.GetPlayer()

    if (action.Skill ~= 'Enhancing Magic' and not ElementalDebuffs:contains(action.Name) and not string.match(action.Name, 'Utsusemi')) then
        local staff = ElementalStaffTable[action.Element]
        if (player.MainJob == 'SMN' or player.MainJob == 'BLM') then
            if (claustrum.Main and action.Skill ~= 'Healing Magic') then
                staff = 'claustrum'
            end
        end
        gFunc.EquipSet(staff)

        if (player.MainJob == 'BLM' and DiabolosPoleSpells:contains(action.Name)) then
            if (environment.WeatherElement == 'Dark') then
                gFunc.EquipSet('diabolos_pole')
            end
        end
        if (player.MainJob == 'WHM' and CureSpells:contains(action.Name)) then
            gFunc.EquipSet('mjollnir')
            if (player.SubJob == 'NIN') then
                gFunc.EquipSet('asklepios')
            end
        end
    end
end

function gcmage.EquipObi(action)
    if (ObiCheck(action)) then
        local obiOwned = NukeObiOwnedTable[action.Element]
        gFunc.EquipSet(obiOwned)
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

function gcmage.DoAbility()
    if (not i_can_read_and_follow_instructions_test) then
        print(chat.header('GCMage'):append(chat.message('Failed to follow instructions. Read the README.md')))
    end

    gcinclude.DoAbility()
    local action = gData.GetAction()
    if (action.Name == 'Release') then
        lastSummoningElement = ''
    end
end

function gcmage.AppendSets(sets)
    sets.claustrum = claustrum

    sets.fire_staff = fire_staff
    sets.earth_staff = earth_staff
    sets.water_staff = water_staff
    sets.wind_staff = wind_staff
    sets.ice_staff = ice_staff
    sets.thunder_staff = thunder_staff
    sets.light_staff = light_staff
    sets.dark_staff = dark_staff

    sets.karin_obi = karin_obi
    sets.dorin_obi = dorin_obi
    sets.suirin_obi = suirin_obi
    sets.furin_obi = furin_obi
    sets.hyorin_obi = hyorin_obi
    sets.rairin_obi = rairin_obi
    sets.korin_obi = korin_obi
    sets.anrin_obi = anrin_obi

    sets.uggalepih_pendant = uggalepih_pendant
    sets.master_casters_bracelets = master_casters_bracelets
    sets.wizards_mantle = wizards_mantle
    sets.republic_gold_medal = republic_gold_medal
    sets.diabolos_earring = diabolos_earring
    sets.diabolos_ring = diabolos_ring
    sets.ice_ring = ice_ring
    sets.water_ring = water_ring
    sets.overlords_ring = overlords_ring

    sets.tp_fenrirs_earring = tp_fenrirs_earring
    sets.tp_diabolos_earring = tp_diabolos_earring

    return gcinclude.AppendSets(sets)
end

return gcmage
