require 'acceptance/acceptance_helper'

feature 'View the post and all comments to it', '
  All user can do it

' do
  given!(:post) { create(:post) }
  given!(:comments) { create_list(:comment, 3, post: post) }

  scenario 'View post and comments' do
    visit root_path
    click_on post.title

    expect(page).to have_content post.body
    comments.each do |c|
      expect(page).to have_content c.text
    end
  end
end