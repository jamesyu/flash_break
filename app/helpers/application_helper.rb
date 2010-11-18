# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  #outputs a single script block in the footer for all jsblock calls
  def jsblock(&block)
    if request.xhr?
      #output in place to allow for evalScripts
      javascript_tag &block
    else
      content_for :jsblock, &block
    end
  end
  
end
