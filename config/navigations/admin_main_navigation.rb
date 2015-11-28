# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'selected'
  navigation.active_leaf_class = 'active'
  navigation.items do |primary|
    primary.dom_class = 'nav'

    primary.item :dashboard, 'Dashboard', admin_dashboard_path
    primary.item :users_index, 'Users', admin_users_path
    primary.item :entries_index, 'Entries', admin_entries_path
    primary.item :votes_index, 'Votes', admin_votes_path
    primary.item :resellers_index, 'Resellers', admin_resellers_path
    primary.item :string_products_index, 'Strings', admin_string_products_path
    primary.item :emails, 'emails', admin_emails_path
    primary.item :site, 'Back to site', page_home_path

  end

end
