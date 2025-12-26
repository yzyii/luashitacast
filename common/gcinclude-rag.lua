local horizon_safe_mode = true -- this disables some of the potentially more contentious automation to ensure LAC is not breaking Horizon server rules

local display_messages = true -- set to true if you want chat log messages to appear on any /gc command used such as DT, or KITE gear toggles

local load_stylist = true -- set to true to just load stylist on game start. this is purely for convenience since putting it in scripts doesn't work

local toggleDisplayHeadOnAbility = true

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local kingdom_aketon = {
    -- Body = 'Kingdom Aketon',
}
local republic_aketon = {
    -- Body = 'Republic Aketon',
}
local federation_aketon = {
    -- Body = 'Federation Aketon',
}
local ducal_aketon = {
    -- Body = 'Ducal Aketon',
}
local dream_boots = {
    Feet = 'Dream Boots +1',
}
local dream_mittens = {
    Hands = 'Dream Mittens +1',
}
local skulkers_cape = {
    -- Back = 'Skulker\'s Cape',
}

-- Set this to true to confirm that actually read the README.md and set up the equipment listed above correctly
local i_can_read_and_follow_instructions_test = false

-- Add additional equipment here that you want to automatically lock when equipping
local LockableEquipment = {
    ['Main'] = T{'Warp Cudgel', 'Rep. Signet Staff', 'Kgd. Signet Staff', 'Fed. Signet Staff', 'Treat Staff II', 'Trick Staff II'},
    ['Sub'] = T{'Warp Cudgel'},
    ['Range'] = T{},
    ['Ammo'] = T{},
    ['Head'] = T{'Reraise Hairpin', 'Dream Hat +1', 'Tinfoil Hat'},
    ['Neck'] = T{'Opo-opo Necklace'},
    ['Ear1'] = T{'Reraise Earring', 'Republic Earring', 'Kingdom Earring', 'Federation Earring'},
    ['Ear2'] = T{'Reraise Earring', 'Republic Earring', 'Kingdom Earring', 'Federation Earring'},
    ['Body'] = T{'Custom Gilet +1', 'Custom Top +1', 'Magna Gilet +1', 'Magna Top +1', 'Savage Top +1', 'Elder Gilet +1', 'Wonder Maillot +1', 'Wonder Top +1', 'Mandra. Suit'},
    ['Hands'] = T{},
    ['Ring1'] = T{'Anniversary Ring', 'Emperor Band', 'Chariot Band', 'Empress Band', 'Homing Ring', 'Tavnazian Ring', 'Dem Ring', 'Holla Ring', 'Mea Ring', 'Altep Ring', 'Yhoat Ring'},
    ['Ring2'] = T{'Anniversary Ring', 'Emperor Band', 'Chariot Band', 'Empress Band', 'Homing Ring', 'Tavnazian Ring', 'Dem Ring', 'Holla Ring', 'Mea Ring', 'Altep Ring', 'Yhoat Ring'},
    ['Back'] = T{},
    ['Waist'] = T{},
    ['Legs'] = T{},
    ['Feet'] = T{'Powder Boots'}
}

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcdisplay = gFunc.LoadFile('common\\gcdisplay-rag.lua')
conquest = gFunc.LoadFile('common\\conquest.lua')

local gcinclude = {}

gcinclude.horizon_safe_mode = horizon_safe_mode

local Overrides = T{ 'idle','dt','pdt','mdt','fireres','fres','iceres','ires','bres','lightningres','lres','tres','earthres','eres','sres','windres','wires','ares','waterres','wares','wres','evasion','eva' }
local Commands = T{ 'kite','lock','lockset','warpme','horizonmode' }

local Towns = T{
    'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau',
    'Southern San d\'Oria [S]','Bastok Markets [S]','Windurst Waters [S]',
    'San d\'Oria-Jeuno Airship','Bastok-Jeuno Airship','Windurst-Jeuno Airship','Kazham-Jeuno Airship',
    'Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille',
    'Bastok Mines','Bastok Markets','Port Bastok','Metalworks',
    'Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower',
    'Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno',
    'Rabao','Selbina','Mhaura','Kazham','Norg',
    'Mog Garden','Celennia Memorial Library','Western Adoulin','Eastern Adoulin'
}

local Sandy = T{ 'Southern San d\'Oria [S]','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille' }
local Bastok = T{ 'Bastok Markets [S]','Bastok Mines','Bastok Markets','Port Bastok','Metalworks' }
local Windy = T{ 'Windurst Waters [S]','Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower' }

