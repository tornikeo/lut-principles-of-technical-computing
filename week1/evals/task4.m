max_matrix_size = 1;
max_execution_time = 5;

while true
    A = randn(max_matrix_size);
    tic;
    [~, ~, ~] = svd(A);
    execution_time = toc;
    if execution_time > max_execution_time
        break;
    end
    max_matrix_size = max_matrix_size + 1;
end

fprintf('Max matrix size computed in less than %d seconds: %dx%d\n', max_execution_time, max_matrix_size, max_matrix_size);
