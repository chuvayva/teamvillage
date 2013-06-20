require 'spec_helper'

describe Project do
  describe '#to_s' do
  	it 'should return name' do
  		p = Project.new(:name => 'super name')
  		p.to_s.should == 'super name'
  	end
  end
end
