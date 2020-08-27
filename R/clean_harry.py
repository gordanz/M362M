
with open('h.txt', 'r') as file:
    data = file.read()

aux = data.split()
aux2 = [ s.lower() for s in aux ]
outdata = '\n'.join(aux2)
with open('hw.txt',"w") as file:
	file.write(outdata)