require 'spec_helper'
require 'support/shared_examples/view_helpers'
SimpleCov.command_name 'test:unit'

module Draper
  describe Draper do
    describe '.setup_action_controller' do
      it 'includes api only compatibility if base is ActionController::API and ' \
         'rails_api_compatibility is enabled' do
        base = ActionController::API
        Draper.rails_api_compatibility = true

        Draper.setup_action_controller(base)

        expect(base.included_modules).to include(Draper::Compatibility::ApiOnly)
      end

      it 'does not include api only compatibility if base is ActionController::Base' do
        base = ActionController::Base

        Draper.setup_action_controller(base)

        expect(base.included_modules).not_to include(Draper::Compatibility::ApiOnly)
      end

      it 'does not include api only compatibility if base is ActionController::API and ' \
         'rails_api_compatibility is disabled' do
        base = ActionController::API
        Draper.rails_api_compatibility = false

        Draper.setup_action_controller(base)

        expect(base.included_modules).not_to include(Draper::Compatibility::ApiOnly)
      end
    end
  end
end
