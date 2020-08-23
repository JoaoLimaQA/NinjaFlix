#language: pt
     @C_Login
    Funcionalidade: Login
         Para que eu possa gerenciar os filmes do catalogo do NinjaFlix
         Sendo um usuário préviamente cadastrado
         Posso acessar o sistema com o meu e-mail e senha

  @happy_login
    Cenario: Acesso
        Quando eu faço o login com "joao@qaninja.com" e "pwd123"
        Então devo ser autenticado
        E devo ver o nome "João Paulo" na área logada

    Esquema do Cenario:Login Invalidos
        Quando eu faço o login com <email> e <senha>
        Então não devo ser autenticado
        E devo ver a mensagem de alerta <menssagem>
  
    Exemplos:

      | email               | senha    | menssagem                      |
      | "joao@qaninja"      | "12345"  | "Usuário e/ou senha inválidos" |
      | "123@gmail.com"     | "pwd123" | "Usuário e/ou senha inválidos" |
      | ""                  | "12345"  | "Opps. Cadê o email?"          |
      | "lobitos@gmail.com" | ""       | "Opps. Cadê a senha?"          |


    