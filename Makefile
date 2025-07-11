install:
	uv sync

run:
	./.venv/bin/jupyter-lab

activate:
	source .venv/bin/activate
