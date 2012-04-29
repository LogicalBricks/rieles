# Be sure to restart your server when you modify this file.

ActiveSupport::Inflector.inflections do |inflect|
  inflect.plural(/([rndlj])([A-Z]|_|$)/, '\1es\2')
  inflect.plural(/([aeiou])([A-Z]|_|$)/, '\1s\2')
  inflect.plural(/([aeiou])([A-Z]|_)([a-z]+)([rndlj])([A-Z]|_|$)/, 
                 '\1s\2\3\4es\5')
  inflect.plural(/([rndlj])([A-Z]|_)([a-z]+)([aeiou])([A-Z]|_|$)/, 
                 '\1es\2\3\4s\5')
  inflect.plural(/(z)$/i, 'ces')

  final_plural_rndlj = /([aeiou][rndlj])es([A-Z]|_|$)/
  final_plural_vocal = /((?<![aeiou][rndlj])[aeiou])s([A-Z]|_|$)/
  palabra_compuesta_1 = /#{final_plural_rndlj}([a-z]+)#{final_plural_vocal}/
  palabra_compuesta_2 = /#{final_plural_vocal}([a-z]+)#{final_plural_rndlj}/

  inflect.singular(/(ia)$/i, '\1')
  inflect.singular(final_plural_rndlj, '\1\2')
  inflect.singular(final_plural_vocal, '\1\2')
  inflect.singular(palabra_compuesta_1, '\1\2\3\4\5')
  inflect.singular(palabra_compuesta_2, '\1\2\3\4\5')
  inflect.singular(/ces$/, 'z')
  
  inflect.irregular 'pais', 'paises'
  inflect.singular /(pais)([A-Z]|_|$)/, '\1\2'

  inflect.uncountable %w( campus lunes martes miercoles jueves viernes )
end
