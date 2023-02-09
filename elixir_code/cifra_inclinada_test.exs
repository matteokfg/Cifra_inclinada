defmodule CriptoTest do
  use ExUnit.Case

  test "crptografia" do
    inicio = Time.utc_now()
    DeCripto.descriptografa("mnes__ya_____mi", 3)
    fim = Time.utc_now()
    tempo = Time.diff(fim, inicio, :microsecond)
    IO.puts("#{tempo} microssegundos")


    inicio = Time.utc_now()
    DeCripto.descriptografa("nhrols_inpaoossnsmmo____aaare_adaarrn_icaeos____ov_bts_aos__gelistre_____eboaev__spla_eo_afs", 4)
    fim = Time.utc_now()
    tempo = Time.diff(fim, inicio, :microsecond)
    IO.puts("#{tempo} microssegundos")


    inicio = Time.utc_now()
    DeCripto.descriptografa("pihsr_aupigemo_e__iosepazvesdapm______amoatoseosa__rmssda_unateo_ierr_______r_roas_nr_ssaaa_eossftrirnqn__ev______aaa_s_po_l_essiqjs_aieas_tutes_o_______ssc_desmoqj__oua_nocs_faaeosecc______m__ueiq_anuaheremda_i_sa_d__tmoe", 6)
    fim = Time.utc_now()
    tempo = Time.diff(fim, inicio, :microsecond)
    IO.puts("#{tempo} microssegundos")
  end
end
# mix test <- para rodar o teste (cd codigo_elixir)
# doctest Cripto <- para testar as docstrings


#my name is->mnes__ya_____mi

#nao havera borboletas se a vida nao passar por longas e silenciosas metamorfoses->nhrols_inpaoossnsmmo____aaare_adaarrn_icaeos____ov_bts_aos__gelistre_____eboaev__spla_eo_afs

#para mim as horas sao curtas e os dias pequenos por mais longas que sejam as horas e maiores que sejam dos dias nao sao suficientes para satisfazer a vontade que sinto de estar sempre com voce->pihsr_aupigemo_e__iosepazvesdapm______amoatoseosa__rmssda_unateo_ierr_______r_roas_nr_ssaaa_eossftrirnqn__ev______aaa_s_po_l_essiqjs_aieas_tutes_o_______ssc_desmoqj__oua_nocs_faaeosecc______m__ueiq_anuaheremda_i_sa_d__tmoe


## Exemplo:
#noite e dia->ned___o_i___iea___t_
#Cripto.descriptografa("ned___o_i___iea___t_", 4)
#
# | n | e | d | _ | _ |
# | _ | o | _ | i | _ |
# | _ | _ | i | e | a |
# | _ | _ | _ | t | _ |
