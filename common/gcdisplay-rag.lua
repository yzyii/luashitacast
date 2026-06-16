local visibilityOnLoad = true -- Default visibility of the UI element on loading the game / switching jobs.
local positionOnLoad_x = 300 -- Default X position of the UI element on loading the game / switching jobs.
local positionOnLoad_y = 0 -- Default Y position of the UI element on loading the game / switching jobs.

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

-- Modified from https://github.com/GetAwayCoxn/Luashitacast-Profiles

local Toggles = {}
local Cycles = {}
local fonts = require('fonts')

local gcdisplay = {
    IdleSet = 'Normal'
}

local fontSettings = {
    visible = visibilityOnLoad,
    font_family = 'Consolas',
    font_height = 12,
    color = 0xFFFFFFFF,
    color_outline = 0xFF000000,
    position_x = positionOnLoad_x,
    position_y = positionOnLoad_y,
    draw_flags = 0x10,
    background =
    T{
        visible = false,
    },
}

function gcdisplay.AdvanceCycle(name)
    local ctable = Cycles[name]
    if (type(ctable) ~= 'table') then
        return
    end

    ctable.Index = ctable.Index + 1
    if (ctable.Index > #ctable.Array) then
        ctable.Index = 1
    end
end

function gcdisplay.SetCycleIndex(name, index)
    local ctable = Cycles[name]
    if (type(ctable) ~= 'table') then
        return
    end

    if (index <= #ctable.Array) then
        ctable.Index = index
    end
end

function gcdisplay.AdvanceToggle(name)
    if (type(Toggles[name]) ~= 'boolean') then
        return
    elseif Toggles[name] then
        Toggles[name] = false
    else
        Toggles[name] = true
    end
end

function gcdisplay.CreateToggle(name, default)
    Toggles[name] = default
end

function gcdisplay.GetToggle(name)
    if (Toggles[name] ~= nil) then
        return Toggles[name]
    else
        return false
    end
end

function gcdisplay.CreateCycle(name, values)
    local newCycle = {
        Index = 1,
        Array = values
    }
    Cycles[name] = newCycle
end

function gcdisplay.GetCycle(name)
    local ctable = Cycles[name]
    if (type(ctable) == 'table') then
        return ctable.Array[ctable.Index]
    else
        return 'Unknown'
    end
end

function gcdisplay.Unload()
    if (gcdisplay.FontObject ~= nil) then
        gcdisplay.FontObject:SetVisible(false)
        gcdisplay.FontObject:destroy()
        gcdisplay.FontObject = nil
    end
    ashita.events.unregister('d3d_present', 'gcdisplay_present_cb')
    ashita.events.unregister('command', 'gcdisplay_command_cb')
end

function gcdisplay.Load()
    if (gcdisplay.FontObject ~= nil) then
        gcdisplay.FontObject:SetVisible(false)
        gcdisplay.FontObject:destroy()
        gcdisplay.FontObject = nil
    end
    gcdisplay.FontObject = fonts.new(fontSettings)

    local player = gData.GetPlayer()
    local job = player.MainJob

    ashita.events.register('d3d_present', 'gcdisplay_present_cb', function ()
        local display = '  ' .. job
        for k, v in pairs(Toggles) do
            display = display .. ' '
            if (v == true) then
                display = display .. '|cFF5FFF5F|' .. k .. '|r'
            else
                display = display .. '|cFF989898|' .. k .. '|r'
            end
        end

        local tpOff = gcdisplay.GetCycle('TP') == 'Off'
        for key, value in pairs(Cycles) do
            if (not (tpOff and key == 'Weapon Loadout')) then
                display = display .. '   ' .. key .. ': ' .. '|cFF5FFF5F|' .. value.Array[value.Index] .. '|r'
            end
        end
        display = display .. '   ' .. 'IdleSet' .. ': ' .. '|cFF5FFF5F|' .. gcdisplay.IdleSet .. '|r' .. ' '
        gcdisplay.FontObject.text = display
    end)

    ashita.events.register('command', 'gcdisplay_command_cb', function (e)
        local args = e.command:args()
        if #args == 0 or args[1] ~= '/gcdisplay' then
            return
        end

        e.blocked = true

        if #args == 1 and gcdisplay.FontObject ~= nil then
            gcdisplay.FontObject.visible = not gcdisplay.FontObject.visible
        end
    end)
end

return gcdisplay
