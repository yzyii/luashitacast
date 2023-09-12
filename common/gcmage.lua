-- Defines Staves to equip. Will automatically equip the correct staff for a spell. Will work even if you don't have the staff.
-- Leave as '' if you do not have the staff.
local fire_staff = 'Vulcan\'s Staff'
local earth_staff = 'Terra\'s Staff'
local water_staff = 'Neptune\'s Staff'
local wind_staff = 'Auster\'s Staff'
local ice_staff = 'Aquilo\'s Staff'
local thunder_staff = 'Jupiter\'s Staff'
local light_staff = 'Apollo\'s Staff'
local dark_staff = 'Pluto\'s Staff'

-- Set to true if you have the obi
local karin_obi = false
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
local sorcerers_tonban = true
local dream_boots = false
local dream_mittens = false
local master_casters_bracelets = true
local skulkers_cape = false
local wizards_mantle = false

local diabolos_earring = true
local diabolos_earring_slot = 'Ear2'
local wizards_earring = false
local wizards_earring_slot = 'Ear2'
local healers_earring = true
local healers_earring_slot = 'Ear2'

local diabolos_ring = true
local diabolos_ring_slot = 'Ring2'
local sorcerers_ring = true
local sorcerers_ring_slot = 'Ring1' -- This is Ring1 instead of Ring2 to allow Ice Ring override to work
local ice_ring = true
local ice_ring_slot = 'Ring2'
local water_ring = true
local water_ring_slot = 'Ring2'

local tp_diabolos_earring = true
local tp_diabolos_earring_slot = 'Ear2'
local tp_fencers_ring = true
local tp_fencers_ring_slot = 'Ring1'

local carbuncle_mitts = true

-- Set to true if you have both Dark Earring and Abyssal earring to turn off Diabolos's Earring override for Dark Magic sets
local dark_and_diabolos_earrings = false

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcinclude = gFunc.LoadFile('common\\gcincluderag.lua')

local gcmage = {}

local AliasList = T{
    'addmp','setmp','reset',
    'oor','mode', -- RDM / BLM
    'csstun','hate','vert','fight', -- RDM
    'yellow','mb', -- BLM
}

local NoMods = T{
    'Haste','Refresh','Blink','Aquaveil',
    'Regen','Regen II','Regen II',
    'Sneak', 'Invisible','Deodorize',
    'Protect','Protect II','Protect III','Protect IV','Protect V',
    'Protectra','Protectra II','Protectra III','Protectra IV','Protectra V',
    'Shell','Shell II','Shell III','Shell IV','Shell V',
    'Shellra','Shellra II','Shellra III','Shellra IV','Shellra V',
    'Warp', 'Warp II','Escape','Tractor',
    'Raise','Reraise','Reraise II',
    'Poisona','Paralyna','Silena','Blindna','Viruna','Erase',
    'Teleport-Holla','Teleport-Dem','Teleport-Mea',
    'Dia','Dia II',
    'Utsusemi: Ichi','Utsusemi: Ni','Tonko: Ichi','Tonko: Ni','Monomi: Ichi'
}

local ElementalDebuffs = T{ 'Burn','Rasp','Drown','Choke','Frost','Shock' }
local EnfeebMNDSpells = T{ 'Paralyze','Slow' }
local EnfeebINTSpells = T{ 'Gravity','Blind','Bind','Dispel','Poison','Sleep','Sleep II','Sleepga','Sleepga II' }
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
}

local NukeObiOwnedTable = {
    ['Fire'] = karin_obi,
    ['Earth'] = dorin_obi,
    ['Water'] = suirin_obi,
    ['Wind'] = furin_obi,
    ['Ice'] = hyorin_obi,
    ['Thunder'] = rairin_obi,
}

local setMP = 0
local addMP = 0
local lastIdleSetBeforeEngaged = ''
local lastSummoningElement = ''

function gcmage.Load()
    gcinclude.Load(true)
    gcmage.SetVariables()
    gcinclude.SetAlias(AliasList)

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 //stun')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 //dia')
end

function gcmage.Unload()
    gcinclude.Unload()
    gcinclude.ClearAlias(AliasList)
end

