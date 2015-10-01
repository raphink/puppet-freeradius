require 'puppetlabs_spec_helper/rake_tasks'
require 'github_readme_generator/task'

GitHubReadmeGenerator::RakeTask.new :readme do |config|
  config.title = 'FreeRADIUS Puppet module'  # Dynamic using github lib?
  config.badges = {
    :puppetforge_version => {
      :badge   => :puppetforge,
      :type    => 'v',
      :user    => 'raphink',    # Dynamic from metadata.json
      :project => 'freeradius', # Dynamic from metadata.json
    },
    :puppetforge_downloads => {
      :badge   => :puppetforge,
      :type    => 'dt',
      :user    => 'raphink',    # Dynamic from metadata.json
      :project => 'freeradius', # Dynamic from metadata.json
    },
    :travis => {
      :badge   => :travis,
      :user    => 'raphink', # Dynamic from git
      :project => 'puppet-freeradius', # Dynamic from git
    },
  }
end
