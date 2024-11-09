#!/usr/bin/python
import subprocess as sub

cpus = 0
listos = []
for i in range(2,14):
    listos.append(float(sub.getoutput(f"lscpu -e=MHZ | head -n {i} | tail -n 1")))

for i in listos:
    cpus += int(i)

cpu_avg = ((cpus / 12) / 1000.0)
print(f" {float(str(cpu_avg)[0:3])}")

# this takes too much of something, rewrite in C99



