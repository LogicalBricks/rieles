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
        expect(s.pluralize).to eq plurales[i]
      end
    end

    it 'pluraliza palabras compuestas' do
      pending "rails 5 changed the api"
      singulares_compuestas = singulares.permutation(4).to_a.collect{ |e| e.join('_') }
      plurales_compuestas = plurales.permutation(4).to_a.collect{ |e| e.join('_') }
      singulares_compuestas.each_with_index do |s, i|
        expect(s.pluralize).to eq plurales_compuestas[i]
      end
    end

    it 'pluraliza casos especiales' do
      expect('pais'.pluralize).to eq 'paises'
      expect('maiz'.pluralize).to eq 'maices'
      expect('materia'.pluralize).to eq 'materias'
    end

    it 'no pluraliza palabras que ya estén en plural' do
      expect('camiones'.pluralize).to eq 'camiones'
      expect('camiones_grandes'.pluralize).to eq 'camiones_grandes'
      expect('universidades_hospitales_doctores'.pluralize).to eq 'universidades_hospitales_doctores'
      expect('paises'.pluralize).to eq 'paises'
      expect('meses'.pluralize).to eq 'meses'
      expect('lunes'.pluralize).to eq 'lunes'
    end
  end

  #########################################################
  # Sección que prueba las conversiones al singular
  #########################################################

  context 'Singularizaciones' do
    it 'singulariza palabras sencillas' do
      plurales.each_with_index do |p, i|
        expect(p.singularize).to eq singulares[i]
      end
    end

    it 'singulariza palabras compuestas' do
      singulares_compuestas = singulares.permutation(4).to_a.collect{ |e| e.join('_') }
      plurales_compuestas = plurales.permutation(4).to_a.collect{ |e| e.join('_') }
      plurales_compuestas.each_with_index do |p, i|
        expect(p.singularize).to eq singulares_compuestas[i]
      end
    end

    it 'singulariza casos especiales' do
      expect('paises'.singularize).to eq 'pais'
      expect('maices'.singularize).to eq 'maiz'
      expect('materias'.singularize).to eq 'materia'
    end

    it 'no singulariza palabras que ya estén en singular' do
      expect('camion'.singularize).to eq 'camion'
      expect('camion_grande'.singularize).to eq 'camion_grande'
      expect('universidad_hospital_doctor'.singularize).to eq 'universidad_hospital_doctor'
      expect('pais'.singularize).to eq 'pais'
      expect('lunes'.singularize).to eq 'lunes'
      expect('materia'.singularize).to eq 'materia'
    end
  end
end
