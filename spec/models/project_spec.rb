require 'spec_helper'

describe Project do
  describe '#to_s' do
    context 'when name \'super name\'' do
      subject { build(:project, :name => 'super name').to_s }
      it {should == 'super name'}
    end
  end
end
