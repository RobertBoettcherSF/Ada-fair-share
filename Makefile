# Simple Makefile for Fair-Share Scheduler

all: clean build run

build: main

main: main.adb fair_share_scheduler.adb fair_share_scheduler.ads
	mkdir -p obj
	gprbuild -P fair_share.gpr

run: main
	./main

clean:
	rm -rf obj *.o *.ali *.exe main

.PHONY: all build run clean
