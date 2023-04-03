require "Date"

horario = /(as\s)?[0-9]+(\:|\s)?([0-9]+)?((horas)|(hora))?/

data = /(([0-9]+\s?(de)?\s(janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro|Janeiro|Fevereiro|Março|Abril|Maio|Junho|Julho|Agosto|Setembro|Outubro|Novembro|Dezembro))(\s(de)?\s?[0-9]{4})?)|([0-9]+\/[0-9]+)(\/[0-9]+)?|((hoje)|(amanhã)|(depois de amanhã))/

tag = /\#[a-zA-Z]+/

acoes = /((([a-zA-Z])+(ar))|(([a-zA-Z])+(ir))|(([a-zA-Z])+(er)))\s(com)\s[a-zA-ZáàâãéèêíóôõúçÁÀÂÃÉÈÊÍÓÔÕÖÚÇÑ]+/

puts "Escreva uma frase:"
entrada = gets

out_data = data.match(entrada).to_s
if out_data == "amanhã"
    out_data = (Date.today+1).strftime("%d/%m/%Y")
elsif out_data == "depois de amanhã"
    out_data = (Date.today+2).strftime("%d/%m/%Y")
end
puts ""
puts "Dia: " + out_data

out_horario = horario.match(entrada).to_s
puts "Horário: " + out_horario

out_acoes = acoes.match(entrada).to_s
out_acoes = out_acoes.split(" ")
puts "Pessoa: " + out_acoes[-1]

puts "Ação: " + out_acoes[0]

out_tag = tag.match(entrada).to_s
puts "Tag: " + out_tag