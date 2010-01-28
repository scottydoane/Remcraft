# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include ExceptionNotifiable
  helper :all # include all helpers, all the time
  layout 'admin'
  
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '210906ad7e7e9d289f8a9bff61884adf'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  def has_permission?
    logged_in? ? true : redirect_to('/')
  end
  
  protected
    def add_breadcrumb name, url = ''
      @breadcrumbs ||= []
      url = eval(url) if url =~ /_path|_url|@/
      @breadcrumbs << [name, url]
    end

    def self.add_breadcrumb name, url, options = {}
      before_filter options do |controller|
        controller.send(:add_breadcrumb, name, url)
      end
    end
    add_breadcrumb 'Home', '/' 
    
  private
  
  def find_polymorphic_object
    sections = request.env['REQUEST_URI'].scan(%r{(\w*)/(\d*)}).reverse.reject { |x| x[1] == "" }
    sections.map! { |controller_name, id| [controller_name.singularize.camelize, id] }
    object, id = sections[0]
    eval("@#{object.downcase} = #{object}.find(#{id})")    
  end
end
