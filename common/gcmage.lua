-- Defines Staves to equip. Will automatically equip the correct staff for a spell. Will work even if you don't have the staff.
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
local hyorin_obi = true
local rairin_obi = true
local korin_obi = true
local anrin_obi = true

-- Set to true if you have the item, and specify which ring or earring slot it will override
local diabolos_pole = true
local uggalepih_pendant = true
local sorcerers_tonban = true
local dream_boots = true
local dream_mittens = true
local master_casters_bracelets = true

local diabolos_earring = true
local diabolos_earring_slot = 'Ear2'
local wizards_earring = true
local wizards_earring_slot = 'Ear2'
local healers_earring = true
local healers_earring_slot = 'Ear2'

local diabolos_ring = true
local diabolos_ring_slot = 'Ring2'
local sorcerers_ring = true
local sorcerers_ring_slot = 'Ring1' -- This is Ring1 instead of Ring2 to allow Ice Ring override to work
local ice_ring = true
local ice_ring_slot = 'Ring2'
local water_ring = true
local water_ring_slot = 'Ring2'

-- Set to true if you have both Dark Earring and Abyssal earring to turn off Diabolos's Earring override for Dark Magic sets
local dark_and_diabolos_earrings = false

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

local gcmage = T{};

function gcmage.DoPrecast(fastCastValue)
    local spell = gData.GetAction();
    local player = gData.GetPlayer();
    if (player.SubJob == "RDM") then
         fastCastValue = fastCastValue + 0.15 -- Fast Cast Trait
    end
    local minimumBuffer = 0.25; -- Can be lowered to 0.1 if you want
    local packetDelay = 0.25; -- Change this to 0.4 if you do not use PacketFlow
    local castDelay = ((spell.CastTime * (1 - fastCastValue)) / 1000) - minimumBuffer;
    if (castDelay >= packetDelay) then
        gFunc.SetMidDelay(castDelay);
    end

    -- print(chat.header('DEBUG'):append(chat.message('Cast delay is ' .. castDelay)))

    gFunc.EquipSet('Precast')

    if (spell.Skill == 'Elemental Magic' and player.MainJob == 'BLM' and gcdisplay.GetToggle('Yellow') == true) then
        local ElementalDebuffs = T{ 'Burn', 'Rasp', 'Drown', 'Choke', 'Frost', 'Shock' };
        if (not ElementalDebuffs:contains(spell.Name)) then
            local function delayYellow()
                gFunc.ForceEquipSet('Yellow')
            end
            local yellowDelay = math.floor(castDelay - 1)
            if (yellowDelay <= 0) then
                gFunc.EquipSet('Yellow')
            else
                delayYellow:once(yellowDelay);
            end
        end
    end
end

function gcmage.EquipStaff()
    local spell = gData.GetAction();
    local environment = gData.GetEnvironment();

    if (spell.Skill == 'Healing Magic') then
        if light_staff ~= '' then gFunc.Equip('Main', light_staff); end
    elseif (spell.Skill == 'Elemental Magic' or spell.Skill == 'Enfeebling Magic' or spell.Skill == 'Summoning') then
        if (spell.Element == 'Fire') then
            gcmage.EquipStaffWithFallback(fire_staff);
        elseif (spell.Element == 'Earth') then
            gcmage.EquipStaffWithFallback(earth_staff);
        elseif (spell.Element == 'Water') then
            gcmage.EquipStaffWithFallback(water_staff);
        elseif (spell.Element == 'Wind') then
            gcmage.EquipStaffWithFallback(wind_staff);
        elseif (spell.Element == 'Ice') then
            gcmage.EquipStaffWithFallback(ice_staff);
        elseif (spell.Element == 'Thunder') then
            gcmage.EquipStaffWithFallback(thunder_staff);
        elseif (spell.Element == 'Dark') then
            gcmage.EquipStaffWithFallback(dark_staff);
        elseif (spell.Element == 'Light') then
            gcmage.EquipStaffWithFallback(light_staff);
        end
    elseif (spell.Skill == 'Dark Magic') then
        if string.contains(spell.Name, 'Stun') then
            if thunder_staff ~= '' then gFunc.Equip('Main', thunder_staff); end
        elseif string.contains(spell.Name, 'Drain') or string.contains(spell.Name, 'Aspir') then
            if (environment.WeatherElement == 'Dark' and diabolos_pole) then gFunc.Equip('Main', 'Diabolos\'s Pole'); end
        else
            if dark_staff ~= '' then gFunc.Equip('Main', dark_staff); end
        end
    elseif (spell.Skill == 'Divine Magic') then
        if light_staff ~= '' then gFunc.Equip('Main', light_staff); end
    end
