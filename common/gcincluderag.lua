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
gcinclude.AliasList = T{'dt','kite','nuke','warpme','vert','lock', 'fight'};

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
    elseif (args[1] == 'kite') then
        gcdisplay.AdvanceToggle('Kite');
        toggle = 'Kite Set';
        status = gcdisplay.GetToggle('Kite');
    elseif (args[1] == 'warpme') then
        gcdisplay.AdvanceToggle('Lock');
        toggle = 'Equip Lock';
        status = gcdisplay.GetToggle('Lock');
        gcinclude.RunWarpCudgel();
    elseif (args[1] == 'lock') then
        gcdisplay.AdvanceToggle('Lock');
        toggle = 'Equip Lock';
        status = gcdisplay.GetToggle('Lock');
        if (not status) then
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Main');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Sub');
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
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Main');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Sub');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Range')
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ammo');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Head');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Neck');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ear1');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ear2');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Body');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Hands');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ring1');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ring2');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Back');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Waist');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Legs');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Feet');
        end
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
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac set Convert');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Main');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Sub');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Range')
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ammo');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Head');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Neck');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ear1');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ear2');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Body');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Hands');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ring1');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ring2');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Back');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Waist');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Legs');
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Feet');
            gcdisplay.CreateToggle('Lock', true);
            toggle = 'Equip Lock';
            status = gcdisplay.GetToggle('Lock');
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

    local player = gData.GetPlayer();
    if (player.Status == 'Resting') then
        gFunc.EquipSet('Resting');
        if (player.SubJob == "BLM") then
            gFunc.Equip('Back', 'Wizard\'s Mantle');
        end
    elseif (player.IsMoving == true) then
        gFunc.EquipSet('Movement');
    end

    local zone = gData.GetEnvironment();
    if (zone.Area ~= nil) and (gcinclude.Towns:contains(zone.Area)) then gFunc.EquipSet('Town') end

    local weakened = gData.GetBuffCount('Weakened');
    local sleep = gData.GetBuffCount('Sleep');
    local doom = (gData.GetBuffCount('Doom'))+(gData.GetBuffCount('Bane'));

    if (gcdisplay.GetToggle('DT') == true) then gFunc.EquipSet('Dt') end;
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
    gcdisplay.CreateToggle('Kite', false);
    gcdisplay.CreateToggle('Lock', false);
    if (player.MainJob == 'RDM') or (player.MainJob == 'BLM') then
        gcdisplay.CreateCycle('Nuke', {[1] = 'DMG', [2] = 'ACC',});
        gcdisplay.CreateToggle('Fight', false);
    end
end

return gcinclude;