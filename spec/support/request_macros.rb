module RequestMacros
  extend ActiveSupport::Concern

  module ClassMethods
    def login(role = nil)
      let!(:current_user){ FactoryGirl.create [:user, role].compact.join('_') }

      before do
        login_as current_user, scope: :user
      end
    end
  end
end