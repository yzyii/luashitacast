--[[
Copyright (c) 2024 Thorny

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
--]]

local dataTracker;
local enhancingDuration = {
    [22055] = 0.10, --Oranyan
    [22097] = 0.10, --Argute Staff
    [22098] = 0.15, --Pedagogy Staff
    [22099] = 0.20, --Musa
    [23134] = 0.10, --Viti. Tabard +2
    [23469] = 0.15, --Viti. Tabard +3
    [23149] = 0.08, --Peda. Gown +2
    [23484] = 0.12, --Peda. Gown +3
    [27947] = 0.15, --Atrophy Gloves
    [27968] = 0.16, --Atrophy Gloves +1
    [23178] = 0.18, --Atrophy Gloves +2
    [23513] = 0.20, --Atrophy Gloves +3
    [27194] = 0.10, --Futhark Trousers
    [27195] = 0.20, --Futhark Trousers +1
    [23285] = 0.25, --Futhark Trousers +2
    [23620] = 0.30, --Futhark Trousers +3
    [23310] = 0.05, --Theo. Duckbills +2
    [23645] = 0.10, --Theo. Duckbills +3
    [11248] = 0.10, --Estq. Houseaux +1
    [11148] = 0.20, --Estq. Houseaux +2
    [27419] = 0.25, --Leth. Houseaux
    [27420] = 0.30, --Leth. Houseaux +1
    [23357] = 0.35, --Leth. Houseaux +2
    [23692] = 0.40, --Leth. Houseaux +3
    [25824] = 0.20, --Regal Gauntlets
    [26250] = 0.20, --Sucellos's Cape
    [26354] = 0.10, --Embla Sash
    [26419] = 0.10, --Ammurapi Shield
    [26782] = 0.10, --Erilaz Galea
    [26783] = 0.15, --Erilaz Galea +1
    [23106] = 0.20, --Erilaz Galea +2
    [23441] = 0.25, --Erilaz Galea +3
    [27891] = 0.09, --Shabti Cuirass
    [27892] = 0.10, --Shab. Cuirass +1
    [28034] = 0.05, --Dynasty Mitts
    [16204] = 0.10, --Estoqueur's Cape
};

local perpetuanceDuration = {
    [11223] = 0.25,     --Svnt. Bracers +1
    [11123] = 0.50,     --Svnt. Bracers +2
    [27090] = 0.50,     --Arbatel Bracers
    [27091] = 0.55,     --Arbatel Bracers +1
    [23238] = 0.60,     --Arbatel Bracers +2
    [23573] = 0.65,     --Arbatel Bracers +3
};

local regenDuration = {
    [28092] = 18, --Theo. Pantaloons
    [28113] = 18, --Theo. Pant. +1
    [23243] = 21, --Th. Pantaloons +2
    [23578] = 24, --Th. Pant. +3
    [11206] = 10, --Orison Mitts +1
    [11106] = 18, --Orison Mitts +2
    [27056] = 20, --Ebers Mitts
    [27057] = 22, --Ebers Mitts +1
    [23221] = 24, --Ebers Mitts +2
    [23556] = 26, --Ebers Mitts +3
    [27787] = 20, --Runeist Bandeau
    [27706] = 21, --Rune. Bandeau +1
    [23062] = 24, --Rune. Bandeau +2
    [23397] = 27, --Rune. Bandeau +3
    [26894] = 12, --Telchine Chas.
    [26265] = 15, --Lugh's Cape
    [21175] = 12 --Coeus
};

local refreshReceived = {
    [26323] = 20, --Gishdubar Sash
    [27464] = 15, --Inspirited Boots
    [28316] = 15, --Shabti Sabatons
    [28317] = 21, --Shab. Sabatons +1
    [11575] = 30 --Grapevine Cape
};

local dilationRing = {
    [27009] = 30, --HorizonXI Custom Item
};

local function ApplyEnhancingAdditions(duration, augments)
    local job = dataTracker:GetJobData();
    if job.Main ~= 5 then
        return duration;
    end

    local mainJobLevel = job.MainLevel;
    if mainJobLevel >= 75 then
        local merits = dataTracker:GetMeritCount(0x910);
        if merits > 0 then
            local multiplier = 6;
            if (augments.Generic[0x54A]) then -- Dls. Gloves variants
                multiplier = 9;
            end
            duration = duration + (merits * multiplier);
        end
    end

    if mainJobLevel == 99 then
        local jobPoints = dataTracker:GetJobPointCount(5, 9);
        duration = duration + jobPoints;
    end

    return duration;
