class drupal::site {

    #######################################################################
    # Dependencies
    #######################################################################

    include drupal::variables
    include drupal::drush

    Class['drupal::drush'] -> Class['drupal::site']

    #######################################################################
    # Install Drupal site
    #######################################################################

    exec { "download_drupal":
        cwd => $drupal::variables::rootPath,
        command => "${drupal::variables::binDrush} dl drupal --drupal-project-rename='${$drupal::variables::publicFolderName}' -y",
        timeout => 0,
        creates => $drupal::variables::docRootPath
    }

    exec { "install_drupal":
        cwd => $drupal::variables::docRootPath,
        command => "${drupal::variables::binDrush} si standard -y --db-url=mysql://${$drupal::variables::dbUsername}:${$drupal::variables::dbPassword}@${$drupal::variables::dbHost}:${drupal::variables::dbPort}/${$drupal::variables::dbName} --site-name='${$drupal::variables::siteTitle}' --account-name=${$drupal::variables::siteAdminUsername} --account-pass=${$drupal::variables::siteAdminPassword} --locale=${$drupal::variables::siteLocale}",
        timeout => 0,
        creates => "${drupal::variables::docRootPath}/sites/default/settings.php",
        require => Exec["download_drupal"]
    }

    #######################################################################
    # Prepare gitignore
    #######################################################################

    file { "create_drupal_gitignore":
        ensure => file,
        path => "${drupal::variables::rootPath}/.gitignore",
        content => template('drupal/gitignore.erb'),
        require => Exec['install_drupal']
    }

    #######################################################################
    # Prepare site settings
    #######################################################################

    file { "create_drupal_settings":
        ensure => file,
        path => "${drupal::variables::docRootPath}/sites/default/settings.php",
        content => template('drupal/site-settings.erb'),
        require => Exec['install_drupal']
    }

    file { "create_drupal_settings_example":
        ensure => file,
        path => "${drupal::variables::docRootPath}/sites/default/settings.php.example",
        content => template('drupal/site-settings-example.erb'),
        require => Exec['install_drupal']
    }

    #######################################################################
    # Prepare Drupal site directories
    #######################################################################

    file { "create_drupal_libraries_folder":
        ensure => directory,
        path => "${drupal::variables::docRootPath}/sites/all/libraries",
        mode => 0755,
        require => Exec["install_drupal"]
    }

    file { "create_drupal_themes_folder":
        ensure => directory,
        path => "${drupal::variables::docRootPath}/sites/default/themes",
        mode => 0755,
        require => Exec["install_drupal"]
    }

    file { "create_drupal_modules_folder":
        ensure => directory,
        path => "${drupal::variables::docRootPath}/sites/default/modules",
        mode => 0755,
        require => Exec["install_drupal"]
    }

}
