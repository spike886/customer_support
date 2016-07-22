require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  context 'Attributes' do
    it{ is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
    it{ is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(null:false) }
  end

  describe 'factory' do
    subject { create :admin_user }

    it { is_expected.to be_valid }
  end
end
