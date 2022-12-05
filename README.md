# Cifra_inclinada

![exercicio_cifra (2)](https://user-images.githubusercontent.com/67129306/205763123-64c9bfd7-5e9a-490d-b20e-12437a3fe705.PNG)

O objetivo do programa é receber uma String (frase) criptografada, com ela, criar uma matriz a partir do número recebido, o qual equivale ao número de linhas da matriz, e ler as diagonais da matriz, assim retornando a String original. Segue-se um exemplo:

![exercicio_cifra (3)](https://user-images.githubusercontent.com/67129306/205763244-c1ad9041-e547-4886-b970-b6f484dba732.PNG)

Como as duas linguagens de programação que sei são Python e Elixir, tentei fazer nessas duas linguagens, os dois programas e seus testes podem ser encontrados nesse repositório.

Tendo feito as duas, qual seria a mais rápida? Para achar a resposta, usei três frases criptografadas: a primeira, seria curta ("my name is", que criptografada ficaria: "mnes__ya_____mi"), a segunda, seria mediana ou longa ("nao havera borboletas se a vida nao passar por longas e silenciosas metamorfoses", que criptografada ficaria: "nhrols_inpaoossnsmmo____aaare_adaarrn_icaeos____ov_bts_aos__gelistre_____eboaev__spla_eo_afs") e a terceira, seria muito longa ("para mim as horas sao curtas e os dias pequenos por mais longas que sejam as horas e maiores que sejam dos dias nao sao suficientes para satisfazer a vontade que sinto de estar sempre com voce", que criptografada ficaria: "pihsr_aupigemo_e__iosepazvesdapm______amoatoseosa__rmssda_unateo_ierr_______r_roas_nr_ssaaa_eossftrirnqn__ev______aaa_s_po_l_essiqjs_aieas_tutes_o_______ssc_desmoqj__oua_nocs_faaeosecc______m__ueiq_anuaheremda_i_sa_d__tmoe"). E depois passei elas com seus respectivos números, para a criação das matrizes, mas antes, peguei o horário do início do algoritmo, e quando finalizado, peguei o horário. Para achar o tempo percorrido, foi necessário fazer a subtração do horário final com o inicial.

O resultado do programa em Python foi:

![test_python](https://user-images.githubusercontent.com/67129306/205763657-e2a87417-a8cf-429d-9ecb-42a1161e1f5f.PNG)

Pode-se ver que no teste da frase curta, o Python levou, aproximadamente, 512 microssegundos. Já no teste da frase muito longa, o Python levou aproximadamente, 211 microssegundos.

Já o programa em Elixir foi:

![test_elixir](https://user-images.githubusercontent.com/67129306/205763713-195f42ea-6ccf-49e8-89a1-2840f138e897.PNG)

Nesse pode-se ver que no teste da frase curta, o Elixir levou, 26000 microssegundos ou 0,026 segundos. Já no teste da frase muito longa, ele retornou 0 microssegundos, o que leva a considerar que o tempo necessário foi tão pequeno na escala dos microssegundos, que fez com que parecesse instantâneo.
