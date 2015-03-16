require 'rails_helper'

 describe User do
 
   include TestFactories
 
  describe "#favorited(post)" do
    
    before do
      @post = associated_post
      @user = User.new(name: 'buddy', email:'buddy@dog.com', password: 'lovebones')
      @user.skip_confirmation!
      @user.save
    end
        
    it "returns 'nil' if the user has not favorited the post" do
      expect( @user.favorited(@post) ).to be_nil
    end
    
    it "returns the appropriate favorite if it exists" do
      @user.favorites.create(post_id: @post.id)
      expect( @user.favorited(@post) ).to eq(@post.favorites.find_by_user_id(@user.id))
    end
    
    it "returns 'nil' if the user has favorited other posts, but not @post" do
      @user.favorites.create(post_id: 10000)
      expect( @user.favorited(@post) ).to be_nil
    end
  end
end