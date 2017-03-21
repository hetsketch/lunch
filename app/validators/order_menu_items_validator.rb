class OrderMenuItemsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.map(&options[:field]).uniq.size == value.size
      record.errors[attribute] << "Category must be unique"
      duplicates = value - Hash[value.map{|obj| [obj[options[:field]], obj]}].values
      duplicates.each { |obj| obj.errors[options[:field]] << "Item from this category has already been taken" }
    end
  end
end