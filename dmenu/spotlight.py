import subprocess
import os
agenda_files = ["$HOME/Dropbox/org/plan.org", "$HOME/Dropbox/org/inbox.org", "$HOME/Dropbox/org/projects.org", "$HOME/Dropbox/org/schedule.org", "$HOME/Dropbox/org/classes.org", "$HOME/Dropbox/org/extra.org", "$HOME/Dropbox/org/routine.org", "$HOME/Dropbox/org/schoolwork.org"]

output = subprocess.check_output("cat $HOME/productivity/completions $HOME/productivity/todos $HOME/productivity/fcompletions | dmenu -g 1", shell=True)
output = output.decode("utf-8")
emacslist = ["  ", "  ", "  ", "  ", "ﭱ  ", "  ", "ﬦ  "]
if output[:3] == "  " or output[:3] == "  ":
    subprocess.Popen(output[3:], shell=True)
elif output[:3] in emacslist:
    out = subprocess.check_output("sed $(grep -n '" + output[3:-1].replace(".", "\.") + "$' $HOME/productivity/files | cut -f1 -d:)q\;d $HOME/productivity/files", shell=True).decode('utf-8')
    subprocess.Popen(["emacsclient --create-frame " + out[3:]], shell=True)
elif output[:3] == "  ":
    out = subprocess.check_output("sed $(grep -n '" + output[3:-1].replace(".", "\.") + "$' $HOME/productivity/files | cut -f1 -d:)q\;d $HOME/productivity/files", shell=True).decode('utf-8')
    subprocess.Popen(["feh " + out[3:]], shell=True)
elif output[:3] == "  ":
    finalfile = ""
    out = 0
    for i in agenda_files:
        out = subprocess.check_output("grep -n '" + output[3:-1].replace(".", "\.") + "$' " + i + " | cut -f1 -d:", shell=True).decode('utf-8')
        if out != '':
            finalfile = i
            break
    subprocess.check_output("emacsclient --create-frame --eval '(progn (find-file \""+finalfile.replace("$HOME", os.getenv("HOME"))+"\") (goto-line "+out[:-1]+"))'", shell=True)
else:
    subprocess.Popen(output, shell=True)
    hist = open(os.getenv("HOME") + "/productivity/exec_hist", "a")
    hist.write("  " + output + "\n")
