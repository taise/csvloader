#! ruby
# coding: utf-8
require 'csvloader'

describe CSVLoader do
  DEFAULT_YML = "./config/csv.yml"
  describe "#new" do
    context "when readed default yaml file" do
      subject { CSVLoader.new() }
      it "should set default yaml file" do
        subject.yml.should == DEFAULT_YML
      end
      it "should get csv_dir path" do
        subject.csv_dir.should ==  "./db/csv"
      end
    end

    context "when readed other yaml file" do
      OTHER_YML = "./config/other.yml"
      before(:each) do
        open(OTHER_YML, "w") {|f| f.write("csv_dir: './db/other_csv'")}
      end
      subject { CSVLoader.new(OTHER_YML) }
      it "should set argument yaml file" do
        subject.yml.should == OTHER_YML
      end
      it "should get other csv_dir path" do
        subject.csv_dir.should ==  "./db/other_csv"
      end
      after(:each) { File.delete(OTHER_YML) }
    end

    context "when didnt read yaml file" do
      it "should raise Errno::ENOENT" do
        lambda {CSVLoader.new("./nil")}.should raise_error(Errno::ENOENT)
      end
    end
  end
end
