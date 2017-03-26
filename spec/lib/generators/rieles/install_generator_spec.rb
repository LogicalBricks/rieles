# encoding: UTF-8
require 'rails/all'
require "generator_spec/test_case"
require 'generators/rieles/install_generator'

describe Rieles::InstallGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../tmp", __FILE__)

  context 'when creating erb views' do
    before(:each) do
      prepare_destination
      allow_any_instance_of(::Rieles::InstallGenerator).to receive(:engine).and_return('erb')
      run_generator
    end

    it 'creates inflection files, spanish locale and erb scaffold templates' do
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

  context 'when creating haml views' do
    before(:each) do
      prepare_destination
      allow_any_instance_of(::Rieles::InstallGenerator).to receive(:engine).and_return('haml')
      run_generator
    end

    it 'creates inflection files, spanish locale and haml scaffold templates' do
      assert_file "config/initializers/inflections.rb", File.read('lib/config/initializer/inflections.rb')
      assert_file "config/locales/es.yml", File.read('lib/config/locales/es.yml')
      assert_file "lib/templates/haml/scaffold/new.html.haml", File.read('lib/templates/haml/scaffold/new.html.haml')
      assert_file "lib/templates/haml/scaffold/show.html.haml", File.read('lib/templates/haml/scaffold/show.html.haml')
      assert_file "lib/templates/haml/scaffold/edit.html.haml", File.read('lib/templates/haml/scaffold/edit.html.haml')
      assert_file "lib/templates/haml/scaffold/index.html.haml", File.read('lib/templates/haml/scaffold/index.html.haml')
      assert_file "lib/templates/haml/scaffold/_form.html.haml", File.read('lib/templates/haml/scaffold/_form.html.haml')
      assert_file "app/views/application/_error_messages.html.haml", File.read('app/views/application/_error_messages.html.haml')
    end
  end
end
