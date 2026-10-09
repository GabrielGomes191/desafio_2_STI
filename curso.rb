# o curso tem um código e a lista dos alunos que têm nota nele
# ele que sabe calcular a média


class Curso
  attr_reader :codigo, :alunos

  def initialize(codigo)
    @codigo = codigo
    @alunos = []
  end

  def adicionar_aluno(aluno)
    # o mesmo aluno aparece em várias linhas do CSV, então só adiciona uma vez
    @alunos << aluno unless @alunos.include?(aluno)
  end

  def media_cr
    soma = 0

    @alunos.each do |aluno|
      soma += aluno.cr
    end
    soma / @alunos.size
  end
end
