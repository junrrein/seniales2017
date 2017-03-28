function setFontSize (fontSize)

set(findall(gcf, '-property', 'FontSize'), 'FontSize', fontSize)
