require 'rails_helper'

RSpec.describe User, type: :model do
  # Create user
  # user = User.new(name: 'John Doe')
  user = User.create(name: 'John Doe', posts_counter: 0)

  it 'User creator.' do
    expect(user).to be_valid
  end

  it 'User with a posts_counter should be valid.' do
    user.posts_counter = 0
    expect(user).to be_valid
  end

  it 'posts_counter of user should be integer.' do
    user.posts_counter = 0.5
    expect(user).to_not be_valid
  end

  it 'last 3 post for a new user should be empty.' do
    expect(user.last_three_posts.length).to eq(0)
  end

  # it 'last 3 post for a user shouldn\'t return more than 3 post.' do
  #   user = User.new(name: 'user1', posts_counter: 0)
  #   user.save
  #   5.times do
  #     Post.create(title: 'example', text: 'example', author: user).save
  #     p user.last_three_posts.length
  #   end
  #   expect(user.last_three_posts.length).to eq(3)
  # end

  it 'LastThreePosts length should be between 0 and 3' do
    expect(subject.last_three_posts).to be_kind_of Array
    expect(subject.last_three_posts.length).to be_between(0, 3)
  end
end
