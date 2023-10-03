local shorterhand = {}

shorterhand.MageAliasList = T{ 'c4','c3','c2','c','i','s','ss','b','av' }
shorterhand.RegularAliasList = T{ 'u1','u2','ichi','ni' }

local isMage = false

function shorterhand.DoCommands(args)
    local name = ''
    if (args[2] ~= nil) then name = args[2] end

    if (args[1] == 'c4') then
        AshitaCore:GetChatManager():QueueCommand(1, '//cure4 ' .. name)
    elseif (args[1] == 'c3') then
        AshitaCore:GetChatManager():QueueCommand(1, '//cure3 ' .. name)
    elseif (args[1] == 'c2') then
        AshitaCore:GetChatManager():QueueCommand(1, '//cure2 ' .. name)
    elseif (args[1] == 'c') then
        AshitaCore:GetChatManager():QueueCommand(1, '//cure ' .. name)
    elseif (args[1] == 'i') then
        AshitaCore:GetChatManager():QueueCommand(1, '//invisible ' .. name)
    elseif (args[1] == 's') then
        AshitaCore:GetChatManager():QueueCommand(1, '//sneak ' .. name)
    elseif (args[1] == 'ss') then
        AshitaCore:GetChatManager():QueueCommand(1, '//stoneskin')
    elseif (args[1] == 'b') then
        AshitaCore:GetChatManager():QueueCommand(1, '//blink')
    elseif (args[1] == 'av') then
        AshitaCore:GetChatManager():QueueCommand(1, '//aquaveil')
    elseif (args[1] == 'u1' or args[1] == 'ichi') then
        AshitaCore:GetChatManager():QueueCommand(1, '/ma "Utsusemi: Ichi" <me>')
    elseif (args[1] == 'u2' or args[1] == 'ni') then
        AshitaCore:GetChatManager():QueueCommand(1, '/ma "Utsusemi: Ni" <me>')
    end
end

function shorterhand.Load(enableMageAliases)
	isMage = enableMageAliases
	if (isMage) then
	    shorterhand.SetAlias(shorterhand.MageAliasList)
	end
	shorterhand.SetAlias(shorterhand.RegularAliasList)
end

function shorterhand.Unload()
    if (isMage) then
        shorterhand.ClearAlias(shorterhand.MageAliasList)
	end
	shorterhand.ClearAlias(shorterhand.RegularAliasList)
end

function shorterhand.SetAlias(aliasList)
    for _, v in ipairs(aliasList) do
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v)
    end
end

function shorterhand.ClearAlias(aliasList)
    for _, v in ipairs(aliasList) do
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v)
    end
end

return shorterhand
