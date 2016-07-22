require 'rails_helper'

RSpec.describe Request, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_length_of(:title).is_at_most(100) }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :customer }
  end

  context 'Attributes' do
    it{ is_expected.to have_db_column(:title).of_type(:string).with_options(null:false) }
    it{ is_expected.to have_db_column(:description).of_type(:text).with_options(null:false) }
    it{ is_expected.to have_db_column(:status).of_type(:string).with_options(null: false, default: 'new') }
    it{ is_expected.to have_db_column(:customer_id).of_type(:integer).with_options(null: false, index: true) }
    it{ is_expected.to have_db_column(:agent_id).of_type(:integer).with_options(index: true) }
  end

  describe 'factory' do
    subject { create :request }

    it { is_expected.to be_valid }
  end
end
