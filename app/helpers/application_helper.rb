module ApplicationHelper
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown(blogtext)
    render_options = {
      filter_html: true,
      hard_wrap:   true,
    }

    coderayified = CodeRayify.new(render_options)

    markdown_options = {
      autolink:           true,
      no_intra_emphasis:  true,
      fenced_code_blocks: true,
      gh_blockcode:       true,
      strikethrough:      true,
      lax_html_blocks:    true,
      superscript:        true,
    }

    markdown = Redcarpet::Markdown.new(coderayified, markdown_options)
    markdown.render(blogtext).html_safe
  end

  def full_title(page_title)
    base_title = 'Daniel Lockhart'
    if page_title.blank?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
