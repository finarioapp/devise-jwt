# frozen_string_literal: true

require 'active_support/concern'

module Devise
  module Models
    # Model that will be authenticatable with the JWT strategy
    #
    # @see [Warden::JWTAuth::Interfaces::UserRepository]
    # @see [Warden::JWTAuth::Interfaces::User]
    module JwtAuthenticatable
      extend ActiveSupport::Concern
      module ClassMethods
        Devise::Models.config(self, :jwt_revocation_strategy)
      end


      def self.find_for_jwt_authentication(sub)
        base.class_eval do
          find(sub)
        end
      end

      def jwt_subject
        id
      end
    end
  end
end
