*Estudo de caso - Olist* 
  
**Contexto** 

A Olist, é uma startup brasileira que oferece um serviço para facilitar o cadastro de produtos de e-commerces disponíveis no Brasil, para realizar vendas online. 

Todas as informações sobre os produtos, clientes, comerciantes, meios de pagamento, avaliações de clientes e pedidos, são informações que estão armazenadas em diferentes tabelas em Banco de Dados. É preciso extrair informações relevantes, através da exploração dos dados.


**Problema de negócio:** 

Explorar os dados e trazer respostas sobre o que realmente está acontecendo com o negócio. É necessário gerar e enviar relatórios, semanalmente para o time de negócios, com respostas para as perguntas feitas pelos gerentes.

**Dados:** 

Datasets Olist, disponível na Plataforma Kaggle.
Os dados estão em formato .csv e organizados nas seguintes tabelas:
- customer (informações dos clientes) 
- geolocation (informações sobre localização)
- order_items (informações sobre envio de itens)
- order_payments (informações sobre os pagamentos)
- order_reviews (informações sobre as avaliações)
- orders (informações sobre pedidos)
- products (informações sobre produtos)
- selles (informações sobre vendedores)
- product_category_name (informações sobre categorias de produtos)

**Planejamento da solução:**

- FERRAMENTAS:
- Linguagem SQL, DBeaver, SQLIte
- PROCEDIMENTOS:
- Coleta de dados e armazenamento em um Banco de Dados Relacional (SQLite).
- Realizar as Querys (consultas), organizando os dados em novas tabelas através do agrupamento de colunas de diferentes tabelas (JOiN).
- ENTREGA DE RESULTADOS:
- Criação de um relatório semanal e envio por email para o time d enegócios.

**Conclusão:**
- Foram gerados 8 relatórios diferentes, utilizando a lingUagem SQL, que proporcionaram um melhor entendimento sobre as informações relacionadas aos clientes, produtos, preços, vendedores, entregas e trazendo uma melhor organização tanto de estoque quanto de vendas, entrega de produtos e satisfação de clientes e vendedores.

Este estudo de caso foi desenvolvido junto à Comunidade DS, fazendo parte da minha Trilha de estudos para Data Science.