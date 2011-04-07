-- Author      : Manuel
-- Create Date : 4/2/2011 1:22:33 PM

Spell = {}
Spell.name = "";
Spell.castName = "";
Spell.duration = 0;
Spell.endTime = 0;
Spell.startTime = 0;
Spell.serverName = "";

function Spell:new()

	local res = {}
	setmetatable(res,self);
	self.__index = self;
	return res;
	
end

function Spell:cast()

   MessageFrame1:AddMessage("start Casting:"..self.name);
	CastSpellByName(self.castName);
	self.startTime = time();
	self.endTime = self.startTime + self.duration;
end

function Spell:returnAllSpells()
	return {verderbnis,pein,lebensentzug,feuerbrand};	
end

function Spell:length()
	return 4;
end

verderbnis = Spell:new();
pein = Spell:new();
lebensentzug = Spell:new();
feuerbrand = Spell:new();

verderbnis.name = "Verderbnis";
verderbnis.castName = "Verderbnis(Rang 6)";
verderbnis.duration = 18;
verderbnis.serverName = "Interface\\Icons\\Spell_Shadow_AbominationExplosion";

pein.name = "Fluch der Pein";
pein.castName = "Fluch der Pein(Rang 6)";
pein.duration = 24;
pein.serverName = "Interface\\Icons\\Spell_Shadow_CurseOfSargeras";

lebensentzug.name = "Lebensentzug";
lebensentzug.castName = "Lebensentzug(Rang 4)";
lebensentzug.duration = 30;
lebensentzug.serverName = "Interface\\Icons\\Spell_Shadow_Requiem";

feuerbrand.name = "Feuerbrand";
feuerbrand.castName = "Feuerbrand(Rang 7)";
feuerbrand.duration = 15;
feuerbrand.serverName = "Interface\\Icons\\Spell_Fire_Immolation";