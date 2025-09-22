// Função que aplica o algoritmo de Gauss-Jordan em uma matriz

function [x, status] = gaussJordan(A, b)
    [n, m] = size(A);
    
    // Verifica se A é quadrada
    if n ~= m then
        error("A matriz de coeficientes deve ser quadrada.");
    end
    
    // Garante que b seja vetor coluna
    if size(b, 2) <> 1 then
        b = b'; 
    end
    if size(b, 2) <> 1 then
        error("O vetor b deve ser coluna ou transponível para coluna.");
    end
    
    // Concatena a matriz aumentada
    Ab = [A, b];

    tol = 1e-10; 
    status = "unique"; // assume único até prova contrária

    // Loop principal Gauss-Jordan
    for k = 1:n
        // Pivotamento parcial
        [max_val, piv_row] = max(abs(Ab(k:n, k)));
        piv_row = piv_row + k - 1;
        
        // Troca de linhas, se necessário
        if piv_row ~= k then
            temp = Ab(k, :);
            Ab(k, :) = Ab(piv_row, :);
            Ab(piv_row, :) = temp;
        end

        // Se pivô for ~0, pula (tratado depois pelo rank)
        if abs(Ab(k, k)) < tol then
            continue;
        end

        // Normaliza pivô
        Ab(k, :) = Ab(k, :) / Ab(k, k);

        // Eliminação
        for i = 1:n
            if i ~= k then
                Ab(i, :) = Ab(i, :) - Ab(i, k) * Ab(k, :);
            end
        end
    end

    // Após eliminação, checa consistência usando rank
    rA = rank(A, tol);
    rAb = rank(Ab(:, 1:n), tol);  // posto de A
    rAug = rank(Ab, tol);         // posto de [A|b]

    if rA ~= rAug then
        status = "inconsistent";
        x = [];
        return;
    elseif rA < n then
        status = "infinite";
        x = [];
        return;
    else
        status = "unique";
        x = Ab(:, $); // última coluna é solução
    end
end
