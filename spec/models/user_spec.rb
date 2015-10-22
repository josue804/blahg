require 'rails_helper'

RSpec.describe User, type: :model do
  it {validate_presence_of :username}
  it {validate_presence_of :email}
  it {validate_presence_of :password}
end
