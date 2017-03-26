# encoding: UTF-8
# Be sure to restart your server when you modify this file.

##############################################################################
# Inflections para trabajar en Español.
# Por omisión, rails obtiene el singular y el plural según las reglas en
# Inglés. La regla más básica consiste en agregar una 's' al final de la
# palabra al obtener su plural, y eliminar la 's' al final para obtener el
# singular. En español, esta regla se cumple la mayoría de las veces, pero no
# siempre, por lo que es necesario especificar algunas más para las
# excepciones.
#
# Las reglas para la formación del plural en Español son muy completas (y
# complejas), en algunas ocasiones dependen de la acentuación. No se pretende
# contemplar todas las posibilidades, sólo las más comunes.
##############################################################################

ActiveSupport::Inflector.inflections do |inflect|

  # La regla básica en Español es similar al Inglés, el plural de las palabras 
  # terminadas en vocal se obtiene agregándole una 's' al final. Sin embargo, 
  # para formar correctamente el plural de palabras como doctor, camion, 
  # universidad ley o pastel, se aplica una regla distinta: las palabras que
  # terminen con r, y, n, d, l se convierten a plural agregando la sílaba "es",
  # de otra forma, el plural se obtendrían como doctors, camions, universidads,
  # leys y pastels.
  # Para obtener correctamente el plural de palabras como maiz => maices,
  # pez => peces, las palabras terminadas en z se cambian la z por c, y
  # se agrega "es".
  # Por facilidad, haremos uso de la posibilidad que nos brinda `gsub` de pasar
  # un hash para realizar los remplazos.

  inflect.plural(/(a)(?=$)/, 'as')
  inflect.plural(/(e)(?=$)/, 'es')
  inflect.plural(/(i)(?=$)/, 'is')
  inflect.plural(/(o)(?=$)/, 'os')
  inflect.plural(/(u)(?=$)/, 'us')
  inflect.plural(/(d)(?=$)/, 'des')
  inflect.plural(/(j)(?=$)/, 'jes')
  inflect.plural(/(l)(?=$)/, 'les')
  inflect.plural(/(n)(?=$)/, 'nes')
  inflect.plural(/(r)(?=$)/, 'res')
  inflect.plural(/(y)(?=$)/, 'yes')
  inflect.plural(/(z)(?=$)/, 'ces')

  #-----------------------------------------------------------------------------

  # Para singularizar, generalmente basta con eliminar la 's' del final, pero
  # palabras como doctores y universidades se convertirían erróneamente como
  # doctore y universidade.
  # Podemos agregar una nueva regla, cuando la palabra termina en "es",
  # eliminar esa sílaba, pero esto tampoco es del todo cierto, ya que funciona
  # con palabras como "doctores" o "camiones", porque su singular son "doctor"
  # y "camion", respectivamente. Sin embargo, hay otras palabras que se
  # convertirían erróneamente, como semestres, por ejemplo, que al eliminar
  # la sílaba "es" del final, se singularizaría como 'semestr'. Para evitar
  # eso, se obliga que la palabra que termina en "es" y venga precedida de r,
  # y, n, d o l, deba también ser precedida por una vocal.
  # Primero, definimos las palabras que terminen en 'es', precedido de r, y, n,
  # d, l o j, precedido de una vocal.
  # Después, definimos las palabras que terminen en vocal seguida de una 's'. En
  # caso de que esa vocal sea la e, entonces debe ser precedida de alguna
  # combinación de las letras b, c, d, f, g, p, t seguida de las letras l o r.
  # Nota: Por una regla que aplica en Inglés, las palabras terminadas en 'ia'
  # son plurales de palabras terminadas en 'um', ejemplo 'medium' => 'media'.
  # Como es Español esa regla no aplica, es necesario especificar que las
  # palabras terminadas en ia ya están en singular.

  inflect.singular(/((?<singular>ia)|(?<singular>[aeiou][rldyjn])es|(?<singular>[bcdfgpt][lr]e|[aeiou])s)(?=[A-Z]|_|$)/, '\\k<singular>')

  # Para singularizar palabras con 'ces', como 'maices'
  inflect.singular(/ces$/, 'z')

  #-----------------------------------------------------------------------------

  # Las palabras en singular que terminan con s son un caso especial, ya que 
  # rails infiere que ya están en plural, lo cual es falso. Por ejemplo, pais.
  # Es necesario indicar que el plural de pais es paises y viceversa. Esto se
  # puede hacer declarándolo como irregular:
  inflect.irregular 'pais', 'paises'
  # Pero es necesario agregar otra regla. Pais termina en s, pero ya está en
  # singular, por lo que hay que indicarle a rails que no elimine la s final.
  inflect.singular /(pais)(?=[A-Z]|_|$)/, '\1'

  # el mismo caso aplica para 'mes'
  inflect.irregular 'mes', 'meses'
  inflect.singular /(mes)(?=[A-Z]|_|$)/, '\1'

  # Ejemplos cuyo plural y singular sea el mismo
  inflect.uncountable %w( campus lunes martes miercoles jueves viernes )

  #-----------------------------------------------------------------------------

  # Otros ejemplos de palabras irregulares
  # En ocasiones, quisiéramos aplicar reglas específicas que no cumplen con las
  # generales. Por ejemplo, si a estas alturas tratamos de obtener el plural de
  # "hermano_de_sangre", el resultado sería "hermanos_des_sangres", así que,
  # para estos casos, es necesario agregar reglas para indicar estos
  # comportamientos 'irregulares'.

  #inflect.irregular 'hermano_de_sangre', 'hermanos_de_sangre'
  #inflect.irregular 'HermanoDeSangre', 'HermanosDeSangre'

  # NOTA: es necesario indicar los dos modos (underscore y camelcase) porque el
  # método irregular no soporta expresiones regulares

  # Caso especial en el que la última palabra termina con 's' desde su versión
  # en singular (caso similar al de pais, pero en esta ocasión, con palabras
  # compuestas)

  #inflect.singular 'calificacion_matematicas', 'calificacion_matematicas'
  #inflect.singular 'CalificacionMatematicas', 'CalificacionMatematicas'
  #inflect.irregular 'calificacion_matematicas', 'calificaciones_matematicas'
  #inflect.irregular 'CalificacionMatematicas', 'CalificacionesMatematicas'

  # NOTA: por claridad, se indican los dos modos (underscore y camelcase)
  # porque el método irregular no soporta expresiones regulares, aunque en el
  # caso del singular sí, por lo que se puede escribir también de la siguiente
  # manera:
  #inflect.singular /([Cc])(alificacion)(_m|M)(atematicas)/, '\1\2\3\4'

end
