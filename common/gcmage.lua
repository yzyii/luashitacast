-- Modified from https://github.com/GetAwayCoxn/Luashitacast-Profiles

-- Defines Staves to Equip on Precast. Will automatically equip the correct staff for a spell. Will work even if you don't have the staff.
-- Leave as '' if you do not have the staff.
local firestaff = 'Vulcan\'s Staff'
local earthstaff = 'Terra\'s Staff'
local waterstaff = 'Neptune\'s Staff'
local windstaff = 'Auster\'s Staff'
local icestaff = 'Aquilo\'s Staff'
local thunderstaff = 'Jupiter\'s Staff'
local lightstaff = 'Apollo\'s Staff'
local darkstaff = 'Pluto\'s Staff'

-- Set to true if you have the obi
local karinobi = false
local dorinobi = false
local suirinobi = false
local furinobi = false
local hyorinobi = false
local rairinobi = false

-- Set to true if you have the item
local diabolos_earring = true
local diabolos_ring = true
local uggalepih_pendant = true
local sorcerers_tonban = false
local sorcerers_ring = true

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

local gcmage = T{};

function gcmage.DoPrecast()
    gFunc.EquipSet('Precast')
    gcmage.EquipStaff();
end

function gcmage.EquipStaff()
    local spell = gData.GetAction();
	
    if (spell.Skill == 'Healing Magic') then
        if lightstaff ~= '' then gFunc.Equip('Main', lightstaff); end
    elseif (spell.Skill == 'Elemental Magic') then
        if (spell.Element == 'Fire') then
            gcmage.EquipStaffNuke(firestaff);
        elseif (spell.Element == 'Earth') then
		    gcmage.EquipStaffNuke(earthstaff);
        elseif (spell.Element == 'Water') then
		    gcmage.EquipStaffNuke(waterstaff);
        elseif (spell.Element == 'Wind') then
		    gcmage.EquipStaffNuke(windstaff);
        elseif (spell.Element == 'Ice') then
		    gcmage.EquipStaffNuke(icestaff);
        elseif (spell.Element == 'Thunder') then
		    gcmage.EquipStaffNuke(thunderstaff);
        end
    elseif (spell.Skill == 'Enfeebling Magic') then
		if string.contains(spell.Name, 'Sleep') or string.contains(spell.Name, 'Blind') then
		    gcmage.EquipStaffEnfeebling(darkstaff);
		elseif string.contains(spell.Name, 'Bind') or string.contains(spell.Name, 'Paralyze') then
		    gcmage.EquipStaffEnfeebling(icestaff);
		elseif string.contains(spell.Name, 'Slow') then
		    gcmage.EquipStaffEnfeebling(earthstaff);
		elseif string.contains(spell.Name, 'Silence') or string.contains(spell.Name, 'Gravity') then
		    gcmage.EquipStaffEnfeebling(windstaff);
		elseif string.contains(spell.Name, 'Poison') then
		    gcmage.EquipStaffEnfeebling(waterstaff);
		elseif string.contains(spell.Name, 'Dia') then
		    gcmage.EquipStaffEnfeebling(lightstaff);
        end
    elseif (spell.Skill == 'Dark Magic') then
		if string.contains(spell.Name, 'Stun') then
		    if thunderstaff ~= '' then gFunc.Equip('Main', thunderstaff); end
		else
            if darkstaff ~= '' then gFunc.Equip('Main', darkstaff); end
        end
    elseif (spell.Skill == 'Divine Magic') then
        if lightstaff ~= '' then gFunc.Equip('Main', lightstaff); end
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
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local player = gData.GetPlayer();

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet('Enhancing');
        if string.match(spell.Name, 'Stoneskin') then
            gFunc.EquipSet('Stoneskin');
        end
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet('Cure');
        if string.match(spell.Name, 'Cursna') then
            gFunc.EquipSet('Cursna');
        end
        if (player.SubJob == "WHM") then
            gFunc.EquipSet('WHMSJ');
		end
    elseif (spell.Skill == 'Elemental Magic') then
	    local ElementalDebuffs = T{ 'Burn', 'Rasp', 'Drown', 'Choke', 'Frost', 'Shock' };
        gFunc.EquipSet('Nuke');
        if (gcdisplay.GetToggle('Nuke') == 'ACC') or (ElementalDebuffs:contains(spell.Name)) then
            gFunc.EquipSet('NukeACC');
            if (player.SubJob == "BLM") then
                gFunc.EquipSet('BLMSJ');
		    end
			if (weather.WeatherElement == 'Dark') and diabolos_earring then
		        gFunc.Equip('Ear2', 'Diabolos\'s Earring');
		    end
        else
		    if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
                if (spell.Element == 'Fire') and karinobi then
                    gFunc.Equip('Waist', 'Karin Obi');
                elseif (spell.Element == 'Earth') and dorinobi then
                    gFunc.Equip('Waist', 'Dorin Obi');
                elseif (spell.Element == 'Water') and suirinobi then
                    gFunc.Equip('Waist', 'Suirin Obi');
                elseif (spell.Element == 'Wind') and furinobi then
                    gFunc.Equip('Waist', 'Furin Obi');
                elseif (spell.Element == 'Ice') and hyorinobi then
                    gFunc.Equip('Waist', 'Hyorin Obi');
                elseif (spell.Element == 'Thunder') and rairinobi then
                    gFunc.Equip('Waist', 'Rairin Obi');
                end
			end
			if (spell.Element == weather.DayElement) and sorcerers_tonban then
                gFunc.Equip('Legs', 'Sorcerer\'s Tonban');
			end
			if (player.HPP < 76 and player.TP < 1000) and sorcerers_ring then
			    gFunc.Equip('Ring1', 'Sorcerer\'s Ring');
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
    elseif (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet('Dark');
		if (weather.DayElement == 'Dark') and diabolos_ring then
		    gFunc.Equip('Ring1', 'Diabolos\'s Ring');
		end
		if (weather.WeatherElement == 'Dark') and diabolos_earring then
		    gFunc.Equip('Ear2', 'Diabolos\'s Earring');
		end
    elseif (spell.Skill == 'Divine Magic') then
        gFunc.EquipSet('Enfeebling');
    end

    gcmage.EquipStaff();
end

return gcmage;