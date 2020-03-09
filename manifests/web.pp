class shiny::web {

    # Install Apache
    class {'apache': 
        mpm_module => 'prefork'
    }

    # Add support for mod proxy
    class {'::apache::mod::'proxy': }
}
