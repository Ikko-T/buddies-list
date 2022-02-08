require 'rails_helper'

RSpec.describe Buddy, type: :model do
  describe "validation" do
    subject { buddy.valid? }

    context "fails with no requirements" do
      let(:buddy) { build(:buddy) }
      it "savable" do
        expect(subject).to eq false
      end
    end

    context "fails validation with no first name" do
      let(:buddy) { build(:buddy, first_name: "") }
      it "display error messages" do
        expect(subject).to eq false
        expect(buddy.errors.messages[:first_name]).to include "can't be blank"
      end
    end

    context "fails validation with a longer first name" do
      let(:buddy) { build(:buddy, first_name: "a" * 31) }
      it "display error messages" do
        expect(subject).to eq false
        expect(buddy.errors.messages[:first_name]).to include "is too long (maximum is 30 characters)"
      end
    end

    context "fails validation with no last name" do
      let(:buddy) { build(:buddy, last_name: "") }
      it "display error messages" do
        expect(subject).to eq false
        expect(buddy.errors.messages[:last_name]).to include "can't be blank"
      end
    end

    context "fails validation with a longer last name" do
      let(:buddy) { build(:buddy, last_name: "b" * 31) }
      it "display error messages" do
        expect(subject).to eq false
        expect(buddy.errors.messages[:last_name]).to include "is too long (maximum is 30 characters)"
      end
    end

    context "fails validation with no positive numbers" do
      let(:buddy) { build(:buddy, age: -1) }
      it "display error messages" do
        expect(subject).to eq false
        expect(buddy.errors.messages[:age]).to include "must be greater than or equal to 0"
      end
    end

    context "fails validation with no email" do
      let(:buddy) { build(:buddy, email: "") }
      it "display error messages" do
        expect(subject).to eq false
        expect(buddy.errors.messages[:email]).to include "can't be blank"
      end
    end

    context "fails validation with a longer email" do
      let(:buddy) { build(:buddy, email: "a" * 256) }
      it "display error messages" do
        expect(subject).to eq false
        expect(buddy.errors.messages[:email]).to include "is too long (maximum is 255 characters)"
      end
    end

    # context "email already exists" do
    #   before { create(:buddy, email: "test@example.com") }
    #   let(:buddy) { build(:buddy, email: "test@example.com") }
    #   it "display error messages" do
    #     expect(subject).to eq false
    #     expect(buddy.errors.messages[:email]).to include "is invalid)"
    #   end
    # end

    context "fails validation with only English letters and numbers for email input" do
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

      let(:buddy) { build(:buddy, email: Faker::Internet.email) }
      it "display error messages" do
        expect(subject).to eq false
        expect(buddy[:email]).to match(VALID_EMAIL_REGEX)
        # expect(buddy.errors.messages[:email]).to include "is invalid"
      end
    end

    context "fails validation with no expected cell phone number pattern" do
      VALID_PHONE_REGEX = /\A[1(]?[-]?\d{3}[-).]?\s?\d{3}[-.]?\d{4}\z/

      let(:buddy) { build(:buddy, phone: Faker::PhoneNumber.cell_phone) }
      it "display error messages" do
        expect(subject).to eq false
        expect(buddy[:phone]).to match(VALID_PHONE_REGEX)
        # expect(buddy.errors.messages[:phone]).to include "is invalid"
      end
    end
  end
end
