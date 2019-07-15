module RedmineRFC822Inline
  module MailHandlerPatch
    unloadable

    def self.included(base)
      base.class_eval do
        alias_method_chain :plain_text_body, :rfc822
      end
    end

    def plain_text_body_with_rfc822
      @plain_text_body = plain_text_body_without_rfc822
      # byebug
      @rfc822_part = email_parts_to_text(email.all_parts.select {|p| p.mime_type == 'message/rfc822'}).presence
      @plain_text_body += @rfc822_part if @rfc822_part
      @plain_text_body
    end
  end
end