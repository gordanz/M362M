import re
import glob
import os
from subprocess import Popen, PIPE, STDOUT


def pandoc(text):
    command = "pandoc -f latex -t markdown"
    p = Popen([command], stdout=PIPE, stdin=PIPE, stderr=STDOUT, shell=True)    
    grep_stdout = p.communicate(input=bytes(text, 'utf-8'))[0]
    return(grep_stdout.decode())
  




def process_file(name):
    print(".",end="", flush=True)
    with open(name+".tex", 'r') as file:
        tex = file.read()
    parts = re.split(r"\\sol{", tex)
    prb = re.sub(r"\\(m|v)choice","", parts[0])
    prb=pandoc(re.sub(r"\\(begin|end){problem}", "",prb))

    with open(name+".prb","w") as file:
         file.write(prb)
    if len(parts)>1:
        sol=pandoc(re.sub(r"}(\s)*\Z","", parts[1]))
        with open(name+".sol","w") as file:
            file.write(sol)

   
rootDir = './01_Random_Walks/'
for dirName, subdirList, fileList in os.walk(rootDir):
    print (dirName)
    for fname in fileList:
        name_ext = dirName+"/"+fname
        name, ext = os.path.splitext(name_ext)
        if ext == ".tex":
            process_file(name)

        
# for name_ext in glob.iglob('*.tex'):
#     print(name_ext)
#     process_file(name_ext)q