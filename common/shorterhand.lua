--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

local shorterhand = {}

shorterhand.MageAliasList = T{
    'c4','c3','c2','c1','c',
    's','ss','b','av',
    'pa','si','po','bl','e',
    'pro4','sh4','pro3','sh3','pro2','sh2','pro1','sh1',
    'prog2','shg2','prog1','shg1',
}
shorterhand.RDMAliasList = T{
    'b3','b2','b1',
    't3','t2','t1',
    'f3','f2','f1',
    'w3','w2','w1',
    'a3','a2','a1',
    's3','s2','s1',
}
shorterhand.BLMAliasList = T{
    'b4','t4','f4','w4','a4','s4',
    'bg','tg','fg','wg','ag','sg',
}
shorterhand.BRDAliasList = T{ 'ft','it','lt','et','wit','wat','dat','lit', }
shorterhand.RegularAliasList = T{ 'u1','u2','ichi','ni','i', }

local isMage = false
local isBRD = false
local isRDM = false
local isBLM = false

function shorterhand.DoCommands(args)
    local name = ''
    if (args[2] ~= nil) then name = args[2] end

    if (args[1] == 'c4') then
        AshitaCore:GetChatManager():QueueCommand(1, '//cure4 ' .. name)
    elseif (args[1] == 'c3') then
        AshitaCore:GetChatManager():QueueCommand(1, '//cure3 ' .. name)
    elseif (args[1] == 'c2') then
        AshitaCore:GetChatManager():QueueCommand(1, '//cure2 ' .. name)
    elseif (args[1] == 'c1') then
        AshitaCore:GetChatManager():QueueCommand(1, '//cure ' .. name)
    elseif (args[1] == 'c') then
        AshitaCore:GetChatManager():QueueCommand(1, '//cure ' .. name)
    elseif (args[1] == 'i') then
        local player = gData.GetPlayer()
        local isNIN = player.MainJob == 'NIN' or player.SubJob == 'NIN'
        if (isNIN and name == 'me') then
            AshitaCore:GetChatManager():QueueCommand(1, '/ma "Tonko: Ni" <me>')
        else
            AshitaCore:GetChatManager():QueueCommand(1, '//invisible ' .. name)
        end
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

    elseif (args[1] == 'bg') then
        AshitaCore:GetChatManager():QueueCommand(1, '//blizzaga3 ' .. name)
    elseif (args[1] == 'tg') then
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

function shorterhand.Load(enableMageAliases, enableBrdAliases, enableRdmAliases, enableBlmAliases)
    isMage = enableMageAliases
    if (isMage) then
        shorterhand.SetAlias(shorterhand.MageAliasList)
    end
    isBRD = enableBrdAliases
    if (isBRD) then
        shorterhand.SetAlias(shorterhand.BRDAliasList)
    end
    isRDM = enableRdmAliases
    if (isRDM) then
        shorterhand.SetAlias(shorterhand.RDMAliasList)
    end
    isBLM = enableBlmAliases
    if (isBLM) then
        shorterhand.SetAlias(shorterhand.BLMAliasList)
    end
    shorterhand.SetAlias(shorterhand.RegularAliasList)
end

function shorterhand.Unload()
    if (isMage) then
        shorterhand.ClearAlias(shorterhand.MageAliasList)
    end
    if (isBRD) then
        shorterhand.ClearAlias(shorterhand.BRDAliasList)
    end
    if (isRDM) then
        shorterhand.ClearAlias(shorterhand.RDMAliasList)
    end
    if (isBLM) then
        shorterhand.ClearAlias(shorterhand.BLMAliasList)
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
