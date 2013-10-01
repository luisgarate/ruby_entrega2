module Camina
  def caminar
    puts "camina"
  end
end

module Nada
  def nadar
    puts "nada"
  end
end

module Desplazarse
  def desplazarse
    puts "se desplaza"
  end
end

class Mamifero; end

class Hombre < Mamifero
  include Camina
  include Nada
  def hablar
    puts "habla"
  end
end

class Perro < Mamifero
  include Camina
  def ladrar
    puts "ladra"
  end
end

class Ballena < Mamifero
  include Nada
end

class Ave
 include Camina
end

class Aguila < Ave 
  def volar
    puts "vuela"
  end
end

class Pinguino < Ave 
  include Nada
end

class Reptil; end

class Cocodrilo < Reptil
  include Camina
  include Nada
end

class Boa < Reptil
  include Desplazarse
  def presion
    puts "presiona"
  end
end

class Cobra < Reptil
  include Desplazarse
  def morder
    puts "muerde"
  end
end

class Anfibio 
  include Nada
end

class Sapo < Anfibio
  def saltar
    puts "salta"
  end
end

class Pez
 include Nada
end

class Tiburon < Pez; end

#Casos de prueba
h1 = Hombre.new
h1.caminar
h1.hablar

s1 = Sapo.new
s1.saltar

a1 = Aguila.new
a1.volar

p1 = Perro.new
p1.volar