class drupal::libraries::ckeditor {

    #######################################################################
    # Dependencies
    #######################################################################

    include drupal::variables
    include drupal::drush
    include drupal::site

    Class['drupal::site'] -> Class['drupal::libraries::ckeditor']

    #######################################################################
    # Install CKEditor library
    #######################################################################

    exec { "drupal_library_download_ckeditor":
        cwd => "${drupal::variables::docRootPath}/sites/all/libraries",
        command => "/usr/bin/wget http://download.cksource.com/CKEditor/CKEditor/CKEditor%204.2/ckeditor_4.2_full.zip && unzip ckeditor_4.2_full.zip",
        creates => "${drupal::variables::docRootPath}/sites/all/libraries/ckeditor"
    }

}
