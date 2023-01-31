.DEFAULT_GOAL :=default
tag:
	git tag -fa -m "xx" v0.0.1
	git push origin main --tags
default:
	sh ./system/time-machine.sh