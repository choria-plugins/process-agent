#!/usr/bin/ruby

require "spec_helper"
require File.join(File.dirname(__FILE__), "../../", "util", "processagent.rb")

module MCollective
  module Util
    class Processagent
      describe "bytes_to_human" do
        it "should return 0 if the value is a fraction" do
          expect(Processagent.bytes_to_human(0.4)).to eq("0 B")
        end

        it "should return 0 if the value is negative" do
          expect(Processagent.bytes_to_human(-1)).to eq("0 B")
        end

        it "should correctly convert bignums" do
          expect(Processagent.bytes_to_human(1024 * 1024 * 1024 * 1024 * 1024 * 1024 * 1024)).to eq("1073741824.000 TB")
        end

        it "should cap the result at TB" do
          expect(Processagent.bytes_to_human(1024 * 1024 * 1024 * 1024 * 1024)).to eq("1024.000 TB")
        end

        it "should convert a value to the correct humand readable format" do
          expect(Processagent.bytes_to_human(50)).to eq("50.000 B")
          expect(Processagent.bytes_to_human(1024)).to eq("1.000 KB")
          expect(Processagent.bytes_to_human(1024 * 1024)).to eq("1.000 MB")
          expect(Processagent.bytes_to_human(1024 * 1024 * 1024)).to eq("1.000 GB")
          expect(Processagent.bytes_to_human(1024 * 1024 * 1024 * 1024)).to eq("1.000 TB")
        end
      end
    end
  end
end
