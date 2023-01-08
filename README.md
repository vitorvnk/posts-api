# APIZINHA

Essa é uma API REST de posts e comentários desenvolvida para fins de estudos.

#### Essa API utiliza:

* Ruby 3.0.5
* Rails 7.0.4
* PostgreSQL

### Como rodar

Para rodar localmente, clone o projeto:

`git clone https://github.com/tarocoLeo/post-api.git`

Certifique-se de ter o **Ruby** na versão **3.0.5** instalado. Em seguida, instale as dependências:

`bundle install`

Primeiro, **inicie o PostgreSQL** no seu computador local. Na sequência, rode os comandos para o funcionamento do banco de dados:

`rails db:create`
`rails db:migrate`

Agora, basta levantar o servidor:

`rails s`

### Como utilizar

Essa API lida com publicações e comentários vinculados à cada publicação. As requisições devem respeitar esse fluxo: 
`/posts/post_id/comments/comment_id`

### Publicações
Vamos começar com as requisições para as publicações:
#### Visualizar todas as publicações

Faça um GET na rota `http://localhost:3000/posts`.
_Deverá retornar `200 OK`._ 

#### Criar publicação

Faça um POST na rota `http://localhost:3000/posts` com os dados `Título`, `Conteúdo` e `Autor`.
```json
{
	"title": "Título da Publicação",
	"content": "Conteúdo da publicação",
	"author": "Nome do Autor"
}
```
_Deverá retornar um `201 Created`._

_Para criar uma publicação, todos os dados precisam ser informados. Do contrário, retornará o erro `422 Unprocessable Entity` com a mensagem de erro `"can't be blank"` indicando o(s) campo(s) vazio(s)._

#### Visualizar publicação específica

Faça um GET na rota da publicação passando seu ID no final:
`http://localhost:3000/posts/post_id`
_Deverá retornar `200 OK` e os dados da publicação._

#### Alterar dado de uma publicação

Faça um PUT na rota `http://localhost:3000/posts/post_id` passando o ID da publicação que terá as informações alteradas. Envie o JSON com os dados que deseja alterar. Nesse caso, vamos alterar o conteúdo:
```json
{
	"title": "Título da Publicação",
	"content": "Conteúdo atualizado",
	"author": "Nome do Autor"
}
```
_Deverá retornar `200 OK` e os dados da publicação já alterada._

#### Deletar uma publicação

Faça um DELETE na rota `http://localhost:3000/posts/post_id`, passando o ID da publicação que deseja deletar.
_Deverá retornar um `200 OK` e nenhum dado da publicação (já excluída)._

### Comentários
Agora, veremos sobre as requisições dos comentários.

Importante lembrar que os comentários pertencem única e exclusivamente à uma publicação, sendo assim, só é possível acessar os comentários informando a publicação a qual pertencem através do `post_id`.
#### Visualizar todos os comentários de uma publicação

Para visualizar os comentários de uma publicação, faça um GET na rota `http://localhost:3000/posts/post_id/comments`, informando o ID da publicação.
_Deverá retornar `200 OK`._

#### Criar comentário para uma publicação

Faça um POST na rota `http://localhost:3000/posts/post_id/comments` com os dados `Conteúdo` e `Autor`.
```json
{
	"content": "Conteúdo do comentário",
	"author": "Autor do Comentário"
}
```
_Deverá retornar um `201 Created`._

_Para publicar um comentário, todos os dados precisam ser informados. Do contrário, retornará o erro `422 Unprocessable Entity` com a mensagem de erro `"can't be blank"` indicando o(s) campo(s) vazio(s)._

#### Visualizar comentário específico

Faça um GET na rota do comentário passando seu ID no final:
`http://localhost:3000/posts/post_id/comments/comment_id`
_Deverá retornar `200 OK` e os dados do comentário._ 

#### Alterar dado de um comentário

Faça um PUT na rota `http://localhost:3000/posts/post_id/comments/comment_id` passando o ID do comentário que terá as informações alteradas. Envie o JSON com os dados que deseja alterar. Nesse caso, vamos alterar o conteúdo:
```json
{
	"content": "Comentário atualizado",
	"author": "Autor do Comentário"
}
```
_Deverá retornar `200 OK` e os dados do comentário já alterado._

#### Deletar um comentário

Faça um DELETE na rota `http://localhost:3000/posts/post_id/comments/comment_id`, passando o ID do comentário que deseja deletar.
_Deverá retornar um `200 OK` e nenhum dado do comentário (já excluído)._
