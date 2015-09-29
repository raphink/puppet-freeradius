require 'spec_helper'

describe 'freeradius' do
  it { is_expected.to compile.with_all_deps }

  it { is_expected.to contain_service('radiusd').with({
    :ensure => 'running',
    :enable => true,
  }) }

  it { is_expected.to contain_package('freeradius')
    .with_ensure(:present)
    .that_comes_before('Service[radiusd]')
  }
end