end

local function ApplyEnhancingMultipliers(duration, augments)
    local enhancingGear = 1.0 + dataTracker:EquipSum(enhancingDuration);
    local enhancingAugments = 1.0 + (augments.EnhancingDuration or 0);
    return duration * enhancingGear * enhancingAugments;
end

local function ApplyComposureModifiers(duration, targetId)
    if not dataTracker:GetBuffActive(419) or (duration >= 1800) then
        return duration;
    end

    if (targetId == dataTracker:GetPlayerId()) then
        return duration * 3;
    else
        --return duration * GetComposureMod();
        return duration;
    end
end

local function ApplyPerpetuanceModifiers(duration)
    if not dataTracker:GetBuffActive(469) then
        return duration;
    end

    local modifier = 2.0 + dataTracker:EquipSum(perpetuanceDuration);
    return duration * modifier;
end

local function ApplyReceivedModifiers(duration, augments)
    local job = dataTracker:GetJobData();
    local enhancingReceived = 1.0;

    if dataTracker:GetBuffActive(534) then
        enhancingReceived = 0.5;
        local embolden = augments.Generic[0x174];
        if embolden then
            for _,v in pairs(embolden) do
                enhancingReceived = enhancingReceived + (0.01 * (v + 1));
            end
        end
    end

    enhancingReceived = enhancingReceived + (augments.EnhancingReceived or 0);

    if (job.Main == 22) and (job.MainLevel == 99) then
        local jobPoints = dataTracker:GetJobPointTotal(22);
        if (jobPoints >= 100) then
            enhancingReceived = enhancingReceived + 0.10;
        end
        if (jobPoints >= 1200) then
            enhancingReceived = enhancingReceived + 0.10;
        end
    end

    return duration * enhancingReceived;
end

local function CalculateEnhancingDuration(baseDuration, targetId)
    local duration = baseDuration;
    local augments = dataTracker:ParseAugments();
    if (targetId == dataTracker:GetPlayerId()) then
        duration = ApplyReceivedModifiers(duration, augments);
    end
    duration = ApplyEnhancingAdditions(duration, augments);
    duration = ApplyEnhancingMultipliers(duration, augments);
    duration = ApplyComposureModifiers(duration, targetId);
    duration = ApplyPerpetuanceModifiers(duration);
    return duration;
end

local function CalculateBarelementDuration(targetId)
    local duration = 480;
    local enhancingSkill = AshitaCore:GetMemoryManager():GetPlayer():GetCombatSkill(34):GetSkill();
    if (enhancingSkill < 240) then
        duration = enhancingSkill * 2;
    end
    return CalculateEnhancingDuration(duration, targetId);
end

local function CalculateBarstatusDuration(targetId)
    local duration = 480;
    local enhancingSkill = AshitaCore:GetMemoryManager():GetPlayer():GetCombatSkill(34):GetSkill();
    if (enhancingSkill < 240) then
        duration = enhancingSkill * 2;
    end
    return CalculateEnhancingDuration(duration, targetId);
end

local function CalculateEnspellDuration(targetId)
    return CalculateEnhancingDuration(180, targetId);
end

--Includes boost spells.
local function CalculateGainDuration(targetId)
    return CalculateEnhancingDuration(300, targetId);
end

--Includes all protect(ra) and shell(ra) tiers
local function CalculateProtectDuration(targetId)
    local duration = 1800;
    local augments = dataTracker:ParseAugments();
    if (targetId == dataTracker:GetPlayerId()) then
        duration = ApplyReceivedModifiers(duration, augments);
    end
    duration = ApplyEnhancingAdditions(duration, augments);
    duration = ApplyEnhancingMultipliers(duration, augments);
    duration = ApplyPerpetuanceModifiers(duration);
    return duration;
end

