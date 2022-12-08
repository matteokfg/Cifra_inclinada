# Cifra_inclinada

## Como rodar o programa em Python?

No cmd, escreva:
- ```python cifra_inclinada.py```
- ```python cifra_inclinada_test.py```

## Como rodar o programa em Elixir?

No cmd, escreva:
- ```elixir cifra_inclinada.ex```

Para fazer os testes, eu utilizei o Mix do Elixir, que é uma ferramenta de construção que fornece tarefas para criar, compilar e testar projectos Elixir, gerir as suas dependências, dentre outros. Então, para testar, escreva no cmd:
- ```mix test```

# Python Vs Elixir
![exercicio_cifra (4)](https://user-images.githubusercontent.com/67129306/206177231-e9dc8d3b-f25b-42c9-a04c-12cad3fc8757.PNG)

Como visto na imagem a cima, o objetivo do programa é receber uma String (frase) criptografada, com ela, criar uma matriz a partir do número recebido, o qual equivale ao número de linhas da matriz, e ler as diagonais da matriz, assim retornando a String original. Segue-se um exemplo: 

![exercicio_cifra (3)](https://user-images.githubusercontent.com/67129306/206177338-db5b2b2b-8276-43a5-8462-01a0d7b42ea5.PNG)

Como as duas linguagens de programação que sei são Python e Elixir, tentei fazer nessas duas linguagens, os dois programas e seus testes podem ser encontrados nesse repositório.

Tendo feito as duas, qual seria a mais rápida? Para achar a resposta, usei três frases criptografadas: a primeira, seria curta ("my name is", que criptografada ficaria: "mnes__ya_____mi"), a segunda, seria mediana ou longa ("nao havera borboletas se a vida nao passar por longas e silenciosas metamorfoses", que criptografada ficaria: "nhrols_inpaoossnsmmo____aaare_adaarrn_icaeos____ov_bts_aos__gelistre_____eboaev__spla_eo_afs") e a terceira, seria muito longa ("para mim as horas sao curtas e os dias pequenos por mais longas que sejam as horas e maiores que sejam dos dias nao sao suficientes para satisfazer a vontade que sinto de estar sempre com voce", que criptografada ficaria: "pihsr_aupigemo_e__iosepazvesdapm______amoatoseosa__rmssda_unateo_ierr_______r_roas_nr_ssaaa_eossftrirnqn__ev______aaa_s_po_l_essiqjs_aieas_tutes_o_______ssc_desmoqj__oua_nocs_faaeosecc______m__ueiq_anuaheremda_i_sa_d__tmoe").

Observação: as duas últimas frases peguei da internet no site: https://www.pensador.com/, apenas retirei a acentuação, letras maiúsculas e a pontuação, porque o programa só aceita letras e o underline.

## Teste do Python

Para medir o tempo de execução do programa em Python, utilizei da biblioteca Timeit, a função timeit.timeit(), passando o algoritmo em Python, com a frase criptografada e o número de linhas da matriz, junto com o número de vezes para se repetir a execução do algoritmo. Dessa forma, evitando estatisticamente contar tempo que não foi utilizado para a execução do algoritmo pela CPU do computador, devido o fato de se rodar várias vezes o mesmo programa e somar os tempos, depois só sendo necessário dividir o tempo retornado pelo número de vezes que o algoritmo foi executado, para se achar o tempo de uma execução. Retornando o tempo em segundos.

O resultado do programa em Python foi:

![test_python](https://user-images.githubusercontent.com/67129306/206177759-fcba7c8e-8fc2-4d77-9ff5-7bf89dfd10b8.PNG)

Pode-se ver que no teste da frase curta, o Python levou, aproximadamente, 425 microssegundos. Já no teste da frase mediana ou longa, o Python levou aproximadamente, 1146 microssegundos. Já no teste da frase muito longa, o Python levou aproximadamente, 990 microssegundos.

Observação: no teste do programa em Python cada teste rodava 10 vezes o algoritmo, por isso o resultado da frase descriptografada aparece 10 vezes.

## Teste do Elixir

Com as frases criptografadas feitas, passei elas com seus respectivos números para a criação das matrizes, para o programa em Elixir. Mas antes, peguei o horário do início do algoritmo, e quando finalizado, peguei o horário. Para achar o tempo percorrido, foi necessário fazer a subtração do horário final com o inicial. Porém devido a subtração retornar um tempo muito pequeno, utilizei do módulo Time, a função Time.diff() para uma maior precisão. Retornando o tempo em microssegundos.

Já o programa em Elixir foi:

![test_elixir](https://user-images.githubusercontent.com/67129306/205763713-195f42ea-6ccf-49e8-89a1-2840f138e897.PNG)

Nesse pode-se ver que no teste da frase curta, o Elixir levou, 26000 microssegundos ou 0,026 segundos. Já no teste da frase mediana ou longa, ele retornou 0 microssegundos, o que leva a considerar que o tempo necessário foi tão pequeno na escala dos microssegundos, que fez com que parecesse igual a 0. A mesma coisa aconteceu com o teste da frase muito longa.

Observação: para fazer o teste do Elixir, utilizei o comando "mix test", que basicamente faz o teste do arquivo elixir_test.exs inteiro, assim ele também retorna no final o tempo utilizado para o teste inteiro, o que incluiria o tempo para colocar na tela os resultados dos testes de cada frase.

## Conclusão

Comparando-se apenas o primeiro teste dos dois programas, o Python é mais rápido. Mas se compararmos os testes 2 e 3, o Elixir é muito mais rápido. Por quê?

O Python, a cada vez que executar o arquivo.py, sempre vai interpretar o arquivo.py para arquivo.pyC, que seria uma linguagem intermediária, e depois vai compilar esse arquivo.pyC, assim transformando-o em linguagem de máquina em um arquivo executável, e por fim executando-o.

Porém o Elixir é compilado, ou seja transforma o arquivo.ex ou .exs em um arquivo executável em linguagem de máquina, mesmo se comportando como um interpretado por permitir fazer um programa e, logo depois, executá-lo. Além de, o Elixir ser uma linguagem de programação funcional, que se baseia na ideia de tratar funções do programa como funções matemáticas.

Logo, todas essas diferenças fazem com que o Elixir seja o mais indicado para o uso em maior escala, já o Python para quando for necessário uma vez ou outra.
