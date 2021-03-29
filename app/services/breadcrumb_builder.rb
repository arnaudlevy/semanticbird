class BreadcrumbBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder

  def render
    @elements.collect do |element|
      render_element(element)
    end.join('')
  end

  def render_element(element)
    name = compute_name(element)
    path = compute_path(element)
    content = @context.link_to_unless_current name, path
    class_name = 'breadcrumb-item'
    class_name += ' active' if @context.current_page? path
    @context.content_tag(:li, content, { class: class_name })
  end
end
