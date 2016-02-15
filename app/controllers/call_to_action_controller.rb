class CallToActionController < ApplicationController
  add_breadcrumb I18n.t('actions.call_to_action.index'), :call_to_action_path

  def index
  end
end