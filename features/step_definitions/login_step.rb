#login funcionando corretamente

Quando("eu faço o login com {string} e {string}") do |email, password|
    @login_page.go
    @login_page.with(email, password)
end
  
Então("devo ser autenticado") do
   js_storage = 'return window.localStorage.getItem("default_auth_token");'
   @token = page.execute_script(js_storage)
   sleep 3
end
  
Então("devo ver o nome {string} na área logada") do |user|
    expect(@sidebar.log_user).to have_text user
end
  

#Login com dados Invalidos

Então("não devo ser autenticado") do
    steps %{
        Então devo ser autenticado
    }  
    expect(@token).to eql nil
end
  
Então("devo ver a mensagem de alerta {string}") do |msn_erro|
   expect(@login_page.alert).to eql msn_erro
end