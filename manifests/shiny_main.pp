class wordpress {
    # Load all variables
    class { 'shiny::conf': }

    # Install Apache and Mod Proxy
    class { 'shiny::web': }

    # Install MySQL
    #class { 'wordpress::db': }

    # Run shiny installation only after Apache is installed
    class { 'shiny::installer': 
        require => Notify['Apache Installation Complete']
    }

    # Display this message after MySQL installation is complete
    notify { 'MySQL Installation Complete':
        require => Class['wordpress::db']
    }

    # Display this message after Apache installation is complete
    notify { 'Apache Installation Complete':
        require => Class['shiny::web']
    }

    # Display this message after shiny installation is complete
    notify { 'Wordpress Installation Complete':
        require => Class['shiny::installer']
    }
}
