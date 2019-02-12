class ApplicationController < ActionController::Base
  rescue_from Exception do |exception|
    logger.error exception.message
    redirect_to root_path, flash: {error: exception.message}
  end
end
