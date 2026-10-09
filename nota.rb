# nota q o aluno tirou em uma disciplina.
# só guarda os dois números que importam pro cálculo do CR.
class Nota
  attr_reader :valor, :carga_horaria

  def initialize(valor, carga_horaria)
    @valor = valor
    @carga_horaria = carga_horaria
  end
end
