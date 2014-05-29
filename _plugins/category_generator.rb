module Jekyll

  class CategoryPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_index.html')
      self.data['category_page'] = true
      self.data['category'] = category
      
      words = (category.split /[-_ ]+/).map do |w|
        w.capitalize
      end
            
      self.data['title'] = "#{words.join ' '}"
    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
        site.categories.keys.each do |category|
          site.pages << CategoryPage.new(site, site.source, category, category)
        end
    end
  end

end
