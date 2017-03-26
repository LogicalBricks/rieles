# encoding: UTF-8
require 'rieles'

describe 'Inflections' do
  def singulares
    %w[riel camion hospital universidad reloj ley semestre mesa ave bola materia]
  end

  def plurales
    %w[rieles camiones hospitales universidades relojes leyes semestres mesas aves bolas materias]
  end

  #########################################################
  # Sección que prueba las conversiones al plural
  #########################################################

  context 'Pluralizaciones' do
    it 'pluraliza palabras sencillas' do
      singulares.each_with_index do |s, i|
        s.pluralize.should == plurales[i]
      end
    end

    it 'pluraliza palabras compuestas' do
      pending "rails 5 changed the api"
      singulares_compuestas = singulares.permutation(4).to_a.collect{ |e| e.join('_') }
      plurales_compuestas = plurales.permutation(4).to_a.collect{ |e| e.join('_') }
      singulares_compuestas.each_with_index do |s, i|
        s.pluralize.should == plurales_compuestas[i]
      end
    end

    it 'pluraliza casos especiales' do
      'pais'.pluralize.should == 'paises'
      'maiz'.pluralize.should == 'maices'
      'materia'.pluralize.should == 'materias'
    end

    it 'no pluraliza palabras que ya estén en plural' do
      'camiones'.pluralize.should == 'camiones'
      'camiones_grandes'.pluralize.should == 'camiones_grandes'
      'universidades_hospitales_doctores'.pluralize.should == 'universidades_hospitales_doctores'
      'paises'.pluralize.should == 'paises'
      'meses'.pluralize.should == 'meses'
      'lunes'.pluralize.should == 'lunes'
    end
  end

  #########################################################
  # Sección que prueba las conversiones al singular
  #########################################################

  context 'Singularizaciones' do
    it 'singulariza palabras sencillas' do
      plurales.each_with_index do |p, i|
        p.singularize.should == singulares[i]
      end
    end

    it 'singulariza palabras compuestas' do
      singulares_compuestas = singulares.permutation(4).to_a.collect{ |e| e.join('_') }
      plurales_compuestas = plurales.permutation(4).to_a.collect{ |e| e.join('_') }
      plurales_compuestas.each_with_index do |p, i|
        p.singularize.should == singulares_compuestas[i]
      end
    end

    it 'singulariza casos especiales' do
      'paises'.singularize.should == 'pais'
      'maices'.singularize.should == 'maiz'
      'materias'.singularize.should == 'materia'
    end

    it 'no singulariza palabras que ya estén en singular' do
      'camion'.singularize.should == 'camion'
      'camion_grande'.singularize.should == 'camion_grande'
      'universidad_hospital_doctor'.singularize.should == 'universidad_hospital_doctor'
      'pais'.singularize.should == 'pais'
      'lunes'.singularize.should == 'lunes'
      'materia'.singularize.should == 'materia'
    end
  end
end
