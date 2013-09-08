require 'spec_helper'

describe Lightscape::Light do
  describe "getting the current state" do
  end

  describe "updating the light state" do
    let(:light) { described_class.find(2) }

    describe "#on!" do
      it "turns the light on immediately" do
        expect(light.on!).to be_true
      end
    end

    describe "#off!" do
      it "turns the light off immediately" do
        expect(light.off!).to be_true
      end
    end

    describe "#on=" do
      it "turns the light on" do
        light.on = true
        expect(light.update!).to be_true
      end

      it "turns the light off" do
        light.on = false
        expect(light.update!).to be_true
      end
    end

    describe "#color=" do
      it "turns the light on if the color is changed" do
        light.off!
        light.color = :fuscia
        expect(light.update!).to be_true
      end

      it "can change the color by name" do
        light.color = :fuscia
        expect(light.update!).to be_true
      end
    end

    context "changing brightness" do

      it "can change the brightness" do
        light.brightness = 100
        expect(light.update!).to be_true
      end

      context "when the value given is larger than 255" do
        it "uses 255" do
          light.brightness = 300
          expect(light.pending_changes[:bri]).to eq(255)
        end
      end

      context "when the value given is negative" do
        it "uses 0" do
          light.brightness = -1
          expect(light.pending_changes[:bri]).to eq(0)
        end
      end
    end
  end
end
