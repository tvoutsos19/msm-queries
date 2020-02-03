module ActiveRecord
  class Relation
    def to_s
      row_count = count
      
      # "Array containing #{row_count} #{model} #{"record".pluralize(row_count)}"
      "#{self.class} (array with #{row_count} #{model} instances inside)"

    end
  end
end
