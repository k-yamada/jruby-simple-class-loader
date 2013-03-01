# SimpleClassLoader

SimpleClassLoader for JRuby

## Installation

Add this line to your application's Gemfile:

```
gem 'simple-class-loader'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install simple-class-loader
```

## Usage

```
require 'simple-class-loader'

JAR_JUNIT_PATH = "#{File.dirname(__FILE__)}/jar/junit-4.10.jar"
JAR_TEST_CASE  = "#{File.dirname(__FILE__)}/jar/TestCaseA.jar"
PACKAGE        = "com.scirocco.cloud.test.ADTest"

loader    = SimpleClassLoader.new([JAR_JUNIT_PATH, JAR_TEST_CASE])
test_case = loader.load_class(PACKAGE)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
