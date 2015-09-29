require 'spec_helper_acceptance'

describe 'freeradius' do
  context 'when running puppet code' do
    pp = "class { 'freeradius': }"

    it 'should apply with no errors' do
      apply_manifest(pp, :catch_failures => true)
    end

    it 'should converge on the first run' do
      apply_manifest(pp, :catch_changes => true)
    end

    describe service('radiusd') do
      it { is_expected.to be_running }
      it { is_expected.to be_enabled }
    end

    describe port('1812') do
      it { is_expected.to be_listening.on('0.0.0.0').with('udp') }
    end
  end
end
