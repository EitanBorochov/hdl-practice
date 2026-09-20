TEMPLATE := XXXX-template

.PHONY: new
new:
	@case "$(N)" in ''|*[!0-9]*) echo "Usage: make new N=2 NAME=and-gate"; exit 1;; esac; \
	case "$(NAME)" in ''|*[!a-z0-9-]*) echo "NAME must use lowercase letters, digits, and hyphens"; exit 1;; esac; \
	dir="$$(printf '%04d-%s' "$(N)" "$(NAME)")"; \
	test ! -e "$$dir" || { echo "Already exists: $$dir"; exit 1; }; \
	cp -R "$(TEMPLATE)" "./$$dir"; \
	echo "Created $$dir"