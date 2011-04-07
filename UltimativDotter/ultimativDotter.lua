-- Author      : Manuel
-- Create Date : 4/2/2011 1:22:33 PM




function castAllDots()

first = Mop:new();
first:saveTargetedMop();

for i=1, Spell:length() do
if not(first:hasDebuffSpell(Spell.returnAllSpells()[i])) then
	first.setAsTarget();
	MessageFrame1:AddMessage("cast:"..i);
	Spell.returnAllSpells()[i]:cast();
	TargetLastEnemy();
	break;
else
	MessageFrame1:AddMessage("already has this spell!");
end
	
end
MessageFrame1:AddMessage(first.name);
end


-- Casted die verschiedenen spells auf den gegener
-- viele messagebox ausgabe
-- keine time analyse
-- unterstützt keine verschiedenen gegner