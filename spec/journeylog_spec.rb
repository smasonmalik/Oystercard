# require 'journeylog'
#
# describe Journeylog do
#
#   let(:journey) {double :journey}
#   let(:station) {double :station}
#   subject(:journeylog) {described_class.new}
#
#   describe "#intialize" do
#     it "initlaizes with an empty array to store history" do
#       expect(journeylog.log).to eq []
#     end
#
#     it "initlaizes with an new Journey class" do
#       expect(journeylog.journey_class).to eq journey_class
#     end
#   end
# 
#   describe "#start" do
#     it "starts a journey" do
#       expect(subject).to respond_to(:start).with(1).argument
#     end
#   end
# end
