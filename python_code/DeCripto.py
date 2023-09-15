class DeCripto:
    """Classe de descriptografia por cifra inclinada.
        -> Instanciar: deCripto = DeCripto("criptocaracter")
        -> Metodo: deCripto.descriptografa(encodedString, numberOfRows)

    encodedDtring - frase a ser descriptografada.
    numberOfRows - numero inteiro para descriptografia, representa o numero de linhas que a matriz tinha e vai ter.
    """

    def __init__(self, caracter):
        self.caracter = caracter #caracter utilizado na matriz para espacos vazios e entre letras da frase original. Chamado de criptocaracter.


    def __str__(self) -> str:
        return "Descriptografia por Cifra Inclinada"


    def _remove_underline(self, encodedString):
        """Metodo privado. Pega a frase e retira todos os criptocaracteres, para futura validacao.

        Parametros:
        string -- frase criptografada original.

        Retorna:
        string -- frase criptografada sem criptocaracter.
        """

        new_encodedString_list = [character for character in encodedString if character != self.caracter]
        new_encodedString = "".join(new_encodedString_list)
        return new_encodedString


    def _validate_decodeString(encodedString, numberOfRows):
        """Verifica se os parametros passados sao validos.

        Parametros:
        string -- frase.
        numberOfRows -- numero inteiro, que representa numero de linhas da matriz.

        Retorna:
        bool - se forem validos, True. Se nao forem, False.
        """

        encodedString_sem_underline = self._remove_underline(encodedString) # retira os criptocaracters da frase

        #    (1 <= numberOfrows <= 2000)   and                         (1 <= tamanho da frase <= 2000000)      and                      (tamanho da frase divisivel por numberOfRows)
        if ((numberOfRows >= 1) and (numberOfRows <= 2*(10**3))) and ((len(encodedString) >= 1) and (len(encodedString) <= 2*(10**6))) and ((len(encodedString) % numberOfRows) == 0):
            #  (frase deve conter apenas letras)           (exceto criptocaracter)
            if (encodedString_sem_underline.isalpha()) and (self.caracter in encodedString):
                return True
            else:
                raise Exception("Erro! Frase com simbolo desconhecido.")
        else:
            raise Exception("Erro! Tamanho da frase ou valor do 'numberOfRows' errados.")


    def _decodeString(encodedString, numberOfRows):
        """Faz a descriptografia em si.

        Parametros:
        string -- frase a ser descriptografada.
        numberOfRows -- inteiro, numero de linhas da matriz, sera utilizado para a descriptografia.

        Retorna/Mostra no console:
        string -- frase descriptografada.
        """

        #--------------- cria a matriz -------------------------------
        matriz = [[self.caracter for i in range(int(len(encodedString)/numberOfRows))] for i in range(numberOfRows)]

        #--------------- popula a matriz -----------------------------
        contador = 0
        for vel, el in enumerate(matriz):
            for v, i in enumerate(el):
                if encodedString[contador] == self.caracter:
                    matriz[vel][v] = " "
                else:
                    matriz[vel][v] = encodedString[contador]
                contador += 1

        #--------------- le a matriz -------------------------------
        contador = range(numberOfRows)
        try:
            for el in range(int((len(encodedString)/numberOfRows) - 1)): # roda a quantidade de diagonais lidas, sendo equivalente ao numberOfRows de colunas menos 1, caso de erro fora de indice na ultima letra tem o try e except
                for i in contador: # roda as X linhas
                    print(matriz[i][i+el], end='')
        except IndexError:
            pass
        finally:
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
