-- Defines Staves to equip
-- Set as '' if you do not have them
local fire_staff = 'Vulcan\'s Staff'
local earth_staff = 'Terra\'s Staff'
local water_staff = 'Neptune\'s Staff'
local wind_staff = 'Auster\'s Staff'
local ice_staff = 'Aquilo\'s Staff'
local thunder_staff = 'Jupiter\'s Staff'
local light_staff = 'Apollo\'s Staff'
local dark_staff = 'Pluto\'s Staff'

-- Set to true if you have the obi
local karin_obi = true
local dorin_obi = false
local suirin_obi = false
local furin_obi = false
local hyorin_obi = true
local rairin_obi = true
local korin_obi = true
local anrin_obi = true

-- Set to true if you have the item, and specify which ring or earring slot it will override
local diabolos_pole = true
local uggalepih_pendant = true
local master_casters_bracelets = true
local dream_boots = true
local dream_mittens = true
local skulkers_cape = false
local wizards_mantle = false
local republic_gold_medal = true -- Note: Disabled for BRD

local diabolos_earring = false
local diabolos_earring_slot = 'Ear2'
local diabolos_ring = true
local diabolos_ring_slot = 'Ring2'
local ice_ring = false
local ice_ring_slot = 'Ring2'
local water_ring = true
local water_ring_slot = 'Ring2'
local overlords_ring = true
local overlords_ring_slot = 'Ring1'
local wizards_earring = false
local wizards_earring_slot = 'Ear2'
local healers_earring = false
local healers_earring_slot = 'Ear2'

-- RDM Specific
local tp_fencers_ring = false
local tp_fencers_ring_slot = 'Ring1'

-- BLM Specific
local sorcerers_ring = true
local sorcerers_ring_slot = 'Ring1' -- This is Ring1 instead of Ring2 to allow Ice Ring override to work
-- Leave as '' if you do not have them.
local sorcerers_tonban = 'Src. Tonban +1'

-- SMN Specific
local carbuncle_mitts = true
local yinyang_robe = true
local bahamuts_staff = false
-- Leave as '' if you do not have them.
local summoners_doublet = 'Smn. Doublet +1'
local summoners_horn = 'Summoner\'s Horn'
local conjurers_ring = false
local conjurers_ring_slot = 'Ring1'

-- WHM Specific
local cure_clogs = false
local ruckes_rung = false
local medicine_ring = false
local medicine_ring_slot = 'Ring1'

-- Set to true if you have both Dark Earring and Abyssal earring to turn off Diabolos's Earring override for Dark Magic sets
local dark_and_abyssal_earrings = true

-- For Meleeing on WHM, BRD or RDM. Fenrir's Earring will be prioritised over Diabolos's Earring if using the same slot
local fenrirs_earring = true
local fenrirs_earring_slot = 'Ear2'
local tp_diabolos_earring = false
local tp_diabolos_earring_slot = 'Ear2'

-- Set to true if you want messages every time Mst.Cst. Bracelets are used.
local log_conquest = false

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcinclude = gFunc.LoadFile('common\\gcincluderag.lua')
conquest = gFunc.LoadFile('common\\conquest.lua')

local gcmage = {}

local AliasList = T{
    'addmp','setmp','resetmp',
    'mode', -- RDM / BLM
    'csstun','hate','vert','fight', -- RDM
    'yellow','mb','hnm', -- BLM
    'lag',
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
    ['Fire'] = fire_staff,
    ['Earth'] = earth_staff,
    ['Water'] = water_staff,
    ['Wind'] = wind_staff,
    ['Ice'] = ice_staff,
    ['Thunder'] = thunder_staff,
    ['Light'] = light_staff,
    ['Dark'] = dark_staff
}

local NukeObiTable = {
    ['Fire'] = 'Karin Obi',
    ['Earth'] = 'Dorin Obi',
    ['Water'] = 'Suirin Obi',
    ['Wind'] = 'Furin Obi',
    ['Ice'] = 'Hyorin Obi',
    ['Thunder'] = 'Rairin Obi',
    ['Light'] = 'Korin Obi',
    ['Dark'] = 'Anrin obi'
}

