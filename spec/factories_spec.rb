require 'spec_helper'

describe 'Factories' do
  FactoryGirl.factories.map(&:name).each do |factory_name|
    describe factory_name do
      it 'is valid' do
        expect(build factory_name).to be_valid
      end
    end
  end
end
