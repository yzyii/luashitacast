local tp_diabolos_earring = false
local tp_diabolos_earring_slot = 'Ear2'

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcinclude = gFunc.LoadFile('common\\gcincluderag.lua')

local gcmelee = {}

function gcmelee.DoDefault()
    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    gcinclude.DoDefaultIdle()

    if (environment.WeatherElement ~= 'Dark') and tp_diabolos_earring then
        gFunc.Equip(tp_diabolos_earring_slot, 'Diabolos\'s Earring')
    end

    gcinclude.DoDefaultOverride()
end

function gcmelee.DoPrecast(fastCastValue)
    gcmelee.SetupMidcastDelay(fastCastValue)
    gFunc.EquipSet('Precast')
end

function gcmelee.SetupMidcastDelay(fastCastValue)
    local player = gData.GetPlayer()
    local action = gData.GetAction()
    if (player.SubJob == "RDM") then
         fastCastValue = fastCastValue + 0.15 -- Fast Cast Trait
    end
    local minimumBuffer = 0.25 -- Can be lowered to 0.1 if you want
    local packetDelay = 0.25 -- Change this to 0.4 if you do not use PacketFlow
    local castDelay = ((action.CastTime * (1 - fastCastValue)) / 1000) - minimumBuffer
    if (castDelay >= packetDelay) then
        gFunc.SetMidDelay(castDelay)
    end

    -- print(chat.header('DEBUG'):append(chat.message('Cast delay is ' .. castDelay)))
end

function gcmelee.DoMidcast(sets)
    gFunc.InterimEquipSet(sets.SIRD)
    gFunc.EquipSet('Haste');
end

return gcmelee
