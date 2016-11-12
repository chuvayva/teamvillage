require 'spec_helper'

describe User do
  
  describe '#role?' do

    context 'when user is admin' do
      subject { build :admin }

    	it { should be_role(:admin) }
    end
  end

  describe '#to_s' do

    context 'when name \'super name\'' do
      subject { build(:user, :name => 'super name').to_s }
      it {should == 'super name'}
    end
  end

  describe '#executing_tasks' do
    before :all do
      @dev = create :developer
      @project1 = create :project
      project2 = create :project
      
      create(:task, project: @project1, executer: @dev) 
      create(:task, project: project2, executer: @dev) 
    end

    context 'project is not given' do
      subject { @dev.executing_tasks }
      it 'results count == 2' do
       subject.count.should == 2
      end
    end

    context 'project is given' do
      subject { @dev.executing_tasks(@project1) }
      it 'results count == 1' do
        subject.count.should == 1
      end
    end
  end
  
  describe '#send_status_mail' do
    let(:projects) { [create(:project)] }
    let(:user) { create :developer, projects: projects }
    
    before :each do
        pdf_kit = double('PDFKit')
        PDFKit.stub(:new).and_return pdf_kit
        pdf_kit.stub(:to_pdf)
        pdf_kit.stub(:stylesheets).and_return []
    end

    it 'sends a e-mail' do
      user.send_status_mail
      ActionMailer::Base.deliveries.last.to.should == [user.email]
    end
  end
end
