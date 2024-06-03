SHELL := /bin/bash

### Build Runner
buildRunner:
	flutter pub run build_runner watch --delete-conflicting-outputs