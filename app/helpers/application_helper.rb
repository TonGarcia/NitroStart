module ApplicationHelper
  # Facebook Page
  def fb_username
    'NitroStart'
  end

  # Return the translation for the obj.attr passed
  def t_attrs(str_obj_attr)
    t("activerecord.attributes.#{str_obj_attr}")
  end

  # Return it LocaleIcon based on model name passed as param
  def locale_icon(model)
    ENUM[:locale_icon][model]
  end

  # Show as readable
  def to_view(value)
    return 'Sim' if value == true
    return 'Não' if value == false
  end
end