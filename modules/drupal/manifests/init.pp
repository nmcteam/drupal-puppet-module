class drupal {

    #######################################################################
    # Install drush
    #######################################################################

    include drupal::variables
    include drupal::drush

    #######################################################################
    # Install Drupal, custom theme, custom module
    #######################################################################

    include drupal::site
    include drupal::libraries::ckeditor
    include drupal::theme
    include drupal::module_custom

    #######################################################################
    # Enable modules
    #######################################################################

    drupal::module_add { "admin_menu":
        enableModules => ["admin_menu", "admin_menu_toolbar"]
    }
    drupal::module_add { "advanced_help": }
    drupal::module_add { "any_menu_path": }
    drupal::module_add { "apc": }
    drupal::module_add { "backup_migrate": }
    drupal::module_add { "ckeditor": }
    drupal::module_add { "ckeditor_link": }
    drupal::module_add { "ctools": }
    drupal::module_add { "date":
        enableModules => ["date", "date_migrate", "date_views"]
    }
    drupal::module_add { "devel":
        enableModules => ["devel", "devel_generate"]
    }
    drupal::module_add { "devel_themer": }
    drupal::module_add { "disable_term_node_listings": }
    drupal::module_add { "disqus": }
    drupal::module_add { "entity": }
    drupal::module_add { "entityreference": }
    drupal::module_add { "entitycache": }
    drupal::module_add { "imce": }
    drupal::module_add { "imce_filefield": }
    drupal::module_add { "jquery_update": }
    drupal::module_add { "libraries": }
    drupal::module_add { "link": }
    drupal::module_add { "markdown": }
    drupal::module_add { "manual-crop":
        enableModules => ["manualcrop"]
    }
    drupal::module_add { "menu_block": }
    drupal::module_add { "menu_position": }
    drupal::module_add { "metatag":
        enableModules => ["metatag", "metatag_ui"]
    }
    drupal::module_add { "migrate": }
    drupal::module_add { "migrate_extras": }
    drupal::module_add { "pathauto": }
    drupal::module_add { "smtp": }
    drupal::module_add { "token": }
    drupal::module_add { "transliteration": }
    drupal::module_add { "views":
        enableModules => ["views", "views_ui"]
    }
    drupal::module_add { "views_datasource":
        enableModules => ["views_datasource", "views_json"]
    }
    drupal::module_add { "webform": }
    drupal::module_add { "webform_validation": }
    drupal::module_add { "xmlsitemap":
        enableModules => ["xmlsitemap", "xmlsitemap_engines", "xmlsitemap_custom", "xmlsitemap_node", "xmlsitemap_taxonomy"]
    }

    #######################################################################
    # Disable modules
    #######################################################################

    drupal::module_remove { "toolbar": }
    drupal::module_remove { "color": }
    drupal::module_remove { "overlay": }
    drupal::module_remove { "rdf": }
    drupal::module_remove { "locale": }

}
