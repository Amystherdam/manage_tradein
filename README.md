<div align="center">
  <h1>
    Manage Trade-In
  </h1>

  <div>
    <img src="https://i.ibb.co/4Ny4qdC/manage-tradein-no-background.png" alt="manage-tradein-no-background" border="0">
  </div>

  <h2>
    Sobre o sistema
  </h2>

  <p>
    Aplicação que visa o gerenciamento de vendas em um supermercado.
  </p>

  <h3>
    Para poder usar o sistema
  </h3>

  Rails 5.2.X |
  Ruby 2.7.2 |
  PostgreSQL |
  Rodar os seguintes comandos
    "bundle" ou "bundle install" | 
    "rails db:create db:migrate db:seed" |
  Verifique no arquivo seeds.rb as credenciais de um dos usuários de teste para poder entrar

  <h2>
    Estruturação do banco de dados e dos relacionamentos
  </h2>

  <img src="https://i.ibb.co/nMg82Wx/database-structure-and-relationships.png" alt="database-structure-and-relationships" border="0">

  <h3>
    Dashboard
  </h3>

  <div>
    <img src="https://i.ibb.co/BGHk8Yt/dashboard.png" alt="dashboard" border="0">
  </div>

  <p>
    Para ver seu perfil, criar um novo usuário (No caso de gerentes) ou sair do sistema, clique na foto do seu usuário no canto superior esquerdo
  </p>

  <p>
    Temos nessa tela também o valor total das vendas de cada mês e ao clicar no mês, um modal é exibido com o top três clientes que mais compraram
  </p>

  <h3>
    Tela Sales New
  </h3>

  <div>
    <img src="https://i.ibb.co/NWjWQhr/sale-new.png" alt="sale-new" border="0">
  </div>

  <p>
    Essa tela é a mais complexa de usar e precisa de muito front-end voltado para UX. Devido ao tempo ela está inacabada. Mas a ideia é ficar como a tela de seleção de itens do Ifood, onde se tem o nome do produto ao lado da quantidade
  </p>

  <h3>
    Permissões
  </h3>

  <p>
    Foram implementadas permisões por função do funcionário via gem CanCanCan. Um dos destaques é o fato de que não se pode criar um usuário estaernament. Só o gerente pode fazer isso por dentro do sistema

    Produtos e clientes não podem ser excluídos, pois isso afeta o relatório mensal e quebra o sistema
  </p>

  <h3>
    Ressalvas
  </h3>

  <p>
    Devido eu ainda estar iniciando com TDD e RSpec eu decidi não implementar no sistema
  </p>

  <p>
    Por conta do tempo, a estilização das telas não pode ser concluída e a internacionalização da aplicação não pode ser efetuadano. No entanto, todas as especificações passadas por email foram cumpridas
  </p>

  <p>
    Existe um bug na tela de cadastro de venda. Se o usuário seleciona um produto e não seleciona a quantidade pertencente aquele produto, é realizado um cadastro no banco sem essa informação que é peça chave para os relatórios mensais. Esse bug se dar porque estou trabalhando com campos jsonb e tratando o ID do produto e a quantidade com regex e methodos de string que são facilmente corrompíveis e precisam de bastante atenção. Isso seria corrigido com mais tempo
  </p>

  <h3>
    Utilitários de linha de comando
  <h3>
</div>

rvm use 2.7.2

rails _5.2.7_ new manage_tradein -T --database=postgresql --skip-coffee --skip-turbolinks

rails server

rails g scaffold Customer name:string birthdate:date

rails g scaffold Product name:string price:decimal description:text

rails g scaffold Sale customer:references data:jsonb date_sale:datetime

rails generate devise:install

rails generate devise User

rails generate devise:views

rails g model UserProfile name:string phone:string gender:string role:string user:references

rails g controller user_management index

rails g controller dashboard index

rails active_storage:install

rails g cancan:ability

rails generate simple_form:install