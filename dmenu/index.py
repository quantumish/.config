import subprocess
import os

completions = open(os.getenv("HOME") + "/productivity/completions", "w")
fcompletions = open(os.getenv("HOME") + "/productivity/fcompletions", "w")
hist = open(os.getenv("HOME") + "/productivity/exec_hist", "r")
files = open(os.getenv("HOME") + "/productivity/files", "w")

def crawl(directory):
    for filename in os.listdir(directory):
        #if directory != "/": directory = directory + "/"
        if os.path.isdir(directory+'/'+filename) and filename[0]!=".":
            prefix = "  "
            files.write(prefix + directory + '/'+ filename + "\n")
            crawl(directory+'/'+filename)
            continue
        if filename[0] == ".":
            continue
        if filename.endswith(".tar.gz") or filename.endswith(".zip"):
            prefix = "  "
        elif filename.endswith(".png") or filename.endswith(".jpg") or filename.endswith(".jpeg"):
            prefix = "  "
        elif filename.endswith(".mp3"):
            prefix = "  "
        elif filename.endswith(".mp4"):
            prefix = "  "
        elif filename.endswith(".txt"):
            prefix = "  "
        elif filename.endswith(".py"):
            prefix = "  "
        elif filename.endswith(".c") or filename.endswith(".h"):
            prefix = "  "
        elif filename.endswith(".el"):
            prefix = "ﬦ  "
        elif filename.endswith(".cpp") or filename.endswith(".hpp") or filename.endswith(".cxx") or filename.endswith(".hxx") or filename.endswith(".cc"):
            prefix = "ﭱ  "
        else:
            prefix = "  "
        files.write(prefix + directory + '/' + filename + "\n")

crawl(os.getenv("HOME"))

files.close()
files = open(os.getenv("HOME") + "/productivity/files", "r")

        
for filename in os.listdir("/usr/local/bin"):
    completions.write("  " + filename + "\n")

for filename in os.listdir("/usr/bin"):
    completions.write("  " + filename + "\n")

for cmd in hist.readlines():
    completions.write(cmd)

for f in files.readlines():
    fcompletions.write(f[:3]+f[f.rfind('/')+1:])

subprocess.check_output("emacs -l ~/org.el -batch -eval '(org-batch-agenda \"t\")' > $HOME/productivity/todos", shell=True)
subprocess.check_output("sed -i 1,4d $HOME/productivity/todos", shell=True)
subprocess.check_output("sed -i 's/^......//' $HOME/productivity/todos", shell=True)
subprocess.check_output("sed -i 's/^/  /' $HOME/productivity/todos", shell=True)

files.close()
completions.close()
fcompletions.close()    
