require 'rails_helper'

RSpec.describe Favorite, type: :model do
	let(:topic) {Topic.create!(name: name, description: description)}
	let(:user) {User.create!(name: "Bloccit User", email: "user@bloccit.io", password: "helloworld")}
	let(:post) {topic.posts.create!(title: title, body: body, user: user)}
	let(:favorite) {Favorite.create!(post: post, user: user)}

	#Shoulda relationhip tests
	it {is_expected.to belong_to(:post)}
	it {is_expected.to belong_to(:user)}
end