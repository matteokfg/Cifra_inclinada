defmodule Cripto do
  @moduledoc """
  Dentro desse modulo, existem todas as funcoes necessarias para a criptografia utilizanddo matriz inclinada.
  """

  @doc """
  Substitui todas letras de tal tipo dentro da lista para outro tipo de letra.

  ## Parametros
    - lista: lista de caracteres.
    - letra: tipo que sera substituido. Em forma de unicode.
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

  def string_p_matrizFrase(string, numberOfRows) do
    #---------- preparo a string ----------------------
    frase = String.to_charlist(string)                                          # transforma a string em uma lista de caracteres (char)
    frase_c_underline = Cripto.replace_all(frase, 32, 95)                       # substitui os espacos por underlines
    #--------- preparo a lista da string --------------
    frase_modificada_em_matriz = Enum.chunk_every(frase_c_underline, numberOfRows, numberOfRows, List.duplicate("_", numberOfRows+1)) #div(length(frase),numberOfRows) # separo a lista em uma lsita de listas cada lista com numero de carateres igual ao numero de linhas, no final eh adicionado underlines falsos
    matrizFrase = Cripto.transpose(frase_modificada_em_matriz)                  # coluna em linha e linha em coluna
    {matrizFrase, frase}
  end

  def melhora_matriz(matrizFrase, numberOfRows, frase) do
    nova_matriz = []

    nova_m = for i <- matrizFrase do                                            # retorna uma matriz
              if i != List.last(matrizFrase) do                                 # se alinha nao for a ultima, retorna a nova matriz com nova linha
                n_colunas = div(length(frase),numberOfRows) + numberOfRows - 1  # quantidade de colunas (nº de underlines mais numero de caracteres, como ultima linha)
                quant_underlines = n_colunas - length(i) + 1                    # quantidade de undelines por linha
                underlines = List.duplicate("_", quant_underlines)              # lista com underlines por linha
                nova_linha = Enum.concat(i, underlines)                         # concateno a linha da frase com a lista de underlines (no final)
                nova_matriz ++ nova_linha                                       # adiciono a nova linha na nova matriz, que vai ser retornada pelo if
              else
                nova_linha= if "_" == List.last(i) do                           # se o ultimo item da linha for underline, retorna nova linha
                              {_valorExcluido, nova_linha} = List.pop_at(i, -1) # exclui o underline no final
                              nova_linha                                        # valor da nova linha que vai ser retornado pelo if
                            else
                              nova_linha = i                                    # se nao tiver underlinhe no final, a linha interira e a nova linha
                              nova_linha                                        # valor da nova linha que vai ser retornado pelo if
                            end
                nova_matriz ++ nova_linha                                       # adiciono a nova linha na nova matriz, que vai ser retornada pelo if
              end
            end
    nova_m
  end

  def codeString(string, numberOfRows) do
    {matrizFrase, frase} = Cripto.string_p_matrizFrase(string, numberOfRows)
    matriz = Cripto.melhora_matriz(matrizFrase, numberOfRows, frase)
    IO.puts("\n -> Parabens conseguiu! Criptografando para: #{matriz}\n")       # imprimo na tela a matriz, o IO.puts() ja vai transformar a a charlist em string e varias linha em uma linha
  end

  def criptografa(string, numberOfRows) do
    if Cripto.validate_string(string, numberOfRows) do
      Cripto.codeString(string, numberOfRows)
    end
  end
end
