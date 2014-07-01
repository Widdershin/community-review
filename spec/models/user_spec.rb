require 'rails_helper'

describe User, :type => :model do
  it { should validate_presence_of :reddit_key }
end
