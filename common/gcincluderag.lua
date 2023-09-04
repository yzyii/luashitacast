local gcinclude = {
    add_mp = 0 -- Do not edit this
};

gcinclude.settings = {
    Messages = true; -- set to true if you want chat log messages to appear on any /gc command used such as DT, or KITE gear toggles, certain messages will always appear
    Shorterhand = true; -- set to true if you want to use the commands available in shorterhand.lua
};

local tp_diabolos_earring = true
local tp_diabolos_earring_slot = 'Ear2'
local tp_fencers_ring = true
local tp_fencers_ring_slot = 'Ring1'

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

--[[
List of commands that can be used:
]]
gcinclude.AliasList = T{'dt','mdt','fireres','fres','iceres','ires','lightningres','lres','thunderres','tres','earthres','eres','windres','wres','hate','kite','nuke','warpme','vert','csstun','lock','fight','oor','idle','yellow','mb','rebind','addmp'};

gcinclude.Towns = T{'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau','Southern San d\'Oria [S]','Bastok Markets [S]','Windurst Waters [S]','San d\'Oria-Jeuno Airship','Bastok-Jeuno Airship','Windurst-Jeuno Airship','Kazham-Jeuno Airship','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille','Bastok Mines','Bastok Markets','Port Bastok','Metalworks','Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower','Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno','Rabao','Selbina','Mhaura','Kazham','Norg','Mog Garden','Celennia Memorial Library','Western Adoulin','Eastern Adoulin'};

gcdisplay = gFunc.LoadFile('common\\gcdisplayrag.lua');
shorterhand = gFunc.LoadFile('common\\shorterhand.lua');

function gcinclude.Message(toggle, status)
    if toggle ~= nil and status ~= nil then
        print(chat.header('Ashitacast'):append(chat.message(toggle .. ' is now ' .. tostring(status))))
    end
end

function gcinclude.DoCommands(args)
    if not (gcinclude.AliasList:contains(args[1]) or shorterhand.AliasList:contains(args[1])) then return end

    local player = gData.GetPlayer();
    local toggle = nil;
    local status = nil;

    if (args[1] == 'addmp') then
        if (args[2] ~= nil) then
            toggle = 'Add MP';
            status = args[2]
            gcinclude.add_mp = args[2]
        else
            print(chat.header('Ashitacast'):append(chat.message('Add MP is ' .. gcinclude.add_mp)))
        end
    elseif (args[1] == 'dt') then
        gcinclude.ToggleIdleSet('DT');
        toggle = 'IdleSet';
        status = gcdisplay.IdleSet;
    elseif (args[1] == 'mdt') then
        gcinclude.ToggleIdleSet('MDT');
        toggle = 'IdleSet';
        status = gcdisplay.IdleSet;
    elseif (args[1] == 'fireres' or args[1] == 'fres') then
        gcinclude.ToggleIdleSet('FireRes');
        toggle = 'IdleSet';
        status = gcdisplay.IdleSet;
    elseif (args[1] == 'iceres' or args[1] == 'ires') then
        gcinclude.ToggleIdleSet('IceRes');
        toggle = 'IdleSet';
        status = gcdisplay.IdleSet;
    elseif (args[1] == 'lightningres' or args[1] == 'lres' or args[1] == 'thunderres' or args[1] == 'tres') then
        gcinclude.ToggleIdleSet('LightningRes');
        toggle = 'IdleSet';
        status = gcdisplay.IdleSet;
    elseif (args[1] == 'earthres' or args[1] == 'eres') then
        gcinclude.ToggleIdleSet('EarthRes');
        toggle = 'IdleSet';
        status = gcdisplay.IdleSet;
    elseif (args[1] == 'windres' or args[1] == 'wres') then
        gcinclude.ToggleIdleSet('WindRes');
        toggle = 'IdleSet';
        status = gcdisplay.IdleSet;
    elseif (args[1] == 'idle') then
        gcinclude.ToggleIdleSet('Idle');
        toggle = 'IdleSet';
        status = gcdisplay.IdleSet;
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
    elseif (args[1] == 'rebind') then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind !F1 /lac fwd ' .. args[2]);
    elseif (args[1] == 'lock') then
        gcdisplay.AdvanceToggle('Lock');
        toggle = 'Equip Lock';
        status = gcdisplay.GetToggle('Lock');
        if (not status) then
            if (gcdisplay.IdleSet == 'Fight') then
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
    end
    if (player.MainJob == 'RDM') or (player.MainJob == 'BLM') then
        if (args[1] == 'nuke') then
            gcdisplay.AdvanceCycle('Nuke');
            toggle = 'Nuking Gear Set';
            status = gcdisplay.GetCycle('Nuke');
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
        elseif (args[1] == 'fight') then
            gcinclude.ToggleIdleSet('Fight');
            toggle = 'IdleSet';
            status = gcdisplay.IdleSet;
        end
    end
    if (player.MainJob == 'RDM') then
        if (args[1] == 'mb') then
            gcdisplay.AdvanceToggle('MB');
            toggle = 'MB Set';
            status = gcdisplay.GetToggle('MB');
        elseif (args[1] == 'yellow') then
            gcdisplay.AdvanceToggle('Yellow');
            toggle = 'Yellow Set';
            status = gcdisplay.GetToggle('Yellow');
        end
    end


    if gcinclude.settings.Messages then
        gcinclude.Message(toggle, status)
    end

    if gcinclude.settings.Shorterhand then
        shorterhand.DoCommands(args);
    end