end

function gcmage.EquipStaffWithFallback(staff)
    if staff ~= '' then
        gFunc.Equip('Main', staff);
    end
end

function gcmage.DoMidcast(sets)
    local player = gData.GetPlayer();
    local environment = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

    if (player.MainJob == 'BLM') then
        gFunc.InterimEquipSet(sets.SIRD);
    else
        gFunc.InterimEquipSet(sets.Casting);
    end

    if (gcdisplay.IdleSet == 'DT') then
        if (environment.Time >= 6 and environment.Time <= 18) then
            gFunc.InterimEquipSet(sets.DT);
        else
            gFunc.InterimEquipSet(sets.DTNight);
        end
    end
    if (gcdisplay.IdleSet == 'MDT') then gFunc.InterimEquipSet(sets.MDT) end;
    if (gcdisplay.IdleSet == 'FireRes') then gFunc.InterimEquipSet(sets.FireRes) end;
    if (gcdisplay.IdleSet == 'IceRes') then gFunc.InterimEquipSet(sets.IceRes) end;
    if (gcdisplay.IdleSet == 'LightningRes') then gFunc.InterimEquipSet(sets.LightningRes) end;
    if (gcdisplay.IdleSet == 'EarthRes') then gFunc.InterimEquipSet(sets.EarthRes) end;

    if (spell.Skill == 'Ninjutsu') then
        if string.contains(spell.Name, 'Utsusemi') then
            gFunc.InterimEquipSet(sets.SIRD);
            gFunc.EquipSet('Haste');
        end
    elseif (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet('Enhancing');
        if string.match(spell.Name, 'Stoneskin') then
            if (gcdisplay.GetToggle('Hate') == false) then
                gFunc.InterimEquipSet(sets.SIRD);
            end
            gFunc.EquipSet('Stoneskin');
        end
        if string.match(spell.Name, 'Blink') then
            gFunc.InterimEquipSet(sets.SIRD);
        end
        if (string.match(spell.Name, 'Haste') or string.match(spell.Name, 'Refresh') or string.match(spell.Name, 'Blink')) then
            gFunc.EquipSet('Haste');
        end
        if string.match(spell.Name, 'Aquaveil') then
            gFunc.InterimEquipSet(sets.SIRD);
            gFunc.EquipSet(sets.SIRD);
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
            if (string.match(spell.Name, 'Cure IV') and target.Name == me) then
                gFunc.InterimEquipSet(sets.C4HPDown);
                gFunc.EquipSet(sets.HPUp);
            end
            if (string.match(spell.Name, 'Cure III') and target.Name == me) then
                gFunc.InterimEquipSet(sets.C3HPDown);
                gFunc.EquipSet(sets.HPUp);
            end
        elseif (player.SubJob == "WHM" and healers_earring) then
            gFunc.Equip(healers_earring_slot, 'Healer\'s Earring');
        elseif (spell.Element == environment.WeatherElement) or (spell.Element == environment.DayElement) then
            if (spell.Element == 'Light') and korin_obi then
                gFunc.Equip('Waist', 'Korin Obi');
            end
		elseif (environment.DayElement == 'Water') and water_ring and player.MPP <= 85 then
			gFunc.Equip(water_ring_slot, 'Water Ring');
        end
        if string.match(spell.Name, 'Cursna') then
            gFunc.EquipSet('Cursna');
        end
    elseif (spell.Skill == 'Elemental Magic') then
        gFunc.EquipSet('Nuke');

        local ElementalDebuffs = T{ 'Burn', 'Rasp', 'Drown', 'Choke', 'Frost', 'Shock' };
        if (ElementalDebuffs:contains(spell.Name)) then
            gFunc.EquipSet('NukeDOT');
            if (player.SubJob == "BLM" and wizards_earring) then
                gFunc.Equip(wizards_earring_slot, 'Wizard\'s Earring');
            end
        else
            if (gcdisplay.GetCycle('Nuke') == 'ACC') then
                gFunc.EquipSet('NukeACC');
                if (gcdisplay.GetToggle('OOR') == true) and (player.MainJob == 'RDM') and master_casters_bracelets then
                    gFunc.Equip('Hands', 'Mst.Cst. Bracelets');
                end
                if (environment.WeatherElement == 'Dark') and diabolos_earring then
                    gFunc.Equip(diabolos_earring_slot, 'Diabolos\'s Earring');
                end
                if (player.SubJob == "BLM" and wizards_earring) then
                    gFunc.Equip(wizards_earring_slot, 'Wizard\'s Earring');
                end
                if (environment.DayElement == 'Ice') and ice_ring and player.MPP <= 85 then
                    gFunc.Equip(ice_ring_slot, 'Ice Ring');
                end
            end
            if (spell.Element == environment.WeatherElement) or (spell.Element == environment.DayElement) then
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
            if (spell.Element == environment.DayElement) and sorcerers_tonban and (player.MainJob == 'BLM') then
                gFunc.Equip('Legs', 'Sorcerer\'s Tonban');
            end
            if (gcdisplay.GetToggle('Yellow') == true and player.TP < 1000) and sorcerers_ring and (player.MainJob == 'BLM') then
                gFunc.Equip(sorcerers_ring_slot, 'Sorcerer\'s Ring');
            end
            if (spell.MppAftercast < 51) and uggalepih_pendant then
                gFunc.Equip('Neck', 'Uggalepih Pendant');
            end
            if (gcdisplay.GetToggle('MB') == true) then
                gFunc.EquipSet('MB')
            end
        end
    elseif (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet('Enfeebling');
        if (gcdisplay.GetToggle('OOR') == true) and master_casters_bracelets then
            gFunc.Equip('Hands', 'Mst.Cst. Bracelets');
        end
        if (environment.WeatherElement == 'Dark') and diabolos_earring then
            gFunc.Equip(diabolos_earring_slot, 'Diabolos\'s Earring');
        end
        if (string.contains(spell.Name, 'Paralyze') or string.contains(spell.Name, 'Slow')) then
            gFunc.EquipSet('EnfeeblingMND');
        elseif (string.contains(spell.Name, 'Gravity') or string.contains(spell.Name, 'Blind') or string.contains(spell.Name, 'Bind') or string.contains(spell.Name, 'Dispel') or string.contains(spell.Name, 'Poison') or string.contains(spell.Name, 'Sleep')) then
            gFunc.EquipSet('EnfeeblingINT');
        end
        if (gcdisplay.GetToggle('Hate') == true) then
            if (string.contains(spell.Name, 'Sleep') or string.contains(spell.Name, 'Blind') or string.contains(spell.Name, 'Dispel') or string.contains(spell.Name, 'Bind')) then
                gFunc.EquipSet('Hate');
            end
        end
    elseif (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet('Dark');
        if (environment.DayElement == 'Dark') and diabolos_ring and player.MPP <= 85 then
            gFunc.Equip(diabolos_ring_slot, 'Diabolos\'s Ring');
        end
        if (environment.WeatherElement == 'Dark') and diabolos_earring and (not dark_and_diabolos_earrings) then
            gFunc.Equip(diabolos_earring_slot, 'Diabolos\'s Earring');
        end
        if (spell.Element == environment.WeatherElement) or (spell.Element == environment.DayElement) then
            if (spell.Element == 'Dark') and anrin_obi then
                gFunc.Equip('Waist', 'Anrin Obi');
            end
        end
    elseif (spell.Skill == 'Divine Magic') then
        gFunc.EquipSet('Enfeebling');
        gFunc.EquipSet('EnfeeblingMND');
    end

    gcmage.EquipStaff();
end

return gcmage;
