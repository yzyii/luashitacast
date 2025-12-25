-- A stepwise calculator for optimal Yellow set usage on BLM that equips anywhere between 230 to 280 HP Down in 5 HP increments.
-- Usage of this will result in this replacing usage of the Yellow and YellowHNM sets and close the SIRD vulnerability by 2x Packet Delay i.e. 500 ms with PacketFlow.
-- It is suggested you do NOT use this unless you understand what you're doing.

local blmAdvanced = {}

local hpBaseWHM = 1030 -- HP on WHM SJ with nothing equipped

local hpOffset = { -- Difference in HP from WHM SJ
    ['WAR'] = 59,
    ['MNK'] = 138,
    ['WHM'] = 0,
    ['RDM'] = 18,
    ['THF'] = 18,
    ['PLD'] = 41,
    ['DRK'] = 41,
    ['BST'] = 41,
    ['BRD'] = 18,
    ['RNG'] = 0,
    ['SAM'] = 59,
    ['NIN'] = 18,
    ['DRG'] = 41,
    ['SMN'] = -38,
}

local dBelt_Nuke = 20 -- HP from belt on Nuke set. i.e. Sorceror's Ring (20) or Penitent's Rope (-20)
local dCape_Nuke = 10 -- HP from cape on Nuke set. i.e. Prism Cape (10)

local dBelt_NukeHNM = -20 -- HP from belt on NukeHNM set
local dCape_NukeHNM = 0 -- HP from cape on NukeHNM set

local dBelt_NukeACC = 20 -- HP from belt on NukeACC set
local dCape_NukeACC = 0 -- HP from cape on NukeACC set

local Yellow_Advanced_Base = { -- 230
    val = 230, -- Total HP Down from this set
    set = {
        Ammo = 'Tiphia Sting',
        Head = 'Zenith Crown +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Loquac. Earring', 
        Ear2 = 'Magnetic Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Serket Ring',
        Back = 'Umbra Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Igqira Lappas',
        Feet = 'Mahatma Pigaches',
    }
}

-- Sequentially applied sets on top of Yellow_Advanced_Base resulting in progressively larger amounts of HP Down
local Yellow_Advanced_Steps = {
    [1] = { -- 235
        val = 5,
        set = {
            Feet = 'Rostrum Pumps', -- 5
        },
    },
    [2] = { -- 240
        val = 5,
        set = {
            Ring1 = 'Ether Ring', -- 30
            Waist = { Name = 'Hierarch Belt', Priority = 100 }, -- -20
            Feet = 'Mahatma Pigaches', -- -5
        },
    },
    [3] = { -- 245
        val = 5,
        set = {
            Feet = 'Rostrum Pumps', -- 5
        },
    },
    [4] = { -- 250
        val = 5,
        set = {
            Back = { Name = 'Prism Cape', Priority = 100 }, -- -10
            Waist = 'Penitent\'s Rope', -- 20
            Feet = 'Mahatma Pigaches', -- -5
        },
    },
    [5] = { -- 255
        val = 5,
        set = {
            Feet = 'Rostrum Pumps', -- 5
        },
    },
    [6] = { -- 260
        val = 5,
        set = {
            Neck = 'Star Necklace', -- 15
            Back = 'Umbra Cape', -- 10
            Waist = { Name = 'Hierarch Belt', Priority = 100 }, -- -20
        },
    },
    [7] = { -- 265
        val = 5,
        set = {
            Neck = 'Jeweled Collar +1', -- -15
            Waist = 'Penitent\'s Rope', -- 20
        },
    },
    [8] = { -- 270
        val = 5,
        set = {
            Neck = 'Star Necklace', -- 15
            Back = { Name = 'Prism Cape', Priority = 100 }, -- -10
        },
    },
    [9] = { -- 275
        val = 5,
        set = {
            Back = 'Umbra Cape', -- 10
            Feet = 'Mahatma Pigaches', -- -5
        },
    },
    [10] = { -- 280
        val = 5,
        set = {
            Feet = 'Rostrum Pumps', -- 5
        },
    },
}

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

--[[
                              HNM,      NukeAcc,  Nuke,     NukeSorc
765 on whm         instead of 767/1010, 782/1030, 790/1040, 805/1060
783 on rdm,nin,thf instead of 781/1028, 796/1048, 804/1058, 819/1078
806 on drg         instead of 798/1051, 813/1071, 821/1081, 836/1101
]]

local debug = false

function blmAdvanced.BuildYellowSet(subJob, isObi, isHNM, isACC)
    -- Determine Max HP
    local baseHP = hpBaseWHM + hpOffset[subJob]
    local maxHP = baseHP

    if (not isObi) then
        local dBelt = dBelt_Nuke
        if (isHNM) then
            dBelt = dBelt_NukeHNM
        end
        if (isACC) then
            dBelt = dBelt_NukeACC
        end

        maxHP = maxHP + dBelt
    end

    local dCape = dCape_Nuke
    if (isHNM) then
        dCape = dCape_NukeHNM
    end
    if (isACC) then
        dCape = dCape_NukeACC
    end
    maxHP = maxHP + dCape

    if debug then print(chat.header('BLMADV'):append(chat.message('Base HP: ' .. tostring(baseHP)))) end
    if debug then print(chat.header('BLMADV'):append(chat.message('Max HP: ' .. tostring(maxHP)))) end

    -- Determine Target HP
    local targetHPFloat = maxHP * 0.76
    local targetHP = math.floor(targetHPFloat)
    if (targetHP == targetHPFloat) then
        targetHP = targetHP - 1
    end
    if (subJob == 'WHM') then -- auto regen
        targetHP = targetHP - 1
    end
    if debug then print(chat.header('BLMADV'):append(chat.message('Target HP: ' .. tostring(targetHP)))) end

    -- Determine Delta HP
    local deltaHP = baseHP - targetHP
    if debug then print(chat.header('BLMADV'):append(chat.message('Delta HP: ' .. tostring(deltaHP)))) end

    -- Progressively apply sets until deltaHP is reached
    local yellowSet = Yellow_Advanced_Base.set
    local i = Yellow_Advanced_Base.val
    local j = 1

    while (i < deltaHP and j <= #Yellow_Advanced_Steps) do
        yellowSet = gFunc.Combine(yellowSet, Yellow_Advanced_Steps[j].set)
        i = i + Yellow_Advanced_Steps[j].val
        j = j + 1

        if debug then print(chat.header('BLMADV'):append(chat.message('i: ' .. tostring(i)))) end
        if debug then print(chat.header('BLMADV'):append(chat.message('j: ' .. tostring(j)))) end
    end

    if (j > #Yellow_Advanced_Steps and i < deltaHP) then
        if debug then print(chat.header('BLMADV'):append(chat.message('i too small: ' .. tostring(i)))) end
        yellowSet = {}
    end

    if debug then print(chat.header('BLMADV'):append(chat.message('Expected HP: ' .. tostring(baseHP - i)))) end

    return baseHP - i, yellowSet
end

return blmAdvanced
