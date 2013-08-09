SimpleNavigation::Configuration.run do |navigation|
  navigation.renderer = SimpleNavigation::Renderer::Bootstrap
  navigation.selected_class = 'active'
  navigation.items do |primary|
    primary.dom_class = 'nav navbar-nav'
    primary.item :home, 'Home', page_path('home')
    primary.item :about, 'About', page_path('about')
  end
end
