import calendar
import numpy as np
from datetime import date


# ano = date.today().year
# mes = date.today().month
# dia = date.today().day
# data = calendar.TextCalendar(calendar.SUNDAY)

lista = ['Segunda-feira','Terça-feira','Quarta-feira','Quinta-feira','Sexta-feira','sabado','domingo']
# nome =[ 'Edson','Sammy', 'Felipe','Barbara','Jhonatan','Janio']

# nome = np.loadcsv('nomes.html', sep=';')
np.loadtxt('nomes')


# dia_semana = calendar.weekday(ano, mes, dia+2)

# while dia_semana == 6:
#   if mes == 5:
#     for x in range(6):
#       dia = [lista[x], nome[x]]
#       print(dia)
#     break
    




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