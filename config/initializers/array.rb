class Array
  def to_view_array
    view_array = []

    self.each_with_index do |element, i|

      if element.is_a?Hash
        element_values = element.values
        append_element = [element_values.last, element_values.first]
      else
        append_element = [element, i]
      end

      view_array.append(append_element)
    end

    view_array
  end
end