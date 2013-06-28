require 'spec_helper'

describe Task do

  describe '#to_s' do
    context 'when name \'super name\'' do
      subject { build(:task, :name => 'super name').to_s }
      it { should == 'super name' }
    end
  end

  describe '#close' do
  	before do
  		@task = build(:task, status: :new, persentage: 20)
  		@task.close
  	end

  	it 'task has status \'Closed\'' do
  		@task.status.should == :closed
  	end

  	it 'task has persentage == 100' do
  		@task.persentage.should == 100
  	end
  end
end
