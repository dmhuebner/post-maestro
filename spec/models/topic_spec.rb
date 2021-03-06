require 'rails_helper'

RSpec.describe Topic, type: :model do
	let(:topic) {create(:topic)}

	# Relational tests
	it {is_expected.to have_many(:posts)}

	# Validate tests
	it {is_expected.to validate_presence_of(:name)}
	it {is_expected.to validate_presence_of(:description)}

	it {is_expected.to validate_length_of(:name)}
	it {is_expected.to validate_length_of(:description)}

	describe "attributes" do
		it "has name, description, and public attributes" do
			expect(topic).to have_attributes(name: topic.name, description: topic.description)
		end
		it "is public by default" do
			expect(topic.public).to be(true)
		end
	end
end
