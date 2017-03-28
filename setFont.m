function setFont (fontName, fontSize)
    fig = gcf;
    set(findall(fig, '-property', 'FontName'), 'FontName', fontName);
    set(findall(fig, '-property', 'FontSize'), 'FontSize', fontSize);
endfunction
