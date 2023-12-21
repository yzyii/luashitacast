--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

local shorterhand = {}

shorterhand.MageAliasList = T{ 'c4','c3','c2','c','i','s','ss','b','pa','si','po','e','av', }
shorterhand.BardAliasList = T{ 'ft','it','lt','et','wit','wat','dt','lit', }
shorterhand.RegularAliasList = T{ 'u1','u2','ichi','ni' }

local isMage = false
local isBard = false

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
    elseif (args[1] == 'pa') then
        AshitaCore:GetChatManager():QueueCommand(1, '//paralyna ' .. name)
    elseif (args[1] == 'si') then
        AshitaCore:GetChatManager():QueueCommand(1, '//silena ' .. name)
    elseif (args[1] == 'po') then
        AshitaCore:GetChatManager():QueueCommand(1, '//poisona ' .. name)
    elseif (args[1] == 'e') then
        AshitaCore:GetChatManager():QueueCommand(1, '//erase ' .. name)
    elseif (args[1] == 'ft') then
        AshitaCore:GetChatManager():QueueCommand(1, '//firethrenody ' .. name)
    elseif (args[1] == 'it') then
        AshitaCore:GetChatManager():QueueCommand(1, '//icethrenody ' .. name)
    elseif (args[1] == 'lt') then
        AshitaCore:GetChatManager():QueueCommand(1, '//lightningthrenody ' .. name)
    elseif (args[1] == 'et') then
        AshitaCore:GetChatManager():QueueCommand(1, '//earththrenody ' .. name)
    elseif (args[1] == 'wit') then
        AshitaCore:GetChatManager():QueueCommand(1, '//windthrenody ' .. name)
    elseif (args[1] == 'wat') then
        AshitaCore:GetChatManager():QueueCommand(1, '//waterthrenody ' .. name)
    elseif (args[1] == 'dt') then
        AshitaCore:GetChatManager():QueueCommand(1, '//darkthrenody ' .. name)
    elseif (args[1] == 'lit') then
        AshitaCore:GetChatManager():QueueCommand(1, '//lightthrenody ' .. name)
    elseif (args[1] == 'av') then
        AshitaCore:GetChatManager():QueueCommand(1, '//aquaveil')
    elseif (args[1] == 'u1' or args[1] == 'ichi') then
        AshitaCore:GetChatManager():QueueCommand(1, '/ma "Utsusemi: Ichi" <me>')
    elseif (args[1] == 'u2' or args[1] == 'ni') then
        AshitaCore:GetChatManager():QueueCommand(1, '/ma "Utsusemi: Ni" <me>')
    end
end

function shorterhand.Load(enableMageAliases, enableBardAliases)
    isMage = enableMageAliases
    if (isMage) then
        shorterhand.SetAlias(shorterhand.MageAliasList)
    end
    isBard = enableBardAliases
    if (isBard) then
        shorterhand.SetAlias(shorterhand.BardAliasList)
    end
    shorterhand.SetAlias(shorterhand.RegularAliasList)
end

function shorterhand.Unload()
    if (isMage) then
        shorterhand.ClearAlias(shorterhand.MageAliasList)
    end
    if (isBard) then
        shorterhand.ClearAlias(shorterhand.BardAliasList)
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
