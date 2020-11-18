function RGB = HSI_RGB(HSI)
    % 取H S I分量
    H = HSI(:, :, 1);
    H = 2 * pi * H;    % [0, 1] -> [0, 2 * pi]
    S = HSI(:, :, 2);
    I = HSI(:, :, 3);
    % 初始化R G B为0
    R = zeros(size(HSI, 1), size(HSI, 2));
    G = R;
    B = R;

    % 0 <= H < 2*pi/3
    i_ = find((H >= 0) & (H < 2*pi/3));
    B(i_) = I(i_) .* (1 - S(i_));
    R(i_) = I(i_) .* (1 + S(i_) .* cos(H(i_)) ./ cos(pi / 3 - H(i_)));
    G(i_) = 3 * I(i_) - R(i_) - B(i_);

    % 2*pi/3 <= H < 4*pi/3
    i_ = find((H >= 2*pi/3) & (H < 4*pi/3));
    H(i_) = H(i_) - 2 * pi / 3;
    R(i_) = I(i_) .* (1 - S(i_));
    G(i_) = I(i_) .* (1 + S(i_) .* cos(H(i_)) ./ cos(pi / 3 - H(i_)));
    B(i_) = 3 * I(i_) - R(i_) - G(i_);

    %4*pi/3 <= H < 2*pi
    i_ = find((H >= 4*pi/3) & (H < 2*pi));
    H(i_) = H(i_) - 4 * pi / 3;
    G(i_) = I(i_) .* (1 - S(i_));
    B(i_) = I(i_) .* (1 + S(i_) .* cos(H(i_)) ./ cos(pi / 3 - H(i_)));
    R(i_) = 3 * I(i_) - G(i_) - B(i_);

    RGB = cat(3, R, G, B);
    RGB = max(min(RGB, 1), 0);

end