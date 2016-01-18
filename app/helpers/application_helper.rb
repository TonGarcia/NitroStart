module ApplicationHelper
  # Facebook Page
  def fb_username
    'NitroStart'
  end

  # Return the translation for the obj.attr passed
  def t_attrs(str_obj_attr)
    t("activerecord.attributes.#{str_obj_attr}")
  end

  # Return it icons list based on controller
  def t_current_class_icons
    return @class_icons if @class_icons
    current_class = params[:controller].singularize.to_sym
    @class_icons = locale_icon(current_class)
  end

  # Return it LocaleIcon based on model name passed as param
  def locale_icon(model)
    ENUM[:locale_icon][model]
  end

  # Show as readable
  def to_view(value, attr=nil)
    return 'Sim' if value == true
    return 'Não' if value == false
  end

  # Generate BackLink
  def gen_back_link(current_obj)
    if @pitch
      if current_obj.id.nil?
        pitch_path @pitch
      else
        send("pitch_#{current_obj.class.name.downcase}_path", @pitch, current_obj)
      end
    elsif @start_up
      if current_obj.id.nil?
        start_up_path @start_up
      else
        send("start_up_#{current_obj.class.name.downcase}_path", @start_up, current_obj)
      end
    end
  end
end