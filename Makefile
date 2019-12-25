.PHONY: all build unload load

PLIST_NAME=info.hotoku.rstudio
PLIST_DIR=~/Library/LaunchAgents
IMAGE_NAME=hotoku/r
CONTAINER_NAME=rstudio

all: load

load: $(PLIST_NAME).plist image stop
	cp -f $< $(PLIST_DIR) && \
		cd $(PLIST_DIR) && \
		launchctl load $(PLIST_NAME).plist

image: unload
	docker build -t $(IMAGE_NAME) .

rebuild: unload
	docker build --no-cache -t $(IMAGE_NAME) .

clean: unload
	rm $(PLIST_DIR)/$(PLIST_NAME).plist

unload: stop
	cd $(PLIST_DIR) && \
		launchctl unload $(PLIST_NAME).plist

stop:
	docker stop $(CONTAINER_NAME) || true
