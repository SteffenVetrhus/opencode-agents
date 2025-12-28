.PHONY: sync

sync:
	cp ~/.claude/agents/_*.md .
	git add -A && git commit -m "chore: sync agent definitions from Claude Code - $$(date +'%Y-%m-%d %H:%M:%S')"
