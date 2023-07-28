-- Modified from https://github.com/GetAwayCoxn/Luashitacast-Profiles

local gcinclude = T{};

gcinclude.settings = {
    Messages = true; -- set to true if you want chat log messages to appear on any /gc command used such as DT, or KITE gear toggles, certain messages will always appear
    Shorterhand = true; -- set to true if you want to use the commands available in shorterhand.lua
};

-- I can't be bothered rewriting this properly so this is specific to how I use a mostly DT set for my idle gear that hits the 50% cap at night due to Umbra Cape.
local use_idle_for_dt_at_night = false

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

--[[
List of commands that can be used:
]]
gcinclude.AliasList = T{'dt','mdt','fireres','fres','iceres','ires','lightningres','lres','thunderres','tres','earthres','eres','hate','kite','nuke','warpme','vert','lock','fight','oor','idle'};

gcinclude.Towns = T{'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau','Southern San d\'Oria [S]','Bastok Markets [S]','Windurst Waters [S]','San d\'Oria-Jeuno Airship','Bastok-Jeuno Airship','Windurst-Jeuno Airship','Kazham-Jeuno Airship','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille','Bastok Mines','Bastok Markets','Port Bastok','Metalworks','Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower','Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno','Rabao','Selbina','Mhaura','Kazham','Norg','Mog Garden','Celennia Memorial Library','Western Adoulin','Eastern Adoulin'};

gcdisplay = gFunc.LoadFile('common\\gcdisplayrag.lua');
shorterhand = gFunc.LoadFile('common\\shorterhand.lua');

function gcinclude.Message(toggle, status)
    if toggle ~= nil and status ~= nil then
        print(chat.header('GCinclude'):append(chat.message(toggle .. ' is now ' .. tostring(status))))
    end
end

function gcinclude.DoCommands(args)
    if not (gcinclude.AliasList:contains(args[1]) or shorterhand.AliasList:contains(args[1])) then return end

    local player = gData.GetPlayer();
    local toggle = nil;
    local status = nil;
    
    if (args[1] == 'dt') then
        gcdisplay.AdvanceToggle('DT');
        toggle = 'DT Set';
        status = gcdisplay.GetToggle('DT');
    elseif (args[1] == 'mdt') then
        gcdisplay.AdvanceToggle('MDT');
        toggle = 'MDT Set';
        status = gcdisplay.GetToggle('MDT');
    elseif (args[1] == 'fireres' or args[1] == 'fres') then
        gcdisplay.AdvanceToggle('FireRes');
        toggle = 'Fire Resist Set';
        status = gcdisplay.GetToggle('FireRes');
    elseif (args[1] == 'iceres' or args[1] == 'ires') then
        gcdisplay.AdvanceToggle('IceRes');
        toggle = 'Ice Resist Set';
        status = gcdisplay.GetToggle('IceRes');
    elseif (args[1] == 'lightningres' or args[1] == 'lres' or args[1] == 'thunderres' or args[1] == 'tres') then
        gcdisplay.AdvanceToggle('LightningRes');
        toggle = 'Lightning Resist Set';
        status = gcdisplay.GetToggle('LightningRes');
    elseif (args[1] == 'earthres' or args[1] == 'eres') then
        gcdisplay.AdvanceToggle('EarthRes');
        toggle = 'Earth Resist Set';
        status = gcdisplay.GetToggle('EarthRes');
    elseif (args[1] == 'kite') then
        gcdisplay.AdvanceToggle('Kite');
        toggle = 'Kite Set';
        status = gcdisplay.GetToggle('Kite');
    elseif (args[1] == 'warpme') then
        gcdisplay.AdvanceToggle('Lock');
        toggle = 'Equip Lock';
        status = gcdisplay.GetToggle('Lock');
        gcinclude.RunWarpCudgel();
    elseif (args[1] == 'oor') then
        gcdisplay.AdvanceToggle('OOR');
        toggle = 'Out of Region Set';
        status = gcdisplay.GetToggle('OOR');
    elseif (args[1] == 'lock') then
        gcdisplay.AdvanceToggle('Lock');
        toggle = 'Equip Lock';
        status = gcdisplay.GetToggle('Lock');
        if (not status) then
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable all');
        else
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all');
        end
    elseif (args[1] == 'idle') then
        gcdisplay.AdvanceCycle('Idle');
        toggle = 'Idle Gear Set';
        status = gcdisplay.GetCycle('Idle');
    end
    if (player.MainJob == 'RDM') or (player.MainJob == 'BLM') then
        if (args[1] == 'nuke') then
            gcdisplay.AdvanceCycle('Nuke');
            toggle = 'Nuking Gear Set';
            status = gcdisplay.GetCycle('Nuke');
        elseif (args[1] == 'fight') then
            if (gcdisplay.GetToggle('Fight') == false) then
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac set TP');
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Main');
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Sub');
                gcdisplay.AdvanceToggle('Fight');
                toggle = 'Mage Weapon Lock';
                status = gcdisplay.GetToggle('Fight');
            else
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Main');
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Sub');
                gcdisplay.AdvanceToggle('Fight');
                toggle = 'Mage Weapon Lock';
                status = gcdisplay.GetToggle('Fight');
            end
        end
    end
    if (player.MainJob == 'RDM') then
        if (args[1] == 'vert') then
            if (gcdisplay.GetToggle('OOR') == true) then
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac set ConvertOOR');
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all');
            else
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac set Convert');
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all');
            end
            gcdisplay.CreateToggle('Lock', true);
            toggle = 'Equip Lock';
            status = gcdisplay.GetToggle('Lock');
        elseif (args[1] == 'hate') then
            gcdisplay.AdvanceToggle('Hate');
            toggle = 'Hate Set';
            status = gcdisplay.GetToggle('Hate');
        end
    end

    if gcinclude.settings.Messages then
        gcinclude.Message(toggle, status)
    end
    
    if gcinclude.settings.Shorterhand then
        shorterhand.DoCommands(args);
    end
