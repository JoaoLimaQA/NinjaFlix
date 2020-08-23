#language: pt
@login
    Funcionalidade: Cadastramento de Filmes 
        Para que eu possa disponibilizar novos titulos no catalogos
        Sendo um gestor de catalogos
        Posso cadastrar novos Filmes
    @new_movies
    Esquema do Cenario: Adicionar filmes
        Dado que <codigo> é um novo filme
        Quando eu faço o cadastro do filme
        Então devo ver o novo filme na lista

    Exemplos:
    |codigo    |
    |"resgate" |
    |"gmz"     |
    |"gb"      |


@attempt_movie
    Esquema do Cenario: Campos Obrigatórios
        o gestor de catálogos tenta cadastrar um novo filme, mas esquece
        de preencher um dos campos que são obrigatórios, em seguida, o sistema
        exibe uma notificação para o usuário.

          Dado que <codigo> é um novo filme
          Quando eu faço o cadastro do filme
          Então devo ver a notificação <texto>

    Exemplos:
      | codigo      | texto                                          |
      | "no_title"  | "Oops - Filme sem titulo. Pode isso Arnaldo?"  |
      | "no_status" | "Oops - O status deve ser informado!"          |
      | "no_year"   | "Oops - Faltou o ano de lançamento também!"    |
      | "no_date"   | "Oops - Quase lá, só falta a data de estréia!" |
    
    @dup_movie
    Cenario: Duplicado
        O gestor de catálogo tenta cadastrar um filme, porem o título
        já está cadastradoe em outro momento e o sistema notifca o usuário
        informando que o titulo já existe.

        Dado que "deadpool2" é um novo filme
        Mas este filme já existe no catálogo
        Quando eu faço o cadastro do filme
        Então devo ver a notificação "Oops - Este titulo já existe no Ninjaflix."