-- Author      : Manuel
-- Create Date : 3/31/2011 1:50:02 PM
local verderbnis="Interface\\Icons\\Spell_Shadow_AbominationExplosion";
local pein="Interface\\Icons\\Spell_Shadow_CurseOfSargeras"; 
local lebensentzug="Interface\\Icons\\Spell_Shadow_Requiem";
local feuerbrand="Interface\\Icons\\Spell_Fire_Immolation"; 
local castVerdEndTime = 0;
local castVerdDuration = 18;
local lebenEndTime = 0;
local lebenDuration = 30;
local cpeinEndTime = 0;
local cpeinDuration = 24;
local cfeuerEndTime = 0;
local cfeuerDuration = 15;
local lebenSpell="Lebensentzug(Rang 4)";
local castVerdSpell ="Verderbnis(Rang 6)";
local cpeinSpell="Fluch der Pein(Rang 6)";
local cfeuerSpell="Feuerbrand(Rang 7)"; 

function MessageFrame1_OnLoad()
MessageFrame1:SetFont("Fonts\\FRIZQT__.TTF", 8, "OUTLINE, MONOCHROME");
end


function castAllUltimative()
MessageFrame1:Clear();
local leben=lebenSpell;
local castVerd =castVerdSpell;
local cpein=cpeinSpell;
local cfeuer=cfeuerSpell;
for i=1,16 do 
	local name = UnitDebuff("target",i);
		if name then
			if (name==verderbnis) then
				castVerd="";
			end
			if (name==pein) then
				cpein="";
			end
			if (name==lebensentzug) then
				leben="";
			end
			if (name==feuerbrand) then
				cfeuer="";
			end
		end
	end

	local currentTime = GetTime();
if (not(cfeuer=="")) or (cfeuerEndTime <= currentTime)then
	CastSpellByName(cfeuer);	
	cfeuerEndTime=currentTime+cfeuerDuration;
	else
	appendMessageToMessageFrame1(cfeuerSpell,floor(cfeuerEndTime-currentTime));
	end
	
	if (not(cpein=="")) or (cpeinEndTime <= currentTime) then
	CastSpellByName(cpein);
	cpeinEndTime=currentTime+cpeinDuration;
	else
	appendMessageToMessageFrame1(cpeinSpell,floor(cpeinEndTime-currentTime));
	end
	
	if (not(castVerd=="")) or (castVerdEndTime <= currentTime) then
	CastSpellByName(castVerd);
	castVerdEndTime=currentTime+castVerdDuration;
	else
	appendMessageToMessageFrame1(castVerdSpell,floor(castVerdEndTime-currentTime));
	end
	
	if (not(leben=="")) or (lebenEndTime <= currentTime-currentTime) then
	CastSpellByName(leben);
	lebenEndTime=currentTime+lebenDuration;
	else
	appendMessageToMessageFrame1(lebenSpell,floor(lebenEndTime-currentTime));
	end


end

function appendMessageToMessageFrame1(message,value)
MessageFrame1:AddMessage(message..":"..value);
end