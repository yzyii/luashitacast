local display_messages = true -- set to true if you want chat log messages to appear on any /gc command used such as DT, or KITE gear toggles

local kingdom_aketon = false
local republic_aketon = false
local federation_aketon = false
local ducal_aketon = false

local dream_boots = true
local dream_mittens = true
local skulkers_cape = false

local load_stylist = true -- set to true to just load stylist on game start. this is purely for convenience since putting it in scripts doesn't work.

-- Add additional equipment here that you want to automatically lock when equipping
local LockableEquipment = {
    ['Main'] = T{'Warp Cudgel', 'Rep. Signet Staff', 'Kgd. Signet Staff', 'Fed. Signet Staff', 'Treat Staff II', 'Trick Staff II'},
    ['Sub'] = T{},
    ['Range'] = T{},
    ['Ammo'] = T{},
    ['Head'] = T{'Reraise Hairpin', 'Dream Hat +1'},
    ['Neck'] = T{'Opo-opo Necklace'},
    ['Ear1'] = T{'Reraise Earring'},
    ['Ear2'] = T{'Reraise Earring'},
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

gcdisplay = gFunc.LoadFile('common\\gcdisplayrag.lua')

local gcinclude = {}

local Overrides = T{ 'idle','dt','pdt','mdt','fireres','fres','iceres','ires','bres','lightningres','lres','tres','earthres','eres','sres','windres','wires','ares','waterres','wares','wres','evasion','eva' }
local Commands = T{ 'kite','lock','locktp','lockset','warpme','horizonmode' }

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

local isMage = T{ 'RDM','BLM','WHM','SMN','BRD' }

local lastIdleSet = 'Normal'

function gcinclude.Load()
    gSettings.AllowAddSet = true
    gcinclude.SetAlias(Overrides)
    gcinclude.SetAlias(Commands)

    gcdisplay.CreateToggle('Kite', false)
    gcdisplay.CreateToggle('Lock', false)

    local function delayLoad()
        local delayedPlayer = gData.GetPlayer()
        if (not isMage:contains(delayedPlayer.MainJob)) then
            gcdisplay.CreateToggle('LockTP', false)
        end

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

function gcinclude.LockWeapon()
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Main')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Sub')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Range')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ammo')
end

function gcinclude.UnlockWeapon()
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Main')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Sub')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Range')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Ammo')
end

function gcinclude.UnlockNonWeapon()
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Head')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Neck')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Ear1')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Ear2')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Body')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Hands')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Ring1')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Ring2')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Back')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Waist')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Legs')
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Feet')
end

function gcinclude.DoCommands(args)
    local isOverride = Overrides:contains(args[1])

    if not (isOverride or Commands:contains(args[1])) then
        do return end
    end

    local player = gData.GetPlayer()

    if (isOverride) then
        if (gcdisplay.IdleSet == 'Fight') then
            print(chat.header('Ashitacast'):append(chat.message('Overriding in Fight mode is currently unsupported. Type /fight to disable Fight mode.')))
        else
            gcinclude.ToggleIdleSet(OverrideNameTable[args[1]])
            gcinclude.Message('IdleSet', gcdisplay.IdleSet)
        end
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
            if (gcdisplay.IdleSet == 'Fight' or gcdisplay.GetToggle('LockTP')) then
                gcinclude.UnlockNonWeapon()
            else
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable all')
                if (not isMage:contains(player.MainJob)) then gcdisplay.CreateToggle('LockTP', false) end
            end
        else
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all')
            if (not isMage:contains(player.MainJob)) then gcdisplay.CreateToggle('LockTP', false) end
        end
    elseif (args[1] == 'locktp') then
        gcdisplay.AdvanceToggle('LockTP')
        gcinclude.Message('Weapons Lock', gcdisplay.GetToggle('LockTP'))
        if (not gcdisplay.GetToggle('LockTP')) then
            if (gcdisplay.IdleSet ~= 'Fight') then
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable all')
            end
            gcdisplay.CreateToggle('Lock', false)
        else
            gcdisplay.CreateToggle('Lock', false)
            gcinclude.LockWeapon()
            gcinclude.UnlockNonWeapon()
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
        if (ducal_aketon == true) then
            gFunc.Equip('Body', 'Ducal Aketon')
        end
    end
    if (environment.Area ~= nil) and (Sandy:contains(environment.Area) and kingdom_aketon == true) then gFunc.Equip('Body', 'Kingdom Aketon') end
    if (environment.Area ~= nil) and (Bastok:contains(environment.Area) and republic_aketon == true) then gFunc.Equip('Body', 'Republic Aketon') end
    if (environment.Area ~= nil) and (Windy:contains(environment.Area) and federation_aketon == true) then gFunc.Equip('Body', 'Federation Aketon') end

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
    if (gcdisplay.IdleSet == 'MDT') then gFunc.EquipSet('MDT') end
    if (gcdisplay.IdleSet == 'FireRes') then gFunc.EquipSet('FireRes') end
    if (gcdisplay.IdleSet == 'IceRes') then gFunc.EquipSet('IceRes') end
    if (gcdisplay.IdleSet == 'LightningRes') then gFunc.EquipSet('LightningRes') end
    if (gcdisplay.IdleSet == 'EarthRes') then gFunc.EquipSet('EarthRes') end
    if (gcdisplay.IdleSet == 'WindRes') then gFunc.EquipSet('WindRes') end
    if (gcdisplay.IdleSet == 'WaterRes') then gFunc.EquipSet('WaterRes') end
    if (gcdisplay.IdleSet == 'Evasion') then gFunc.EquipSet('Evasion') end
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

    if ((player.IsMoving == true)
        and (
            gcdisplay.IdleSet == 'Normal'
            or gcdisplay.IdleSet == 'Alternate'
            or gcdisplay.IdleSet == 'DT'
            or gcdisplay.IdleSet == 'Fight'
            or gcdisplay.IdleSet == 'LowAcc'
            or gcdisplay.IdleSet == 'HighAcc'
            or gcdisplay.IdleSet == 'Evasion'
        )
    ) then
        gFunc.EquipSet('Movement')
    elseif (gcdisplay.IdleSet == 'Fight' and player.Status ~= 'Engaged') then
        gFunc.EquipSet('DT')
        gFunc.EquipSet('Movement')
    end
end

function gcinclude.DoItem()
    local item = gData.GetAction()

    if (item.Name == 'Silent Oil') then
        if (dream_boots) then
            gFunc.Equip('Feet', 'Dream Boots +1')
        end
        if (skulkers_cape) then
            gFunc.Equip('Back', 'Skulker\'s Cape')
        end
    elseif (item.Name == 'Prism Powder') then
        if (dream_mittens) then
            gFunc.Equip('Hands', 'Dream Mittens +1')
        end
        if (skulkers_cape) then
            gFunc.Equip('Back', 'Skulker\'s Cape')
        end
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
                lockableSet['Legs'] = 'Displaced'
            elseif (slot == 'Main') then
                lockableSet['Sub'] = 'Displaced'
            end
        end
    end

    return lockableSet
end

return gcinclude
