module SignHelper
  def sign_bg
    current_controller = params[:controller]
    case current_controller
      when 'users/sessions'
        return 'indigo darken-5'
      when 'users/registrations'
        return 'teal darken-4'
      when 'users/passwords'
        return 'blue-grey'
    end
  end
end