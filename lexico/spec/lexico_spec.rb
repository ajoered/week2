describe Lexiconomitron do 

	before :each do
		@lexico = Lexiconomitron.new
	end

 	describe "#eat_t" do

    	it "removes every letter t from the input" do
      		expect(@lexico.eat_t("great scott!")).to eq("grea sco!")
    		end
		end

	describe "#shazam" do

		it "reverses the letters within each word in the array, and returns the first and last words without the Ts" do
			expect(@lexico.shazam(["This", "is", "a", "boring", "test"])).to eq(["sih", "se"])
			end
	end

	describe "#oompa_loompa" do
		it "takes the words that are three characters or less from an array and returns it in the same order without the T's" do
			expect(@lexico.oompa_loompa(["if", "you", "wanna", "be", "my", "lover"])).to eq (["if", "you", "be", "my"])
		end
	end
end
