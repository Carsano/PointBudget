require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET show' do
    login_user

    it "should have a current_user" do
      # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
      expect(subject.current_user).to_not eq(nil)
    end


    it 'renders the show template' do
      get :show
      expect(response).to render_template('show')
    end
  end

end
