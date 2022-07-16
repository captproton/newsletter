require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "returns the full name for a user" do
    user = create(:user, first_name: 'Chipper', last_name: 'Roe')

    expect(user.full_name).to eq 'Roe'
  end
  
end
