require 'base64'
require 'json'
require 'kramdown'


def parse_heading(cell)
    level = cell["level"]
    source = cell["source"].join
    
    "<h#{level}>#{source}</h#{level}>"
end

def parse_code(cell)
    input = cell["input"].join
    language = cell["language"]
    
    cell["outputs"].each do |output|
        if output["output_type"] == "display_data"
            png = output["png"]
            imagen = Base64.decode64 png
            f = File.open 'imagen.png', 'wb'
            f.write imagen
        end
    end
    
    <<EOS
<pre><code>
#{input}
</code></pre>
EOS

end

def parse_markdown(cell)
    markdown = cell["source"].join
    Kramdown::Document.new(markdown).to_html
end


nb = JSON::parse(File.read ARGV[0])

puts <<EOS
<document>
<head>

<head>
<body>
EOS

nb["worksheets"].each do |ws|
    ws["cells"].each do |cell|
        if cell["cell_type"] == "heading"
            puts parse_heading(cell)
            
        elsif cell["cell_type"] == "code"
            puts parse_code(cell)
            
        elsif cell["cell_type"] == "markdown"
            puts parse_markdown(cell)
        end
        
    end
end

puts <<EOS
</body>
</document>
EOS