function gcmage.SetVariables()
    local player = gData.GetPlayer()

    gcdisplay.CreateToggle('OOR', false)
    gcdisplay.CreateCycle('Mode', {[1] = 'Potency', [2] = 'Accuracy',})

    if (player.MainJob == 'RDM') then
        gcdisplay.CreateToggle('Hate', false)
    end
    if (player.MainJob == 'BLM') then
        gcdisplay.CreateToggle('Yellow', true)
        gcdisplay.CreateToggle('MB', false)
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
    elseif (args[1] == 'reset') then
        setMP = 0
        addMP = 0
        lastIdleSetBeforeEngaged = ''
        lastSummoningElement = ''
        print(chat.header('GCMage'):append(chat.message('Reset Variables')))
    elseif (args[1] == 'mode') then
        gcdisplay.AdvanceCycle('Mode')
        gcinclude.Message('Magic Mode', gcdisplay.GetCycle('Mode'))
    elseif (args[1] == 'oor') then
        gcdisplay.AdvanceToggle('OOR')
        gcinclude.Message('Out of Region', gcdisplay.GetToggle('OOR'))
    end

    if (player.MainJob == 'RDM') then
        if (args[1] == 'vert') then
            if (gcdisplay.GetToggle('OOR') == true) then
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac set ConvertOOR')
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all')
            else
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac set Convert')
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all')
            end
            gcdisplay.CreateToggle('Lock', true)
            gcinclude.Message('Equip Lock', gcdisplay.GetToggle('Lock'))
        elseif (args[1] == 'csstun') then
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac set Stun')
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all')
            gcdisplay.CreateToggle('Lock', true)
            gcinclude.Message('Equip Lock', gcdisplay.GetToggle('Lock'))
        elseif (args[1] == 'hate') then
            gcdisplay.AdvanceToggle('Hate')
            gcinclude.Message('Hate', gcdisplay.GetToggle('Hate'))
        elseif (args[1] == 'fight') then
            if (gcdisplay.IdleSet == 'Fight') then
                gcmage.UnlockWeapon:once(1)
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
        end
    end
end

function gcmage.DoDefault(ninSJMMP, whmSJMMP, blmSJMMP, rdmSJMMP)
    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    gcinclude.DoDefaultIdle()
    if (gcdisplay.IdleSet == 'Normal' or gcdisplay.IdleSet == 'Alternate') then
        if (setMP > 0 and player.MP >= setMP + addMP - 50) then
            gFunc.EquipSet('IdleMaxMP')
        elseif (player.SubJob == "NIN") and player.MP >= ninSJMMP + addMP - 50 then
            gFunc.EquipSet('IdleMaxMP')
        elseif (player.SubJob == "WHM") and player.MP >= whmSJMMP + addMP - 50 then
            gFunc.EquipSet('IdleMaxMP')
        elseif (player.SubJob == "BLM") and player.MP >= blmSJMMP + addMP - 50 then
            gFunc.EquipSet('IdleMaxMP')
        elseif (player.SubJob == "RDM") and player.MP >= rdmSJMMP + addMP - 50 then
            gFunc.EquipSet('IdleMaxMP')
        end
    end

    if (player.MainJob == 'RDM') then
        if (player.Status == 'Engaged' and lastIdleSetBeforeEngaged == '') then
            lastIdleSetBeforeEngaged = gcdisplay.IdleSet
            gcinclude.ToggleIdleSet('Fight')
            gcmage.LockWeapon:once(1)
        end
        if (player.Status == 'Idle' and lastIdleSetBeforeEngaged ~= '') then
            if (player.TP == 0) then
                gcinclude.ToggleIdleSet(lastIdleSetBeforeEngaged)
                lastIdleSetBeforeEngaged = ''
                gcmage.UnlockWeapon:once(1)
            end
        end

        if (gcdisplay.IdleSet == 'Fight') then
            gFunc.EquipSet('TP')
            if (player.SubJob == 'NIN') then
                gFunc.EquipSet('TP_NIN')
            end
            if (environment.WeatherElement ~= 'Dark') and tp_diabolos_earring then
                gFunc.Equip(tp_diabolos_earring_slot, 'Diabolos\'s Earring')
            end
            if (tp_fencers_ring and player.HPP <= 75 and player.TP <= 1000) then
                gFunc.Equip(tp_fencers_ring_slot, 'Fencer\'s Ring')
            end
        end
    end

    gcinclude.DoDefaultOverride()
    if (player.MainJob == 'SMN') then
        if (lastSummoningElement ~= '') then
            local staff = ElementalStaffTable[lastSummoningElement]
            if staff ~= '' then
                gFunc.Equip('Main', staff)
            end
            if (lastSummoningElement == 'Light') then
                if (carbuncle_mitts) then
                    gFunc.Equip('Hands', 'Carbuncle Mitts') -- Who cares about Light Spirit anyway
                end
            end
        end
    end
    if (player.Status == 'Resting') then
        lastSummoningElement = ''
        if (player.SubJob == "BLM" and wizards_mantle) then
            gFunc.Equip('Back', 'Wizard\'s Mantle')
        end
    end
