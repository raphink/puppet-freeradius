require 'spec_helper'

describe 'freeradius::mod' do
  let(:title) { 'perl' }

  context 'when passing no parameters' do
    it 'should fail' do
      expect { is_expected.to compile }.to raise_error(/Must pass content/)
    end
  end

  context 'when passing content' do
    let(:params) { {
      :content => 'foo',
    } }

    it { is_expected.to compile.with_all_deps }

    it { is_expected.to contain_file('/etc/raddb/mods-enabled/perl').with({
      :ensure  => :file,
      :owner   => 'root',
      :group   => 'radiusd',
      :mode    => '0640',
      :content => 'foo',
    }) }
  end

  context 'when ensuring absence' do
    let(:params) { {
      :ensure => 'absent',
    } }

    it { is_expected.to compile.with_all_deps }

    it { is_expected.to contain_file('/etc/raddb/mods-enabled/perl').with_ensure(:absent) }
  end
end
