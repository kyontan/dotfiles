#require "irb/ext/save-history"
IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_PATH] = File::expand_path("~/.irb.history")

require "irb/completion"

begin
  require "pp"
  require "awesome_print"
  AwesomePrint.irb!
rescue LoadError
  # Missing goodies, bummer
end
