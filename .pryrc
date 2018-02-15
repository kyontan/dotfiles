begin
  require "hirb"
  require "hirb-unicode"
rescue LoadError
  # Missing goodies, bummer
end

if defined? Hirb
  # Slightly dirty hack to fully support in-session Hirb.disable/enable toggling
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |*args|
        Hirb::View.view_or_page_output(args[1]) || @old_print.call(*args)
      end
    end

    def disable_output_method
      Pry.config.print = @old_print
      @output_method = nil
    end
  end

  Hirb.enable
end

# if defined? Bundler
#   Bundler.require
#   STDERR.puts Dir.pwd
# end

require "base64"
require "json"

Pry.commands.delete '.<shell command>'

Pry.commands.block_command (/^\.$/), "Evaluate string of `pbpaste`", keep_retval: true do
  string = `pbpaste`
  puts Pry::Helpers::BaseHelpers.colorize_code(string)
  target.eval string
end