end

function gcinclude.RunWarpCudgel()
    AshitaCore:GetChatManager():QueueCommand(-1, '/equip main "Warp Cudgel"');
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Main');
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Sub');
    local function usecudgel()
        AshitaCore:GetChatManager():QueueCommand(-1, '/item "Warp Cudgel" <me>');
    end
    usecudgel:once(31);
end

function gcinclude.DoDefault()
    gFunc.EquipSet('Idle');
    if (gcdisplay.GetCycle('Idle') == 'ALT') then gFunc.EquipSet('IdleALT') end;

    local environment = gData.GetEnvironment();
    if (environment.Area ~= nil) and (gcinclude.Towns:contains(environment.Area)) then gFunc.EquipSet('Town') end

    local player = gData.GetPlayer();
    if (player.Status == 'Resting') then
        gFunc.EquipSet('Resting');
        if (player.SubJob == "BLM") then
            gFunc.Equip('Back', 'Wizard\'s Mantle');
        end
    elseif (player.IsMoving == true) then
        gFunc.EquipSet('Movement');
    end

    if (gcdisplay.GetToggle('DT') == true) then
        if (environment.Time >= 6 and environment.Time <= 18) or (not use_idle_for_dt_at_night) then
            gFunc.EquipSet('DT');
        else
            gFunc.EquipSet('Idle');
        end
    end
    if (gcdisplay.GetToggle('MDT') == true) then gFunc.EquipSet('MDT') end;
    if (gcdisplay.GetToggle('FireRes') == true) then gFunc.EquipSet('FireRes') end;
    if (gcdisplay.GetToggle('IceRes') == true) then gFunc.EquipSet('IceRes') end;
    if (gcdisplay.GetToggle('LightningRes') == true) then gFunc.EquipSet('LightningRes') end;
    if (gcdisplay.GetToggle('EarthRes') == true) then gFunc.EquipSet('EarthRes') end;
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet('Movement') end;
end

function gcinclude.Load()
    gSettings.AllowAddSet = true;
    gcdisplay.Load:once(2);
    gcinclude.SetVariables:once(2);
    gcinclude.SetAlias:once(2);
    
    if gcinclude.settings.Shorterhand then
        shorterhand.Load();
    end
end

function gcinclude.Unload()
    gcinclude.ClearAlias();
    gcdisplay.Unload();
    if gcinclude.settings.Shorterhand then
        shorterhand.Unload();
    end
end

function gcinclude.SetAlias()
    for _, v in ipairs(gcinclude.AliasList) do
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
    end
end

function gcinclude.ClearAlias()
    for _, v in ipairs(gcinclude.AliasList) do
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v);
    end
end

function gcinclude.SetVariables()
    local player = gData.GetPlayer();

    gcdisplay.CreateToggle('DT', false);
    gcdisplay.CreateToggle('MDT', false);
    gcdisplay.CreateToggle('FireRes', false);
    gcdisplay.CreateToggle('IceRes', false);
    gcdisplay.CreateToggle('LightningRes', false);
    gcdisplay.CreateToggle('EarthRes', false);
    gcdisplay.CreateToggle('Kite', false);
    gcdisplay.CreateToggle('Lock', false);
    gcdisplay.CreateToggle('OOR', false);
    gcdisplay.CreateCycle('Idle', {[1] = 'REG', [2] = 'ALT',});
    if (player.MainJob == 'RDM') or (player.MainJob == 'BLM') then
        gcdisplay.CreateCycle('Nuke', {[1] = 'DMG', [2] = 'ACC',});
        gcdisplay.CreateToggle('Fight', false);
    end
    if (player.MainJob == 'RDM') then
        gcdisplay.CreateToggle('Hate', false);
    end
end

return gcinclude;
