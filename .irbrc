require "brice/init"

#require "irb/ext/save-history"
IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_PATH] = File::expand_path("~/.irb.history")

require "irb/completion"
#単語補完

require "pp"
require "awesome_print"
AwesomePrint.irb!

