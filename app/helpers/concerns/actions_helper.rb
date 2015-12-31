module Concerns::ActionsHelper
# List AdminActions
  def admin_actions
    {
      label: 'Admin',
      actions: [
        {name:'DashBoard', icon:'ion ion-ios-pulse-strong', link: admin_dashboard_path, action_controller:'dashboard'}
      ]
    }
  end

  # List StartupActions
  def start_up_actions
    {
      label: 'Startup',
      actions: [
        # {name:t('actions.cards.index'), icon:'fa fa-credit-card', link: cards_path, action_controller:'cards'},
        #TODO transaction user_to_user on another version {name:t('actions.account_transactions.index'), icon:'fa fa-money', link: account_transactions_path, action_controller:'account_transactions'},
        #TODO withdraws only on pre-paid cards, bank acc withdraw on another version {name:t('actions.bank_accounts.index'), icon:'fa fa-bank', link: bank_accounts_path, action_controller:'bank_accounts'},
        #{name:'Rendimentos', icon:'fa fa-line-chart'},
        #{name:'Capital de Giro', icon:'fa fa-refresh'},
        #{name:'Capital Semente', icon:'ion ion-leaf'},
        #{name:'Cobranças Manuais', icon:'fa fa-barcode'}
      ]
    }
  end

  # List LegalPersonActions
  def investor_actions
    {
        label: 'Investidor',
        actions: [
            # {name:t('actions.purchases.index'), icon:'fa fa-exchange', link: purchases_path, action_controller:'purchases'},
            # {name:t('actions.companies.index'), icon:'fa fa-building', link: companies_path, action_controller:'companies'},
            # {name:t('actions.providers.index'), icon:'fa fa-truck', link: providers_path, action_controller:'providers'},
            # {name:'Consultorias', icon:'fa fa-black-tie'},
            # {name:'Fornecedores', icon:'fa fa-truck', del:true} TODO melhor por ele rasurado (com del) ou deixar sem até existir?
        ]
    } # teammate
  end

  # List PartnersActions
  def partners_actions
    {
      label: 'Parceiros & Fornecedores',
      actions: [
        # {name:t('actions.app_store.index'), icon:'mdi-navigation-apps', link: app_store_path, action_controller:'app_store'},
        # {name:'E-Commerce', icon:'ion ion-ios-cart'},
        # {name:'Comprovantes', icon:'ion ion-android-list'}
      ]
    }
  end

  # Return the profile_actions array
  def profile_actions
    [
        {name: t('actions.users.show'), icon: 'icon ion-person', link: root_path},
        {name: t('actions.users.edit'), icon: 'icon ion-edit', link: edit_user_registration_path},
        {name: t('actions.users.show'), icon: 'icon ion-locked', link: root_path},
    ]
  end

# Array of grouped actions
  def aside_grouped_actions
    [
      start_up_actions,
      investor_actions,
      partners_actions
    ]
  end
end