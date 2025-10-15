# Tarefas da Análise
Por favor, gere um script SQL com as consultas que respondam às seguintes perguntas de negócio, utilizando o esquema Northwind. 
Mantenha o padrão de comentar cada consulta para explicar o que está sendo analisado.

## 1. Perfil de Vendas por Colaborador (Employees)

### Pergunta de Negócio: Quem são nossos colaboradores mais consistentes e quem se destaca em vendas de alto valor?

- Métricas Necessárias: Para cada colaborador, calcule:
- Faturamento Total Gerado: A soma total do valor de todas as suas vendas. Lembre-se que o valor real está em OrderDetails (UnitPrice * Quantity * (1 - Discount)).
- Ticket Médio por Pedido: O valor médio de cada pedido (Order) que o colaborador processou.
- Total de Pedidos Processados: A contagem de pedidos distintos (Orders) associados a cada colaborador.
  
- Tabelas Envolvidas: Employees, Orders, OrderDetails.

**Dica:** Você precisará agrupar os resultados pelo nome e sobrenome do colaborador.

## 2. Análise Estratégica de Categorias (Categories)

### Pergunta de Negócio: Quais categorias concentram nosso faturamento e quais são baseadas em volume de vendas?

- Métricas Necessárias: Para cada categoria de produto, calcule:
- Faturamento Total da Categoria: A soma do valor de venda de todos os produtos daquela categoria.
- Preço Médio de Produto na Categoria: A média do UnitPrice dos produtos (Products) dentro daquela categoria.
- Quantidade Total de Itens Vendidos: A soma das unidades (Quantity em OrderDetails) vendidas para cada categoria.

**Tabelas Envolvidas:** Categories, Products, OrderDetails.


## 3. Distribuição do Valor dos Pedidos (Orders)

### Pergunta de Negócio: Qual é o perfil do nosso pedido típico? Nossas transações são majoritariamente de baixo, médio ou alto valor?

= Análise Solicitada: Crie uma consulta que categorize o valor total de cada pedido (OrderID) em faixas e conte quantos pedidos caem em cada faixa.

- Baixo Valor: pedidos até $500
- Médio Valor: pedidos entre $500.01 e $2.500
- Alto Valor: pedidos acima de $2.500

**Tabelas Envolvidas:** OrderDetails (principalmente), Orders.

**Dica:** Você precisará primeiro calcular o valor total por OrderID (sugestão: usar uma subconsulta ou CTE). Depois, na consulta externa, aplique a expressão CASE para criar as faixas e agrupe por elas para fazer a contagem.

## 4. Identificação do Produto "Carro-Chefe" (por Frequência)

### Pergunta de Negócio: Qual produto aparece no maior número de pedidos distintos? Este é o item que os clientes mais procuram, independentemente da quantidade comprada.

- Métrica Necessária: Encontre o nome do produto (ProductName) que está presente na maior quantidade de pedidos (Orders) diferentes.

**Tabelas Envolvidas:** Products, OrderDetails.

**Dica:** Agrupe por ProductID e ProductName na tabela OrderDetails e conte o número de OrderID distintos (COUNT(DISTINCT OrderID)). Ordene o resultado para encontrar o principal.

# Formato de Entrega
Entregue um único arquivo chamado **Analise_Northwind_Q3_<SeuNome>.sql**. O script deve conter apenas as consultas T-SQL que resolvem as quatro análises solicitadas, com seus respectivos comentários.

Este desafio é um passo importante. Dominar a estrutura do Northwind é essencial para qualquer analista de dados. Estou confiante na sua capacidade de traduzir as necessidades de negócio em consultas SQL eficazes.


# **Uma Nota Importante: "Seja Consciente com o Uso de IA Generativa"**
O objetivo principal desta e de qualquer atividade é o seu aprendizado. Ferramentas de Inteligência Artificial, como o ChatGPT ou o Gemini, são incrivelmente poderosas e podem ser excelentes aliadas nos seus estudos, mas é crucial usá-las com sabedoria.


## Como usar a IA a seu favor (o jeito inteligente):

Para tirar dúvidas: "Pode me explicar o que "uma subconsulta faz" em outras palavras?"

Para pedir exemplos: "Me mostre um exemplo diferente de como usar uma "subconsulta"

**Para depurar erros:** "Estou recebendo este erro no meu código, o que ele pode significar?"

### **O que evitar (o caminho que não gera aprendizado):**

**Pedir a solução completa:** "Resolva esta atividade para mim."

**Copiar e colar o código sem entender:** Entregar uma solução que você não consegue explicar é o mesmo que não ter aprendido nada.

Encare a IA como um tutor particular disponível 24h, e não como alguém que faz o trabalho por você. O processo de tentar, errar e consertar é a parte mais valiosa do seu desenvolvimento.

Bom trabalho e bons estudos!
