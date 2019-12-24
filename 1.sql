SELECT l.fullname as "NAME",count(*) as "COUNT" 
FROM `d_lpu` l 
LEFT JOIN `d_persmedcard` p 
on p.lpu=l.id 
where p.RHESUS=1 and p.BLOODGROUPE=1 
group by p.RHESUS,p.BLOODGROUPE,p.lpu;