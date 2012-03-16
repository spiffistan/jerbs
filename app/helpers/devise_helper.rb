module DeviseHelper
  # A simple way to show error messages for the current devise resource. If you need
  # to customize this method, you can either overwrite it in your application helpers or
  # copy the views to your application.
  #
  # This method is intended to stay simple and it is unlikely that we are going to change
  # it to add more behavior or options.
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation" class="alert alert-error">
      <h4 class="alert-heading">#{sentence}</h4>
      <p><ul>#{messages}</ul></p>
    </div>
    HTML

    html.html_safe
  end


  def flash_messages

    html = ""

    logger.info flash.inspect

    unless flash[:notice].blank?
      html = <<-HTML
      <div class="alert alert-success">
        #{flash[:notice]}
      </div>
      HTML
    end

    unless flash[:error].blank?
      html = <<-HTML
      <div class="alert alert-error">
        #{flash[:error]}
      </div>
      HTML
    end

    unless flash[:alert].blank?
      html = <<-HTML
      <div class="alert alert-warning">
        #{flash[:alert]}
      </div>
      HTML
    end

    unless flash[:message].blank?
      html = <<-HTML
      <div class="alert alert-info">
        #{flash[:message]}
      </div>
      HTML
    end

    html.html_safe
  end
end
