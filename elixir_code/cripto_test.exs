defmodule CriptoTest do
  use ExUnit.Case

  test "criptografia - frase pequena - valor" do
    assert Cripto.criptografa("my name is", 3) == 'mnes__ya_____mi'
  end

  test "criptografia - frase media - valor" do
    assert Cripto.criptografa("nao havera borboletas se a vida nao passar por longas e silenciosas metamorfoses", 4) == 'nhrols_inpaoossnsmmo____aaare_adaarrn_icaeos____ov_bts_aos__gelistre_____eboaev__spla_eo_afs'
  end

  test "criptografia - frase grande - valor" do
    assert Cripto.criptografa("para mim as horas sao curtas e os dias pequenos por mais longas que sejam as horas e maiores que sejam dos dias nao sao suficientes para satisfazer a vontade que sinto de estar sempre com voce", 6) == 'pihsr_aupigemo_e__iosepazvesdapm______amoatoseosa__rmssda_unateo_ierr_______r_roas_nr_ssaaa_eossftrirnqn__ev______aaa_s_po_l_essiqjs_aieas_tutes_o_______ssc_desmoqj__oua_nocs_faaeosecc______m__ueiq_anuaheremda_i_sa_d__tmoe'
  end

  test "criptografia - frase pequena - tempo" do
    inicio = Time.utc_now()
    Cripto.criptografa("my name is", 3)
    fim = Time.utc_now()
    tempo = Time.diff(fim, inicio, :microsecond)
    IO.puts("#{tempo} microssegundos \n")
  end

  test "criptografia - frase media - tempo" do
    inicio = Time.utc_now()
    Cripto.criptografa("nao havera borboletas se a vida nao passar por longas e silenciosas metamorfoses", 4)
    fim = Time.utc_now()
    tempo = Time.diff(fim, inicio, :microsecond)
    IO.puts("#{tempo} microssegundos \n")
  end

  test "criptografia - frase grande - tempo" do
    inicio = Time.utc_now()
    Cripto.criptografa("para mim as horas sao curtas e os dias pequenos por mais longas que sejam as horas e maiores que sejam dos dias nao sao suficientes para satisfazer a vontade que sinto de estar sempre com voce", 6)
    fim = Time.utc_now()
    tempo = Time.diff(fim, inicio, :microsecond)
    IO.puts("#{tempo} microssegundos \n")
  end
end
# mix test <- para rodar o teste (cd codigo_elixir)
# doctest Cripto <- para testar as docstrings


#my name is->mnes__ya_____mi

#nao havera borboletas se a vida nao passar por longas e silenciosas metamorfoses->nhrols_inpaoossnsmmo____aaare_adaarrn_icaeos____ov_bts_aos__gelistre_____eboaev__spla_eo_afs

#para mim as horas sao curtas e os dias pequenos por mais longas que sejam as horas e maiores que sejam dos dias nao sao suficientes para satisfazer a vontade que sinto de estar sempre com voce->pihsr_aupigemo_e__iosepazvesdapm______amoatoseosa__rmssda_unateo_ierr_______r_roas_nr_ssaaa_eossftrirnqn__ev______aaa_s_po_l_essiqjs_aieas_tutes_o_______ssc_desmoqj__oua_nocs_faaeosecc______m__ueiq_anuaheremda_i_sa_d__tmoe


## Exemplo:
#noite e dia->ned___o_i___iea___t_
#DeCripto.descriptografa("ned___o_i___iea___t_", 4)
#
# | n | e | d | _ | _ |
# | _ | o | _ | i | _ |
# | _ | _ | i | e | a |
# | _ | _ | _ | t | _ |
