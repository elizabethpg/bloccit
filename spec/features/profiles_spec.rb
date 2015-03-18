require 'rails_helper'
 
describe "Visiting profiles" do
  include Warden::Test::Helpers
  include TestFactories
  Warden.test_mode!

 
  before do
    @user = authenticated_user
    @post = associated_post(user: @user)
    @comment = Comment.new(user: @user, body: "A Comment")
    allow(@comment).to receive(:send_favorite_emails)
    @comment.save
  end
 
  describe "not signed in" do
 
     it "shows profile" do
       visit user_path(@user)
       expect(current_path).to eq(user_path(@user))

       expect( page ).to have_content(@user.name)
       expect( page ).to have_content(@post.title)
       expect( page ).to have_content(@comment.body)
     end
  end

  describe "Visting members own profile" do
    before do
      user = authenticated_user
      login_as(user, :scope => :user)
    end

    describe "signed in" do

    it "shows a users own profile" do
       visit user_path(@user)
       expect(current_path).to eq(user_path(@user))

       expect( page ).to have_content(@user.name)
       expect( page ).to have_content(@post.title)
       expect( page ).to have_content(@comment.body)
     end
   end
  end
end