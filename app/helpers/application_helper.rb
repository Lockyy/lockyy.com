module ApplicationHelper

  def markdown(blogtext)
    renderOptions = { hard_wrap: true, 
                      filter_html: true }

    markdownOptions = { autolink: true, 
                        no_intra_emphasis: true, 
                        fenced_code_blocks: true, 
                        gh_blockcode: true }
                        
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(renderOptions), markdownOptions)
    markdown.render(blogtext).html_safe
  end

  def full_title(page_title)
    base_title = "Daniel Lockhart"
    if page_title.blank?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

end