local OverrideNameTable = {
    ['idle'] = 'Idle',
    ['dt'] = 'DT',
    ['pdt'] = 'DT',
    ['mdt'] = 'MDT',
    ['fireres'] = 'FireRes',
    ['fres'] = 'FireRes',
    ['iceres'] = 'IceRes',
    ['ires'] = 'IceRes',
    ['bres'] = 'IceRes',
    ['lightningres'] = 'LightningRes',
    ['lres'] = 'LightningRes',
    ['tres'] = 'LightningRes',
    ['earthres'] = 'EarthRes',
    ['eres'] = 'EarthRes',
    ['sres'] = 'EarthRes',
    ['windres'] = 'WindRes',
    ['ares'] = 'WindRes',
    ['wires'] = 'WindRes',
    ['waterres'] = 'WaterRes',
    ['wres'] = 'WaterRes',
    ['wares'] = 'WaterRes',
    ['evasion'] = 'Evasion',
    ['eva'] = 'Evasion'
}

local isMageJobs = T{ 'RDM','BLM','WHM','SMN','BRD' }

local lastIdleSet = 'Normal'

function gcinclude.Load()
    gSettings.AllowAddSet = true
    gcinclude.SetAlias(Overrides)
    gcinclude.SetAlias(Commands)

    gcdisplay.CreateToggle('Kite', false)
    gcdisplay.CreateToggle('Lock', false)

    local function delayLoad()
        gcdisplay.Load()

        if (load_stylist) then
            AshitaCore:GetChatManager():QueueCommand(-1, '/load Stylist')
            AshitaCore:GetChatManager():QueueCommand(-1, '/stylist load default')
        end
    end

    local player = gData.GetPlayer()
    if (player.MainJob ~= 'NON') then
        delayLoad()
    else
        delayLoad:once(3)
    end
end

function gcinclude.Unload()
    gcinclude.ClearAlias(Overrides)
    gcinclude.ClearAlias(Commands)
    gcdisplay.Unload()
end

function gcinclude.SetAlias(aliasList)
    for _, v in ipairs(aliasList) do
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v)
    end
end

function gcinclude.ClearAlias(aliasList)
    for _, v in ipairs(aliasList) do
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v)
    end
end

function gcinclude.DoCommands(args)
    local isOverride = Overrides:contains(args[1])

    if not (isOverride or Commands:contains(args[1])) then
        do return end
    end

    local player = gData.GetPlayer()
    local isMage = isMageJobs:contains(player.MainJob)

    if (isOverride) then
        gcinclude.ToggleIdleSet(OverrideNameTable[args[1]])
        gcinclude.Message('IdleSet', gcdisplay.IdleSet)
    elseif (args[1] == 'kite') then
        gcdisplay.AdvanceToggle('Kite')
        gcinclude.Message('Kite', gcdisplay.GetToggle('Kite'))
    elseif (args[1] == 'warpme') then
        gcinclude.RunWarpCudgel()
    elseif (args[1] == 'lockset') then
        if (tonumber(args[2]) ~= nil) then
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac set LockSet' .. args[2])
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all')
            gcdisplay.CreateToggle('Lock', true)
            gcinclude.Message('Equip Lock', gcdisplay.GetToggle('Lock'))
        end
    elseif (args[1] == 'lock') then
        local player = gData.GetPlayer()
        gcdisplay.AdvanceToggle('Lock')
        gcinclude.Message('Equip Lock', gcdisplay.GetToggle('Lock'))
        if (not gcdisplay.GetToggle('Lock')) then
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable all')
        else
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all')
        end
    end
end

function gcinclude.Message(toggle, status)
    if (display_messages) then
        print(chat.header('Ashitacast'):append(chat.message(toggle .. ' is ' .. tostring(status))))
    end
end

function gcinclude.ToggleIdleSet(idleSet)
    if (idleSet == 'Idle') then
        if (gcdisplay.IdleSet == 'Normal') then
            gcdisplay.IdleSet = 'Alternate'
        else
            gcdisplay.IdleSet = 'Normal'
        end
        lastIdleSet = gcdisplay.IdleSet
    else
        if (idleSet == gcdisplay.IdleSet) then
            gcdisplay.IdleSet = lastIdleSet
        else
            gcdisplay.IdleSet = idleSet
        end
    end
end

function gcinclude.RunWarpCudgel()
    AshitaCore:GetChatManager():QueueCommand(-1, '/equip main "Warp Cudgel"')
    local function usecudgel()
        AshitaCore:GetChatManager():QueueCommand(-1, '/item "Warp Cudgel" <me>')
    end
    usecudgel:once(31)
end

function gcinclude.DoDefaultIdle()
    gFunc.EquipSet('Idle')
    if (gcdisplay.IdleSet == 'Alternate') then gFunc.EquipSet('IdleALT') end
end

local restTimestamp = 0
local restTimestampRecorded = false

