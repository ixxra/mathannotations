module Jekyll
  class TagPage < Page
    def initialize(site, base, dir, tag, posts)
        @site = site
        @base = base
        @dir = dir
        @name = 'index.html'
        
        self.process @name
        self.read_yaml File.join(base, '_layouts'), 'tag_index.html'
        self.data['tag'] = tag
        self.data['title'] = "Tag: #{tag}"
        
        _posts = posts.map {|post| {'title' => post.title, 'path' => post.id}}
        
        self.data['posts'] = _posts
    end
  end
    
  class TagPageGenerator < Generator
    safe true

    def generate(site)
        if site.layouts.key? 'tag_index'
            site.tags.each do |tag, posts|
                site.pages << TagPage.new(site, site.source, File.join('tag', tag),  tag, posts)
            end
        end
    end
  end
end
