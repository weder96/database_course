Tabela: World

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| name        | varchar |
| continent   | varchar |
| area        | int     |
| population  | int     |
| gdp         | bigint  |
+-------------+---------+


name é a chave primária (coluna com valores únicos) para esta tabela.
Cada linha desta tabela fornece informações sobre o nome de um país, o continente ao qual ele pertence, sua área, a população e seu valor de PIB.



País é grande se:

tem uma área de pelo menos três milhões (ou seja, 3000000 km2), ou
tem uma população de pelo menos vinte e cinco milhões (ou seja, 25000000).
Escreva uma solução para encontrar o nome, a população e a área dos países grandes.

Retorne a tabela de resultados em qualquer ordem.

O formato do resultado está no exemplo a seguir.

 

Example 1:

Input: 
World table:

+-------------+-----------+---------+------------+--------------+
| name        | continent | area    | population | gdp          |
+-------------+-----------+---------+------------+--------------+
| Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
| Albania     | Europe    | 28748   | 2831741    | 12960000000  |
| Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
| Andorra     | Europe    | 468     | 78115      | 3712000000   |
| Angola      | Africa    | 1246700 | 20609294   | 100990000000 |
+-------------+-----------+---------+------------+--------------+