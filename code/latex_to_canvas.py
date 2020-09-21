import urllib.parse as parse

def to_canvas(latex, inline = False):
    '''Converts Latex expression to canvas used <img> class.'''
    model = '<img class="equation_image" title="{0}" src="/equation_images/{1}" alt="Latex: {0}" data-equation-content="{0}" />' 
    out = model.format(latex.replace('&amp;','&'),parse.quote(parse.quote(latex.replace('&amp;','&'), safe='()'), safe='()&'))
    if not inline:
        out = '</p>' + out + '</p>'
    return out

print(to_canvas(r"{\mathbb P}[X>0.38]"))