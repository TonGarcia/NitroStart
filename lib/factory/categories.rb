module Factory
  class Categories
    def self.create
      system_names = [
        :education, :health_care, :food,
        :work, :transport, :lounge, :security,
        :social_entrepreneurship, :fin_tech, :law,
        :marketing, :art_design_fashion, :biotechnology, :science
      ]

      system_names.each do |category_name|
        category = Category.find_or_create_by name: category_name
        category.errors.empty? ? puts("\t #{category}".green) : puts("\t #{category}".red)
      end
    end
  end
end