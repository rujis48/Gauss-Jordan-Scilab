    // Nome do arquivo: terminalGaussJordan.sce
    // Este script permite que um usuário insira sua própria matriz e vetor
    // para aplicar o algoritmo de Gauss-Jordan, com opção de rodar novamente.
    
    // Carrega a função gaussJordan do arquivo gaussJordan.sci.
    exec('gaussJordan.sci');
    exec('testeDeCaso.sci');
    
    // Variável de controle para o loop
    run_again = %T;
    
    // Início do loop principal do programa
    while run_again do
        
        disp('--- Aplicativo Gauss-Jordan ---');
        disp('Você irá inserir os dados para resolver um sistema de equações lineares.');
        disp(' ');
    
        // 1. Solicita a dimensão da matriz (n x n)
        disp('1. Digite a dimensão da matriz (n x n):');
        n = input('n = ');
    
        // Cria uma matriz de zeros para preencher com os dados do usuário
        A_usuario = zeros(n, n);
        b_usuario = zeros(n, 1);
    
        // 2. Solicita os elementos da matriz de coeficientes (A)
        disp('');
        disp('2. Digite os elementos da matriz de coeficientes (A), um por um:');
        for i = 1:n
            for j = 1:n
                // Concatena as strings para exibir a mensagem corretamente
                mensagem = strcat(['A(', string(i), ',', string(j), ') = ']);
                disp(mensagem);
                A_usuario(i, j) = input('');
            end
        end
    
        // 3. Solicita os elementos do vetor de termos independentes (b)
        disp('');
        disp('3. Digite os elementos do vetor de termos independentes (b), um por um:');
        for i = 1:n
            // Concatena as strings para exibir a mensagem corretamente
            mensagem = strcat(['b(', string(i), ') = ']);
            disp(mensagem);
            b_usuario(i) = input('');
        end
    
        // Exibe a matriz e o vetor inseridos para confirmação
        disp('');
        disp('--- Dados Inseridos ---');
        disp('Sua matriz A:');
        disp(A_usuario);
        disp('Seu vetor b:');
        disp(b_usuario);
    
        // 4. Chama a função gaussJordan para resolver o sistema
        [x_solucao, status_solucao] = gaussJordan(A_usuario, b_usuario);
    
        // 5. Exibe o resultado com base no status retornado pela função
        disp('');
        disp('--- Resultado ---');
        if status_solucao == 'unique' then
            disp('O sistema tem uma solução única.');
            disp('Solução (x):');
            disp(x_solucao);
        elseif status_solucao == 'infinite' then
            disp('O sistema tem infinitas soluções.');
        elseif status_solucao == 'inconsistent' then
            disp('O sistema é inconsistente (não tem solução).');
        end
    
        // Pergunta ao usuário se ele deseja rodar o programa novamente
        disp('');
        resposta = input('Deseja rodar o programa novamente? (s/n): ', 'string');
        
        // Converte a resposta para minúsculo e verifica se é 'n'
        if part(resposta, 1) == 'n' | part(resposta, 1) == 'N' then
            run_again = %F; // Define a flag para falso para sair do loop
        end
    end
    
    disp('Programa encerrado. Obrigado!');
    // Após finalizar o programa uma mensagem de erro aparece devido a falta de uma
    // biblioteca contendo o "gaussJordan.sci" e "testeDeCaso.sci", porém, o
    // programa funciona corretamente e a mensagem de erro não interfere no 
    // funcionamento dele.
