local shorterhand = T{};

--[[
List of commands that can be used
]]
shorterhand.AliasList = T{'c4','c3','c2','c','i','s','ss','b','av'};

function shorterhand.DoCommands(args)
    local name = ''
    if (args[2] ~= nil) then name = args[2] end

    if (args[1] == 'c4') then
        AshitaCore:GetChatManager():QueueCommand(1, '//cure4 ' .. name);
    elseif (args[1] == 'c3') then
        AshitaCore:GetChatManager():QueueCommand(1, '//cure3 ' .. name);
    elseif (args[1] == 'c2') then
        AshitaCore:GetChatManager():QueueCommand(1, '//cure2 ' .. name);
    elseif (args[1] == 'c') then
        AshitaCore:GetChatManager():QueueCommand(1, '//cure ' .. name);
    elseif (args[1] == 'i') then
        AshitaCore:GetChatManager():QueueCommand(1, '//invisible ' .. name);
    elseif (args[1] == 's') then
        AshitaCore:GetChatManager():QueueCommand(1, '//sneak ' .. name);
    elseif (args[1] == 'ss') then
        AshitaCore:GetChatManager():QueueCommand(1, '//stoneskin');
    elseif (args[1] == 'b') then
        AshitaCore:GetChatManager():QueueCommand(1, '//blink');
    elseif (args[1] == 'av') then
        AshitaCore:GetChatManager():QueueCommand(1, '//aquaveil');
    end
end

function shorterhand.Load()
    shorterhand.SetAlias:once(2);
end

function shorterhand.Unload()
    shorterhand.ClearAlias();
end

function shorterhand.SetAlias()
    for _, v in ipairs(shorterhand.AliasList) do
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
    end
end

function shorterhand.ClearAlias()
    for _, v in ipairs(shorterhand.AliasList) do
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v);
    end
end

return shorterhand;
