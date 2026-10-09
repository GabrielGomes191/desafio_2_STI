require_relative "nota"
require_relative "aluno"
require_relative "curso"

alunos = {} # matrícula => Aluno
cursos = {} # código do curso => Curso

linhas = File.readlines("notas.csv")
linhas.shift # joga fora a primeira linha (o cabeçalho)

linhas.each do |linha|
  # "100,1,10,80,60,20231" vira ["100", "1", "10", "80", "60", "20231"]
  matricula, disciplina, codigo_curso, valor, carga_horaria = linha.chomp.split(",")

  # tudo que vem do arquivo é texto, então converte pra número
  matricula = matricula.to_i
  codigo_curso = codigo_curso.to_i
  nota = Nota.new(valor.to_i, carga_horaria.to_i)

  # ||= só cria o aluno se ele ainda não estiver no hash
  alunos[matricula] ||= Aluno.new(matricula)
  alunos[matricula].adicionar_nota(nota)

  cursos[codigo_curso] ||= Curso.new(codigo_curso)
  cursos[codigo_curso].adicionar_aluno(alunos[matricula])
end

puts "------- O CR dos alunos é: --------"
alunos.sort.each do |matricula, aluno|
  puts "#{matricula}  -  #{aluno.cr.round(2)}"
end
puts "-----------------------------------"

puts "----- Média de CR dos cursos ------"
cursos.sort.each do |codigo, curso|
  puts "#{codigo}   -  #{curso.media_cr.round(2)}"
end
puts "-----------------------------------"
