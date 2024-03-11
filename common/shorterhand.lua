--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

local shorterhand = {}

shorterhand.MageAliasList = T{ 'c4','c3','c2','c',
                               'i','s','ss','b','av',
                               'pa','si','po','bl','e',
                               'pro4','sh4','pro3','sh3','pro2','sh2','pro1','sh1',
                               'prog2','shg2','prog1','shg1',
                               'b4','b3','b2','b1',
                               't4','t3','t2','t1',
                               'f4','f3','f2','f1',
                               'w4','w3','w2','w1',
                               'a4','a3','a2','a1',
                               's4','s3','s2','s1',
                               'bga','tga'
                             }
shorterhand.BardAliasList = T{ 'ft','it','lt','et','wit','wat','dat','lit', }
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
    elseif (args[1] == 'av') then
        AshitaCore:GetChatManager():QueueCommand(1, '//aquaveil')
    elseif (args[1] == 'pa') then
        AshitaCore:GetChatManager():QueueCommand(1, '//paralyna ' .. name)
    elseif (args[1] == 'si') then
        AshitaCore:GetChatManager():QueueCommand(1, '//silena ' .. name)
    elseif (args[1] == 'po') then
        AshitaCore:GetChatManager():QueueCommand(1, '//poisona ' .. name)
    elseif (args[1] == 'bl') then
        AshitaCore:GetChatManager():QueueCommand(1, '//blindna ' .. name)
    elseif (args[1] == 'e') then
        AshitaCore:GetChatManager():QueueCommand(1, '//erase ' .. name)
    elseif (args[1] == 'ft') then
        AshitaCore:GetChatManager():QueueCommand(1, '//firethrenody ' .. name)
    elseif (args[1] == 'it') then
        AshitaCore:GetChatManager():QueueCommand(1, '//icethrenody ' .. name)
    elseif (args[1] == 'lt') then
        AshitaCore:GetChatManager():QueueCommand(1, '//ltngthrenody ' .. name)
    elseif (args[1] == 'et') then
        AshitaCore:GetChatManager():QueueCommand(1, '//earththrenody ' .. name)
    elseif (args[1] == 'wit') then
        AshitaCore:GetChatManager():QueueCommand(1, '//windthrenody ' .. name)
    elseif (args[1] == 'wat') then
        AshitaCore:GetChatManager():QueueCommand(1, '//waterthrenody ' .. name)
    elseif (args[1] == 'dat') then
        AshitaCore:GetChatManager():QueueCommand(1, '//darkthrenody ' .. name)
    elseif (args[1] == 'lit') then
        AshitaCore:GetChatManager():QueueCommand(1, '//lightthrenody ' .. name)
    elseif (args[1] == 'u1' or args[1] == 'ichi') then
        AshitaCore:GetChatManager():QueueCommand(1, '/ma "Utsusemi: Ichi" <me>')
    elseif (args[1] == 'u2' or args[1] == 'ni') then
        AshitaCore:GetChatManager():QueueCommand(1, '/ma "Utsusemi: Ni" <me>')

    elseif (args[1] == 'bga') then
        AshitaCore:GetChatManager():QueueCommand(1, '//blizzaga3 ' .. name)
    elseif (args[1] == 'tga') then
        AshitaCore:GetChatManager():QueueCommand(1, '//thundaga3 ' .. name)
    elseif (args[1] == 'b4') then
        AshitaCore:GetChatManager():QueueCommand(1, '//blizzard4 ' .. name)
    elseif (args[1] == 'b3') then
        AshitaCore:GetChatManager():QueueCommand(1, '//blizzard3 ' .. name)
    elseif (args[1] == 'b2') then
        AshitaCore:GetChatManager():QueueCommand(1, '//blizzard2 ' .. name)
    elseif (args[1] == 'b1') then
        AshitaCore:GetChatManager():QueueCommand(1, '//blizzard ' .. name)
    elseif (args[1] == 't4') then
        AshitaCore:GetChatManager():QueueCommand(1, '//thunder4 ' .. name)
    elseif (args[1] == 't3') then
        AshitaCore:GetChatManager():QueueCommand(1, '//thunder3 ' .. name)
    elseif (args[1] == 't2') then
        AshitaCore:GetChatManager():QueueCommand(1, '//thunder2 ' .. name)
    elseif (args[1] == 't1') then
        AshitaCore:GetChatManager():QueueCommand(1, '//thunder ' .. name)
    elseif (args[1] == 'f4') then
        AshitaCore:GetChatManager():QueueCommand(1, '//fire4 ' .. name)
    elseif (args[1] == 'f3') then
        AshitaCore:GetChatManager():QueueCommand(1, '//fire3 ' .. name)
    elseif (args[1] == 'f2') then
        AshitaCore:GetChatManager():QueueCommand(1, '//fire2 ' .. name)
    elseif (args[1] == 'f1') then
        AshitaCore:GetChatManager():QueueCommand(1, '//fire ' .. name)
    elseif (args[1] == 'w4') then
        AshitaCore:GetChatManager():QueueCommand(1, '//water4 ' .. name)
    elseif (args[1] == 'w3') then
        AshitaCore:GetChatManager():QueueCommand(1, '//water3 ' .. name)
    elseif (args[1] == 'w2') then
        AshitaCore:GetChatManager():QueueCommand(1, '//water2 ' .. name)
    elseif (args[1] == 'w1') then
        AshitaCore:GetChatManager():QueueCommand(1, '//water ' .. name)
    elseif (args[1] == 'a4') then
        AshitaCore:GetChatManager():QueueCommand(1, '//aero4 ' .. name)
    elseif (args[1] == 'a3') then
        AshitaCore:GetChatManager():QueueCommand(1, '//aero3 ' .. name)
    elseif (args[1] == 'a2') then
        AshitaCore:GetChatManager():QueueCommand(1, '//aero2 ' .. name)
    elseif (args[1] == 'a1') then
        AshitaCore:GetChatManager():QueueCommand(1, '//aero ' .. name)
    elseif (args[1] == 's4') then
        AshitaCore:GetChatManager():QueueCommand(1, '//stone4 ' .. name)
    elseif (args[1] == 's3') then
        AshitaCore:GetChatManager():QueueCommand(1, '//stone3 ' .. name)
    elseif (args[1] == 's2') then
        AshitaCore:GetChatManager():QueueCommand(1, '//stone2 ' .. name)
    elseif (args[1] == 's1') then
        AshitaCore:GetChatManager():QueueCommand(1, '//stone ' .. name)

    elseif (args[1] == 'pro4') then
        AshitaCore:GetChatManager():QueueCommand(1, '//protect4 ' .. name)
    elseif (args[1] == 'sh4') then
        AshitaCore:GetChatManager():QueueCommand(1, '//shell4 ' .. name)
    elseif (args[1] == 'pro3') then
        AshitaCore:GetChatManager():QueueCommand(1, '//protect3 ' .. name)
    elseif (args[1] == 'sh3') then
        AshitaCore:GetChatManager():QueueCommand(1, '//shell3 ' .. name)
    elseif (args[1] == 'pro2') then
        AshitaCore:GetChatManager():QueueCommand(1, '//protect2 ' .. name)
    elseif (args[1] == 'sh2') then
        AshitaCore:GetChatManager():QueueCommand(1, '//shell2 ' .. name)
    elseif (args[1] == 'pro1') then
        AshitaCore:GetChatManager():QueueCommand(1, '//protect ' .. name)
    elseif (args[1] == 'sh1') then
        AshitaCore:GetChatManager():QueueCommand(1, '//shell ' .. name)
    elseif (args[1] == 'prog2') then
        AshitaCore:GetChatManager():QueueCommand(1, '//protectra2 ' .. name)
    elseif (args[1] == 'shg2') then
        AshitaCore:GetChatManager():QueueCommand(1, '//shellra2 ' .. name)
    elseif (args[1] == 'prog1') then
        AshitaCore:GetChatManager():QueueCommand(1, '//protectra ' .. name)
    elseif (args[1] == 'shg1') then
        AshitaCore:GetChatManager():QueueCommand(1, '//shellra ' .. name)
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
