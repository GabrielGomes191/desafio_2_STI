# aluno tem uma matrícula e uma lista de notas.
# sabe calcular o próprio CR.
class Aluno
  attr_reader :matricula

  def initialize(matricula)
    @matricula = matricula
    @notas = []
  end

  def adicionar_nota(nota)
    @notas << nota
  end

  # CR = soma de (nota * carga horária) / soma das cargas horárias
  def cr
    soma = 0
    total_carga_horaria = 0

    @notas.each do |nota|
      soma += nota.valor * nota.carga_horaria
      total_carga_horaria += nota.carga_horaria
    end

    soma.to_f / total_carga_horaria
  end
end