end

function gcmage.LockWeapon()
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Main')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Sub')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Range')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ammo')
end

function gcmage.UnlockWeapon()
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Main')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Sub')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Range')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Ammo')
end

function gcmage.DoPrecast(fastCastValue)
    gcmage.SetupMidcastDelay(fastCastValue)
    gFunc.EquipSet('Precast')
end

function gcmage.SetupMidcastDelay(fastCastValue)
    local player = gData.GetPlayer()
    local action = gData.GetAction()
    if (player.SubJob == "RDM") then
         fastCastValue = fastCastValue + 0.15 -- Fast Cast Trait
    end
    local minimumBuffer = 0.25 -- Can be lowered to 0.1 if you want
    local packetDelay = 0.25 -- Change this to 0.4 if you do not use PacketFlow
    local castDelay = ((action.CastTime * (1 - fastCastValue)) / 1000) - minimumBuffer
    if (castDelay >= packetDelay) then
        gFunc.SetMidDelay(castDelay)
    end

    if (action.Skill == 'Elemental Magic' and player.MainJob == 'BLM' and gcdisplay.GetToggle('Yellow') == true) then
        if (not ElementalDebuffs:contains(action.Name)) then
            local function delayYellow()
                gFunc.ForceEquipSet('Yellow')
            end
            local yellowDelay = math.floor(castDelay - 1)
            if (yellowDelay <= 0) then
                gFunc.EquipSet('Yellow')
            else
                delayYellow:once(yellowDelay)
            end
        end
    end
    -- print(chat.header('DEBUG'):append(chat.message('Cast delay is ' .. castDelay)))
end

function gcmage.DoMidcast(sets, ninSJMMP, whmSJMMP, blmSJMMP, rdmSJMMP)
    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()
    local action = gData.GetAction()
    local isNoModSpell = NoMods:contains(action.Name)

    if (gcmage.ShouldSkipCast(ninSJMMP, whmSJMMP, blmSJMMP, rdmSJMMP, isNoModSpell)) then
        do return end
    end

    gcmage.SetupInterimEquipSet(sets)

    if (action.Skill == 'Enhancing Magic') then
        gcmage.EquipEnhancing()
    elseif (action.Skill == 'Healing Magic') then
        gcmage.EquipHealing(sets)
    elseif (action.Skill == 'Elemental Magic') then
        gcmage.EquipElemental()
    elseif (action.Skill == 'Enfeebling Magic') then
        gcmage.EquipEnfeebling()
    elseif (action.Skill == 'Dark Magic') then
        gcmage.EquipDark()
    elseif (action.Skill == 'Divine Magic') then
        gFunc.EquipSet('Enfeebling')
        gFunc.EquipSet('EnfeeblingMND')
    elseif (action.Skill == 'Summoning') then
        lastSummoningElement = action.Element
    end

    if (isNoModSpell) then
        gFunc.EquipSet('Haste')
        if (environment.DayElement == 'Water') and water_ring and (player.MPP <= 85) and (action.Skill ~= 'Ninjutsu') then
            gFunc.Equip(water_ring_slot, 'Water Ring')
        end
    end

    gcmage.EquipStaff()
end

