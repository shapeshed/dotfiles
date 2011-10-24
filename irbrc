require 'irb/ext/save-history'

%w(rubygems hirb interactive_editor).each do |gem|
  begin
    require gem
  rescue LoadError => err
    %x{gem install #{gem} --no-ri --no-rdoc} unless Gem::Specification::find_by_name(gem)
    Gem.refresh 
    require gem
  end
end

# Load the readline module.
IRB.conf[:USE_READLINE] = true

# Remove the annoying irb(main):001:0 and replace with >>
IRB.conf[:PROMPT_MODE]  = :SIMPLE

# Automatic Indentation
IRB.conf[:AUTO_INDENT]= true

# Save History between irb sessions
IRB.conf[:SAVE_HISTORY] = 100

# Enable Wirble
Wirble.init

# Enable Wirble Colors
Wirble.colorize


