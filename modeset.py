import sys
import socket

UDP_IP = "0.0.0.0"
UDP_PORT = 5001
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

sock.sendto(bytes(sys.argv[1], 'utf-8'), (UDP_IP, UDP_PORT))
