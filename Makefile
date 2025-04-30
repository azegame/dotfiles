all: link

# create symbolic links
link:
	@echo "\033[0;34mRun link.sh\033[0m"
	chmod +x .bin/link.sh
	@.bin/link.sh
	@echo "\033[0;34mDone.\033[0m"
