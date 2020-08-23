#language: pt
   @login
    Funcionalidade: Remover Filmes
        Para que eu possa manter o catálogo atualizado
        Sendo um gestor de catálogo que encontrou um titulo cancelado, indesejado ou que não tem aceitação do publico
        Posso remover este filme


    Cenário: Confirmar Exlusão
        Dado que "howends" está no catálogo
        Quando eu solicito a exclusão
        E eu confirmo a solicitação
        Então este item deve ser removido catálogo
    @rm_movie
    Cenário: Desistir da exclusão
        Dado que "6rid" está no catálogo
        Quando eu solicito a exclusão
        Mas cancelo a solicitação
        Então este item deve permanecer no catálogo