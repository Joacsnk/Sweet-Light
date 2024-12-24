algoritmo "SWEET_LIGHT"
// Disciplina   : [Linguagem e Lógica de Programação] 

//Procedimento onde irá fazer o menu gráfico
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
Escreval("1- Registrar o número de cada avião")
Escreval("2- Registrar o quantitativo de assentos disponíveis em cada avião")
Escreval("3- Reservar passagem aérea")
Escreval("4- Realizar consulta por avião.")
Escreval("5- Realizar consulta por passageiro")
Escreval("6- Encerrar")
Escreval("")
Leia(resposta) //resposta que será a variável principal de escolha
Limpatela
FimProcedimento

//Procedimento para registrar os números dos 4 aviões
Procedimento Registrar_aviao()
inicio

Para i de 1 ate 4 faca
     Escreval("Digite o número do", i, "° avião:")
     Leia(aviao[i])
     Limpatela
FimPara
FimProcedimento

//Procedimento para registrar quantos assentos tem em cada avião
Procedimento Registrar_assentos()
inicio

Para i de 1 ate 4 faca
     Escreval("Digite a quantidade de assentos no avião N°", aviao[i], ":")
     Leia(assento[i])
     Limpatela
FimPara
FimProcedimento

//Procedimento para fazer a reserva do avião, digitando o número do avião e o nome
Procedimento Registrar_reserva()
var
numero: inteiro

inicio

Escreva("Digite o N° do avião:")
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
             Escreval("Este avião não existe!")
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
      Escreva("“Não há assentos disponíveis para este avião!")
      Escreval("")
   FimSe
FimSe

FimProcedimento

// Procedimento para pesquisar o avião e ver as reservas disponíveis
Procedimento Pesquisar_aviao()
var
naviao: inteiro

inicio

Escreva("Número do avião:")
Leia(naviao)
Para i de 1 ate 4 faca
     Se naviao = aviao[i] entao
        Limpatela
        interrompa
        Escreval("")
     Senao
          Se (naviao <> aviao[i]) e (i = 4) entao
             Limpatela
             Escreval("Este avião não existe!")
             Escreval("")
          FimSe
     FimSe
FimPara
Se (naviao = aviao[i]) e (contreserva[i] > 0) entao
   Para i de 1 ate 20 faça
        Se cadastro.numero_aviao[i] = naviao entao
           Escreval(cadastro.nome_passageiro[i])
        FimSe
   FimPara
   Escreval("")
   Escreval("Todas as reservas acima")
Senão
   Limpatela
   Escreval("Não há reservas realizadas para este avião")
   Escreval("")
FimSe
FimProcedimento

// Procedimento para pesquisar qual avião estar a reserva pelo nome
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
     Se nnome = cadastro.nome_passageiro[i] então
        Escreval(cadastro.numero_aviao[i])
        cont <- verdadeiro
     FimSe
FimPara
Se cont = falso entao
   Limpatela
   Escreval("Não há reservas realizadas para este passageiro!")
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

// Parte principal, onde são designadas cada função
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
              Se contador < 21 então
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