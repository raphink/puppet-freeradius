require 'spec_helper_acceptance'

describe 'freeradius::mod' do
  context 'when running puppet code' do
    pp = <<-EOF
      class { 'freeradius': }
      freeradius::mod { 'perl':
        ensure  => present,
        content => 'perl {
          filename = ${modconfdir}/${.:instance}/auth.pl
        }
        ',
      }
    EOF

    it 'should apply with no errors' do
      apply_manifest(pp, :catch_failures => true)
    end

    it 'should converge on the first run' do
      apply_manifest(pp, :catch_changes => true)
    end

    describe file('/etc/raddb/mods-enabled/perl') do
      it { is_expected.to be_file }
      it { is_expected.to be_owned_by('root') }
      it { is_expected.to be_grouped_into('radiusd') }
      it { is_expected.to be_mode('0640') }
      its(:content) { is_expected.to match(/auth\.pl$/) }
    end
  end
end
