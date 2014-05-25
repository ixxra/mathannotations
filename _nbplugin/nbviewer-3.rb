module Jekyll
    class NotebookParser
    
    end

    class NBViewerGenerator < Generator
        safe true
        
        def generate(site)
            site.static_files.each do |sf|
                if sf.path =~ /.*?\.ipynb/
                    target_dir = sf.path.chomp '.ipynb'
                    target = "#{target_dir}/index.md"   
                  Dir.mkdir target_dir unless Dir.exist? target_dir
                    if File.exist? target
                        f = File.open(target, 'w')
                    else
                        f = File.new(target, 'w')
                    end
                    
                    layout = <<EOF
---
layout: post
---

#{target}                    
EOF
                    f.write(layout)
                end
            end
        end
    end
end
