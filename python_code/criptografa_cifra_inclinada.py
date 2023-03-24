def espacos_por_underline(string):
    """Substitui os espacos por underlines."""

    string = list(string)
    for v, i in enumerate(string):
        if i == " ":
            string[v] = "_"
    return string

def falsos_underlines_String(string, numberOfRows):
    """Adiciona os falsos underlines na string.

    Parametros:
    string -- frase que vai ser modificada com underlines extras, que nao estavam na inicial.
    numberOfRows -- inteiro com a quantidade de linhas.

    Retorna:
    string -- frase modificada.
    bool -- se for necessario modificar, sera False. Se nao foi, True.
    """

    if (len(string) % numberOfRows == 0):
        booleano = True
    else:
        while len(string) % numberOfRows != 0: # coloca underlines no final da string para que o tamanho fique divisivel pelo numero de linhas
            string.append("_")
        booleano = False
    return string, booleano

def validate_String(string, numberOfRows):
    """Verifica se os parametros passados sao validos.

    Parametros:
    string -- frase.
    numberOfRows -- numero inteiro, que representa numero de linhas da matriz.

    Retorna:
    bool - se forem validos, True. Se nao forem, False.
    """

    if (numberOfRows >= 1 and numberOfRows <= 2*(10**3)) and (len(string) >= 1 and len(string) <= 2*(10**6)):
        if string.isalpha() or ' ' in string:
            return True
        else:
            return False
    else:
        print("Algo deu errado!")
        return False

def encoding_String(string, numberOfRows):
    """Faz a criptografia em si, ate mesmo utilizando outras funcoes.

    Parametros:
    string -- frase a ser criptografada.
    numberOfRows -- inteiro, numero de linhas da matriz, sera utilizado para a criptografia.

    Retorna/Mostra no console:
    string -- frase criptografada.
    """

    #------------ preparo a string / vira uma lista -----------------------
    new_String = espacos_por_underline(string)                                            # substituo o valor dos espacos por underlines
    new_String, string_verdadeira = falsos_underlines_String(new_String, numberOfRows)    # garanto que a string tenha uma tamanho divisivel pelo numero de linhas, por se precisar colocar no final dela quantos underlines forem necessarios
    copia_string = new_String.copy()                                                      # faco uma copia da lista da string ja que vou apagar o item inicial a cada passagem pelo looping

    #------------ crio a matriz --------------------------
    if string_verdadeira:
        n_colunas = int(len(new_String)/numberOfRows) + (numberOfRows - 1)                # a quantidade de colunas vai ser o tamanho da string dividido pelo numero de linhas mais o numeros de linha menos 1
        matriz = [["_" for i in range(n_colunas)] for i in range(numberOfRows)]           # crio a matriz
    else:
        n_colunas = int(len(new_String)/numberOfRows) + (numberOfRows - 2)                # a quantidade de colunas vai ser o tamanho da string dividido pelo numero de linhas mais o numeros de linha menos 2, garanto que a coluna com apenas underlines falsos sea excluida
        matriz = [["_" for i in range(n_colunas)] for i in range(numberOfRows)]           # crio a matriz

    #------------ popula a matriz ------------------------
    contador_linhas = range(numberOfRows)
    try:
        for el in range(int((len(new_String)/numberOfRows))):                   # roda a quantidade de diagonais lidas, caso de erro fora de indice na ultima letra tem o try e except
            for i in contador_linhas:                                           # roda as X linhas
                matriz[i][i+el] = copia_string[0]                               # coloca o caracter da string no seu lugar na matriz/diagonal
                copia_string.pop(0)                                             # para que n seja repetido, retira-se o item, assim dando o lugar para o proximo valor a ser colocado na prozima vez no for loop
    except:
        pass

    #------------ le a matriz linha por linha ----------------------------
    for linha in matriz:
        for caracter in linha:
            print(caracter, end="")
    print()

def encode_String(string, numberOfRows):
    """Funcao Main. Junta as funcoes de validacao e de criptografia.

    Parametros:
    string -- frase a ser criptografada.
    numberOfRows -- inteiro, numero de linhas da matriz, sera utilizado para a criptografia.

    Retorna/Mostra no console:
    string -- frase criptografada.
    """

    if validate_String(string, numberOfRows):
        encoding_String(string, numberOfRows)
