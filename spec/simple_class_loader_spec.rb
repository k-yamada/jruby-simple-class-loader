require 'spec_helper'

describe SimpleClassLoader do
  JAR_JUNIT_PATH = "#{File.dirname(__FILE__)}/jar/junit-4.10.jar"

  describe ".new" do
    it "should initialize with jar_path" do
      loader = SimpleClassLoader.new([JAR_JUNIT_PATH])
    end
  end
end
