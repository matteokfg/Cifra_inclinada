 class Cripto:
    """Classe de criptografia por cifra inclinada.
        -> Instanciar: cripto = Cripto(criptocaracter)
        -> Metodo: Cripto.encode_string(string, numberOfRows)

    string - frase a ser criptografada.
    numberOfRows - numero inteiro para criptografia, representa o numero de linhas que a matriz vai ter.
    """

    def __init__(self, criptocaracter):
        self.criptocaracter = criptocaracter


    def __str__(self) -> str:
        return "Criptografia por Cifra Inclinada"


    def _remove_espacos(self, string):
        """Metodo privado. Pega a frase e retira todos os espacos, para futura validacao.

        Parametros:
        string -- frase criptografada original.

        Retorna:
        string -- frase criptografada sem criptocaracter.
        """

        new_string_list = [character for character in string if character != " "]
        new_string = "".join(new_string_list)
        return new_string


    def _espacos_por_criptocaracter(self, string):
        """Substitui os espacos por criptocaracter."""

        string = list(string)
        for v, i in enumerate(string):
            if i == " ":
                string[v] = self.criptocaracter
        return string


    def _falsos_criptocaracter_String(self, string, numberOfRows):
        """Adiciona os falsos criptocaracteres na string.

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
                string.append(self.criptocaracter)
            booleano = False
        return string, booleano


    def _validate_String(self, string, numberOfRows):
        """Verifica se os parametros passados sao validos.

        Parametros:
        string -- frase.
        numberOfRows -- numero inteiro, que representa numero de linhas da matriz.

        Retorna:
        bool - se forem validos, True. Se nao forem, inicia erro.
        """

        string_sem_espaco = self._remove_espacos(string) # reitra os espacos, para validar

        #    (1 <= numberOfRows <= 2000)  and                         (1<= tamanho da frase <= 2000000)
        if ((numberOfRows >= 1) and (numberOfRows <= 2*(10**3))) and ((len(string) >= 1) and (len(string) <= 2*(10**6))):
            #   (frase so pode ter letras)       (exceto espaco)
            if (string_sem_espaco.isalpha()) and (' ' in string):
                return True
            else:
                raise Exception("Erro! Frase com simbolo desconhecido.")
        else:
            raise Exception("Erro! Tamanho da frase ou valor do 'numberOfRows' errados.")


    def _encoding_String(self, string, numberOfRows):
        """Faz a criptografia em si, ate mesmo utilizando outras funcoes.

        Parametros:
        string -- frase a ser criptografada.
        numberOfRows -- inteiro, numero de linhas da matriz, sera utilizado para a criptografia.

        Retorna/Mostra no console:
        string -- frase criptografada.
        """

        #------------ preparo a string / vira uma lista -----------------------
        new_String = self._espacos_por_criptocaracter(string)                                           # substituo o valor dos espacos pelo criptocaracter
        new_String, string_verdadeira = self._falsos_criptocaracter_String(new_String, numberOfRows)    # garanto que a string tenha uma tamanho divisivel pelo numero de linhas, por se precisar colocar no final dela quantos criptocaraceter forem necessarios
        copia_string = new_String.copy()                                                                # faco uma copia da lista da string ja que vou apagar o item inicial a cada passagem pelo looping

        #------------ crio a matriz --------------------------
        if string_verdadeira:
            n_colunas = int(len(new_String)/numberOfRows) + (numberOfRows - 1)                                # a quantidade de colunas vai ser o tamanho da string dividido pelo numero de linhas mais o numeros de linha menos 1
            matriz = [[self.criptocaracter for i in range(n_colunas)] for i in range(numberOfRows)]           # crio a matriz
        else:
            n_colunas = int(len(new_String)/numberOfRows) + (numberOfRows - 2)                                # a quantidade de colunas vai ser o tamanho da string dividido pelo numero de linhas mais o numeros de linha menos 2, garanto que a coluna com apenas criptocaracecteres falsos sea excluida
            matriz = [[self.criptocaracter for i in range(n_colunas)] for i in range(numberOfRows)]           # crio a matriz

        #------------ popula a matriz ------------------------
        contador_linhas = range(numberOfRows)
        try:
            for el in range(int((len(new_String)/numberOfRows))):                   # roda a quantidade de diagonais lidas, caso de erro fora de indice na ultima letra tem o try e except
                for i in contador_linhas:                                           # roda as X linhas
                    matriz[i][i+el] = copia_string[0]                               # coloca o caracter da string no seu lugar na matriz/diagonal
                    copia_string.pop(0)                                             # para que nao seja repetido, retira-se o item, assim dando o lugar para o proximo valor a ser colocado na prozima vez no for loop
        except IndexError:
            pass

        #------------ le a matriz linha por linha ----------------------------
        for linha in matriz:
            for caracter in linha:
                print(caracter, end="")
        print()


    def encode_String(self, string, numberOfRows):
        """Funcao Main. Junta as funcoes de validacao e de criptografia.

        Parametros:
        string -- frase a ser criptografada.
        numberOfRows -- inteiro, numero de linhas da matriz, sera utilizado para a criptografia.

        Retorna/Mostra no console:
        string -- frase criptografada.
        """

        if self._validate_String(string, numberOfRows):
            self._encoding_String(string, numberOfRows)
