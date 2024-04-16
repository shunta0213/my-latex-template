.PHONY:
set-env:
	@tlmgr conf texmf $(KEY) $(VALUE)

.PHONY:
clean:
	@rm -rf ./**/dist/
