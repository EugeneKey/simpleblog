require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of :title }
  it { should validate_length_of(:title).is_at_least(3).is_at_most(255) }
  it { should validate_uniqueness_of :title }
  it { should validate_presence_of :body }
  it { should have_many(:comments).dependent(:destroy) }
  it { should validate_presence_of :user_id }
  it { should belong_to :user }
end