function gcinclude.DoDefaultOverride(isMelee)
    local environment = gData.GetEnvironment()
    local player = gData.GetPlayer()

    if (environment.Area ~= nil) and (Towns:contains(environment.Area)) then
        gFunc.EquipSet('Town')
        gFunc.EquipSet('ducal_aketon')
    end
    if (environment.Area ~= nil) and (Sandy:contains(environment.Area)) then gFunc.EquipSet('kingdom_aketon') end
    if (environment.Area ~= nil) and (Bastok:contains(environment.Area)) then gFunc.EquipSet('republic_aketon') end
    if (environment.Area ~= nil) and (Windy:contains(environment.Area)) then gFunc.EquipSet('federation_aketon') end

    if (gcdisplay.IdleSet == 'DT') then
        if (isMelee) then
            gFunc.EquipSet('DT')
        else
            if (environment.Time >= 6 and environment.Time < 18) then
                gFunc.EquipSet('DT')
            else
                gFunc.EquipSet('DTNight')
            end
        end
    end
    if (gcdisplay.IdleSet == 'Evasion') then gFunc.EquipSet('Evasion') end

    if ((player.IsMoving == true)
        and (
            gcdisplay.IdleSet == 'Normal'
            or gcdisplay.IdleSet == 'Alternate'
            or gcdisplay.IdleSet == 'DT'
            or gcdisplay.IdleSet == 'Evasion'
            or gcdisplay.IdleSet == 'LowAcc'
            or gcdisplay.IdleSet == 'HighAcc'
        )
    ) then
        if (isMageJobs:contains(player.MainJob) and (gcdisplay.GetCycle('TP') ~= 'Off') and player.Status == 'Engaged') then
            if (environment.Time >= 6 and environment.Time < 18) then
                gFunc.EquipSet('DT')
            else
                gFunc.EquipSet('DTNight')
            end
        end
        gFunc.EquipSet('Movement')
    end

    if (gcdisplay.IdleSet == 'MDT') then gFunc.EquipSet('MDT') end
    if (gcdisplay.IdleSet == 'FireRes') then gFunc.EquipSet('FireRes') end
    if (gcdisplay.IdleSet == 'IceRes') then gFunc.EquipSet('IceRes') end
    if (gcdisplay.IdleSet == 'LightningRes') then gFunc.EquipSet('LightningRes') end
    if (gcdisplay.IdleSet == 'EarthRes') then gFunc.EquipSet('EarthRes') end
    if (gcdisplay.IdleSet == 'WindRes') then gFunc.EquipSet('WindRes') end
    if (gcdisplay.IdleSet == 'WaterRes') then gFunc.EquipSet('WaterRes') end
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet('Movement') end

    if (player.Status == 'Resting') then
        if (not restTimestampRecorded) then
            restTimestamp = os.clock() + 16
            restTimestampRecorded = true
        end
        if (os.clock() > restTimestamp) then
            gFunc.EquipSet('Resting')
        end
    else
        restTimestampRecorded = false
    end
end

function gcinclude.DoItem()
    if (not i_can_read_and_follow_instructions_test) then
        print(chat.header('GCInclude'):append(chat.message('Failed to follow instructions. Read the README.md')))
    end

    local item = gData.GetAction()

    if (item.Name == 'Silent Oil') then
        gFunc.EquipSet('dream_boots')
        gFunc.EquipSet('skulkers_cape')
    elseif (item.Name == 'Prism Powder') then
        gFunc.EquipSet('dream_mittens')
        gFunc.EquipSet('skulkers_cape')
    end
end

function gcinclude.DoAbility()
    if (toggleDisplayHeadOnAbility) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/displayhead')
    end
end

function gcinclude.BuildLockableSet(equipment)
    local lockableSet = {}

    for slot, item in pairs(equipment) do
        if (LockableEquipment[slot]:contains(item.Name)) then
            lockableSet[slot] = item
            if (
                item.Name == 'Custom Gilet +1'
                or item.Name == 'Custom Top +1'
                or item.Name == 'Magna Gilet +1'
                or item.Name == 'Magna Top +1'
                or item.Name == 'Savage Top +1'
                or item.Name == 'Elder Gilet +1'
                or item.Name == 'Wonder Maillot +1'
                or item.Name == 'Wonder Top +1'
            ) then
                lockableSet['Hands'] = 'Displaced'
            elseif (item.Name == 'Mandra. Suit') then
                lockableSet['Hands'] = 'Displaced'
                lockableSet['Legs'] = 'Displaced'
                lockableSet['Feet'] = 'Displaced'
            elseif (slot == 'Main') then
                lockableSet['Sub'] = 'Displaced'
            end
        end
    end

    return lockableSet
end

function gcinclude.AppendSets(sets)
    sets.kingdom_aketon = kingdom_aketon
    sets.republic_aketon = republic_aketon
    sets.federation_aketon = federation_aketon
    sets.ducal_aketon = ducal_aketon
    sets.dream_boots = dream_boots
    sets.dream_mittens = dream_mittens
    sets.skulkers_cape = skulkers_cape

    return sets
end

return gcinclude
