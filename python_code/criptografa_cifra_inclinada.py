def espacos_por_underline(String):
    String = list(String)
    for v, i in enumerate(String):
        if i == " ":
            String[v] = "_"
    return String

def validate_String(String, numberOfRows):
    if (numberOfRows >= 1 and numberOfRows <= 2*(10**3)) and (len(String) >= 1 and len(String) <= 2*(10**6)) and (len(String) % numberOfRows == 0):
        if String.isalpha() or ' ' in String:
            return True
        else:
            return False
    else:
        print("Algo deu errado!")
        return False

def encoding_String(String, numberOfRows):
    #------------ crio a matriz --------------------------
    n_colunas = int(len(String)/numberOfRows) + (numberOfRows - 1) # a quantidade de colunas vai ser o tamanho da string dividido pelo numero de linhas mais o numeros de linha menos 1
    matriz = [["_" for i in range(n_colunas)] for i in range(numberOfRows)] # crio a matriz

    #------------ preparo a string -----------------------
    new_String = espacos_por_underline(String) # substituo o valor os espacos por underlines
    copia_string = new_String.copy() # faco uma copia da lista da string ja que vou apagar o item inicial a cada passagem pelo looping

    #------------ popula a matriz ------------------------
    contador_linhas = range(numberOfRows)
    try:
        for el in range(int((len(String)/numberOfRows))): # roda a quantidade de diagonais lidas, caso de erro fora de indice na ultima letra tem o try e except
            for i in contador_linhas: # roda as X linhas
                matriz[i][i+el] = copia_string[0] # coloca o caracter da string no seu lugar na matriz/diagonal
                copia_string.pop(0) # para que n seja repetido, retira-se o item, assim dando o lugar para o proximo valor a ser colocado na prozima vez no for loop
    except:
        pass

    #------------ le a matriz ----------------------------
    for linha in matriz:
        for caracter in linha:
            print(caracter, end="")
    print()

def encode_String(String, numberOfRows):
    if validate_String(String, numberOfRows):
        encoding_String(String, numberOfRows)