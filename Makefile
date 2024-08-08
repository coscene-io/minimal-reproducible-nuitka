.PHONY: clean
clean:
	rm -rf .venv
	rm -rf dist

.PHONY: install
install:
	python3 -m pip install -r requirements.txt nuitka

.PHONY: onefile
onefile:
	python3 -m nuitka --debug --standalone --experimental=allow-c-warnings --static-libpython=no --output-filename=main --output-dir=dist main.py
