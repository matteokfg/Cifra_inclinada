defmodule Cripto do
  @moduledoc """
  Dentro desse modulo, existem todas as funcoes necessarias para a criptografia utilizanddo matriz inclinada.
  """

  @doc """
  Substitui todas letras de tal tipo dentro da lista para outro tipo de letra.

  ## Parametros
    - Lista: lista de caracteres.
    - Letra: tipo que sera substituido. Em forma de unicode.
    - Letra: tipo que vai substituir. Em forma de unicode.

  ## Exemplo

    iex>Cripto.replace_all([0,1,2,3,4,5,0,1,2,3,4,5], 2, 44)
    [0,1,44,3,4,5,0,1,44,3,4,5]

  """

  def replace_all(list, from, to) do
    list
    |> Enum.map(fn
      ^from -> to
      other -> other
    end)
  end

  @doc """
  Transforma as linhas de uma matriz em colunas e as colunas em linhas.

  ## Parametros
    - Lista de listas.

  ## Exemplo

    iex>Cripto.transpose([[1, 2], [3, 4], [5, 6]])
    [[1, 3, 5], [2, 4, 6]]

  """

  def transpose(rows) do
    rows
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end

  @doc """
  Valida os parametros necessarios para a criptografia.

  ## Parametros
    - String: string crptografada.
    - Numero: numero de linhas.

  ## Exemplos

    iex>Cripto.validate_string("my name is", 3)
    :true

    iex>Cripto.validate_string("my name is5", 4)
    Algo deu errado
    :false

  """

  def validate_string(string, numberOfRows) do
    if (numberOfRows >= 1 and numberOfRows <= 2*(:math.pow(10,3))) and (String.length(string) >= 1 and String.length(string) <= 2*(:math.pow(10, 6))) do
      if String.valid?(string) or String.contains?(string,'_') do
        :true
      else
        IO.puts("Algo deu errado")
        :false
      end
    else
      IO.puts("Algo deu errado")
      :false
    end
  end

  @doc """
  Transforma a string em uma lista de charlistas.

  ## Parametros
    - String: string a ser criptografada.
    - Numero: numero de linhas.

  ## Exemplo

    iex>Cripto.string_p_matrizFrase("my name is", 3)
    {[109, 121, 32, 110, 97, 109, 101, 32, 105, 115], [[109, 110, 101, 115], [121, 97, 95, 95], [95, 109, 105, 95]]}

  """

  def string_p_matrizFrase(string, numberOfRows) do
    #---------- preparo a string ----------------------
    frase = string |> String.to_charlist()                                                  # transforma a string em uma lista de caracteres (char)
    #---------- retorno uma tupla ---------------------
    {
      frase,
      #--------- preparo a lista da string --------------
      frase
      |> Cripto.replace_all( 32, 95)                                                        # substitui os espacos por underlines
      |> Enum.chunk_every( numberOfRows, numberOfRows, List.duplicate(95, numberOfRows+1))  # separo a lista em uma lista de listas cada lista com numero de carateres igual ao numero de linhas, no final eh adicionado underlines falsos
      |> Cripto.transpose()                                                                 # coluna em linha e linha em coluna
    }
  end

  @doc """
  Recebe a lista de charlistas e adiciona no final de cada uma a quantidade de underlines necessarios para cada linha linha ficar cheia, e se tornar uma matriz completa.

  ## Parametros
    - Tupla: com dois valores:
      -- Charlista: lista de caracteres para utilizar o tamanho dela nos calculos dentro da funcao.
      -- Lista: lista com as charlistas, da string separada.
    - Numero: numero de linhas da matriz.

  ## Exemplo

    iex>Cripto.melhora_matriz({[109, 121, 32, 110, 97, 109, 101, 32, 105, 115], [[109, 110, 101, 115], [121, 97, 95, 95], [95, 109, 105, 95]]}, 3)
    [[109, 110, 101, 115, 95, 95], [121, 97, 95, 95, 95, 95], [95, 109, 105, 95]]

  """

  def melhora_matriz({frase, matrizFrase}, numberOfRows) do
    nova_matriz = []

    for i <- matrizFrase do                                               # retorna uma matriz
      nova_matriz ++                                                      # adiciono a nova linha na nova matriz
      cond do
        i != List.last(matrizFrase) ->                                    # se alinha nao for a ultima, retorna a nova matriz com nova linha
          n_colunas = div(length(frase),numberOfRows) + numberOfRows - 1  # quantidade de colunas (nº de underlines mais numero de caracteres, como ultima linha)
          quant_underlines = n_colunas - length(i) + 1                    # quantidade de undelines por linha
          underlines = List.duplicate("_", quant_underlines)              # lista com underlines por linha
          nova_linha = Enum.concat(i, underlines)                         # concateno a linha da frase com a lista de underlines (no final), valor da nova linha que vai ser retornado pela condicao

        List.last(i) == 95 ->                                             # se o ultimo item da linha for underline, retorna nova linha
          {_valorExcluido, nova_linha} = List.pop_at(i, -1)               # exclui o underline no final
          nova_linha                                                      # valor da nova linha que vai ser retornado pela condicao

        true -> i                                                         # se nao tiver underlinhe no final, a linha inteira eh a nova linha, sendo retornado pela condicao
      end
    end
  end

  @doc """
  E uma funcao que junta todas a funcaoes necessarias para a criptografia da string, e que no final printa na tela a string criptografada.

  ## Parametros
    - String: string a ser criptografada.
    - Numero: numero de linhas para criptografia por matriz.

  ## Exemplo

    iex>Cripto.codeString("my name is", 3)

     -> Parabens conseguiu! Criptografando para: mnes__ya_____mi

  """

  def codeString(string, numberOfRows) do
    matriz = string |> Cripto.string_p_matrizFrase( numberOfRows) |> Cripto.melhora_matriz( numberOfRows)
    IO.puts("\n -> Parabens conseguiu! Criptografando para: #{matriz}\n")                                 # imprimo na tela a matriz, o IO.puts() ja vai transformar a a charlist em string e varias linhas em uma linha
  end

  @doc """
  Funcao "main", junta a funcao que criptografa a string, junto com a funcao que valida os parametros.

  ## Parametros
    - String: string que vai ser criptografada.
    - Inteiro: numero de linhas para a matriz.

  ## Exemplos

    iex>Cripto.criptografa("my name is", 3)

     -> Parabens conseguiu! Criptografando para: mnes__ya_____mi

    iex>Cripto.criptografa("my name is5", 3)
    Algo deu errado
    :false

  """

  def criptografa(string, numberOfRows) do
    if Cripto.validate_string(string, numberOfRows) do
      Cripto.codeString(string, numberOfRows)
    end
  end
end
