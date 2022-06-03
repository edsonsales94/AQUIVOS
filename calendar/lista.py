import calendar
from datetime import date
import pandas as pd
import numpy as np
import csv

# with open('listapaes.csv', newline='') as csvfile:
#   spamreader = csv.reader(csvfile, delimiter=';', quotechar='|')
#   for row in spamreader:
#     print(row)

ano = date.today().year
mes = date.today().month
dia = date.today().day
data = calendar.TextCalendar(calendar.SUNDAY)
lista = np.array(['Segunda-feira','Terça-feira','Quarta-feira','Quinta-feira','Sexta-feira','sabado','domingo'])
dia_semana = calendar.weekday(ano, mes, dia+2)

if dia_semana == 2:
  nomes = np.loadtxt(fname = "nomes.txt", dtype=str)
  n = nomes[5]
  nomes = np.delete(nomes,(5),axis=0)
  nomes = np.insert(nomes, 0, n)
  nomes = nomes.tolist()
  arquivo = open('nomes.txt', 'w')
  for x in range(6):
    nome=nomes[x]
    arquivo.write(nome+"\n")
  
  with open('listapaes.csv', 'w', newline='') as csvfile:
      spamwriter = csv.writer(csvfile, delimiter=';',
                              quotechar='|', quoting=csv.QUOTE_MINIMAL)
      spamwriter.writerow(['Lista de Quem Traz Paes'])
      spamwriter.writerow(['Segunda-feira','Terca-feira','Quarta-feira','Quinta-feira','Sexta-feira'])
      spamwriter.writerow(nomes[0:5])
    
  dataset = pd.read_csv('listapaes.csv', sep = ';')
  dataset.to_excel("lista.xlsx")
  print(dataset)
  print('Lista atualizada')

 

  





# 'DIA';'QUEM-TRAZ'
# 'Segunda-Feira';'Edson'
# 'Terça-Feira';'Sammy'
# 'Quarta-feira';'Felipe'
# 'quinta-Feira';'Barbara'
# 'Sexta-Feira';'Jhonatan'
# 'Sabado';'Janio'




























 

# dia_semana = calendar.weekday(ano, mes, dia+2)





  # dia_semana = calendar.weekday(ano, mes, dia+2)


  # if dia_semana == 0:
  #     print('Segunda-feira')
  # elif dia_semana == 1:
  #     print('Terça-feira')
  # elif dia_semana == 2:
  #     print('Quarta-feira')
  # elif dia_semana == 3:
  #     print('Quinta-feira')
  # elif dia_semana == 4:
  #     print('Sexta-feira')
  # elif dia_semana == 5:
  #     print('Sabado')
  # else:
  #     print('Domingo')