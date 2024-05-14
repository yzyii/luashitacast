--Any zone listed here will look up conquest based on the specified region.
local regionMap = T{
    [1] = 'Norvallen', --Phanauet Channel
    [2] = 'Norvallen', --Carpenters' Landing
    [3] = 'Kolshushu', --Manaclipper
    [4] = 'Kolshushu', --Bibiki Bay
    [5] = 'Valdeaunia', --Uleguerand Range
    [6] = 'Valdeaunia', --Bearclaw Pinnacle
    [7] = 'Aragoneu', --Attohwa Chasm
    [8] = 'Aragoneu', --Boneyard Gully
    [9] = 'Fauregandi', --Pso'Xja
    [10] = 'Fauregandi', --The Shrouded Maw
    [11] = 'Movalpolos', --Oldton Movalpolos
    [12] = 'Movalpolos', --Newton Movalpolos
    [13] = 'Movalpolos', --Mine Shaft #2716
    [24] = 'Tavnazian Archipelago', --Lufaise Meadows
    [25] = 'Tavnazian Archipelago', --Misareaux Coast
    [27] = 'Tavnazian Archipelago', --Phomiuna Aqueducts
    [28] = 'Tavnazian Archipelago', --Sacrarium
    [29] = 'Tavnazian Archipelago', --Riverne - Site #B01
    [30] = 'Tavnazian Archipelago', --Riverne - Site #A01
    [31] = 'Tavnazian Archipelago', --Monarch Linn
    [32] = 'Tavnazian Archipelago', --Sealion's Den
    [100] = 'Ronfaure', --West Ronfaure
    [101] = 'Ronfaure', --East Ronfaure
    [102] = 'Zulkheim', --La Theine Plateau
    [103] = 'Zulkheim', --Valkurm Dunes
    [104] = 'Norvallen', --Jugner Forest
    [105] = 'Norvallen', --Batallia Downs
    [106] = 'Gustaberg', --North Gustaberg
    [107] = 'Gustaberg', --South Gustaberg
    [108] = 'Zulkheim', --Konschtat Highlands
    [109] = 'Derfland', --Pashhow Marshlands
    [110] = 'Derfland', --Rolanberry Fields
    [111] = 'Fauregandi', --Beaucedine Glacier
    [112] = 'Valdeaunia', --Xarcabard
    [113] = 'Vollbow', --Cape Teriggan
    [114] = 'Kuzotz', --Eastern Altepa Desert
    [115] = 'Sarutabaruta', --West Sarutabaruta
    [116] = 'Sarutabaruta', --East Sarutabaruta
    [117] = 'Kolshushu', --Tahrongi Canyon
    [118] = 'Kolshushu', --Buburimu Peninsula
    [119] = 'Aragoneu', --Meriphataud Mountains
    [120] = 'Aragoneu', --Sauromugue Champaign
    [121] = 'Li\'Telor', --The Sanctuary of Zi'Tah
    [122] = 'Li\'Telor', --Ro'Maeve
    [123] = 'Elshimo Lowlands', --Yuhtunga Jungle
    [124] = 'Elshimo Uplands', --Yhoator Jungle
    [125] = 'Kuzotz', --Western Altepa Desert
    [126] = 'Qufim', --Qufim Island
    [127] = 'Qufim', --Behemoth's Dominion
    [128] = 'Vollbow', --Valley of Sorrows
    [130] = 'Tu\'Lia', --Ru'Aun Gardens
    [139] = 'Ronfaure', --Horlais Peak
    [140] = 'Ronfaure', --Ghelsba Outpost
    [141] = 'Ronfaure', --Fort Ghelsba
    [142] = 'Ronfaure', --Yughott Grotto
    [143] = 'Gustaberg', --Palborough Mines
    [144] = 'Gustaberg', --Waughroon Shrine
    [145] = 'Sarutabaruta', --Giddeus
    [146] = 'Sarutabaruta', --Balga's Dais
    [147] = 'Derfland', --Beadeaux
    [148] = 'Derfland', --Qulun Dome
    [149] = 'Norvallen', --Davoi
    [150] = 'Norvallen', --Monastic Cavern
    [151] = 'Aragoneu', --Castle Oztroja
    [152] = 'Aragoneu', --Altar Room
    [154] = 'Li\'Telor', --Dragon's Aery
    [157] = 'Qufim', --Middle Delkfutt's Tower
    [158] = 'Qufim', --Upper Delkfutt's Tower
    [159] = 'Elshimo Uplands', --Temple of Uggalepih
    [160] = 'Elshimo Uplands', --Den of Rancor
    [161] = 'Valdeaunia', --Castle Zvahl Baileys
    [162] = 'Valdeaunia', --Castle Zvahl Keep
    [163] = 'Elshimo Uplands', --Sacrificial Chamber
    [165] = 'Valdeaunia', --Throne Room
    [166] = 'Fauregandi', --Ranguemont Pass
    [167] = 'Ronfaure', --Bostaunieux Oubliette
    [168] = 'Kuzotz', --Chamber of Oracles
    [169] = 'Sarutabaruta', --Toraimarai Canal
    [170] = 'Sarutabaruta', --Full Moon Fountain
    [172] = 'Gustaberg', --Zeruhn Mines
    [173] = 'Gustaberg', --Korroloka Tunnel
    [174] = 'Vollbow', --Kuftal Tunnel
    [176] = 'Elshimo Lowlands', --Sea Serpent Grotto
    [177] = 'Tu\'Lia', --Ve'Lugannon Palace
    [178] = 'Tu\'Lia', --The Shrine of Ru'Avitau
    [179] = 'Qufim', --Stellar Fulcrum
    [180] = 'Tu\'Lia', --La'Loff Amphitheater
    [181] = 'Tu\'Lia', --The Celestial Nexus
    [184] = 'Qufim', --Lower Delkfutt's Tower
    [190] = 'Ronfaure', --King Ranperre's Tomb
    [191] = 'Gustaberg', --Dangruf Wadi
    [192] = 'Sarutabaruta', --Inner Horutoto Ruins
    [193] = 'Zulkheim', --Ordelle's Caves
    [194] = 'Sarutabaruta', --Outer Horutoto Ruins
    [195] = 'Norvallen', --The Eldieme Necropolis
    [196] = 'Zulkheim', --Gusgen Mines
    [197] = 'Derfland', --Crawlers' Nest
    [198] = 'Kolshushu', --Maze of Shakhrami
    [200] = 'Aragoneu', --Garlaige Citadel
    [201] = 'Vollbow', --Cloister of Gales
    [202] = 'Li\'Telor', --Cloister of Storms
    [203] = 'Fauregandi', --Cloister of Frost
    [204] = 'Fauregandi', --Fei'Yin
    [205] = 'Elshimo Uplands', --Ifrit's Cauldron
    [206] = 'Fauregandi', --Qu'Bia Arena
    [207] = 'Elshimo Uplands', --Cloister of Flames
    [208] = 'Kuzotz', --Quicksand Caves
    [209] = 'Kuzotz', --Cloister of Tremors
    [211] = 'Elshimo Uplands', --Cloister of Tides
    [212] = 'Vollbow', --Gustav Tunnel
    [213] = 'Kolshushu', --Labyrinth of Onzozo
    [247] = 'Kuzotz', --Rabao
    [248] = 'Zulkheim', --Selbina
    [249] = 'Kolshushu', --Mhaura
    [250] = 'Elshimo Lowlands', --Kazham
    [251] = 'Li\'Telor', --Hall of the Gods
    [252] = 'Elshimo Lowlands', --Norg
}

