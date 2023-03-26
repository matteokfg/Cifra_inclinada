class DeCripto:
    """Classe de descriptografia por cifra inclinada. 
        -> Metodo: DeCripto.descriptografa(encodedString, numberOfRows)

    encodedDtring - frase a ser descriptografada.
    numberOfRows - numero inteiro para descriptografia, representa o numero de linhas que a matriz tinha e vai ter.
    """

    def __str__(self) -> str:
        return "Descriptografia por Cifra Inclinada"


    def _validate_decodeString(encodedString, numberOfRows):
        """Verifica se os parametros passados sao validos.

        Parametros:
        string -- frase.
        numberOfRows -- numero inteiro, que representa numero de linhas da matriz.

        Retorna:
        bool - se forem validos, True. Se nao forem, False.
        """

        if (numberOfRows >= 1 and numberOfRows <= 2*(10**3)) and (len(encodedString) >= 1 and len(encodedString) <= 2*(10**6)) and (len(encodedString) % numberOfRows == 0):
            if encodedString.isalpha() or '_' in encodedString:
                return True
            else:
                return False
        else:
            print("Algo deu errado!")
            return False


    def _decodeString(encodedString, numberOfRows):
        """Faz a descriptografia em si.

        Parametros:
        string -- frase a ser descriptografada.
        numberOfRows -- inteiro, numero de linhas da matriz, sera utilizado para a descriptografia.

        Retorna/Mostra no console:
        string -- frase descriptografada.
        """

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
                    for i in contador: # roda as X linhas
                        print(matriz[i][i+el], end='')
            except:
                pass
            break
        print()


    def descriptografa(self, encodedString, numberOfRows):
        """Funcao Main. Junta as funcoes de validacao e de descriptografia.

        Parametros:
        string -- frase a ser descriptografada.
        numberOfRows -- inteiro, numero de linhas da matriz, sera utilizado para a descriptografia.

        Retorna/Mostra no console:
        string -- frase descriptografada.
        """

        if self._validate_decodeString(encodedString, numberOfRows):
            self._decodeString(encodedString, numberOfRows)
