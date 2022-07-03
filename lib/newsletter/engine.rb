require 'acts_as_list'

module Newsletter
  class Engine < ::Rails::Engine
    isolate_namespace Newsletter

    config.generators do |g|
      g.test_framework :rspec, fixtures: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.assets false
      g.helper false
    end

    # an easy way to get the root of the gem's directory structure
    PLUGIN_ROOT = File.expand_path(File.join(File.dirname(__FILE__),'..','..'))
    # an easy way to get the root of the gem's assets
    def self.assets_path
      File.join(PLUGIN_ROOT,'assets')
    end

  end


  def self.authorized_for_roles?(user,roles=[])
    user_roles = if ::Newsletter.roles_method.present?
      user.send(::Newsletter.roles_method)
    elsif user.respond_to?(:roles)
      user.roles
    elsif user.respond_to?(:role)
      [user.role]
    else
      []
    end
    user_roles = [user_roles] unless user_roles.is_a?(Array)
    roles.detect{|role| user_roles.map(&:to_sym).map(&:to_s).include?(role.to_s)}.present?
  end

  def self.authorized?(user, object=nil)
    if object.eql?(::Newsletter::Design)
      # return true unless ::Newsletter.designs_require_authentication 
      return false if user.blank?
      return true unless self.settings.design_authorized_roles.present? 
      authorized_for_roles?(user, self.settings.design_authorized_roles)
    elsif object.eql?(::Newsletter::Newsletter)
      return true unless self.settings.newsletters_require_authentication 
      return false if user.blank?
      return true unless ::Newsletter.newsletter_authorized_roles.present? 
      authorized_for_roles?(user, ::Newsletter.newsletter_authorized_roles)
    else
      false
    end
  end
  
  def self.abilities
    <<-EOT
      if ::Newsletter.authorized?(user, ::Newsletter::Design)
        can :manage, [
          ::Newsletter::Design,
          ::Newsletter::Element,
          ::Newsletter::Area,
          ::Newsletter::Field
        ]
      end
      if ::Newsletter.authorized?(user, ::Newsletter::Newsletter)
        can :manage, [
          ::Newsletter::Newsletter,
          ::Newsletter::Piece,
          ::Newsletter::FieldValue
        ]
        can :read, [
          ::Newsletter::Design,
          ::Newsletter::Element,
          ::Newsletter::Area,
          ::Newsletter::Field
        ]
        can [:sort,:publish,:unpublish], ::Newsletter::Newsletter
        can :sort, ::Newsletter::Area
      end
      can :read, [
        ::Newsletter::Newsletter,
        ::Newsletter::Piece,
        ::Newsletter::FieldValue
      ]
      can :archive, ::Newsletter::Newsletter
    EOT
  end

  def self.settings
    Rails.application.config_for(:newsletter)
  end
  

end
