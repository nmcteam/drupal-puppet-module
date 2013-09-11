class drupal::theme {

    #######################################################################
    # Dependencies
    #######################################################################

    include drupal::variables
    include drupal::drush
    include drupal::site

    Class['drupal::site'] -> Class['drupal::theme']

    #######################################################################
    # Install theme
    #######################################################################

    exec { "drupal_theme_download":
        cwd => "${drupal::variables::docRootPath}/sites/default/themes",
        command => "${drupal::variables::binWget} https://github.com/nmcteam/drupal-theme/archive/master.zip && ${drupal::variables::binUnzip} master.zip",
        unless => "/usr/bin/test -d ${drupal::variables::docRootPath}/sites/default/themes/${drupal::variables::siteSlug}"
    }

    exec { "drupal_theme_rename":
        cwd => "${drupal::variables::docRootPath}/sites/default/themes",
        command => "/bin/mv drupal-theme-master ${drupal::variables::siteSlug}",
        creates => "${drupal::variables::docRootPath}/sites/default/themes/${drupal::variables::siteSlug}",
        require => Exec["drupal_theme_download"]
    }

    file { "drupal_theme_cleanup":
        ensure => absent,
        path => "${drupal::variables::docRootPath}/sites/default/themes/master.zip",
        require => Exec["drupal_theme_rename"]
    }

}
