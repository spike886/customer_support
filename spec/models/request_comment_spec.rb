require 'rails_helper'

RSpec.describe RequestComment, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of :text }
  end

  context 'Attributes' do
    it{ is_expected.to have_db_column(:text).of_type(:text).with_options(null: false) }
    it{ is_expected.to have_db_column(:author_id).of_type(:integer).with_options(null: false, index: true) }
    it{ is_expected.to have_db_column(:author_type).of_type(:string).with_options(null: false, index: true) }
  end

  context 'Associations' do
    it{ is_expected.to belong_to :author }
  end

  describe 'factory' do
    subject { create :request_comment }

    it { is_expected.to be_valid }
  end
end
