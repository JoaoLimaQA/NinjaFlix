class MovieAdd
    include Capybara::DSL

    def create(movie)
        #Titulo
        find('input[name=title]').set movie["title"]
        #Status
        select_status(movie["status"]) unless movie["status"].empty?
        #Ano de Lançamento
        find('input[name=year]').set movie["year"]
        #Data da Estreia
        find('input[name=release_date]').set movie["release_date"]
        #Atores
        add_cast(movie["cast"])
        #Sinopse
        find('textarea[name=overview]').set movie["overview"]
        #Capa
        upload(movie["cover"]) unless movie["cover"].empty?
        #Finalizar
        find("#create-movie").click
    
    end

    def upload(file)
        cover_file = File.join(Dir.pwd, "features/support/fixture/covers/" + file)
        cover_file = cover_file.tr("/", "\\")
        
        Capybara.ignore_hidden_elements = false
        attach_file('upcover', cover_file) if OS.windows?
        Capybara.ignore_hidden_elements = true
    
    end    
    
    def add_cast(cast)
        actor = find(".input-new-tag")
        cast.each do |a|
          actor.set a
          actor.send_keys :tab
        end
        
    end    

    def alert
     find(".alert").text
    end

    def select_status(status)
        #combobox customizado com li's
        find("input[placeholder=Status]").click
        find(".el-select-dropdown__item", text: status).click
    end

   

end