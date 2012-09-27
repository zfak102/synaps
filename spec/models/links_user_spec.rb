# == Schema Information
#
# Table name: links_users
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  links_table_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe LinksUser do
  pending "add some examples to (or delete) #{__FILE__}"
end
