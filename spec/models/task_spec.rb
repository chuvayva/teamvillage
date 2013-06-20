require 'spec_helper'

describe Task do
  describe '#to_s' do
  	it 'should return name' do
  		t = Task.new(:name => 'super name')
  		t.to_s.should == 'super name'
  	end
  end
end
