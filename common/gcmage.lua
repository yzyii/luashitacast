-- Modified from https://github.com/GetAwayCoxn/Luashitacast-Profiles

-- Defines Staves to Equip on Precast. Will automatically equip the correct staff for a spell. Will work even if you don't have the staff.
-- Leave as '' if you do not have the staff.
local fire_staff = 'Vulcan\'s Staff'
local earth_staff = 'Terra\'s Staff'
local water_staff = 'Neptune\'s Staff'
local wind_staff = 'Auster\'s Staff'
local ice_staff = 'Aquilo\'s Staff'
local thunder_staff = 'Jupiter\'s Staff'
local light_staff = 'Apollo\'s Staff'
local dark_staff = 'Pluto\'s Staff'

-- Set to true if you have the obi
local karin_obi = false
local dorin_obi = false
local suirin_obi = false
local furin_obi = false
local hyorin_obi = false
local rairin_obi = false
local korin_obi = false
local anrin_obi = false

-- Set to true if you have the item
local diabolos_pole = true
local diabolos_earring = true
local diabolos_ring = true
local uggalepih_pendant = true
local sorcerers_tonban = false
local sorcerers_ring = true
local dream_boots = true
local dream_mittens = true
local wizards_earring = true
local healers_earring = true

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

local gcmage = T{};

function gcmage.DoPrecast(fastCastValue)
    local spell = gData.GetAction();
    local minimumBuffer = 0.25;
    local packetDelay = 0.25;
    local castDelay = ((spell.CastTime * (1 - fastCastValue)) / 1000) - minimumBuffer;
    if (castDelay >= packetDelay) then
        gFunc.SetMidDelay(castDelay);
    end

    gFunc.EquipSet('Precast')
end

function gcmage.EquipStaff()
    local spell = gData.GetAction();
    local weather = gData.GetEnvironment();

    if (spell.Skill == 'Healing Magic') then
        if light_staff ~= '' then gFunc.Equip('Main', light_staff); end
    elseif (spell.Skill == 'Elemental Magic') then
        if (spell.Element == 'Fire') then
            gcmage.EquipStaffNuke(fire_staff);
        elseif (spell.Element == 'Earth') then
            gcmage.EquipStaffNuke(earth_staff);
        elseif (spell.Element == 'Water') then
            gcmage.EquipStaffNuke(water_staff);
        elseif (spell.Element == 'Wind') then
            gcmage.EquipStaffNuke(wind_staff);
        elseif (spell.Element == 'Ice') then
            gcmage.EquipStaffNuke(ice_staff);
        elseif (spell.Element == 'Thunder') then
            gcmage.EquipStaffNuke(thunder_staff);
        end
    elseif (spell.Skill == 'Enfeebling Magic') then
        if string.contains(spell.Name, 'Sleep') or string.contains(spell.Name, 'Blind') then
            gcmage.EquipStaffEnfeebling(dark_staff);
        elseif string.contains(spell.Name, 'Bind') or string.contains(spell.Name, 'Paralyze') then
            gcmage.EquipStaffEnfeebling(ice_staff);
        elseif string.contains(spell.Name, 'Slow') then
            gcmage.EquipStaffEnfeebling(earth_staff);
        elseif string.contains(spell.Name, 'Silence') or string.contains(spell.Name, 'Gravity') then
            gcmage.EquipStaffEnfeebling(wind_staff);
        elseif string.contains(spell.Name, 'Poison') then
            gcmage.EquipStaffEnfeebling(water_staff);
        elseif string.contains(spell.Name, 'Dia') then
            gcmage.EquipStaffEnfeebling(light_staff);
        end
    elseif (spell.Skill == 'Dark Magic') then
        if string.contains(spell.Name, 'Stun') then
            if thunder_staff ~= '' then gFunc.Equip('Main', thunder_staff); end
        elseif string.contains(spell.Name, 'Drain') or string.contains(spell.Name, 'Aspir') then
            if (weather.WeatherElement == 'Dark' and diabolos_pole) then gFunc.Equip('Main', 'Diabolos\'s Pole'); end
        else
            if dark_staff ~= '' then gFunc.Equip('Main', dark_staff); end
        end
    elseif (spell.Skill == 'Divine Magic') then
        if light_staff ~= '' then gFunc.Equip('Main', light_staff); end
    end
end

function gcmage.EquipStaffEnfeebling(staff)
    if staff ~= '' then
        gFunc.Equip('Main', staff);
    else
        gFunc.EquipSet('FallbackEnfeeblingSub');
    end
end

function gcmage.EquipStaffNuke(staff)
    if staff ~= '' then
        gFunc.Equip('Main', staff);
    else
        gFunc.EquipSet('FallbackNukeSub');
    end
end

