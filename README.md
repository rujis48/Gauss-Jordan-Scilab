# README: Algoritmo de Gauss-Jordan em Scilab

### Este projeto é uma implementação do algoritmo de eliminação de Gauss-Jordan para resolver sistemas de equações lineares, utilizando a linguagem de programação Scilab. O projeto é modularizado em três arquivos principais para garantir organização e reutilização do código.

## Estrutura do Projeto

### O projeto é composto pelos seguintes arquivos:

    gaussJordan.sci: Contém a função central que aplica o algoritmo de Gauss-Jordan. Esta função recebe a matriz de coeficientes A e o vetor de termos independentes b e retorna o vetor solução x e um status que indica a natureza da solução do sistema (única, infinitas ou inconsistente).

    testesGaussJordan.sce: Um script de testes que executa a função gaussJordan com casos de teste pré-definidos para verificar se o algoritmo funciona corretamente em diferentes cenários (solução única, infinitas soluções, inconsistência e pivô nulo).

    terminalGaussJordan.sce: Um script executável que oferece uma interface interativa para que o usuário insira sua própria matriz e vetor. Ele utiliza a função gaussJordan para calcular e exibir a solução.

### Para rodar os programas, siga os passos abaixo:
  ### Coloque todos os arquivos na mesma pasta.
  ### Abra o scilab. Mude o diretório de trabalho do Scilab para a pasta onde você salvou os arquivos. Você pode fazer isso usando o comando cd no console.
    cd('C:\caminho\para\sua\pasta');

  ### Execute os scripts: Você pode executar os arquivos interativos para usar o algoritmo.
  ### Para usar a interface de usuário digite o seguinte comando no console do Scilab e siga as instruções na tela:
    Scilab: exec('terminalGaussJordan.sce');

  ### Para realizar os testes automáticos:
  ### Digite o seguinte comando no console do Scilab para ver os resultados dos casos de teste:
        exec('testesGaussJordan.sce');

## Observação Importante
### Ao executar os scripts, você pode notar uma mensagem de aviso no console do Scilab semelhante a:
    exec: Quantidade incorreta de argumentos de saída: esperava-se 0.

### Esta mensagem não indica um erro de funcionamento do seu código. Ela é gerada pelo Scilab quando o comando exec é usado para rodar um arquivo que contém uma função. Como a função gaussJordan retorna valores (x e status), o Scilab emite esse aviso.

### O programa funciona corretamente e a mensagem pode ser ignorada com segurança. A modularização em arquivos separados é uma boa prática de programação e não deve ser alterada.