--These can be changed, and determine what the output will be from the functions when called.
--It is not recommended for you to change them unless necessary.
local controllerNames = T{
    [1] = 'San d\'Oria',
    [2] = 'Bastok',
    [3] = 'Windurst',
    [4] = 'Beastmen',
}

--Any zone listed here will always report this conquest.
local fixedControl = T{
    [39] = controllerNames[4], --Dynamis - Valkurm
    [40] = controllerNames[4], --Dynamis - Buburimu
    [41] = controllerNames[4], --Dynamis - Qufim
    [42] = controllerNames[4], --Dynamis - Tavnazia
    [134] = controllerNames[4], --Dynamis - Beaucedine
    [135] = controllerNames[4], --Dynamis - Xarcabard
    [185] = controllerNames[4], --Dynamis - San d'Oria
    [186] = controllerNames[4], --Dynamis - Bastok
    [187] = controllerNames[4], --Dynamis - Windurst
    [188] = controllerNames[4], --Dynamis - Jeuno

    --Verified on retail that cities all trigger 'outside control' but not 'inside control' regardless of allegiance..
    [230] = controllerNames[4], --Southern San d'Oria
    [231] = controllerNames[4], --Northern San d'Oria
    [232] = controllerNames[4], --Port San d'Oria
    [233] = controllerNames[4], --Chateau d'Oraguille
    [234] = controllerNames[4], --Bastok Mines
    [235] = controllerNames[4], --Bastok Markets
    [236] = controllerNames[4], --Port Bastok
    [237] = controllerNames[4], --Metalworks
    [238] = controllerNames[4], --Windurst Waters
    [239] = controllerNames[4], --Windurst Walls
    [240] = controllerNames[4], --Port Windurst
    [241] = controllerNames[4], --Windurst Woods
    [242] = controllerNames[4], --Heavens Tower

}

