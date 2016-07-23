require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_length_of(:password).is_at_least(5).is_at_most(40) }
    it { is_expected.to validate_confirmation_of :password }
    it { is_expected.to validate_presence_of :name }
  end

  context 'Attributes' do
    it{ is_expected.to have_db_column(:name).of_type(:string).with_options(null:false) }
    it{ is_expected.to have_db_column(:email).of_type(:string).with_options(index: true, null:false) }
    it{ is_expected.to have_db_column(:password_digest).of_type(:string).with_options(null: false) }
  end

  context 'Associations' do
    it{ is_expected.to have_many :requests }
    it{ is_expected.to have_many :request_comment }
  end

  describe 'factory' do
    subject { create :customer }

    it { is_expected.to be_valid }
  end
end
