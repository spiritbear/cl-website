FACEBOOK_SETTINGS = YAML.load_file(File.join(Rails.root,'config','facebook.yml'))[Rails.env].with_indifferent_access