local NukeObiOwnedTable = {
    ['Fire'] = karin_obi,
    ['Earth'] = dorin_obi,
    ['Water'] = suirin_obi,
    ['Wind'] = furin_obi,
    ['Ice'] = hyorin_obi,
    ['Thunder'] = rairin_obi,
    ['Light'] = korin_obi,
    ['Dark'] = anrin_obi
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
local lastIdleSetBeforeEngaged = ''
local lastSummoningElement = ''
local restingMaxMP = false

local lag = false

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

    if (player.MainJob ~= 'BRD') then
        gcdisplay.CreateCycle('Mode', {[1] = 'Potency', [2] = 'Accuracy',})
    end
    if (player.MainJob == 'RDM') then
        gcdisplay.CreateToggle('Hate', false)
    end
    if (player.MainJob == 'BLM') then
        gcdisplay.CreateToggle('Yellow', true)
        gcdisplay.CreateToggle('MB', false)
        gcdisplay.CreateToggle('HNM', false)
    end
end

function gcmage.DoCommands(args)
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
    elseif (args[1] == 'lag') then
        lag =  not lag
        gcinclude.Message('[Note: Midcast Delays are disabled if Lag is true] Lag', lag)
    end

    if (player.MainJob == 'RDM') then
        if (args[1] == 'vert') then
            if (conquest:GetOutsideControl()) then
                print(chat.header('GCMage'):append(chat.message('Out of Region - using ConvertOOR set.')))
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
        elseif (args[1] == 'hate') then
            gcdisplay.AdvanceToggle('Hate')
            gcinclude.Message('Hate', gcdisplay.GetToggle('Hate'))
        end
    end

    if (player.MainJob == 'RDM' or player.MainJob == 'WHM' or player.MainJob == 'BRD') then
        if (args[1] == 'fight') then
            if (gcdisplay.IdleSet == 'Fight') then
                gcinclude.UnlockWeapon:once(1)
                if (lastIdleSetBeforeEngaged ~= '') then
                    gcinclude.ToggleIdleSet(lastIdleSetBeforeEngaged)
                end
                lastIdleSetBeforeEngaged = ''
                gcinclude.Message('IdleSet', gcdisplay.IdleSet)
            end
        end
    end

    if (player.MainJob == 'BLM') then
        if (args[1] == 'mb') then
            gcdisplay.AdvanceToggle('MB')
            gcinclude.Message('MB', gcdisplay.GetToggle('MB'))
        elseif (args[1] == 'yellow') then
            gcdisplay.AdvanceToggle('Yellow')
            gcinclude.Message('Yellow', gcdisplay.GetToggle('Yellow'))
        elseif (args[1] == 'hnm') then
            gcdisplay.AdvanceToggle('HNM')
            gcinclude.Message('HNM', gcdisplay.GetToggle('HNM'))
        end
    end
end

function gcmage.DoFenrirsEarring()
    local environment = gData.GetEnvironment()

    if (fenrirs_earring and (environment.Time >= 6 and environment.Time < 18)) then
        gFunc.Equip(fenrirs_earring_slot, 'Fenrir\'s Earring')
    end
end

function gcmage.DoDefault(ninSJMMP, whmSJMMP, blmSJMMP, rdmSJMMP, drkSJMMP)
    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    gcinclude.DoDefaultIdle()

    local equipMaxMP = false
    if (gcdisplay.IdleSet == 'Normal' or gcdisplay.IdleSet == 'Alternate') then
        if (setMP > 0) then
            if (player.MP >= setMP + addMP) then
                equipMaxMP = true
            end
        elseif (player.SubJob == "NIN") and ninSJMMP ~= nil and player.MP >= ninSJMMP + addMP then
            equipMaxMP = true
        elseif (player.SubJob == "WHM") and whmSJMMP ~= nil and player.MP >= whmSJMMP + addMP then
            equipMaxMP = true
        elseif (player.SubJob == "BLM") and blmSJMMP ~= nil and player.MP >= blmSJMMP + addMP then
            equipMaxMP = true
        elseif (player.SubJob == "RDM") and rdmSJMMP ~= nil and player.MP >= rdmSJMMP + addMP then
            equipMaxMP = true
        elseif (player.SubJob == "DRK") and drkSJMMP ~= nil and player.MP >= drkSJMMP + addMP then
            equipMaxMP = true
        end
    end

    if (equipMaxMP) then
        gFunc.EquipSet('IdleMaxMP')
        if (conquest:GetOutsideControl()) then
            if (republic_gold_medal and player.MainJob ~= 'BRD') then
                gFunc.Equip('Neck', 'Rep.Gold Medal')
            end
        end
    end

    if (player.MainJob == 'RDM' or player.MainJob == 'WHM' or player.MainJob == 'BRD') then
        if (player.Status == 'Engaged') then
            if (gcdisplay.IdleSet == 'Normal' or gcdisplay.IdleSet == 'Alternate') then
                lastIdleSetBeforeEngaged = gcdisplay.IdleSet
                gcinclude.ToggleIdleSet('Fight')
                gcinclude.LockWeapon:once(1)
            elseif (gcdisplay.IdleSet == 'Fight') then
                gFunc.EquipSet('TP')
                if (environment.WeatherElement ~= 'Dark') and tp_diabolos_earring then
                    gFunc.Equip(tp_diabolos_earring_slot, 'Diabolos\'s Earring')
                end
                if (fenrirs_earring and (environment.Time >= 6 and environment.Time < 18)) then
                    gFunc.Equip(fenrirs_earring_slot, 'Fenrir\'s Earring')
                end
                if (player.SubJob == 'NIN') then
                    gFunc.EquipSet('TP_NIN')
                end
                if (player.MainJob == 'RDM' and tp_fencers_ring and player.HPP <= 75 and player.TP <= 1000) then
                    gFunc.Equip(tp_fencers_ring_slot, 'Fencer\'s Ring')
                end
            end
        end
        if (player.Status == 'Idle' and lastIdleSetBeforeEngaged ~= '') then
            if (player.TP == 0) then
                gcinclude.ToggleIdleSet(lastIdleSetBeforeEngaged)
                lastIdleSetBeforeEngaged = ''
                gcinclude.UnlockWeapon:once(1)
            end
        end
    end

    gcinclude.DoDefaultOverride(false)
    if (player.MainJob == 'SMN') then
        if (lastSummoningElement ~= '') then
            local staff = ElementalStaffTable[lastSummoningElement]
            if (bahamuts_staff) then
                staff = 'Bahamut\'s Staff'
            end
            if staff ~= '' then
                gFunc.Equip('Main', staff)
            end
            if (player.HPP <= 75 and player.TP < 1000) and conjurers_ring then
                gFunc.Equip(conjurers_ring_slot, 'Conjurer\'s Ring')
            end
            if (lastSummoningElement == 'Light') then
                if (carbuncle_mitts) then
                    gFunc.Equip('Hands', 'Carbuncle Mitts') -- Who cares about Light Spirit anyway
                end
                if (yinyang_robe) then
                    gFunc.Equip('Body', 'Yinyang Robe')
                end
            elseif (lastSummoningElement == environment.DayElement) then
                if (summoners_doublet ~= '') then
                    gFunc.Equip('Body', summoners_doublet)
                end
            end
            if (lastSummoningElement == environment.WeatherElement) then
                if (summoners_horn ~= '') then
                    gFunc.Equip('Head', summoners_horn)
                end
            end
        end
    end
    if (player.Status == 'Resting') then
        lastSummoningElement = ''
        if (player.SubJob == "BLM" and wizards_mantle) then
            gFunc.Equip('Back', 'Wizard\'s Mantle')
        end
        if (player.MPP >= 95 or restingMaxMP) then
            restingMaxMP = true
            gcinclude.DoDefaultIdle()
            gFunc.EquipSet('IdleMaxMP')
            if (conquest:GetOutsideControl()) then
                if (republic_gold_medal) then
                    gFunc.Equip('Neck', 'Rep.Gold Medal')
                end
            end
            if (dark_staff ~= '') then
                gFunc.Equip('Main', dark_staff)
            end
        end
    else
        restingMaxMP = false
    end
end

function gcmage.DoPrecast(fastCastValue)
    local chainspell = gData.GetBuffCount('Chainspell')
    local action = gData.GetAction()
    local player = gData.GetPlayer()

    if (chainspell > 0) then
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
    elseif (not lag) then
        gFunc.EquipSet('Precast')
        gcmage.SetupMidcastDelay(fastCastValue)
    else
        gFunc.EquipSet('Precast')

        local weakened = gData.GetBuffCount('Weakness')
        if (weakened >= 1) then
            do return end
        end

        if (action.Skill == 'Elemental Magic' and player.MainJob == 'BLM' and gcdisplay.GetToggle('Yellow') == true) then
            if (not ElementalDebuffs:contains(action.Name)) then
                gFunc.EquipSet('Yellow')
                if (gcdisplay.GetToggle('HNM') == true) then
                    gFunc.EquipSet('YellowHNM')
                end
            end
        end
    end
end

function gcmage.SetupMidcastDelay(fastCastValue)
    local player = gData.GetPlayer()
    local action = gData.GetAction()
    local castTime = action.CastTime
    if (player.SubJob == "RDM") then
        fastCastValue = fastCastValue + 0.15 -- Fast Cast Trait
    end
    if (player.MainJob == "WHM") then
        if (string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga')) then
            if (cure_clogs) then
                fastCastValue = fastCastValue + 0.15 -- Note, this should actually be 0.13 if you own both Rostrum Pumps and Cure Clogs but whatever, close enough.
                gFunc.Equip('Feet', 'Cure Clogs')
            end
            if (ruckes_rung) then
                fastCastValue = fastCastValue + 0.10
                gFunc.Equip('Main', 'Rucke\'s Rung')
            end
        end
    end
    if (action.Type == 'Bard Song' and string.match(action.Name, 'Prelude')) then
        castTime = 8000
    end
    if (action.Skill == 'Divine Magic' and action.Name == 'Banish III') then
        castTime = 3000
    end
    local minimumBuffer = 0.25 -- Can be lowered to 0.1 if you want
    local packetDelay = 0.25 -- Change this to 0.4 if you do not use PacketFlow
    local castDelay = ((castTime * (1 - fastCastValue)) / 1000) - minimumBuffer
    if (castDelay >= packetDelay) then
        gFunc.SetMidDelay(castDelay)
    end

    local weakened = gData.GetBuffCount('Weakness')
    if (weakened >= 1) then
        do return end
    end

    if (action.Skill == 'Elemental Magic' and player.MainJob == 'BLM' and gcdisplay.GetToggle('Yellow') == true) then
        if (not ElementalDebuffs:contains(action.Name)) then
            local function delayYellow()
                gFunc.ForceEquipSet('Yellow')
                if (gcdisplay.GetToggle('HNM') == true) then
                    gFunc.ForceEquipSet('YellowHNM')
                end
            end
            local yellowDelay = castDelay - 1
            if (yellowDelay <= 0) then
                gFunc.EquipSet('Yellow')
                if (gcdisplay.GetToggle('HNM') == true) then
                    gFunc.EquipSet('YellowHNM')
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
    elseif (player.SubJob == "NIN" and ninSJMMP ~= nil) then
        maxMP = ninSJMMP + addMP
    elseif (player.SubJob == "WHM" and whmSJMMP ~= nil) then
        maxMP = whmSJMMP + addMP
    elseif (player.SubJob == "BLM" and blmSJMMP ~= nil) then
        maxMP = blmSJMMP + addMP
    elseif (player.SubJob == "RDM" and rdmSJMMP ~= nil) then
        maxMP = rdmSJMMP + addMP
    elseif (player.SubJob == "DRK" and drkSJMMP ~= nil) then
        maxMP = drkSJMMP + addMP
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
        gcmage.EquipEnhancing()
    elseif (action.Skill == 'Healing Magic') then
        gcmage.EquipHealing(maxMP, sets, chainspell)
    elseif (action.Skill == 'Elemental Magic') then
        gcmage.EquipElemental(maxMP, blmSJMMP)
    elseif (action.Skill == 'Enfeebling Magic') then
        gcmage.EquipEnfeebling()
    elseif (action.Skill == 'Dark Magic') then
        gcmage.EquipDark(maxMP)
    elseif (action.Skill == 'Divine Magic') then
        gFunc.EquipSet('Divine')
    elseif (action.Skill == 'Summoning') then
        lastSummoningElement = action.Element
    end

    if (isNoModSpell) then
        gFunc.EquipSet('Haste')
        if (action.Skill ~= 'Ninjutsu') then
            gFunc.EquipSet('ConserveMP')
            if (environment.DayElement == 'Water') and water_ring and (player.MPP <= 85) then
                if (maxMP == 0 or player.MP < maxMP * 0.85) then
                    gFunc.Equip(water_ring_slot, 'Water Ring')
                end
            end
        end
        gcmage.EquipSneakInvisGear()
    end

    gcmage.EquipStaff()
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
            if (dream_boots) then
                gFunc.Equip('Feet', 'Dream Boots +1')
            end
            if (skulkers_cape) then
                gFunc.Equip('Back', 'Skulker\'s Cape')
            end
        elseif (action.Name == 'Invisible' or string.match(action.Name, 'Tonko')) then
            if (dream_mittens) then
                gFunc.Equip('Hands', 'Dream Mittens +1')
            end
            if (skulkers_cape) then
                gFunc.Equip('Back', 'Skulker\'s Cape')
            end
        end
    end
end

function gcmage.SetupInterimEquipSet(sets)
    local environment = gData.GetEnvironment()
    local action = gData.GetAction()

    gFunc.InterimEquipSet(sets.Casting)
    if (gcdisplay.IdleSet == 'DT') then
        if (environment.Time >= 6 and environment.Time < 18) then
            gFunc.InterimEquipSet(sets.DT)
        else
            gFunc.InterimEquipSet(sets.DTNight)
        end
    end
    if (gcdisplay.IdleSet == 'MDT') then gFunc.InterimEquipSet(sets.MDT) end
    if (gcdisplay.IdleSet == 'FireRes') then gFunc.InterimEquipSet(sets.FireRes) end
    if (gcdisplay.IdleSet == 'IceRes') then gFunc.InterimEquipSet(sets.IceRes) end
    if (gcdisplay.IdleSet == 'LightningRes') then gFunc.InterimEquipSet(sets.LightningRes) end
    if (gcdisplay.IdleSet == 'EarthRes') then gFunc.InterimEquipSet(sets.EarthRes) end

    if (SurvivalSpells:contains(action.Name)) then
        gFunc.InterimEquipSet(sets.SIRD)
    end
end

function gcmage.EquipEnhancing()
    local action = gData.GetAction()

    gFunc.EquipSet('Enhancing')
    if (action.Name == 'Stoneskin') then
        gFunc.EquipSet('Stoneskin')
    elseif (SpikeSpells:contains(action.Name)) then
        gFunc.EquipSet('Spikes')
    end
end

function gcmage.EquipHealing(maxMP, sets, chainspell)
    local player = gData.GetPlayer()
    local action = gData.GetAction()
    local environment = gData.GetEnvironment()
    local target = gData.GetActionTarget()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

    gFunc.EquipSet('Cure')
    if (action.Name == 'Cure V') then
        gFunc.EquipSet('Cure5')
    end
    if (player.SubJob == "WHM" and healers_earring) then
        gFunc.Equip(healers_earring_slot, 'Healer\'s Earring')
    end
    if (action.Element == environment.WeatherElement) or (action.Element == environment.DayElement) then
        if (action.Element == 'Light') and korin_obi then
            gFunc.Equip('Waist', 'Korin Obi')
        end
    end
    if (environment.DayElement == 'Water') and water_ring and player.MPP <= 85 then
        if (maxMP == 0 or player.MP < maxMP * 0.85) then
            gFunc.Equip(water_ring_slot, 'Water Ring')
        end
    end
    if (player.MainJob == 'WHM' and medicine_ring and player.HPP <= 75 and player.TP <= 1000) then
        gFunc.Equip(medicine_ring_slot, 'Medicine Ring')
    end
    if (gcdisplay.GetToggle('Hate') == true) then
        gFunc.EquipSet('Hate')
        if (target.Name == me) then
            if (action.Name == 'Cure III') then
                if (chainspell == 0) then
                    gFunc.ForceEquipSet(sets.Cheat_C3HPDown)
                end
                gFunc.EquipSet('Cheat_HPUp')
            elseif (action.Name == 'Cure IV') then
                if (chainspell == 0) then
                    gFunc.ForceEquipSet(sets.Cheat_C4HPDown)
                end
                gFunc.EquipSet('Cheat_HPUp')
            end
        end
    end
    if (action.Name == 'Cursna') then
        gFunc.EquipSet('Cursna')
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
        if (player.SubJob == "BLM" and wizards_earring) then
            gFunc.Equip(wizards_earring_slot, 'Wizard\'s Earring')
        end
    else
        if (gcdisplay.GetCycle('Mode') == 'Accuracy') then
            gFunc.EquipSet('NukeACC')
            if ((player.MainJob == 'RDM') and conquest:GetOutsideControl()) and master_casters_bracelets then
                if (log_conquest) then print(chat.header('GCMage'):append(chat.message('Out of Region - Using Mst.Cst. Bracelets'))) end
                gFunc.Equip('Hands', 'Mst.Cst. Bracelets')
            end
            if (environment.WeatherElement == 'Dark') and diabolos_earring then
                gFunc.Equip(diabolos_earring_slot, 'Diabolos\'s Earring')
            end
            if (player.SubJob == "BLM" and wizards_earring) then
                gFunc.Equip(wizards_earring_slot, 'Wizard\'s Earring')
            end
            if (environment.DayElement == 'Ice') and ice_ring and player.MPP <= 85 then
                if (maxMP == 0 or player.MP < maxMP * 0.85) then
                    gFunc.Equip(ice_ring_slot, 'Ice Ring')
                end
            end
        end
        if (action.MppAftercast < 51) and uggalepih_pendant then
            if (maxMP == 0 or action.MpAftercast < maxMP * 0.51) then
                gFunc.Equip('Neck', 'Uggalepih Pendant')
            end
        end
        if (gcdisplay.GetToggle('MB') == true) then
            gFunc.EquipSet('MB')
        end
        if (ObiCheck(action)) then
            local obi = NukeObiTable[action.Element]
            local obiOwned = NukeObiOwnedTable[action.Element]
            if (obiOwned) then
                gFunc.Equip('Waist', obi)
            end
        end
        if (action.Element == environment.DayElement) and sorcerers_tonban ~= '' and (player.MainJob == 'BLM') then
            gFunc.Equip('Legs', sorcerers_tonban)
        end
        if (gcdisplay.GetToggle('Yellow') == true and player.TP < 1000) and sorcerers_ring and (player.MainJob == 'BLM') then
            gFunc.Equip(sorcerers_ring_slot, 'Sorcerer\'s Ring')
        end
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

function gcmage.EquipEnfeebling()
    local environment = gData.GetEnvironment()
    local action = gData.GetAction()
    local player = gData.GetPlayer()

    gFunc.EquipSet('Enfeebling')
    if ((player.MainJob ~= 'WHM') and conquest:GetOutsideControl()) and master_casters_bracelets then
        if (log_conquest) then print(chat.header('GCMage'):append(chat.message('Out of Region - Using Mst.Cst. Bracelets'))) end
        gFunc.Equip('Hands', 'Mst.Cst. Bracelets')
    end
    if (environment.WeatherElement == 'Dark') and diabolos_earring then
        gFunc.Equip(diabolos_earring_slot, 'Diabolos\'s Earring')
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

    gFunc.EquipSet('EnfeeblingACC')
    if ((player.MainJob ~= 'WHM') and conquest:GetOutsideControl()) and master_casters_bracelets then
        gFunc.Equip('Hands', 'Mst.Cst. Bracelets')
    end
    if (ObiCheck(action)) then
        local obi = NukeObiTable[action.Element]
        local obiOwned = NukeObiOwnedTable[action.Element]
        if (obiOwned) then
            gFunc.Equip('Waist', obi)
        end
    end
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

    if (environment.DayElement == 'Dark') and diabolos_ring then
        if (player.MPP <= 85 and action.Name == 'Drain') then
            if (maxMP == 0 or player.MP < maxMP * 0.85) then
                gFunc.Equip(diabolos_ring_slot, 'Diabolos\'s Ring')
            end
        elseif (player.MPP <= 50 and action.Name == 'Aspir') then
            if (maxMP == 0 or player.MP < maxMP * 0.50) then
                gFunc.Equip(diabolos_ring_slot, 'Diabolos\'s Ring')
            end
        end
    end
    if (DiabolosPoleSpells:contains(action.Name) and overlords_ring) then
        gFunc.Equip(overlords_ring_slot, 'Overlord\'s Ring')
    end
    if (environment.WeatherElement == 'Dark') and diabolos_earring and (not dark_and_abyssal_earrings) then
        gFunc.Equip(diabolos_earring_slot, 'Diabolos\'s Earring')
    end

    if (ObiCheck(action)) then
        local obi = NukeObiTable[action.Element]
        local obiOwned = NukeObiOwnedTable[action.Element]
        if (obiOwned) then
            gFunc.Equip('Waist', obi)
        end
    end
end

function gcmage.EquipStaff()
    local action = gData.GetAction()
    local environment = gData.GetEnvironment()

    if (action.Skill ~= 'Enhancing Magic' and not ElementalDebuffs:contains(action.Name) and not string.match(action.Name, 'Utsusemi')) then
        local staff = ElementalStaffTable[action.Element]
        if staff ~= '' then
            gFunc.Equip('Main', staff)
        end

        if (DiabolosPoleSpells:contains(action.Name)) then
            if (environment.WeatherElement == 'Dark' and diabolos_pole) then gFunc.Equip('Main', 'Diabolos\'s Pole') end
        end
    end
end

function gcmage.DoAbility()
    local action = gData.GetAction()
    if (action.Name == 'Release') then
        lastSummoningElement = ''
    end
end

return gcmage
