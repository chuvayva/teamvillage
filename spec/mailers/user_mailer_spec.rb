require "spec_helper"

describe UserMailer do
  describe 'status' do
    let(:user) { create :developer }
    let(:mail) { UserMailer.status(user) }

   #  it 'renders the subject' do
   #  	mail.subject.should == 'Projects status' 
   #  end

   #  it 'renders the receiber mail' do
   #  	mail.to.should == [user.email] 
   #  end

   #  it 'renders that the sender is correct' do
	  #   mail.from.should == ["from@example.com"] 
	  # end

   #  it 'renders name in the body' do 
   #      mail.body.encoded.should match(user.name) 
    # end
    it 'add attachments' do 
    	mail.attachments.should have(0).attachment
    end
  end
end
