-- Author      : Manuel
-- Create Date : 4/2/2011 1:18:22 PM

Mop = {};

Mop.name = "";
Mop.level = 0;
Mop.armor = 0;
Mop.health = 0;
Mop.mana = 0;
Mop.isDead = false;

function Mop:new()
	local res = {};
	setmetatable(res,self);
	self.__index = self;
	return res;
end

function Mop:saveTargetedMop()
self.name= UnitName("target");
self.level= UnitLevel("target");
self.armor= UnitArmor("target");
self.health = UnitHealth("target");
self.mana = UnitMana("target");
	if(UnitIsDead("target")) then
	self.isDead = true
	end
end

function Mop:setAsTarget()
	TargetUnit(Mop.name);
end

function Mop:hasDebuffSpell(spellServerNameToTest)
	
	for i=1,16 do 
		local name = UnitDebuff("target",i);	
			MessageFrame1:AddMessage(name);
			MessageFrame1:AddMessage(spellServerNameToTest.serverName);
			if(name==spellServerNameToTest.serverName) then
				 return true;
			 end
	end
	
	return false;
end

function isSame(compareMob)
	if(compareMob.name==Mop.name
		-- compareMob.level == mop.level and
		-- compareMob.armor == mop.armor and
		-- compareMob.health == mop.health and
		-- compareMob.mana = mop.mana
		)	then
		return true;
	end
	return false;
end
