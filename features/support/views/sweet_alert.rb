class SweetAlert
    include Capybara::DSL
    def alert_confirm
        find(".swal2-confirm").click
    end

    def alert_cancel
        find(".swal2-cancel").click
    end
end