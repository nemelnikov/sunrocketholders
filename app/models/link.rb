# == Schema Information
#
# Table name: links
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string
#  rocket     :string
#  telegram   :string
#  tinkoff    :string
#  updated_at :datetime         not null
#  weight     :integer
#

class Link < ApplicationRecord
end
