module ApplicationHelper
  def field_error(model, attribute)
    content_tag :span do
      model.errors[attribute].first
    end
  end
end
