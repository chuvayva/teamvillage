require "spec_helper"

describe UserMailer do
  describe 'status' do
    let(:user) { create :developer }
    let(:mail) { UserMailer.status(user) }

    before :each do
        pdf_kit = mock('PDFKit')
        PDFKit.stub(:new).and_return pdf_kit
        pdf_kit.stub(:to_pdf)
    end

    it 'renders the subject' do
    	mail.subject.should == 'Projects status' 
    end

    it 'renders the receiber mail' do
    	mail.to.should == [user.email] 
    end

    it 'renders that the sender is correct' do
	    mail.from.should == ["from@example.com"] 
	  end

    it 'renders name in the body' do 
        mail.body.encoded.should match(user.name) 
    end
    it 'add attachments' do 
    	mail.attachments.should have(1).attachment
    end
  end
end
