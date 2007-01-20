# gettext tasks

require 'gettext/utils'

desc "Create mo-files for L10n" 
task :makemo do
  GetText.create_mofiles(true, "po", "locale")
end

desc "Update pot/po files to match new version."
task :updatepo do
  ALUMNIONRAILS_TEXT_DOMAIN = "alumnionrails" 
  ALUMNIONRAILS_VERSION     = "AlumniOnRails 0.0.0" 
  GetText.update_pofiles(ALUMNIONRAILS_TEXT_DOMAIN, Dir.glob("{app,lib,bin}/**/*.{rb,rhtml}"), ALUMNIONRAILS_VERSION)
end