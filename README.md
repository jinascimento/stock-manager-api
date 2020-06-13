# Desafio Nexaas para desenvolvedor(a) em Ruby

Ficamos felizes que você tenha chegado nesta etapa do processo seletivo para desenvolvedor(a) em Ruby. Nosso desafio é a construção de uma API Rest, obrigatoriamente você deve implementar uma solução com Ruby (preferencialmente utilizando Rails).

Crie uma API Rest que faça o gerenciamento de estoque de loja. As entidades devem ser: 
- Product: informações de produto (id, nome e preço de custo, por exemplo)
- Store: Informações sobre a loja (id, nome e endereço, por exemplo)
- StockItem: Deve relacionar uma loja a um produto e armazenar a quantidade de itens em estoque

As operações devem ser:
- Cadastrar, alterar, excluir e pesquisar produto (apenas por ID) 
- Cadastrar, alterar, excluir e pesquisar loja (apenas por ID) 
- Criar estoque de um produto em uma loja (relacionar loja e produto e inserir uma quantidade inicial de itens)
- Adicionar itens de um produto ao estoque
- Retirar itens de um produto do estoque

O que você deve nos entregar:
- Código fonte no Github com documentação no readme ou wiki sobre como rodar localmente a aplicação
- Utilize banco relacional
- Aplicação rodando no Heroku
- Documentação de como utilizar os endpoints

O que vamos avaliar:
- Solução adotada, principalmente a questão de adicionar e retirar itens do estoque (imagine um cenário de concorrência)
- Cobertura de testes e a qualidade dos testes (utilize o RSpec)
- Qualidade de código
- Conceitos avançados de orientação a objetos (nada de fat model ou controllers com regras de negócio, por favor)
- Estrutura do banco de dados (índices, chave estrangeiras, chaves únicas… use um banco relacional e todo seu poder)
- Verbos e status code dos endpoints (utilize os padrões HTTP)
- Como os erros são tratados

# Configurações do projeto

* Ruby version: 2.5.3

* Rails version: 5.2.4.1

* Banco de dados: PostgreSql

## Ambiente de Desenvolvimento
* Clone este repositorio
* Configure as variáveis de ambiente a baixo no arquivo .env:

```javascript
STOCK_MANAGER_DB_PASSWORD=
RAILS_MAX_THREADS=
STOCK_MANAGER_DB_HOSTNAME=
STOCK_MANAGER_DB_USERNAME=
STOCK_MANAGER_DB_PORT=
```

* Rode os comandos para configuração do ambiente Rails.

 `bundle install`

`rails db:setup`

* Suba o servidor rails rodando o comando  
  - `rails s`

* O Projeto estara disponivel em 
  - `http://localhost:3000`
 
* Gerar documentação swagger: 
  - `rails rswag:specs:swaggerize`
 
Acessar URL com apis documentadas:

http://localhost:3000/api-docs/index.html

* Testes unitários: 
  - `rspec`
  
Cobertura de testes:  
- `Abrir arquivo coverage/index.html`