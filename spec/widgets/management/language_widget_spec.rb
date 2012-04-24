require 'spec_helper'

describe Management::LanguageWidget do
  has_widgets do |root|
    root << widget('management/language')
  end
  
end
