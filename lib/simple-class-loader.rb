# coding: UTF-8
require 'pp'
require 'java'
require "simple-class-loader/version"
java_import "java.net.URL"
java_import "java.net.URLClassLoader"

class SimpleClassLoader

  def initialize(jar_paths)
    pp jar_paths
    jar_urls = get_jar_urls(jar_paths)
    @class_loader = java.net.URLClassLoader.new(jar_urls)
  end

  def get_jar_urls(jar_paths)
    jar_urls = []
    jar_paths.each do |jar_path|
      jar_urls << get_url(jar_path)
    end
    jar_urls.to_java(java.net.URL)
  end

  def get_url(jar_path)
    java.io.File.new(jar_path).toURL
  end

  def load_class(class_name)
    class_type = @class_loader.loadClass(class_name)
    class_type.newInstance
  end

  def add_jar(jar_path)
    @class_loader.addURL(java.io.File.new(jar_path).toURL)
  end

end
