--  используем round для получения числа с 2-мя знаками после запятой
SELECT round(sum(a.SEX=0)/count(*)*100,2) as "FEMALE PERCENT" 
FROM `d_agents` a 
LEFT JOIN `d_persmedcard` p 
ON p.agent=a.id 
LEFT JOIN `d_lpu` l 
ON p.lpu=l.id 
WHERE p.lpu IS NOT NULL
GROUP BY p.lpu