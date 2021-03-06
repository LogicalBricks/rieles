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
    it 'debe pluralizar palabras sencillas' do
      singulares.each_with_index do |s, i|
        s.pluralize.should == plurales[i]
      end
    end

    it 'debe pluralizar palabras compuestas' do
      singulares_compuestas = singulares.permutation(4).to_a.collect{ |e| e.join('_') }
      plurales_compuestas = plurales.permutation(4).to_a.collect{ |e| e.join('_') }
      singulares_compuestas.each_with_index do |s, i|
        s.pluralize.should == plurales_compuestas[i]
      end
    end

    it 'debe pluralizar casos especiales' do
      'pais'.pluralize.should == 'paises'
      'maiz'.pluralize.should == 'maices'
      'materia'.pluralize.should == 'materias'
    end

    it 'no debe pluralizar palabras que ya estén en plural' do
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
    it 'debe singularizar palabras sencillas' do
      plurales.each_with_index do |p, i|
        p.singularize.should == singulares[i]
      end
    end

    it 'debe singularizar palabras compuestas' do
      singulares_compuestas = singulares.permutation(4).to_a.collect{ |e| e.join('_') }
      plurales_compuestas = plurales.permutation(4).to_a.collect{ |e| e.join('_') }
      plurales_compuestas.each_with_index do |p, i|
        p.singularize.should == singulares_compuestas[i]
      end
    end

    it 'debe singularize casos especiales' do
      'paises'.singularize.should == 'pais'
      'maices'.singularize.should == 'maiz'
      'materias'.singularize.should == 'materia'
    end

    it 'no debe singularizar palabras que ya estén en singular' do
      'camion'.singularize.should == 'camion'
      'camion_grande'.singularize.should == 'camion_grande'
      'universidad_hospital_doctor'.singularize.should == 'universidad_hospital_doctor'
      'pais'.singularize.should == 'pais'
      'lunes'.singularize.should == 'lunes'
      'materia'.singularize.should == 'materia'
    end
  end
end
