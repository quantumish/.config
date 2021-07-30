import socket
import subprocess as sub

def call(x):
    try:
        o = sub.check_output(x, shell=True, stderr=sub.STDOUT)
    except sub.CalledProcessError as e:
        o = str(e.output)
    return o

UDP_IP="0.0.0.0"
UDP_PORT=5001

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((UDP_IP, UDP_PORT))

mode = "default"

def quickwrite(file):


while True:
    data, addr = sock.recvfrom(1024)
    if data == b"normal":
        if mode == "normal":
            call("xbindkeys &")
            call("sh ~/.config/X/xcape.sh &")
            mode = "default"
        else:
            call("killall xcape")
            call("killall xbindkeys")
            call("xbindkeys -f ~/.config/minibinds.rc")
            mode = "normal"
    elif data == b"kill":
        exit(1)

