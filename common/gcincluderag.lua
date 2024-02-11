local display_messages = true -- set to true if you want chat log messages to appear on any /gc command used such as DT, or KITE gear toggles
local use_shorterhand = true -- set to true if you want to use the commands available in shorterhand.lua

local kingdom_aketon = false
local republic_aketon = false
local federation_aketon = false
local ducal_aketon = false

local load_stylist = true

--[[
-----------------------------------
Custom Keybinds. Change if Desired.
-----------------------------------
]]

function DoCustom() -- Write your own custom Keybinds or logic in here that will get run OnLoad()
    -- e.g.
    -- AshitaCore:GetChatManager():QueueCommand(-1, '/bind space /jump')
    -- AshitaCore:GetChatManager():QueueCommand(-1, '/bind m /map')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !F1 /lac fwd fres')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !F2 /lac fwd kite')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !F3 /lac fwd dt')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !F4 /lac fwd mdt')
end

local MageJobs = T{ 'RDM','BLM','WHM','SMN','PLD','BRD','BST','DRG' } -- Due to how job changing and loading ashitacast works, just enable all shorthand macros for the following jobs

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcdisplay = gFunc.LoadFile('common\\gcdisplayrag.lua')
shorterhand = gFunc.LoadFile('common\\shorterhand.lua')

local gcinclude = {}

local Overrides = T{ 'idle','dt','pdt','mdt','fireres','fres','iceres','ires','bres','lightningres','lres','tres','earthres','eres','sres','windres','wires','ares','waterres','wares','wres','evasion','eva' }
local Commands = T{ 'kite','lock','locktp','rebind','lockset','warpme' }

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

local NoTPLockJobs = T{ 'RDM','BLM','WHM','SMN','BRD' }

local lastIdleSet = 'Normal'

function gcinclude.Load()
    gSettings.AllowAddSet = true
    gcinclude.SetAlias(Overrides)
    gcinclude.SetAlias(Commands)

    DoCustom()

    gcdisplay.CreateToggle('Kite', false)
    gcdisplay.CreateToggle('Lock', false)


    local function delayLoad()
        local player = gData.GetPlayer()
        if (not NoTPLockJobs:contains(player.MainJob)) then
            gcdisplay.CreateToggle('LockTP', false)
        end

        local isMage = MageJobs:contains(player.MainJob)
        local isBard = player.MainJob == 'BRD'
        if (use_shorterhand) then
            shorterhand.Load(isMage, isBard)
        end

        gcdisplay.Load()

        if (load_stylist) then
            AshitaCore:GetChatManager():QueueCommand(-1, '/load Stylist')
        end
    end
    delayLoad:once(3)
end

function gcinclude.Unload()
    gcinclude.ClearAlias(Overrides)
    gcinclude.ClearAlias(Commands)
    gcdisplay.Unload()

    if (use_shorterhand) then
        shorterhand.Unload()
    end
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
    local isShorterhandAlias = shorterhand.MageAliasList:contains(args[1]) or shorterhand.RegularAliasList:contains(args[1]) or shorterhand.BardAliasList:contains(args[1])
    if (use_shorterhand and isShorterhandAlias) then
        shorterhand.DoCommands(args)
        do return end
    end

    local isOverride = Overrides:contains(args[1])

    if not (isOverride or Commands:contains(args[1])) then
        do return end
    end

    local player = gData.GetPlayer()

    if (isOverride) then
        gcinclude.ToggleIdleSet(OverrideNameTable[args[1]])
        gcinclude.Message('IdleSet', gcdisplay.IdleSet)
    elseif (args[1] == 'kite') then
        gcdisplay.AdvanceToggle('Kite')
        gcinclude.Message('Kite', gcdisplay.GetToggle('Kite'))
    elseif (args[1] == 'warpme') then
        gcdisplay.CreateToggle('Lock', true)
        gcinclude.RunWarpCudgel()
        gcinclude.Message('Equip Lock', gcdisplay.GetToggle('Lock'))
    elseif (args[1] == 'rebind') then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind !F1 /lac fwd ' .. args[2])
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
                if (not NoTPLockJobs:contains(player.MainJob)) then gcdisplay.CreateToggle('LockTP', false) end
            end
        else
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all')
            if (not NoTPLockJobs:contains(player.MainJob)) then gcdisplay.CreateToggle('LockTP', false) end
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
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all')
    local function usecudgel()
        AshitaCore:GetChatManager():QueueCommand(-1, '/item "Warp Cudgel" <me>')
    end
    usecudgel:once(31)
end

function gcinclude.DoDefaultIdle()
    gFunc.EquipSet('Idle')
    if (gcdisplay.IdleSet == 'Alternate') then gFunc.EquipSet('IdleALT') end
end

function gcinclude.DoDefaultOverride(isMelee)
    local environment = gData.GetEnvironment()
    local player = gData.GetPlayer()

    if (environment.Area ~= nil) and (Towns:contains(environment.Area))	then
        gFunc.EquipSet('Town')
        if (kingdom_aketon == true) then
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
            if (environment.Time >= 6 and environment.Time <= 18) then
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
        gFunc.EquipSet('Resting')
    elseif (player.IsMoving == true) and (gcdisplay.IdleSet == 'Normal' or gcdisplay.IdleSet == 'Alternate' or gcdisplay.IdleSet == 'DT') then
        gFunc.EquipSet('Movement')
    elseif (player.IsMoving == true) and gcdisplay.IdleSet == 'Fight' then
        gFunc.EquipSet('DT')
        gFunc.EquipSet('Movement')
    end
end

return gcinclude