end

local lastIdleSet = 'Normal'
local lastIdleSetBeforeEngaged = ''

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
            if (idleSet == 'Fight') then
                gcinclude.UnlockWeapon:once(1);
				if (lastIdleSetBeforeEngaged ~= '') then
                    gcinclude.ToggleIdleSet(lastIdleSetBeforeEngaged);
				end
                lastIdleSetBeforeEngaged = ''
            end
        else
            gcdisplay.IdleSet = idleSet;
            if (idleSet == 'Fight') then
                gcinclude.LockWeapon:once(1);
            end
        end
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

function gcinclude.DoDefault(ninSJMMP, whmSJMMP, blmSJMMP, rdmSJMMP)
    gFunc.EquipSet('Idle');
    if (gcdisplay.IdleSet == 'Alternate') then gFunc.EquipSet('IdleALT') end;

    local player = gData.GetPlayer();

    if (gcdisplay.IdleSet == 'Normal' or gcdisplay.IdleSet == 'Alternate') then
        if (player.SubJob == "NIN") and player.MP >= ninSJMMP + gcinclude.add_mp - 50 then
            gFunc.EquipSet('IdleMaxMP')
        elseif (player.SubJob == "WHM") and player.MP >= whmSJMMP + gcinclude.add_mp - 50 then
            gFunc.EquipSet('IdleMaxMP')
        elseif (player.SubJob == "BLM") and player.MP >= blmSJMMP + gcinclude.add_mp - 50 then
            gFunc.EquipSet('IdleMaxMP')
        elseif (player.SubJob == "RDM") and player.MP >= rdmSJMMP + gcinclude.add_mp - 50 then
            gFunc.EquipSet('IdleMaxMP')
        end
    end

    local environment = gData.GetEnvironment();
    if (environment.Area ~= nil) and (gcinclude.Towns:contains(environment.Area)) then gFunc.EquipSet('Town') end

    if (player.Status == 'Engaged' and lastIdleSetBeforeEngaged == '') then
        lastIdleSetBeforeEngaged = gcdisplay.IdleSet;
        gcinclude.ToggleIdleSet('Fight');
    end
    if (player.Status == 'Idle' and lastIdleSetBeforeEngaged ~= '') then
        if (player.TP == 0) then
            gcinclude.ToggleIdleSet(lastIdleSetBeforeEngaged);
            lastIdleSetBeforeEngaged = '';
            gcinclude.UnlockWeapon:once(1);
        end
    end

    if (gcdisplay.IdleSet == 'Fight') then
        gFunc.EquipSet('TP')
        if tp_diabolos_earring then
            gFunc.Equip(tp_diabolos_earring_slot, 'Diabolos\'s Earring');
        end
        if (tp_fencers_ring and player.HPP <= 75 and player.TP <= 1000) then
            gFunc.Equip(tp_fencers_ring_slot, 'Fencer\'s Ring');
        end
    end

    if (gcdisplay.IdleSet == 'DT') then
        if (environment.Time >= 6 and environment.Time <= 18) then
            gFunc.EquipSet('DT');
        else
            gFunc.EquipSet('DTNight');
        end
    end
    if (gcdisplay.IdleSet == 'MDT') then gFunc.EquipSet('MDT') end;
    if (gcdisplay.IdleSet == 'FireRes') then gFunc.EquipSet('FireRes') end;
    if (gcdisplay.IdleSet == 'IceRes') then gFunc.EquipSet('IceRes') end;
    if (gcdisplay.IdleSet == 'LightningRes') then gFunc.EquipSet('LightningRes') end;
    if (gcdisplay.IdleSet == 'EarthRes') then gFunc.EquipSet('EarthRes') end;
    if (gcdisplay.IdleSet == 'WindRes') then gFunc.EquipSet('WindRes') end;
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet('Movement') end;

    local player = gData.GetPlayer();
    if (player.Status == 'Resting') then
        gFunc.EquipSet('Resting');
    elseif (player.IsMoving == true) and (gcdisplay.IdleSet == 'None' or gcdisplay.IdleSet == 'DT') then
        gFunc.EquipSet('Movement');
    end
end

function gcinclude.LockWeapon()
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Main');
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Sub');
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Range');
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ammo');
end

function gcinclude.UnlockWeapon()
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Main');
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Sub');
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Range');
    AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Ammo');
end

function gcinclude.Load()
    gSettings.AllowAddSet = true;
    gcdisplay.Load:once(2);
    gcinclude.SetVariables:once(2);
    gcinclude.SetAlias:once(2);

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !F1 /lac fwd fres');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !F2 /lac fwd kite');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !F3 /lac fwd dt');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !F4 /lac fwd mdt');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 //stun');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 //dia');

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
    if (player.MainJob == 'RDM') or (player.MainJob == 'BLM') then
        gcdisplay.CreateToggle('OOR', false);
        gcdisplay.CreateCycle('Nuke', {[1] = 'DMG', [2] = 'ACC',});
    end
    if (player.MainJob == 'RDM') then
        gcdisplay.CreateToggle('Hate', false);
    end
    if (player.MainJob == 'BLM') then
        gcdisplay.CreateToggle('Yellow', true);
        gcdisplay.CreateToggle('MB', false);
    end
end

return gcinclude;
