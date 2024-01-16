require 'redmine'
require_relative 'lib/redmine_rfc822_inline/mail_handler_patch.rb'
Redmine::Plugin.register :redmine_rfc822_inline do
  name 'Redmine RFC822 inline plugin'
  author 'Eugene Dubinin <eugend@commandprompt.com>'
  author_url 'https://www.commandprompt.com'
  description 'Adds support for inline message/rfc822 mime in inbound emails by converting any inline message parts to text/plain'
  version '0.2.1'
  requires_redmine :version_or_higher => '5.0'
  url 'https://github.com/commandprompt/redmine_rfc822'
end


MailHandler.send(:include, RedmineRFC822Inline::MailHandlerPatch)
