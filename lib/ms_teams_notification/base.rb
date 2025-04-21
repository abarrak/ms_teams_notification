require 'uri'
require 'net/http'
require 'active_support/core_ext/object/blank'
require_relative 'logger'

module MsTeamsNotification
  class Base

    attr_reader :default_subject

    def initialize **kwargs
      @log = MsTeamsNotification::Logger.instance

      setup_configuration(**kwargs)
      configure_ms_teams
    end

    def send_ms_teams_notice text
      return unless @webhook_url.present?

      @log.msg "#{self_name}: sending ms teams notification."

      request = Net::HTTP::Post.new @webhook_url.request_uri
      request['Content-Type'] = 'application/json'
      request.body = { title: message_subject, text: text }.to_json

      http = Net::HTTP.new @webhook_url.host, @webhook_url.port
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      body = http.request(request)&.body
      @log.msg "#{self_name}: ms teams notification is sent."
      body
    rescue StandardError => e
      @log.msg "#{self_name}: ms teams notification failed.", level: :error
      @log.msg "#{self_name}: #{e.message}.", level: :error
    end

    private

    def self_name
      @klass ||= self.class.name.downcase.split(":").last
    end

    def setup_configuration **opts
      %i[notification_subject ms_teams_webhook].each do |sym|
          @log.msg "#{self_name}: argument #{sym} is empty.", level: :warn if opts[sym].blank?
          instance_variable_set "@#{sym.to_s}", opts[sym]
      end

      @default_subject = "Automated Notification."
    end

    def configure_ms_teams
      return unless @ms_teams_webhook.present?
      @webhook_url = URI.parse @ms_teams_webhook
    end

    def message_subject
      @notification_subject || default_subject
    end
  end
end
