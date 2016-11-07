require_relative 'spec_helper'
require 'pry'

RSpec.describe PasswordChecker do

  before :each do
    @password = PasswordChecker.new("alvaro@gmail.com", "Pp@24444")
  end

  describe ".check_password" do
    it "tells you whether the password is valid with all the parameters" do
      expect(@password.check_password).to eq("valid")
    end
  end

  describe ".longer" do
    it "tells you whether the password is longer than 7 characters" do
      expect(@password.longer).to eq(true)
    end
  end

  describe ".up_low_case" do
    it "tells you whether the password has an upcase and a lowcase" do
      expect(@password.up_low_case).to eq(false)
    end
  end

  describe ".namey_domain" do
    it "tells you whether the password has the name or the domain included" do
      password = PasswordChecker.new("alvaro@gmail.com", "gmail")
      expect(password.namey_domain).to eq(true)
    end
  end

  describe ".chars" do
    it "tells you whether the password contains at least 1 letter, 1 number and 1 symbol" do
      expect(@password.chars).to eq(true)
    end
  end
end







    