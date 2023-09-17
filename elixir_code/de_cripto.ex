defmodule DeCripto do
  @moduledoc """
  Dentro desse modulo, existem todas as funcoes necessarias para a quebra da criptografia, utilizanddo matriz inclinada.
  """

  @doc """
  Substitui todas letras de tal tipo dentro da lista para outro tipo de letra.

  ## Parametros
    - lista: lista de caracteres.
    - letra: tipo que sera substituido. Em forma de unicode.
    - Letra: tipo que vai substituir. Em forma de unicode.

  ## Exemplo

    iex>DeCripto.replace_all([0,1,2,3,4,5,0,1,2,3,4,5], 2, 44)
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
  Valida os parametros necessarios para a quebra da criptografia.

  ## Parametros
    - String: string crptografada.
    - Numero: numero de linhas.

  ## Exemplo

    iex>DeCripto.validate_decodeString("mnes__ya_____mi", 3)
    :true

    iex>DeCripto.validate_decodeString("mnes__y_a_____mi5", 4)
    Algo deu errado
    :false

  """

  def validate_decodeString(encodedString, numberOfRows) do
    if (numberOfRows >= 1 and numberOfRows <= 2*(:math.pow(10,3))) and (String.length(encodedString) >= 1 and String.length(encodedString) <= 2*(:math.pow(10, 6)) and rem(String.length(encodedString), numberOfRows) == 0) do
      if String.valid?(encodedString) or String.contains?(encodedString,'_') do
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
  Transforma a frase em uma matriz, tendo a quantidade de linhas iguais ao numero passado como parametro. Substitui os "_" por " ", usando a funcao replace_all().

  ## Parametros
    - Lista: lista tendo os caracteres da frase critptografada.
    - Numero: Quantidade de vezes que a lista vai ser quebrada, igual ao numero de linhas da matriz.

  ## Exemplo

    iex>DeCripto.popula_matriz(["m","n","e","s","_","_","y","a","_","_","_","_","_","m","i"], 3)
    [["m","n","e","s"," "],
     [" ","y","a"," "," "],
     [" "," "," ","m","i"]]
  """

  def popula_matriz(frase, numberOfRows) do
    frase
    |> DeCripto.replace_all( 95, 32)                        #95 eh o unicode de "_", e 32 eh o unicode de " "
    |> Enum.chunk_every( div(length(frase), numberOfRows))
  end

  @doc """
  Le a matriz de forma a retornar a frase com a criptografia quebrada.

  ## Parametros
    - String: string criptogradada.
    - Numero: numero de linhas da matriz.
    - matriz: para ser lida.

  ## Exemplo

    iex>DeCripto.read_dig("mnes__ya_____mi", 3, [["m","n","e","s","_"],["_","y","a","_","_"],["_","_","_","m","i"]])
    my name is
    Parabens, vc conseguiu!

  """

  def read_dig(matriz, encodedString, numberOfRows) do
    try do
      for el <- Enum.to_list(0..div(String.length(encodedString), numberOfRows)-2) do
        for i <- Enum.to_list(0..numberOfRows-1) do
          posicao = i+el
          row = Enum.at(matriz, i)
          elemento = Enum.at(row, posicao)
          IO.write(<<elemento::utf8>>)
        end
      end
    rescue
      e in ArgumentError -> IO.puts("")
    after
      IO.puts("Parabens, vc conseguiu!")
    end
  end

  @doc """
  Recebe a string crptografada e o numero de linhas e transforma a string em charlist, a charlista em matriz e chama a funcao read_dig, passadno a string, o numero e a matriz.

  ## Parametros
    - Lista: lista tendo os caracteres da frase critptografada.
    - Numero: Quantidade de vezes que a lista vai ser quebrada, igual ao numero de linhas da matriz.

  ## Exemplo

    iex>DeCripto.decodeString("mnes__ya_____mi", 3)
    my name is
    Parabens, vc conseguiu!
  """

  def decodeString(encodedString, numberOfRows) do
    encodedString
    |> String.to_charlist()
    |> DeCripto.popula_matriz( numberOfRows)
    |> DeCripto.read_dig( encodedString, numberOfRows)
  end

  @doc """
    Recebe os parametros, valida eles, por meio da funcao validate_decodeString(), e se passarem chama a funcao decodeString().

    ## Parametros
      - Lista: lista tendo os caracteres da frase critptografada.
      - Numero: Quantidade de vezes que a lista vai ser quebrada, igual ao numero de linhas da matriz.

    ## Exemplo

      iex>DeCripto.descriptografa("mnes__ya_____mi", 3)
      my name is
      Parabens, vc conseguiu!

      iex>DeCripto.descriptografa("mnes__y_a_____mi5", 4)
      Algo deu errado
    """

  def descriptografa(encodedString, numberOfRows) do
    if DeCripto.validate_decodeString(encodedString, numberOfRows) do
      DeCripto.decodeString(encodedString, numberOfRows)
    end
  end
end