--This data should not be changed unless it is found to be inaccurate or custom regions are added.
local packetData = T{
    { offset=0x1D, name='Ronfaure' },
    { offset=0x21, name='Zulkheim' },
    { offset=0x25, name='Norvallen' },
    { offset=0x29, name='Gustaberg' },
    { offset=0x2D, name='Derfland' },
    { offset=0x31, name='Sarutabaruta' },
    { offset=0x35, name='Kolshushu' },
    { offset=0x39, name='Aragoneu' },
    { offset=0x3D, name='Fauregandi' },
    { offset=0x41, name='Valdeaunia' },
    { offset=0x45, name='Qufim' },
    { offset=0x49, name='Li\'Telor' },
    { offset=0x4D, name='Kuzotz' },
    { offset=0x51, name='Vollbow' },
    { offset=0x55, name='Elshimo Lowlands' },
    { offset=0x59, name='Elshimo Uplands' },
    { offset=0x5D, name='Tu\'Lia' },
    { offset=0x61, name='Movalpolos' },
    { offset=0x65, name='Tavnazian Archipelago' },
}

local regionControllers = {}

local function LookupControl(zone)
    local region = regionMap[zone]
    if region == nil then
        local fixed = fixedControl[zone]
        if fixed == nil then
            return 'N/A'
        else
            return fixed
        end
    end
    local control = regionControllers[region]
    if control == nil then
        return 'Unknown'
    else
        return control
    end
end

local chat = require('chat')
local currentNation = 'Unknown'
local currentZone = AshitaCore:GetMemoryManager():GetParty():GetMemberZone(0)
local currentControl = LookupControl(currentZone)
local daysUntilConquest = -1
local packetTime  = (currentZone > 0) and 0 or 999999999

ashita.events.register('packet_out', 'LAC_Conquest_Module_HandleOutgoingPacket', function (e)
    if (e.id == 0x15) and (os.clock() > packetTime) then
        if (daysUntilConquest == -1) and (currentControl ~= 'N/A') then
            local packet = struct.pack('L', 0)
            AshitaCore:GetPacketManager():AddOutgoingPacket(0x5A, packet:totable())
            print(chat.header('Conquest') .. chat.message('Sending packet to request conquest information.'))
            packetTime = os.clock() + 10
        elseif (currentNation == 'Unknown') then
            local packet = struct.pack('LL', 0, 0)
            AshitaCore:GetPacketManager():AddOutgoingPacket(0x61, packet:totable())
            print(chat.header('Conquest') .. chat.message('Sending packet to request current nation.'))
            packetTime = os.clock() + 10
        end
    end
end)

ashita.events.register('packet_in', 'LAC_Conquest_Module_HandleIncomingPacket', function (e)
    if (e.id == 0x00A) then
        currentZone = struct.unpack('H', e.data, 0x30 + 1)
        currentControl = LookupControl(currentZone)
        packetTime = os.clock() + 15
    elseif (e.id == 0x5E) then
        local days = struct.unpack('B', e.data, 0x8C + 1)
        if (days > daysUntilConquest) then
            for _,region in ipairs(packetData) do
                local controller = struct.unpack('B', e.data, region.offset + 1)
                regionControllers[region.name] = controllerNames[controller]
            end

            print(chat.header('Conquest') .. chat.message('Updated conquest information.'))
        end

        packetTime = os.clock() + 1
        daysUntilConquest = days
        currentControl = LookupControl(currentZone)
    elseif (e.id == 0x61) then
        local nationIndex = struct.unpack('B', e.data, 0x50 + 1)
        local newNation = controllerNames[nationIndex + 1]
        if (newNation ~= currentNation) then
            currentNation = newNation
            print(chat.header('Conquest') .. chat.message('Updated player nation.'))
        end
    end
end)



local lib = {}

function lib:GetCurrentControl()
    return currentControl
end

function lib:GetCurrentNation()
    return currentNation
end

function lib:GetZoneControl(zone)
    return LookupControl(zone)
end

function lib:GetInsideControl()
    return (currentControl == currentNation)
end

function lib:GetOutsideControl()
    if (currentControl == 'Unknown') then
        return false
    end

    return (currentControl ~= currentNation)
end

return lib
