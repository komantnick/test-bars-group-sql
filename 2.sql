SELECT 
COUNT(*) 
FROM `d_agents` a 
left join `d_persmedcard` p 
on p.agent=a.id 
where p.CARD_NUMB IS NULL