function gcmage.ShouldSkipCast(ninSJMMP, whmSJMMP, blmSJMMP, rdmSJMMP, isNoModSpell)
    local player = gData.GetPlayer()
    local action = gData.GetAction()
    local target = gData.GetActionTarget()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

    local skipCast_MP = false
    if (gcdisplay.IdleSet == 'Normal' or gcdisplay.IdleSet == 'Alternate') then
        if (setMP > 0 and player.MP > setMP + addMP) then
            skipCast_MP = true
        elseif (player.SubJob == "NIN") and player.MP > ninSJMMP + addMP then
            skipCast_MP = true
        elseif (player.SubJob == "WHM") and player.MP > whmSJMMP + addMP then
            skipCast_MP = true
        elseif (player.SubJob == "BLM") and player.MP > blmSJMMP + addMP then
            skipCast_MP = true
        elseif (player.SubJob == "RDM") and player.MP > rdmSJMMP + addMP then
            skipCast_MP = true
        end
    end

    local skipCast_Spell = false
    if (isNoModSpell) then
        skipCast_Spell = true
        if (target.Name == me) then
            if (action.Name == 'Sneak') then
                if (dream_boots) then
                    gFunc.Equip('Feet', 'Dream Boots +1')
                end
                if (skulkers_cape) then
                    gFunc.Equip('Back', 'Skulker\'s Cape')
                end
            elseif (action.Name == 'Invisible') then
                if (dream_mittens) then
                    gFunc.Equip('Hands', 'Dream Mittens +1')
                end
                if (skulkers_cape) then
                    gFunc.Equip('Back', 'Skulker\'s Cape')
                end
            end
        end
    end
    if (CureSpells:contains(action.Name)) then
        if (gcdisplay.GetToggle('Hate') == false) then
            skipCast_Spell = true
        end
    end

    return skipCast_MP and skipCast_Spell
end

function gcmage.SetupInterimEquipSet(sets)
    local environment = gData.GetEnvironment()
    local action = gData.GetAction()

    gFunc.InterimEquipSet(sets.Casting)
    if (gcdisplay.IdleSet == 'DT') then
        if (environment.Time >= 6 and environment.Time <= 18) then
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
    local target = gData.GetActionTarget()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

    gFunc.EquipSet('Enhancing')
    if (action.Name == 'Stoneskin') then
        gFunc.EquipSet('Stoneskin')
    elseif (SpikeSpells:contains(action.Name)) then
        gFunc.EquipSet('Spikes')
    elseif (target.Name == me) then
        if (action.Name == 'Sneak') then
            if (dream_boots) then
                gFunc.Equip('Feet', 'Dream Boots +1')
            end
            if (skulkers_cape) then
                gFunc.Equip('Back', 'Skulker\'s Cape')
            end
        elseif (action.Name == 'Invisible') then
            if (dream_mittens) then
                gFunc.Equip('Hands', 'Dream Mittens +1')
            end
            if (skulkers_cape) then
                gFunc.Equip('Back', 'Skulker\'s Cape')
            end
        end
    end
end

function gcmage.EquipHealing(sets)
    local player = gData.GetPlayer()
    local action = gData.GetAction()
    local environment = gData.GetEnvironment()
    local target = gData.GetActionTarget()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

    gFunc.EquipSet('Cure')
    if (player.SubJob == "WHM" and healers_earring) then
        gFunc.Equip(healers_earring_slot, 'Healer\'s Earring')
    end
    if (action.Element == environment.WeatherElement) or (action.Element == environment.DayElement) then
        if (action.Element == 'Light') and korin_obi then
            gFunc.Equip('Waist', 'Korin Obi')
        end
    end
    if (environment.DayElement == 'Water') and water_ring and player.MPP <= 85 then
        gFunc.Equip(water_ring_slot, 'Water Ring')
    end
    if (gcdisplay.GetToggle('Hate') == true) then
        gFunc.EquipSet('Hate')
        if (target.Name == me) then
            if (action.Name == 'Cure III') then
                gFunc.InterimEquipSet(sets.C3HPDown)
                gFunc.EquipSet('HPUp')
            elseif (action.Name == 'Cure IV') then
                gFunc.InterimEquipSet(sets.C4HPDown)
                gFunc.EquipSet('HPUp')
            end
        end
    end
    if (action.Name == 'Cursna') then
        gFunc.EquipSet('Cursna')
    end
end