local function CalculateRegenDuration(baseDuration, targetId)
    local job = dataTracker:GetJobData();
    local duration = baseDuration;
    local augments = dataTracker:ParseAugments();
    if (targetId == dataTracker:GetPlayerId()) then
        duration = ApplyReceivedModifiers(duration, augments);
    end
    duration = ApplyEnhancingAdditions(duration, augments);
    duration = duration + dataTracker:EquipSum(regenDuration);
    if job.Main == 3 and job.MainLevel == 99 then
        duration = duration + (3 * dataTracker:GetJobPointCount(3, 8));
    end

    --Light Arts
    if dataTracker:GetBuffActive(358) or dataTracker:GetBuffActive(401) then
        local schLevel = 0;
        if job.Main == 20 then
            schLevel = job.MainLevel;
            if schLevel == 99 then
                duration = duration + (3 * dataTracker:GetJobPointCount(20, 2));
            end
        else
            schLevel = job.SubLevel;
        end

        --Stepwise 25,28,31,34,37,40 = 3,6,9,12,15,18... untested, absolute guesswork
        --https://www.bluegartr.com/threads/109412-Regen-Spells-amp-Light-Arts?p=5067176&viewfull=1#post5067176
        --Not verified for every single level.
        if schLevel > 25 then
            local seconds = math.floor(((schLevel - 22) / 3) * 3);
            if schLevel > 40 then
                seconds = math.floor((schLevel - 1) / 4) * 2;
            end
            if dataTracker:GetBuffActive(377) then
                seconds = seconds * 2;
            end
            duration = duration + seconds;
        end
    end

    duration = ApplyEnhancingMultipliers(duration, augments);
    duration = ApplyComposureModifiers(duration, targetId);
    duration = ApplyPerpetuanceModifiers(duration);
    return duration;
end

local function CalculateRefreshDuration(targetId)
    local duration = 150;
    local augments = dataTracker:ParseAugments();
    if (targetId == dataTracker:GetPlayerId()) then
        duration = ApplyReceivedModifiers(duration, augments);
    end
    duration = ApplyEnhancingAdditions(duration, augments);
    if (targetId == dataTracker:GetPlayerId()) then
        duration = duration + dataTracker:EquipSum(refreshReceived);
    end
    duration = duration + dataTracker:EquipSum(dilationRing);
    duration = ApplyEnhancingMultipliers(duration, augments);
    duration = ApplyComposureModifiers(duration, targetId);
    duration = ApplyPerpetuanceModifiers(duration);
    return duration;
end

--No perpetuance for spikes because they're dark magic.
local function CalculateSpikesDuration(targetId)
    local duration = 180;
    local augments = dataTracker:ParseAugments();
    if (targetId == dataTracker:GetPlayerId()) then
        duration = ApplyReceivedModifiers(duration, augments);
    end
    duration = ApplyEnhancingAdditions(duration, augments);
    duration = ApplyEnhancingMultipliers(duration, augments);
    duration = ApplyComposureModifiers(duration, targetId);
    return duration;
end

local function CalculateStormDuration(targetId)
    return CalculateEnhancingDuration(180, targetId);
end

