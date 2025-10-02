### Atividade Prática de SQL: Dominando JOINs e Agregações
- Objetivo
Esta atividade foi projetada para solidificar seus conhecimentos em um dos conceitos mais importantes e utilizados em SQL: as cláusulas JOIN. Através de um cenário prático de uma pequena loja virtual, você irá construir e consultar um banco de dados para extrair informações valiosas, combinando dados de múltiplas tabelas e utilizando funções de agregação.

- Ao final desta atividade, você será capaz de:
    - Entender a necessidade de relacionar tabelas em um banco de dados.
    - Utilizar INNER JOIN para combinar registros correspondentes de duas ou mais tabelas.
    - Utilizar LEFT JOIN para incluir registros que não possuem correspondência em outra tabela.
    - Aplicar funções de agregação como SUM(), COUNT() e GROUP BY em conjunto com JOINs para gerar relatórios e insights.

- O Cenário: Uma Pequena Loja Virtual
  - Nosso banco de dados simula as operações de uma loja online. Ele é composto por 5 tabelas principais que se relacionam para registrar quem são os clientes, o que eles compram e quais produtos estão disponíveis.

### Estrutura do Banco de Dados
- Categorias: Armazena as categorias dos produtos (Ex: Eletrônicos, Livros).
- Produtos: Contém os detalhes de cada produto, como nome, preço e a qual categoria ele pertence (categoria_id).
- Clientes: Guarda as informações dos clientes, como nome e cidade.
- Pedidos: Registra cada compra realizada, indicando qual cliente (cliente_id) a fez e em qual data.
- ItensPedido: Esta é a tabela de junção (ou "junction table"). Ela é crucial, pois detalha o conteúdo de cada pedido,    conectando um pedido_id a um produto_id e especificando a quantidade comprada.

- O relacionamento entre elas é a chave para entender como as consultas funcionarão. Por exemplo, para saber o que a cliente "Ana Silva" comprou, você precisa navegar de Clientes -> Pedidos -> ItensPedido -> Produtos.

## O Desafio: As Questões
As 20 questões a seguir foram divididas em níveis de dificuldade para guiar seu aprendizado de forma progressiva.

### Nível Básico (Questões 1-5)

1. Liste o nome de cada produto e o nome da sua respectiva categoria.

2. Mostre o ID de cada pedido, a data do pedido e o nome do cliente que o realizou.

3. Liste todos os itens de pedido, mostrando o nome do produto, a quantidade e o preço unitário de cada item.

4. Quais clientes moram na cidade de "São Paulo" e qual a data dos pedidos que eles fizeram?

5. Liste o nome dos produtos da categoria "Eletrônicos".



### Nível Intermediário (Questões 6-13)


6. Mostre o nome do cliente, a data do pedido e o nome do produto para cada item vendido.
7. 
8. Calcule o valor total de cada pedido.
   Dica: Você precisará agrupar os resultados (GROUP BY) pelo pedido_id e usar a função SUM() sobre uma expressão matemática (quantidade * preco_unitario).

9. Quantos pedidos cada cliente fez?

10. Qual o valor total gasto por cada cliente em todos os seus pedidos?

11.  Quantos produtos existem em cada categoria?

12. Liste os nomes dos clientes que compraram o produto "Notebook Pro".

13. Qual o total de faturamento da loja?

14. Quantos itens (somando as quantidades) foram vendidos de cada produto?


### Nível Avançado (Questões 14-20)


14. Liste TODOS os clientes e, para aqueles que fizeram pedidos, mostre a data do último pedido.

15. Liste TODOS os produtos e a quantidade total vendida de cada um. Produtos que nunca foram vendidos devem aparecer na lista com quantidade 0.

16. Liste TODAS as categorias e o valor total vendido de produtos de cada categoria.

17. Quais clientes gastaram mais de R$ 300,00 no total?

18. Liste os produtos que foram vendidos em mais de um pedido.

19. Qual a data do primeiro e do último pedido registrado no sistema?

20. Liste o nome dos clientes e o nome dos produtos para todos os pedidos feitos no dia '2025-09-11'.
