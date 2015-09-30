require 'beaker-rspec'

install_puppet_agent_on hosts, {}

def puppet_example(name)
  spec_dir = Pathname.new(__FILE__).parent
  examples_dir = File.join(spec_dir, '..', 'examples')
  File.read(File.join(examples_dir, "#{name}.pp"))
end

RSpec.configure do |c|
  module_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  module_name = module_root.split('-').last

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module
    puppet_module_install(:source => module_root, :module_name => module_name)

    hosts.each do |host|
      on host, puppet('module','install','puppetlabs-stdlib'), { :acceptable_exit_codes => [0,1] }
    end
  end
end
