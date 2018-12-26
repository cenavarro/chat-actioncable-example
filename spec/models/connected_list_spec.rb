# frozen_string_literal: true

require "rails_helper"

RSpec.describe ConnectedList, type: :model do
  describe ".all" do
    it "returns all current connected user's IDs for the passing chat" do
      described_class.add(1, 1)
      described_class.add(1, 2)
      described_class.add(2, 3)

      users_ids = described_class.all(1)
      expect(users_ids).to eq(%w[1 2])
    end
  end

  describe ".clear" do
    it "clears user's IDs for the passing chat" do
      described_class.add(1, 1)
      described_class.add(1, 2)
      described_class.add(2, 3)
      described_class.clear(1)

      expect(described_class.all(1)).to be_empty
      expect(described_class.all(2)).not_to be_empty
    end
  end

  describe ".add" do
    it "adds a new user to the list for the passing chat" do
      described_class.add(1, 1)
      expect(described_class.all(1)).to eq(["1"])
    end
  end

  describe ".include?" do
    it "ckecks if user's ID exists for the passing chat" do
      described_class.add(1, 1)
      described_class.add(1, 2)

      expect(described_class.include?(1, 1)).to be_truthy
      expect(described_class.include?(1, 3)).to be_falsy
    end
  end

  describe ".remove" do
    it "removes an user's ID from the list for the passing chat" do
      described_class.add(2, 2)
      described_class.add(2, 3)

      expect(described_class.include?(2, 2)).to be_truthy
      described_class.remove(2, 2)
      expect(described_class.include?(2, 2)).to be_falsy
    end
  end
end
