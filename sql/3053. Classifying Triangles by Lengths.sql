SELECT 
CASE WHEN A+B > C AND A+C>B AND B+C >A  THEN 
(CASE WHEN A=B AND B=C THEN 'Equilateral'
WHEN A=B OR B=C OR C = A THEN 'Isosceles'
ELSE 'Scalene' END
)
ELSE 'Not A Triangle' END  AS triangle_type
FROM Triangles;
