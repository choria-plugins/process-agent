#!/usr/bin/ruby

require "spec_helper"
require File.join(File.dirname(__FILE__), "../../", "util", "processagent.rb")

module MCollective
  module Util
    class Processagent
      describe "bytes_to_human" do
        it "should return 0 if the value is a fraction" do
          Processagent.bytes_to_human(0.4).should eq("0 B")
        end

        it "should return 0 if the value is negative" do
          Processagent.bytes_to_human(-1).should eq("0 B")
        end

        it "should correctly convert bignums" do
          Processagent.bytes_to_human(1024 * 1024 * 1024 * 1024 * 1024 * 1024 * 1024).should eq("1073741824.000 TB")
        end

        it "should cap the result at TB" do
          Processagent.bytes_to_human(1024 * 1024 * 1024 * 1024 * 1024).should eq("1024.000 TB")
        end

        it "should convert a value to the correct humand readable format" do
          Processagent.bytes_to_human(50).should eq("50.000 B")
          Processagent.bytes_to_human(1024).should eq("1.000 KB")
          Processagent.bytes_to_human(1024 * 1024).should eq("1.000 MB")
          Processagent.bytes_to_human(1024 * 1024 * 1024).should eq("1.000 GB")
          Processagent.bytes_to_human(1024 * 1024 * 1024 * 1024).should eq("1.000 TB")
        end
      end
    end
  end
end
