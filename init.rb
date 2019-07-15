require 'redmine'

Redmine::Plugin.register :redmine_rfc822_inline do
  name 'Redmine RFC822 inline plugin'
  author 'Eugene Dubinin <eugend@commandprompt.com>'
  author_url 'https://www.commandprompt.com'
  description 'Adds support for inline message/rfc822 mime in inbound emails by converting any inline message parts to text/plain'
  version '0.1.0'
  requires_redmine :version_or_higher => '3.4'
  url 'https://github.com/commandprompt/redmine_rfc822'
end

prepare_block = Proc.new do
  MailHandler.send(:include, RedmineRFC822Inline::MailHandlerPatch)
end

if Rails.env.development?
  ActionDispatch::Reloader.to_prepare { prepare_block.call }
else
  prepare_block.call
end