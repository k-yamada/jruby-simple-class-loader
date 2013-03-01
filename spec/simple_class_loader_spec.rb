# coding: UTF-8
require 'spec_helper'
require 'pp'

describe SimpleClassLoader do

  JAR_JUNIT_PATH  = "#{File.dirname(__FILE__)}/jar/junit-4.10.jar"
  JAR_TEST_CASE_A = "#{File.dirname(__FILE__)}/jar/TestCaseA.jar"
  JAR_TEST_CASE_B = "#{File.dirname(__FILE__)}/jar/TestCaseB.jar"
  PACKAGE         = "com.scirocco.cloud.test.ADTest"

  before(:each) do
  end

  def check_test_case_a(test_case)
    test_case.methods.should include(:testA)
    test_case.methods.should_not include(:testB)
  end

  def check_test_case_b(test_case)
    test_case.methods.should include(:testB)
    test_case.methods.should_not include(:testA)
  end

  describe "#load_class" do
    it "should load TestCaseA" do
      loader = SimpleClassLoader.new([JAR_JUNIT_PATH, JAR_TEST_CASE_A])
      test_case = loader.load_class(PACKAGE)
      check_test_case_a test_case
    end

    it "should load TestCaseB" do
      loader = SimpleClassLoader.new([JAR_JUNIT_PATH, JAR_TEST_CASE_B])
      test_case = loader.load_class(PACKAGE)
      check_test_case_b test_case
    end

    it "should load TestCaseA and TestCaseB with different SimpleClassLoader instance" do
      loader = SimpleClassLoader.new([JAR_JUNIT_PATH, JAR_TEST_CASE_A])
      test_case = loader.load_class(PACKAGE)
      check_test_case_a test_case

      loader = SimpleClassLoader.new([JAR_JUNIT_PATH, JAR_TEST_CASE_B])
      test_case = loader.load_class(PACKAGE)
      check_test_case_b test_case
    end
  end

  describe "#add_jar" do
    it "should add TestCaseA" do
      loader = SimpleClassLoader.new([JAR_JUNIT_PATH])
      loader.add_jar(JAR_TEST_CASE_A)
      test_case = loader.load_class(PACKAGE)
      check_test_case_a test_case
    end
  end

end
