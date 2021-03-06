require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should have_many :tags}
  it { should validate_presence_of :title}
  it { should validate_presence_of :body}
end
