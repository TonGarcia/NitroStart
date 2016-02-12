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
    start_up_section = {
      label: 'Startup',
      actions: [
        # {name:'Baú de Ideias', icon:'mdi-action-assignment', link: pitches_path, action_controller:'pitches'},
        # {name:'Trending Problemas', icon:'ion-speakerphone', link: start_ups_path, action_controller:'start_ups'},
        # {name:t('actions.dashboard.start_ups'), icon:'ion-speedometer', link: dashboard_start_ups_path, action_controller:'dashboard'},
        {name:t('actions.pitches.index'), icon:'mdi-action-assignment', link: pitches_path, action_controller:'pitches'},
      ]
    }

    start_up_ref = {name:t('actions.start_ups.index'), icon:'mdi-action-assignment-turned-in', link: start_ups_path, action_controller:'start_ups'}
    start_up_section[:actions] << start_up_ref unless @current_user.start_ups.empty?
     start_up_section
  end

  # List LegalPersonActions
  def investor_actions
    {
        label: 'Investidor',
        actions: [
            {name:t('actions.pitches.supporting'), icon:'ion-thumbsup', link: showroom_index_path, action_controller:'showroom'},
            # {name:t('actions.showroom.index'), icon:'mdi-action-dashboard', link: showroom_index_path, action_controller:'showroom'},
            # {name:t('actions.start_ups.invested'), icon:'ion-flame', link: showroom_index_path, action_controller:'showroom'},
            # {name:t('actions.dashboard.investments'), icon:'mdi-action-trending-up', link: dashboard_investments_path, action_controller:'dashboard'},
        ]
    } # teammate
  end

  # List PartnersActions
  def supporter_actions
    {
        label: 'Apoiadores',
        actions: [
          {name:t('actions.problems.new'), icon:'ion-android-warning', link: showroom_index_path, action_controller:'showroom'},
          {name:t('actions.problems.trending'), icon:'ion-ios-people', link: pitches_path, action_controller:'pitches'},
        ]
    }
  end

  # List PartnersActions
  def partners_actions
    {
      label: 'Parceiros & Fornecedores',
      actions: [
      ]
    }
  end

  # List Tools
  def tools_actions
    {
        label: 'Ferramentas Exclusivas',
        actions: [
        ]
    }
  end

  # Return the profile_actions array
  def profile_actions
    [
        {name: t('actions.user.show'), icon: 'icon ion-person', link: root_path},
        {name: t('actions.user.edit'), icon: 'icon ion-edit', link: root_path},
        {name: t('actions.user.password'), icon: 'icon ion-locked', link: root_path},
    ]
  end

# Array of grouped actions
  def aside_grouped_actions
    [
      supporter_actions,
      start_up_actions,
      investor_actions,
      # partners_actions,
      # tools_actions
    ]
  end
end