function gcmage.EquipElemental()
    local action = gData.GetAction()
    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    gFunc.EquipSet('Nuke')
    if (ElementalDebuffs:contains(action.Name)) then
        gFunc.EquipSet('NukeDOT')
        if (player.SubJob == "BLM" and wizards_earring) then
            gFunc.Equip(wizards_earring_slot, 'Wizard\'s Earring')
        end
    else
        if (gcdisplay.GetCycle('Mode') == 'Accuracy') then
            gFunc.EquipSet('NukeACC')
            if (gcdisplay.GetToggle('OOR') == true) and (player.MainJob == 'RDM') and master_casters_bracelets then
                gFunc.Equip('Hands', 'Mst.Cst. Bracelets')
            end
            if (environment.WeatherElement == 'Dark') and diabolos_earring then
                gFunc.Equip(diabolos_earring_slot, 'Diabolos\'s Earring')
            end
            if (player.SubJob == "BLM" and wizards_earring) then
                gFunc.Equip(wizards_earring_slot, 'Wizard\'s Earring')
            end
            if (environment.DayElement == 'Ice') and ice_ring and player.MPP <= 85 then
                gFunc.Equip(ice_ring_slot, 'Ice Ring')
            end
        end
        if (action.Element == environment.WeatherElement) or (action.Element == environment.DayElement) then
            local obi = NukeObiTable[action.Element]
            local obiOwned = NukeObiOwnedTable[action.Element]
            if (obiOwned) then
                gFunc.Equip('Waist', obi)
            end
        end
        if (action.Element == environment.DayElement) and sorcerers_tonban and (player.MainJob == 'BLM') then
            gFunc.Equip('Legs', 'Sorcerer\'s Tonban')
        end
        if (gcdisplay.GetToggle('Yellow') == true and player.TP < 1000) and sorcerers_ring and (player.MainJob == 'BLM') then
            gFunc.Equip(sorcerers_ring_slot, 'Sorcerer\'s Ring')
        end
        if (action.MppAftercast < 51) and uggalepih_pendant then
            gFunc.Equip('Neck', 'Uggalepih Pendant')
        end
        if (gcdisplay.GetToggle('MB') == true) then
            gFunc.EquipSet('MB')
        end
    end
end

function gcmage.EquipEnfeebling()
    local environment = gData.GetEnvironment()
    local action = gData.GetAction()

    gFunc.EquipSet('Enfeebling')
    if (gcdisplay.GetToggle('OOR') == true) and master_casters_bracelets then
        gFunc.Equip('Hands', 'Mst.Cst. Bracelets')
    end
    if (environment.WeatherElement == 'Dark') and diabolos_earring then
        gFunc.Equip(diabolos_earring_slot, 'Diabolos\'s Earring')
    end
    if (EnfeebMNDSpells:contains(action.Name)) then
        gFunc.EquipSet('EnfeeblingMND')
    elseif (EnfeebINTSpells:contains(action.Name)) then
        gFunc.EquipSet('EnfeeblingINT')
    end
    if (gcdisplay.GetCycle('Mode') == 'Accuracy') then
        gFunc.EquipSet('EnfeeblingACC')
        if (gcdisplay.GetToggle('OOR') == true) and master_casters_bracelets then
            gFunc.Equip('Hands', 'Mst.Cst. Bracelets')
        end
    end
    if (gcdisplay.GetToggle('Hate') == true) then
        if (HateSpells:contains(action.Name)) then
            gFunc.EquipSet('Hate')
        end
    end
end

function gcmage.EquipDark()
    local environment = gData.GetEnvironment()
    local player = gData.GetPlayer()
    local action = gData.GetAction()

    gFunc.EquipSet('Dark')
    if (environment.DayElement == 'Dark') and diabolos_ring and player.MPP <= 85 then
        gFunc.Equip(diabolos_ring_slot, 'Diabolos\'s Ring')
    end
    if (environment.WeatherElement == 'Dark') and diabolos_earring and (not dark_and_diabolos_earrings) then
        gFunc.Equip(diabolos_earring_slot, 'Diabolos\'s Earring')
    end
    if (action.Element == environment.WeatherElement) or (action.Element == environment.DayElement) then
        if (action.Element == 'Dark') and anrin_obi then
            gFunc.Equip('Waist', 'Anrin Obi')
        end
    end
end

function gcmage.EquipStaff()
    local action = gData.GetAction()
    local environment = gData.GetEnvironment()

    if (action.Skill ~= 'Enhancing Magic') then
        local staff = ElementalStaffTable[action.Element]
        if staff ~= '' then
            gFunc.Equip('Main', staff)
        end

        if (DiabolosPoleSpells:contains(action.Name)) then
            if (environment.WeatherElement == 'Dark' and diabolos_pole) then gFunc.Equip('Main', 'Diabolos\'s Pole'); end
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
