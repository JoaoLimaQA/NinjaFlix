
Dado("que {string} é um novo filme") do |movie_list|
  file = YAML.load_file(File.join(Dir.pwd, "features/support/fixture/movies.yaml"))
  @movies = file[movie_list]
  Database.new.delete_movie(@movies["title"])
end

Dado("este filme já existe no catálogo") do
  Database.new.insert_movie(@movies)
end
  
Quando("eu faço o cadastro do filme") do
  @movie_page.add
  @movie_page.form.create(@movies)
end
  
Então("devo ver o novo filme na lista") do
  result = @movie_page.movie_tr(@movies["title"])
  expect(result).to have_text @movies["title"]
  expect(result).to have_text @movies["status"]
end
   
Então("devo ver a notificação {string}") do |notification|
  sleep 2
  expect(@movie_page.form.alert).to eql notification
end 

Dado("que {string} está no catálogo") do |movie_list|                            
  #Utilização do Dynamic Steps
  steps %{
    Dado que "#{movie_list}" é um novo filme
    E este filme já existe no catálogo
  }
end                                                                          
                                                                             
Quando("eu solicito a exclusão") do                                           
  @movie_page.remove(@movies["title"])
end                                                                          
                                                                             
Quando("eu confirmo a solicitação") do                                       
@movie_page.sweet_alert.alert_confirm
sleep 2
end                                                                          
                                                                             
Então("este item deve ser removido catálogo") do                             
expect(@movie_page.has_no_movie(@movies["title"])).to be true
end                                                                          
                                                                             
Quando("cancelo a solicitação") do
  @movie_page.sweet_alert.alert_cancel
end

Então("este item deve permanecer no catálogo") do
  expect(@movie_page.has_movie(@movies["title"])).to be true
end