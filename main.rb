require_relative "nota"
require_relative "aluno"
require_relative "curso"

alunos = {} # matrícula => Aluno
cursos = {} # código do curso => Curso

linhas = File.readlines("notas.csv")
linhas.shift

linhas.each do |linha|
  # pula linhas em branco (senão viram um aluno 0 sem notas, com CR NaN)
  next if linha.strip.empty?

  # "100,1,10,80,60,20231" vira ["100", "1", "10", "80", "60", "20231"]
  matricula, disciplina, codigo_curso, valor, carga_horaria = linha.chomp.split(",")

  # tudo que vem do arquivo é texto, então converte pra número
  matricula = matricula.to_i
  codigo_curso = codigo_curso.to_i
  nota = Nota.new(disciplina.to_i, valor.to_i, carga_horaria.to_i)

  alunos[matricula] = alunos[matricula].nil? ? Aluno.new(matricula) : alunos[matricula]
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

matricula_buscada = 100
disciplina_buscada = 2



curso_buscado = 10
matricula_buscada = 100
disciplina_buscada = 2

nota_encontrada = nil

cursos[curso_buscado].alunos.each do |aluno|
  next unless aluno.matricula == matricula_buscada   # pula os outros alunos

  aluno.notas.each do |nota|
    nota_encontrada = nota if nota.disciplina == disciplina_buscada
  end
end

if nota_encontrada
  puts "Nota encontrada: #{nota_encontrada.valor}"
else
  puts "Nota não encontrada"
end


