.PHONY: all build unload load

PLIST=/Users/hotoku/Library/LaunchAgents/info.hotoku.sample_r.plist

all: unload build load

unload:
	launchctl unload $(PLIST)

build: unload
	docker build -t hotoku/r . 

load: build
	launchctl load $(PLIST)
