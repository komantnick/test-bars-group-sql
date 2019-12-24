SELECT 
a.firstname as "FIRST NAME",a.surname as "SURNAME",a.lastname as "LAST NAME",l.fullname as "LPU NAME",p.card_numb as "CARD_NUMBER" 
FROM `d_agents` a 
left join `d_persmedcard` p 
on p.agent=a.id 
left join `d_lpu` l 
on p.lpu=l.id