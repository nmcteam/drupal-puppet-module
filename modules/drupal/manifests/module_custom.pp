class drupal::module_custom {

    #######################################################################
    # Dependencies
    #######################################################################

    include drupal::variables
    include drupal::drush
    include drupal::site

    Class['drupal::site'] -> Class['drupal::module_custom']

    #######################################################################
    # Create custom module
    #######################################################################

    exec { "drupal_module_download":
        cwd => "${drupal::variables::docRootPath}/sites/default/modules",
        command => "${drupal::variables::binWget} https://github.com/nmcteam/drupal-module/archive/master.zip && ${drupal::variables::binUnzip} master.zip",
        unless => "/usr/bin/test -d ${drupal::variables::docRootPath}/sites/default/modules/${drupal::variables::siteSlug}"
    }

    exec { "drupal_module_rename":
        cwd => "${drupal::variables::docRootPath}/sites/default/modules",
        command => "/bin/mv drupal-module-master ${drupal::variables::siteSlug}",
        creates => "${drupal::variables::docRootPath}/sites/default/modules/${drupal::variables::siteSlug}",
        require => Exec["drupal_module_download"]
    }

    file { "drupal_module_cleanup":
        ensure => absent,
        path => "${drupal::variables::docRootPath}/sites/default/modules/master.zip",
        require => Exec["drupal_module_rename"]
    }

}
