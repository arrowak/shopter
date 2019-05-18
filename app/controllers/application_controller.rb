class ApplicationController < ActionController::Base
  breadcrumb 'Home', "/store", match: :exclusive
  layout 'userlayout'
end
