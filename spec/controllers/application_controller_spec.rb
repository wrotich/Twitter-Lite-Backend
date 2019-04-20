require 'spec_helper'

describe ApplicationController do
  describe "#test_method" do
    it "returns a helpful string" do
      expect(subject.test_method).to eq("a_helpful_string")
    end
  end

end