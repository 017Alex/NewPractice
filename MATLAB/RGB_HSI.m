% RGB颜色空间转HSI颜色空间
function HSI = RGB_HSI(rgb)

    rgb = im2double(rgb);
    r = rgb(:, :, 1);
    g = rgb(:, :, 2);
    b = rgb(:, :, 3);

    % 分子 molecular
    mol = ((r - g) + (r - b)) / 2;
    % 分母 denominator
    den = sqrt((r - g) .^ 2 + (r - b) .* (g - b));
    % 计算
    theta = acos(mol ./ den + eps);

    if (b > g)
        h = 2 * pi - h;
    else
        h = theta;
    end
    h = h / (2 * pi); %h归一化为[0, 1]
    MinC = min(min(r, g), b);
    s = 1 - 3 * MinC ./ (r + g + b + eps);
    if (0 == s)
        h = 0;
    end
    i = (r + g + b) / 3;

    HSI = cat(3, h, s, i);
end