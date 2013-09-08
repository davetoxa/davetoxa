module ControllerMacros
  extend ActiveSupport::Concern

  module ClassMethods
    def login(role = nil)
      let!(:current_user){ FactoryGirl.create [:user, role].compact.join('_') }

      before do
        controller.stub :authenticate_user!
        controller.stub :current_user => current_user
        controller.stub :add_secure_model_data
      end
    end
  end
end
