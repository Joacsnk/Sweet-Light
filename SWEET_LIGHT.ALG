algoritmo "SWEET_LIGHT"
// Disciplina   : [Linguagem e L�gica de Programa��o] 

//Procedimento onde ir� fazer o menu gr�fico
Procedimento Menu():inteiro
inicio

Escreval("           ----------------------------------------------")
Escreval("           |                                            |")
Escreval("           |     SWEET                  LIGTH           |")
Escreval("           ----------------------------------------------")
Escreval("")
Escreval("                                 Menu                                           ")
Escreval("")
Escreval("")
Escreval("1- Registrar o n�mero de cada avi�o")
Escreval("2- Registrar o quantitativo de assentos dispon�veis em cada avi�o")
Escreval("3- Reservar passagem a�rea")
Escreval("4- Realizar consulta por avi�o.")
Escreval("5- Realizar consulta por passageiro")
Escreval("6- Encerrar")
Escreval("")
Leia(resposta) //resposta que ser� a vari�vel principal de escolha
Limpatela
FimProcedimento

//Procedimento para registrar os n�meros dos 4 avi�es
Procedimento Registrar_aviao()
inicio

Para i de 1 ate 4 faca
     Escreval("Digite o n�mero do", i, "� avi�o:")
     Leia(aviao[i])
     Limpatela
FimPara
FimProcedimento

//Procedimento para registrar quantos assentos tem em cada avi�o
Procedimento Registrar_assentos()
inicio

Para i de 1 ate 4 faca
     Escreval("Digite a quantidade de assentos no avi�o N�", aviao[i], ":")
     Leia(assento[i])
     Limpatela
FimPara
FimProcedimento

//Procedimento para fazer a reserva do avi�o, digitando o n�mero do avi�o e o nome
Procedimento Registrar_reserva()
var
numero: inteiro

inicio

Escreva("Digite o N� do avi�o:")
Leia(numero)
Para i de 1 ate 4 faca
     Se numero = aviao[i] entao
        cadastro.numero_aviao[contador] <- aviao[i]
        contreserva[i] <- contreserva[i] + 1
        Limpatela
        interrompa
        Escreval("")
        numero <- i
     Senao
          Se (numero <> aviao[i]) e (i = 4) entao
             Limpatela
             Escreval("Este avi�o n�o existe!")
             Escreval("")
          FimSe
     FimSe
FimPara

Se numero = aviao[i] entao
   Se assento[i] > 0 entao
      Escreva("Nome do passageiro:")
      Leia(cadastro.nome_passageiro[Contador])
      assento[i] <- assento[i] - 1
      contador <- contador + 1
      Limpatela
      Escreval("Reserva realizada com sucesso!")
      Escreval("")
   Senao
      Escreva("�N�o h� assentos dispon�veis para este avi�o!")
      Escreval("")
   FimSe
FimSe

FimProcedimento

// Procedimento para pesquisar o avi�o e ver as reservas dispon�veis
Procedimento Pesquisar_aviao()
var
naviao: inteiro

inicio

Escreva("N�mero do avi�o:")
Leia(naviao)
Para i de 1 ate 4 faca
     Se naviao = aviao[i] entao
        Limpatela
        interrompa
        Escreval("")
     Senao
          Se (naviao <> aviao[i]) e (i = 4) entao
             Limpatela
             Escreval("Este avi�o n�o existe!")
             Escreval("")
          FimSe
     FimSe
FimPara
Se (naviao = aviao[i]) e (contreserva[i] > 0) entao
   Para i de 1 ate 20 fa�a
        Se cadastro.numero_aviao[i] = naviao entao
           Escreval(cadastro.nome_passageiro[i])
        FimSe
   FimPara
   Escreval("")
   Escreval("Todas as reservas acima")
Sen�o
   Limpatela
   Escreval("N�o h� reservas realizadas para este avi�o")
   Escreval("")
FimSe
FimProcedimento

// Procedimento para pesquisar qual avi�o estar a reserva pelo nome
Procedimento Pesquisar_nome()
var
nnome: caracter
cont: logico

inicio
cont <- falso
Escreva("Nome do passageiro:")
Leia(nnome)
Limpatela
Para i de 1 ate 20 faca
     Se nnome = cadastro.nome_passageiro[i] ent�o
        Escreval(cadastro.numero_aviao[i])
        cont <- verdadeiro
     FimSe
FimPara
Se cont = falso entao
   Limpatela
   Escreval("N�o h� reservas realizadas para este passageiro!")
   Escreval("")
Senao
   Escreval("")
   Escreval("Todas as reservas acima")
   Escreval("")
FimSe
FimProcedimento

// Registro para salvar as reservas
tipo
    reserva = registro
    numero_aviao: inteiro
    nome_passageiro: caracter
FimRegistro

var
cadastro: vetor[1..20] de reserva
aviao, assento, contreserva: vetor[1..4] de inteiro
resposta, i, contador: inteiro
res: reserva

// Parte principal, onde s�o designadas cada fun��o
inicio
contador <- 1
Enquanto Resposta <> 6 faca
         Menu()
         Escolha resposta
         Caso 1
              Registrar_aviao()
         Caso 2
              Registrar_assentos()
         Caso 3
              Se contador < 21 ent�o
                 Registrar_reserva()
              Senao
                 Escreval("Limite de reservas atingidas!")
              FimSe
         Caso 4
              Pesquisar_aviao()
         Caso 5
              pesquisar_nome()
         FimEscolha
FimEnquanto
fimalgoritmo