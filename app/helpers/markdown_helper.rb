# frozen_string_literal: true

class CodeRayify < Redcarpet::Render::HTML
  def block_code(code, language = 'ruby')
    CodeRay.scan(code, language).div
  end
end

module MarkdownHelper
  CODERAY_RENDER_OPTIONS = {
    filter_html: true,
    hard_wrap:   true,
  }.freeze

  MARKDOWN_OPTIONS = {
    autolink:           true,
    no_intra_emphasis:  true,
    fenced_code_blocks: true,
    gh_blockcode:       true,
    strikethrough:      true,
    lax_html_blocks:    true,
    superscript:        true,
  }.freeze

  def markdown(blogtext)
    coderayified = CodeRayify.new(CODERAY_RENDER_OPTIONS)

    markdown = Redcarpet::Markdown.new(coderayified, MARKDOWN_OPTIONS)
    markdown.render(blogtext).html_safe
  end
end
