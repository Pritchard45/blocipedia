require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:user) { create(:user) }
  let(:wiki) { create(:wiki, user: user) }

  describe "attributes" do
    it "has title and body attributes" do
      expect(wiki).to have_attributes(title: "MyString", body: "MyText")
    end
  end
end
