# nota q o aluno tirou em uma disciplina.
# guarda a disciplina (pra poder buscar a nota) e os dois números que importam pro cálculo do CR.


class Nota
  attr_reader :disciplina, :valor, :carga_horaria

  def initialize(disciplina, valor, carga_horaria)
    @disciplina = disciplina
    @valor = valor
    @carga_horaria = carga_horaria
  end
end
