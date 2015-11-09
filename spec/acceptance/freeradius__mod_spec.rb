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

    describe command('radiusd -XC') do
      its(:exit_status) { is_expected.to eq 0 }
      its(:stdout) { is_expected.to match /auth\.pl/ }
    end
  end
end
