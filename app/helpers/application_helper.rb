module ApplicationHelper
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
