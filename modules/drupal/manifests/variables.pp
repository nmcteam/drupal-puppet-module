class drupal::variables {

    #######################################################################
    # Binaries
    #######################################################################

    $binDrush = "/usr/bin/drush"
    $binMysql = "/usr/bin/mysql"
    $binWget = "/usr/bin/wget"
    $binUnzip = "/usr/bin/unzip"

    #######################################################################
    # Site database
    #######################################################################

    $dbName = "CHANGE ME"
    $dbUsername = "CHANGE ME"
    $dbPassword = "CHANGE ME"
    $dbHost = "localhost"
    $dbPort = 3306

    #######################################################################
    # Site settings
    #######################################################################

    $siteTitle = "My Drupal Website"
    $siteSlug = "mydrupalwebsite"
    $siteLocale = "en-US"
    $siteAdminUsername = "admin"
    $siteAdminPassword = "password"

    #######################################################################
    # SMTP settings
    #######################################################################

    $smtpHost = "CHANGE ME"
    $smtpPort = 587
    $smtpUsername = "CHANGE ME"
    $smtpPassword = "CHANGE ME"
    $smtpFromEmail = "CHANGE ME"
    $smtpFromName = "CHANGE ME"
    $smtpDebug = 0

    #######################################################################
    # Locale settings
    #######################################################################

    $siteTimezone = "America/New_York"
    $siteCountry = "US"

    #######################################################################
    # Site paths
    #######################################################################

    $rootPath = "/var/www"
    $publicFolderName = "public"
    $docRootPath = "${rootPath}/${publicFolderName}"

}
