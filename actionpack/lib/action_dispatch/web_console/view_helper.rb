module ActionDispatch
  module WebConsole
    module ViewHelper
      def console(console_binding = nil)
        if WebConsole.binding_of_caller_available?
          console_binding ||= binding.callers[1]
        end

        if controller.should_render_console
          @console_session = WebConsole::REPLSession.create(
            repl_binding: console_binding
          )

          controller.should_render_console = false
          render('rescues/web_console')
        end
      end
    end
  end
end