local function Initialize(tracker, buffer)
    dataTracker = tracker;

    --Protect
    buffer[43] = function(targetId)
        return CalculateProtectDuration(targetId), 40;
    end

    --Protect II
    buffer[44] = function(targetId)
        return CalculateProtectDuration(targetId), 40;
    end

    --Protect III
    buffer[45] = function(targetId)
        return CalculateProtectDuration(targetId), 40;
    end

    --Protect IV
    buffer[46] = function(targetId)
        return CalculateProtectDuration(targetId), 40;
    end

    --Protect V
    buffer[47] = function(targetId)
        return CalculateProtectDuration(targetId), 40;
    end

    --Shell
    buffer[48] = function(targetId)
        return CalculateProtectDuration(targetId), 41;
    end

    --Shell II
    buffer[49] = function(targetId)
        return CalculateProtectDuration(targetId), 41;
    end

    --Shell III
    buffer[50] = function(targetId)
        return CalculateProtectDuration(targetId), 41;
    end

    --Shell IV
    buffer[51] = function(targetId)
        return CalculateProtectDuration(targetId), 41;
    end

    --Shell V
    buffer[52] = function(targetId)
        return CalculateProtectDuration(targetId), 41;
    end

    --Blink
    buffer[53] = function(targetId)
        return CalculateEnhancingDuration(300, targetId), 36;
    end

    --Stoneskin
    buffer[54] = function(targetId)
        return CalculateEnhancingDuration(300, targetId), 37;
    end

    --Aquaveil
    buffer[55] = function(targetId)
        return CalculateEnhancingDuration(600, targetId), 39;
    end

    --Haste
    buffer[57] = function(targetId)
        local duration = 180;
        duration = duration + dataTracker:EquipSum(dilationRing);
        return CalculateEnhancingDuration(duration, targetId), 33;
    end

    --Barfire
    buffer[60] = function(targetId)
        return CalculateBarelementDuration(targetId), 100;
    end

    --Barblizzard
    buffer[61] = function(targetId)
        return CalculateBarelementDuration(targetId), 101;
    end

    --Baraero
    buffer[62] = function(targetId)
        return CalculateBarelementDuration(targetId), 102;
    end

    --Barstone
    buffer[63] = function(targetId)
        return CalculateBarelementDuration(targetId), 103;
    end

    --Barthunder
    buffer[64] = function(targetId)
        return CalculateBarelementDuration(targetId), 104;
    end

    --Barwater
    buffer[65] = function(targetId)
        return CalculateBarelementDuration(targetId), 105;
    end

    --Barfira
    buffer[66] = function(targetId)
        return CalculateBarelementDuration(targetId), 100;
    end

    --Barblizzara
    buffer[67] = function(targetId)
        return CalculateBarelementDuration(targetId), 101;
    end

    --Baraera
    buffer[68] = function(targetId)
        return CalculateBarelementDuration(targetId), 102;
    end

    --Barstonra
    buffer[69] = function(targetId)
        return CalculateBarelementDuration(targetId), 103;
    end

    --Barthundra
    buffer[70] = function(targetId)
        return CalculateBarelementDuration(targetId), 104;
    end

    --Barwatera
    buffer[71] = function(targetId)
        return CalculateBarelementDuration(targetId), 105;
    end

    --Barsleep
    buffer[72] = function(targetId)
        return CalculateBarstatusDuration(targetId), 106;
    end

    --Barpoison
    buffer[73] = function(targetId)
        return CalculateBarstatusDuration(targetId), 107;
    end

    --Barparalyze
    buffer[74] = function(targetId)
        return CalculateBarstatusDuration(targetId), 108;
    end

    --Barblind
    buffer[75] = function(targetId)
        return CalculateBarstatusDuration(targetId), 109;
    end

    --Barsilence
    buffer[76] = function(targetId)
        return CalculateBarstatusDuration(targetId), 110;
    end

    --Barpetrify
    buffer[77] = function(targetId)
        return CalculateBarstatusDuration(targetId), 111;
    end

    --Barvirus
    buffer[78] = function(targetId)
        return CalculateBarstatusDuration(targetId), 112;
    end

    --Baramnesia
    buffer[84] = function(targetId)
        return CalculateBarstatusDuration(targetId), 286;
    end

    --Baramnesra
    buffer[85] = function(targetId)
        return CalculateBarstatusDuration(targetId), 286;
    end

    --Barsleepra
    buffer[86] = function(targetId)
        return CalculateBarstatusDuration(targetId), 106;
    end

    --Barpoisonra
    buffer[87] = function(targetId)
        return CalculateBarstatusDuration(targetId), 107;
    end

    --Barparalyzra
    buffer[88] = function(targetId)
        return CalculateBarstatusDuration(targetId), 108;
    end

    --Barblindra
    buffer[89] = function(targetId)
        return CalculateBarstatusDuration(targetId), 109;
    end

    --Barsilencera
    buffer[90] = function(targetId)
        return CalculateBarstatusDuration(targetId), 110;
    end

    --Barpetra
    buffer[91] = function(targetId)
        return CalculateBarstatusDuration(targetId), 111;
    end

    --Barvira
    buffer[92] = function(targetId)
        return CalculateBarstatusDuration(targetId), 112;
    end

    --Auspice
    buffer[96] = function(targetId)
        return CalculateEnhancingDuration(180, targetId), 275;
    end

    --Reprisal
    buffer[97] = function(targetId)
        return CalculateEnhancingDuration(60, targetId), 403;
    end

    --Sandstorm
    buffer[99] = function(targetId)
        return CalculateStormDuration(targetId), 592;
    end

    --Enfire
    buffer[100] = function(targetId)
        return CalculateEnspellDuration(targetId), 94;
    end

    --Enblizzard
    buffer[101] = function(targetId)
        return CalculateEnspellDuration(targetId), 95;
    end

    --Enaero
    buffer[102] = function(targetId)
        return CalculateEnspellDuration(targetId), 96;
    end

    --Enstone
    buffer[103] = function(targetId)
        return CalculateEnspellDuration(targetId), 97;
    end

    --Enthunder
    buffer[104] = function(targetId)
        return CalculateEnspellDuration(targetId), 98;
    end

    --Enwater
    buffer[105] = function(targetId)
        return CalculateEnspellDuration(targetId), 99;
    end

    --Phalanx
    buffer[106] = function(targetId)
        return CalculateEnhancingDuration(180, targetId), 116;
    end

    --Phalanx II
    buffer[107] = function(targetId)
        return CalculateEnhancingDuration(240, targetId), 116;
    end

    --Regen
    buffer[108] = function(targetId)
        return CalculateRegenDuration(75, targetId), 42;
    end

    --Refresh
    buffer[109] = function(targetId)
        return CalculateRefreshDuration(targetId), 43;
    end

    --Regen II
    buffer[110] = function(targetId)
        return CalculateRegenDuration(60, targetId), 42;
    end

    --Regen III
    buffer[111] = function(targetId)
        return CalculateRegenDuration(60, targetId), 42;
    end

    --Rainstorm
    buffer[113] = function(targetId)
        return CalculateStormDuration(targetId), 183;
    end

    --Windstorm
    buffer[114] = function(targetId)
        return CalculateStormDuration(targetId), 180;
    end

    --Firestorm
    buffer[115] = function(targetId)
        return CalculateStormDuration(targetId), 178;
    end

    --Hailstorm
    buffer[116] = function(targetId)
        return CalculateStormDuration(targetId), 179;
    end

    --Thunderstorm
    buffer[117] = function(targetId)
        return CalculateStormDuration(targetId), 182;
    end

    --Voidstorm
    buffer[118] = function(targetId)
        return CalculateStormDuration(targetId), 185;
    end

    --Aurorastorm
    buffer[119] = function(targetId)
        return CalculateStormDuration(targetId), 184;
    end

    --Protectra
    buffer[125] = function(targetId)
        return CalculateProtectDuration(targetId), 40;
    end

    --Protectra II
    buffer[126] = function(targetId)
        return CalculateProtectDuration(targetId), 40;
    end

    --Protectra III
    buffer[127] = function(targetId)
        return CalculateProtectDuration(targetId), 40;
    end

    --Protectra IV
    buffer[128] = function(targetId)
        return CalculateProtectDuration(targetId), 40;
    end

    --Protectra V
    buffer[129] = function(targetId)
        return CalculateProtectDuration(targetId), 40;
    end

    --Shellra
    buffer[130] = function(targetId)
        return CalculateProtectDuration(targetId), 41;
    end

    --Shellra II
    buffer[131] = function(targetId)
        return CalculateProtectDuration(targetId), 41;
    end

    --Shellra III
    buffer[132] = function(targetId)
        return CalculateProtectDuration(targetId), 41;
    end

    --Shellra IV
    buffer[133] = function(targetId)
        return CalculateProtectDuration(targetId), 41;
    end

    --Shellra V
    buffer[134] = function(targetId)
        return CalculateProtectDuration(targetId), 41;
    end

     --Invisible
     buffer[136] = function(targetId)
        return CalculateEnhancingDuration(300, targetId), 69; --Random variation with guarantee of at least 5 minutes..
     end

      --Sneak
     buffer[137] = function(targetId)
        return CalculateEnhancingDuration(300, targetId), 71; --Random variation with guarantee of at least 5 minutes..
     end

      --Deodorize
     buffer[138] = function(targetId)
        return CalculateEnhancingDuration(300, targetId), 70; --Random variation with guarantee of at least 5 minutes..
     end

    --Blaze Spikes
    buffer[249] = function(targetId)
        return CalculateSpikesDuration(targetId), 34;
    end

    --Ice Spikes
    buffer[250] = function(targetId)
        return CalculateSpikesDuration(targetId), 35;
    end

    --Shock Spikes
    buffer[251] = function(targetId)
        return CalculateSpikesDuration(targetId), 38;
    end

    --Animus Augeo
    buffer[308] = function(targetId)
        return CalculateEnhancingDuration(180, targetId), 289;
    end

    --Animus Minuo
    buffer[309] = function(targetId)
        return CalculateEnhancingDuration(180, targetId), 291;
    end

    --Enfire II
    buffer[312] = function(targetId)
        return CalculateEnspellDuration(targetId), 277;
    end

    --Enblizzard II
    buffer[313] = function(targetId)
        return CalculateEnspellDuration(targetId), 278;
    end

    --Enaero II
    buffer[314] = function(targetId)
        return CalculateEnspellDuration(targetId), 279;
    end

    --Enstone II
    buffer[315] = function(targetId)
        return CalculateEnspellDuration(targetId), 280;
    end

    --Enthunder II
    buffer[316] = function(targetId)
        return CalculateEnspellDuration(targetId), 281;
    end

    --Enwater II
    buffer[317] = function(targetId)
        return CalculateEnspellDuration(targetId), 282;
    end

    --Refresh II
    buffer[473] = function(targetId)
        return CalculateRefreshDuration(targetId), 43;
    end

    --Crusade
    buffer[476] = function(targetId)
        return CalculateEnhancingDuration(300, targetId), 289;
    end

    --Regen IV
    buffer[477] = function(targetId)
        return CalculateRegenDuration(60, targetId), 42;
    end

    --Embrava
    buffer[478] = function(targetId)
        return CalculateEnhancingDuration(90, targetId), 228;
    end

    --Boost-STR
    buffer[479] = function(targetId)
        return CalculateGainDuration(targetId), 119;
    end

    --Boost-DEX
    buffer[480] = function(targetId)
        return CalculateGainDuration(targetId), 120;
    end

    --Boost-VIT
    buffer[481] = function(targetId)
        return CalculateGainDuration(targetId), 121;
    end

    --Boost-AGI
    buffer[482] = function(targetId)
        return CalculateGainDuration(targetId), 122;
    end

    --Boost-INT
    buffer[483] = function(targetId)
        return CalculateGainDuration(targetId), 123;
    end

    --Boost-MND
    buffer[484] = function(targetId)
        return CalculateGainDuration(targetId), 124;
    end

    --Boost-CHR
    buffer[485] = function(targetId)
        return CalculateGainDuration(targetId), 125;
    end

    --Gain-STR
    buffer[486] = function(targetId)
        return CalculateGainDuration(targetId), 119;
    end

    --Gain-DEX
    buffer[487] = function(targetId)
        return CalculateGainDuration(targetId), 120;
    end

    --Gain-VIT
    buffer[488] = function(targetId)
        return CalculateGainDuration(targetId), 121;
    end

    --Gain-AGI
    buffer[489] = function(targetId)
        return CalculateGainDuration(targetId), 122;
    end

    --Gain-INT
    buffer[490] = function(targetId)
        return CalculateGainDuration(targetId), 123;
    end

    --Gain-MND
    buffer[491] = function(targetId)
        return CalculateGainDuration(targetId), 124;
    end

    --Gain-CHR
    buffer[492] = function(targetId)
        return CalculateGainDuration(targetId), 125;
    end

    --Temper
    buffer[493] = function(targetId)
        return CalculateEnhancingDuration(180, targetId), 432;
    end

    --Adloquium
    buffer[495] = function(targetId)
        return CalculateEnhancingDuration(180, targetId), 170;
    end

    --Regen V
    buffer[504] = function(targetId)
        return CalculateRegenDuration(60, targetId), 42;
    end

    --Haste II
    buffer[511] = function(targetId)
        return CalculateEnhancingDuration(180, targetId), 33;
    end

    --Foil
    buffer[840] = function(targetId)
        return CalculateEnhancingDuration(30, targetId), 568;
    end

    --Flurry
    buffer[845] = function(targetId)
        return CalculateEnhancingDuration(180, targetId), 265;
    end

    --Flurry II
    buffer[846] = function(targetId)
        return CalculateEnhancingDuration(180, targetId), 265;
    end

    --Sandstorm II
    buffer[857] = function(targetId)
        return CalculateStormDuration(targetId), 592;
    end

    --Rainstorm II
    buffer[858] = function(targetId)
        return CalculateStormDuration(targetId), 594;
    end

    --Windstorm II
    buffer[859] = function(targetId)
        return CalculateStormDuration(targetId), 591;
    end

    --Firestorm II
    buffer[860] = function(targetId)
        return CalculateStormDuration(targetId), 589;
    end

    --Hailstorm II
    buffer[861] = function(targetId)
        return CalculateStormDuration(targetId), 590;
    end

    --Thunderstorm II
    buffer[862] = function(targetId)
        return CalculateStormDuration(targetId), 593;
    end

    --Voidstorm II
    buffer[863] = function(targetId)
        return CalculateStormDuration(targetId), 596;
    end

    --Aurorastorm II
    buffer[864] = function(targetId)
        return CalculateStormDuration(targetId), 595;
    end

    --Refresh III
    buffer[894] = function(targetId)
        return CalculateRefreshDuration(targetId), 43;
    end

    --Temper II
    buffer[895] = function(targetId)
        return CalculateEnhancingDuration(180, targetId), 432;
    end
end

return Initialize;
