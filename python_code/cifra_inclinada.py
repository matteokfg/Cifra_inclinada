def validate_decodeString(encodedString, numberOfRows):
    if (numberOfRows >= 1 and numberOfRows <= 2*(10**3)) and (len(encodedString) >= 1 and len(encodedString) <= 2*(10**6)) and (len(encodedString) % numberOfRows == 0):
        if encodedString.isalpha() or '_' in encodedString:
            return True
        else:
            return False
    else:
        print("Algo deu errado!")
        return False

def decodeString(encodedString, numberOfRows):
    matriz = [["_" for i in range(int(len(encodedString)/numberOfRows))] for i in range(numberOfRows)]

    contador = 0
    for vel, el in enumerate(matriz):
        for v, i in enumerate(el):
            if encodedString[contador] == "_":
                matriz[vel][v] = " "
            else:
                matriz[vel][v] = encodedString[contador]
            contador += 1

    contador = range(numberOfRows)
    while True:
        try:
            for el in range(int((len(encodedString)/numberOfRows) - 1)): # roda a quantidade de diagonais lidas, sendo equivalente ao numberOfRows de colunas menos 1, caso de erro fora de indice na ultima letra tem o try e except
                for i in contador: # roda as 3 linhas
                    print(matriz[i][i+el], end='')
        except:
            pass
        break
    print()

def descriptografa(encodedString, numberOfRows):
    if validate_decodeString(encodedString, numberOfRows):
        decodeString(encodedString, numberOfRows)
