# require 'active_support/lazy_load_hooks'
# require 'web_console/repl'
# require 'web_console/repl_session'
require 'active_support/dependencies/autoload'

module ActionDispatch
  module WebConsole
    extend ActiveSupport::Autoload

    autoload :REPL
    autoload :REPLSession
    autoload :ViewHelper
    autoload :ControllerHelper

    class << self
      attr_accessor :binding_of_caller_available

      alias_method :binding_of_caller_available?, :binding_of_caller_available
    end
  end
end

begin
  require 'binding_of_caller'
  ActionDispatch::WebConsole.binding_of_caller_available = true
rescue LoadError
  ActionDispatch::WebConsole.binding_of_caller_available = false
end
