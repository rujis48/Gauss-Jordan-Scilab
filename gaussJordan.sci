// Nome do arquivo: gaussJordan.sci
// Este arquivo contém a função que aplica o algoritmo de Gauss-Jordan em uma matriz.

function [x, status] = gaussJordan(A, b)
    // Inicialização da matriz aumentada [A|b]
    [n, m] = size(A);
    if n ~= m then
        error('A matriz de coeficientes deve ser quadrada.');
    end
    
    // Concatena a matriz de coeficientes e o vetor de termos independentes
    Ab = [A, b];

    // Define a tolerância para verificar se um número é próximo de zero
    tol = 1e-10; 
    status = 'unique'; // Assume que a solução é única por padrão

    // Loop principal para a eliminação (do início ao fim da matriz)
    for k = 1:n
        // 1. Pivotamento Parcial: Encontra a linha com o maior valor absoluto na coluna 'k'
        max_val = 0;
        piv_row = k;
        for i = k:n
            if abs(Ab(i, k)) > max_val then
                max_val = abs(Ab(i, k));
                piv_row = i;
            end
        end

        // Troca de linhas para mover o maior pivô para a posição 'k'
        if piv_row ~= k then
            temp_row = Ab(k, :);
            Ab(k, :) = Ab(piv_row, :);
            Ab(piv_row, :) = temp_row;
        end

        // 2. Verificação de Singularidade
        if abs(Ab(k, k)) < tol then
            // Se o pivô for zero, verifica se a linha é inconsistente ou tem infinitas soluções
            if abs(Ab(k, n + 1)) < tol then
                status = 'infinite'; // Linha de zeros = infinitas soluções
            else
                status = 'inconsistent'; // 0x = b, com b diferente de 0 = sem solução
            end
            x = [];
            return; 
        end

        // 3. Normalização: Torna o pivô igual a 1
        Ab(k, :) = Ab(k, :) / Ab(k, k);

        // 4. Eliminação: Zera todos os outros elementos da coluna 'k'
        for i = 1:n
            if i ~= k then
                Ab(i, :) = Ab(i, :) - Ab(i, k) * Ab(k, :);
            end
        end
    end

    // A última coluna da matriz aumentada é a solução
    x = Ab(:, n + 1);
end
