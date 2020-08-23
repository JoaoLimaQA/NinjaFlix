class SideBarView
   include Capybara::DSL
    def log_user
       find(".sidebar-wrapper .user .info span").text 
    end
end