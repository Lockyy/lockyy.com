module ApplicationHelper

  def markdown(blogtext)
    renderOptions = {hard_wrap: true, filter_html: true}
    markdownOptions = {autolink: true, no_intra_emphasis: true, fenced_code_blocks: true}
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(renderOptions), markdownOptions)
    markdown.render(blogtext).html_safe
  end

end