# encoding: UTF-8
require 'rails/all'
require "generator_spec/test_case"
require 'generators/rieles/install_generator'

describe Rieles::InstallGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../tmp", __FILE__)

  before(:all) do
    prepare_destination
    run_generator
  end

  it "crea los archivos de inflections, el locale en español, y los templates del scaffold" do
    assert_file "config/initializers/inflections.rb", File.read('lib/config/initializer/inflections.rb')
    assert_file "config/locales/es.yml", File.read('lib/config/locales/es.yml')
    assert_file "lib/templates/erb/scaffold/new.html.erb", File.read('lib/templates/erb/scaffold/new.html.erb')
    assert_file "lib/templates/erb/scaffold/show.html.erb", File.read('lib/templates/erb/scaffold/show.html.erb')
    assert_file "lib/templates/erb/scaffold/edit.html.erb", File.read('lib/templates/erb/scaffold/edit.html.erb')
    assert_file "lib/templates/erb/scaffold/index.html.erb", File.read('lib/templates/erb/scaffold/index.html.erb')
    assert_file "lib/templates/erb/scaffold/_form.html.erb", File.read('lib/templates/erb/scaffold/_form.html.erb')
    assert_file "app/views/application/_error_messages.html.erb", File.read('app/views/application/_error_messages.html.erb')
  end
end