function gcmage.DoMidcast()
    gFunc.InterimEquipSet('Idle');
    if (gcdisplay.GetToggle('DT') == true) then gFunc.InterimEquipSet('DT') end;
    if (gcdisplay.GetToggle('MDT') == true) then gFunc.InterimEquipSet('MDT') end;
    if (gcdisplay.GetToggle('FireRes') == true) then gFunc.InterimEquipSet('FireRes') end;
    if (gcdisplay.GetToggle('IceRes') == true) then gFunc.InterimEquipSet('IceRes') end;
    if (gcdisplay.GetToggle('LightningRes') == true) then gFunc.InterimEquipSet('LightningRes') end;
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.InterimEquipSet('Movement') end;

    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local player = gData.GetPlayer();
    local target = gData.GetActionTarget();
	local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

    if (spell.Skill == 'Ninjutsu') then
        if string.contains(spell.Name, 'Utsusemi') then
            gFunc.InterimEquipSet('SIRD');
            gFunc.EquipSet('Haste');
        end
    elseif (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet('Enhancing');
        if string.match(spell.Name, 'Stoneskin') then
            gFunc.EquipSet('Stoneskin');
        end
        if (string.match(spell.Name, 'Haste') or string.match(spell.Name, 'Refresh') or string.match(spell.Name, 'Blink')) then
            gFunc.EquipSet('Haste');
        end
        if string.match(spell.Name, 'Aquaveil') then
            gFunc.InterimEquipSet('SIRD');
            gFunc.EquipSet('SIRD');
        end
        if (string.match(spell.Name, 'Sneak') and target.Name == me and dream_boots) then
            gFunc.Equip('Feet', 'Dream Boots +1');
        end
        if (string.match(spell.Name, 'Invisible') and target.Name == me and dream_mittens) then
            gFunc.Equip('Hands', 'Dream Mittens +1');
        end
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet('Cure');
        if (gcdisplay.GetToggle('Hate') == true) then
            gFunc.EquipSet('Hate');
        elseif (player.SubJob == "WHM" and healers_earring) then
            gFunc.Equip('Ear2', 'Healer\'s Earring');
        end
        if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
            if (spell.Element == 'Light') and korin_obi then
                gFunc.Equip('Waist', 'Korin Obi');
            end
        end
        if string.match(spell.Name, 'Cursna') then
            gFunc.EquipSet('Cursna');
        end
    elseif (spell.Skill == 'Elemental Magic') then
        local ElementalDebuffs = T{ 'Burn', 'Rasp', 'Drown', 'Choke', 'Frost', 'Shock' };
        gFunc.EquipSet('Nuke');
        if (gcdisplay.GetToggle('Nuke') == 'ACC') then
            gFunc.EquipSet('NukeACC');
            if (weather.WeatherElement == 'Dark') and diabolos_earring then
                gFunc.Equip('Ear2', 'Diabolos\'s Earring');
            end
            if (player.SubJob == "BLM" and wizards_earring) then
                gFunc.Equip('Ear2', 'Wizard\'s Earring');
            end
        elseif (ElementalDebuffs:contains(spell.Name)) then
            gFunc.EquipSet('NukeDOT');
            if (player.SubJob == "BLM" and wizards_earring) then
                gFunc.Equip('Ear2', 'Wizard\'s Earring');
            end
        else
            if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
                if (spell.Element == 'Fire') and karin_obi then
                    gFunc.Equip('Waist', 'Karin Obi');
                elseif (spell.Element == 'Earth') and dorin_obi then
                    gFunc.Equip('Waist', 'Dorin Obi');
                elseif (spell.Element == 'Water') and suirin_obi then
                    gFunc.Equip('Waist', 'Suirin Obi');
                elseif (spell.Element == 'Wind') and furin_obi then
                    gFunc.Equip('Waist', 'Furin Obi');
                elseif (spell.Element == 'Ice') and hyorin_obi then
                    gFunc.Equip('Waist', 'Hyorin Obi');
                elseif (spell.Element == 'Thunder') and rairin_obi then
                    gFunc.Equip('Waist', 'Rairin Obi');
                end
            end
            if (spell.Element == weather.DayElement) and sorcerers_tonban then
                gFunc.Equip('Legs', 'Sorcerer\'s Tonban');
            end
            if (player.HPP < 76 and player.TP < 1000) and sorcerers_ring then
                gFunc.Equip('Ring2', 'Sorcerer\'s Ring');
            end
            if (spell.MppAftercast < 51) and uggalepih_pendant then
                gFunc.Equip('Neck', 'Uggalepih Pendant');
            end
        end
    elseif (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet('Enfeebling');
        if (weather.WeatherElement == 'Dark') and diabolos_earring then
            gFunc.Equip('Ear2', 'Diabolos\'s Earring');
        end
        if (string.contains(spell.Name, 'Paralyze') or string.contains(spell.Name, 'Slow')) then
            gFunc.EquipSet('EnfeeblingMND');
        elseif (string.contains(spell.Name, 'Gravity') or string.contains(spell.Name, 'Blind')) then
            gFunc.EquipSet('EnfeeblingINT');
        end
        if (gcdisplay.GetToggle('Hate') == true) then
            if (string.contains(spell.Name, 'Sleep') or string.contains(spell.Name, 'Blind') or string.contains(spell.Name, 'Dispel')) then
                gFunc.EquipSet('Hate');
            end
        end
    elseif (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet('Dark');
        if (weather.DayElement == 'Dark') and diabolos_ring and player.MPP < 86 then
            gFunc.Equip('Ring2', 'Diabolos\'s Ring');
        end
        -- Remove the Following if you have Dark Earring / Abyssal Earring
        if (weather.WeatherElement == 'Dark') and diabolos_earring then
            gFunc.Equip('Ear2', 'Diabolos\'s Earring');
        end
        if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
            if (spell.Element == 'Dark') and anrin_obi then
                gFunc.Equip('Waist', 'Anrin Obi');
            end
        end
    elseif (spell.Skill == 'Divine Magic') then
        gFunc.EquipSet('Enfeebling');
    end

    gcmage.EquipStaff();
end

return gcmage;