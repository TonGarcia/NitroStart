module Concerns::HowWorkHelper
  def startupers_work_flow
    [
        {icon: 'ion-ios-lightbulb', text: 'Cadastre suas ideias'},
        {icon: 'ion-android-done-all', text: 'Valide suas Hipóteses'},
        {icon: 'mdi-action-dashboard', text: 'Preencha o Canvas'}
    ]
  end

  def investors_work_flow
    [
        {icon: 'fa fa-rocket', text: 'Selecione e Invista'},
        {icon: 'ion-clock', text: 'Aguarde Faturamento'},
        {icon: 'ion-cash', text: 'Receba o Retorno'}
    ]
  end
end