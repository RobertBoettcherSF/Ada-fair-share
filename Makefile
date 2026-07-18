# Simple Makefile for Fair-Share Scheduler

all: clean build run

build: fair_share_demo

fair_share_demo: main.adb fair_share_scheduler.adb fair_share_scheduler.ads
	mkdir -p obj
	gprbuild -P fair_share.gpr

run: fair_share_demo
	./fair_share_demo

clean:
	rm -rf obj *.o *.ali *.exe fair_share_demo

.PHONY: all build run clean
