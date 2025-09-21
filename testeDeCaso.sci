// Nome do arquivo: testesGaussJordan.sce
// Este script carrega e testa a função gaussJordan.sci

// Carrega a função gaussJordan do arquivo
exec('gaussJordan.sci');

clc; // Limpa o console uma melhor visualização.

// Pergunta ao usuário se ele deseja executar os testes
resposta = input('Deseja ver os testes de caso? (s/n): ', 'string');

// Converte a resposta para minúsculo e verifica se é 's' ou 'S'
if part(resposta, 1) == 's' | part(resposta, 1) == 'S' then

    disp('--- Executando os testes do algoritmo de Gauss-Jordan ---');
    disp(' ');

    // Teste 1: Sistema com solução única
    // Resultado esperado: solução única
    disp('1. Teste: Sistema com solução única');
    A1 = [1, 1, 1; 2, 3, 4; 5, 6, 8];
    b1 = [6; 20; 40];
    [x1, status1] = gaussJordan(A1, b1);
    disp(['Status do sistema: ', status1]);
    disp('Solução (x):');
    disp(x1);
    disp(' ');

    // Teste 2: Sistema com infinitas soluções
    // Resultado esperado: status 'infinite'
    disp('2. Teste: Sistema com infinitas soluções');
    A2 = [1, 2, 3; 4, 5, 6; 7, 8, 9];
    b2 = [6; 15; 24];
    [x2, status2] = gaussJordan(A2, b2);
    disp(['Status do sistema: ', status2]);
    disp(' ');

    // Teste 3: Sistema inconsistente (sem solução)
    // Resultado esperado: status 'inconsistent'
    disp('3. Teste: Sistema inconsistente');
    A3 = [1, 2, 3; 4, 5, 6; 7, 8, 9];
    b3 = [6; 15; 100];
    [x3, status3] = gaussJordan(A3, b3);
    disp(['Status do sistema: ', status3]);
    disp(' ');

    // Teste 4: Matriz com pivô nulo, mas com solução única devido ao pivotamento
    // Resultado esperado: solução única
    disp('4. Teste: Matriz com pivô nulo na diagonal');
    A4 = [0, 1; 1, 0];
    b4 = [1; 1];
    [x4, status4] = gaussJordan(A4, b4);
    disp(['Status do sistema: ', status4]);
    disp('Solução (x):');
    disp(x4);
    
    disp('Testes concluidos.');

else
    disp('Testes não visualizados.');

end
