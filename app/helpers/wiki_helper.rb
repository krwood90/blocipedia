module WikiHelper
    def markdown(text)
       # extensions = [:tables, :fenced_code_blocks, :autolink, :strikethrough, :superscript, :underline, :highlight, :quote, :footnotes]
       markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, 
         autolink: true,
         tables: true,
         fenced_code_blocks: true,
         strikethrough: true,
         superscript: true,
         underline: true,
         highlight: true,
         quote: true,
         footnotes: true)
       markdown.render(text).html_safe
    end
end
