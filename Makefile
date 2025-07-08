install:
	cd notebooks && uv sync

run:
	cd notebooks && .venv/bin/jupyter-lab
