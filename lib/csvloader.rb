#! ruby
# coding: utf-8

require 'yaml'

class CSVLoader
  DEFAULT_YML = "./config/csv.yml"
  attr_reader :yml, :csv_dir
  def initialize(yml=nil)
    @yml = yml ||= DEFAULT_YML
    yml_data = YAML.load(File.read(@yml)) 
    @csv_dir = yml_data['csv_dir']
  end
end
