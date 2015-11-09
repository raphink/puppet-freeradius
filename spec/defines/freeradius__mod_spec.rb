require 'spec_helper'

describe 'freeradius::mod' do
  let(:title) { 'perl' }

  it { is_expected.to compile.with_all_deps }
end
