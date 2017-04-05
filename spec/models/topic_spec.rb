require 'rails_helper'

RSpec.describe Topic, type: :model do
  	let(:name) {RandomData.random_sentence}
	let(:description) {RandomData.random_paragraph}
	let(:public) {true}
	let(:topic) {Topic.create!(name: name, description: description)}

	# Relational tests
	it {is_expected.to have_many(:posts)}

	# Validate tests
	it {is_expected.to validate_presence_of(:name)}
	it {is_expected.to validate_presence_of(:description)}

	it {is_expected.to validate_length_of(:name)}
	it {is_expected.to validate_length_of(:description)}

	describe "attributes" do
		it "has name, description, and public attributes" do
			expect(topic).to have_attributes(name: name, description: description, public: public)
		end
		it "is public by default" do
			expect(topic.public).to be(true)
		end
	end
end