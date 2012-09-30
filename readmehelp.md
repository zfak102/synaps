# select on a form builder
<%= f.select(:city_id, ...) %>

If you are using select (or similar helpers such as collection_select, select_tag) to set a belongs_to association you must pass the name of the foreign key (in the example above city_id), not the name of association itself. If you specify city instead of city_id Active Record will raise an error along the lines of ActiveRecord::AssociationTypeMismatch: City(#17815740) expected, got String(#1138750) when you pass the params hash to Person.new or update_attributes. Another way of looking at this is that form helpers only edit attributes. You should also be aware of the potential security ramifications of allowing users to edit foreign keys directly. You may wish to consider the use of attr_protected and attr_accessible. For further details on this, see the Ruby On Rails Security Guide.


I will need to below for my links data button

grouped_collection_select(object, method, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {}) public

Returns <select>, <optgroup> and <option> tags for the collection of existing return values of method for object's class. The value returned from calling method on the instance object will be selected. If calling method returns nil, no selection is made without including :prompt or :include_blank in the options hash.

Parameters:

    object - The instance of the class to be used for the select tag

    method - The attribute of object corresponding to the select tag

    collection - An array of objects representing the <optgroup> tags.

    group_method - The name of a method which, when called on a member of collection, returns an array of child objects representing the <option> tags.

    group_label_method - The name of a method which, when called on a member of collection, returns a string to be used as the label attribute for its <optgroup> tag.

    option_key_method - The name of a method which, when called on a child object of a member of collection, returns a value to be used as the value attribute for its <option> tag.

    option_value_method - The name of a method which, when called on a child object of a member of collection, returns a value to be used as the contents of its <option> tag.

Example object structure for use with this method:

class Continent < ActiveRecord::Base
  has_many :countries
  # attribs: id, name
end
class Country < ActiveRecord::Base
  belongs_to :continent
  # attribs: id, name, continent_id
end
class City < ActiveRecord::Base
  belongs_to :country
  # attribs: id, name, country_id
end

Sample usage:

grouped_collection_select(:city, :country_id, @continents, :countries, :name, :id, :name)

Possible output:

<!-- <select name="city[country_id]">
  <optgroup label="Africa">
    <option value="1">South Africa</option>
    <option value="3">Somalia</option>
  </optgroup>
  <optgroup label="Europe">
    <option value="7" selected="selected">Denmark</option>
    <option value="2">Ireland</option>
  </optgroup>
</select> -->

