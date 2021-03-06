require "spec_helper"

describe UserMailer do
  describe 'status' do
    let(:user) { create :developer }
    let(:mail) { UserMailer.status(user) }

    before :each do
        pdf_kit = double('PDFKit')
        PDFKit.stub(:new).and_return pdf_kit
        pdf_kit.stub(:to_pdf)
        pdf_kit.stub(:stylesheets).and_return []
    end

    it 'renders the subject' do
    	mail.subject.should == 'Projects status' 
    end

    it 'renders the receiber mail' do
    	mail.to.should == [user.email] 
    end

    it 'renders that the sender is correct' do
	    mail.from.should == ["teamvillage@mail.com"] 
	  end

    it 'renders name in the body' do 
        mail.body.encoded.should match(user.name) 
    end

    it 'add attachments' do 
    	mail.attachments.count.should eql(1)
    end
  end
end
