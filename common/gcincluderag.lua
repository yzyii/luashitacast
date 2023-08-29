-- Modified from https://github.com/GetAwayCoxn/Luashitacast-Profiles

local gcinclude = T{};

gcinclude.settings = {
    Messages = true; -- set to true if you want chat log messages to appear on any /gc command used such as DT, or KITE gear toggles, certain messages will always appear
    Shorterhand = true; -- set to true if you want to use the commands available in shorterhand.lua
};

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

--[[
List of commands that can be used:
]]
gcinclude.AliasList = T{'dt','mdt','fireres','fres','iceres','ires','lightningres','lres','thunderres','tres','earthres','eres','windres','wres','hate','kite','nuke','warpme','vert','csstun','lock','fight','oor','idle','yellow','mb'};

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
        gcinclude.ToggleOverride('DT');
        toggle = 'Override';
        status = gcdisplay.Override;
    elseif (args[1] == 'mdt') then
        gcinclude.ToggleOverride('MDT');
        toggle = 'Override';
        status = gcdisplay.Override;
    elseif (args[1] == 'fireres' or args[1] == 'fres') then
        gcinclude.ToggleOverride('FireRes');
        toggle = 'Override';
        status = gcdisplay.Override;
    elseif (args[1] == 'iceres' or args[1] == 'ires') then
        gcinclude.ToggleOverride('IceRes');
        toggle = 'Override';
        status = gcdisplay.Override;
    elseif (args[1] == 'lightningres' or args[1] == 'lres' or args[1] == 'thunderres' or args[1] == 'tres') then
        gcinclude.ToggleOverride('LightningRes');
        toggle = 'Override';
        status = gcdisplay.Override;
    elseif (args[1] == 'earthres' or args[1] == 'eres') then
        gcinclude.ToggleOverride('EarthRes');
        toggle = 'Override';
        status = gcdisplay.Override;
    elseif (args[1] == 'windres' or args[1] == 'wres') then
        gcinclude.ToggleOverride('WindRes');
        toggle = 'Override';
        status = gcdisplay.Override;
    elseif (args[1] == 'kite') then
        gcdisplay.AdvanceToggle('Kite');
        toggle = 'Kite Set';
        status = gcdisplay.GetToggle('Kite');
    elseif (args[1] == 'yellow') then
        gcdisplay.AdvanceToggle('Yellow');
        toggle = 'Yellow Set';
        status = gcdisplay.GetToggle('Yellow');
    elseif (args[1] == 'mb') then
        gcdisplay.AdvanceToggle('MB');
        toggle = 'MB Set';
        status = gcdisplay.GetToggle('MB');
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
            if (gcdisplay.GetToggle('Fight') == true) then
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Range')
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Ammo');
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Head');
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Neck');
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Ear1');
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Ear2');
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Body');
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Hands');
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Ring1');
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Ring2');
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Back');
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Waist');
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Legs');
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Feet');
            else
                AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable all');
            end
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
        elseif (args[1] == 'csstun') then
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac set Stun');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all');
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

function gcinclude.ToggleOverride(override)
    if (gcdisplay.Override == override) then
        gcdisplay.Override = 'None'
    else
        gcdisplay.Override = override;
    end
end

function gcinclude.RunWarpCudgel()
    AshitaCore:GetChatManager():QueueCommand(-1, '/equip main "Warp Cudgel"');
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all');
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

    if (gcdisplay.Override == 'DT') then
        if (environment.Time >= 6 and environment.Time <= 18) then
            gFunc.EquipSet('DT');
        else
            gFunc.EquipSet('DTNight');
        end
    end
    if (gcdisplay.Override == 'MDT') then gFunc.EquipSet('MDT') end;
    if (gcdisplay.Override == 'FireRes') then gFunc.EquipSet('FireRes') end;
    if (gcdisplay.Override == 'IceRes') then gFunc.EquipSet('IceRes') end;
    if (gcdisplay.Override == 'LightningRes') then gFunc.EquipSet('LightningRes') end;
    if (gcdisplay.Override == 'EarthRes') then gFunc.EquipSet('EarthRes') end;
    if (gcdisplay.Override == 'WindRes') then gFunc.EquipSet('WindRes') end;
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet('Movement') end;

    local player = gData.GetPlayer();
    if (player.Status == 'Resting') then
        gFunc.EquipSet('Resting');
        if (player.SubJob == "BLM") then
            gFunc.Equip('Back', 'Wizard\'s Mantle');
        end
    elseif (player.IsMoving == true) and (gcdisplay.Override == 'None' or gcdisplay.Override == 'DT') then
        gFunc.EquipSet('Movement');
    end
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

    gcdisplay.CreateToggle('Kite', false);
    gcdisplay.CreateToggle('Lock', false);
    gcdisplay.CreateCycle('Idle', {[1] = 'REG', [2] = 'ALT',});
    if (player.MainJob == 'RDM') or (player.MainJob == 'BLM') then
        gcdisplay.CreateToggle('OOR', false);
        gcdisplay.CreateCycle('Nuke', {[1] = 'DMG', [2] = 'ACC',});
    end
    if (player.MainJob == 'RDM') then
        gcdisplay.CreateToggle('Hate', false);
        gcdisplay.CreateToggle('Fight', false);
    end
    if (player.MainJob == 'BLM') then
        gcdisplay.CreateToggle('Yellow', true);
        gcdisplay.CreateToggle('MB', false);
    end
end

return gcinclude;
