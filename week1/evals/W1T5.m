% Read the Image
original_image = imread('cat.jpg');

% Converting to Grayscale
gray_image = rgb2gray(original_image);

% Economy Singular Value Decomposition
[U, S, V] = svd(double(gray_image), 'econ');

% Reconstructing the cat.jpg with Different Truncation Values
r = [10, 200, 1000, 2000, 3000];
reconstructed_images = cell(length(r), 1);

for i = 1:length(r)
    Ur = U(:, 1:r(i));
    Sr = S(1:r(i), 1:r(i));
    Vr = V(:, 1:r(i));
    
    reconstructed_image = uint8(Ur * Sr * Vr');
    reconstructed_images{i} = reconstructed_image;
end

% Similarity
singular_values = diag(S);
similarity = zeros(length(r), 1);

for i = 1:length(r)
    % The difference between original and reconstructed images
    difference = double(gray_image) - double(reconstructed_images{i});
    frobenius_norm = norm(difference, 'fro');
    
    % Similarity using singular values
    similarity(i) = 1 - (frobenius_norm / norm(double(gray_image), 'fro'));
end

% Original and Reconstructed Images
figure;
subplot(1, length(r) + 1, 1);
imshow(gray_image);
title('Original Image');

for i = 1:length(r)
    subplot(1, length(r) + 1, i + 1);
    imshow(reconstructed_images{i});
    title(['r = ' num2str(r(i))]);
end

% Similarity in a Plot
figure;
plot(r, similarity, 'o-');
title('Similarity vs. Rank Truncation');
xlabel('Rank Truncation (r)');
ylabel('Similarity');
