define drupal::module_remove {

    #######################################################################
    # Dependencies
    #######################################################################

    $moduleName = $title

    include drupal::drush
    include drupal::site

    Class['drupal::site'] -> Drupal::Module_remove[$moduleName]

    #######################################################################
    # Disable module
    #######################################################################

    exec { "disable_drupal_module_${moduleName}":
        cwd => $drupal::variables::docRootPath,
        command => "${drupal::variables::binDrush} dis ${moduleName} -y",
        timeout => 0,
        onlyif => "${drupal::variables::binDrush} pm-list --status=enabled --type=module | grep ${moduleName}"
    }

}
