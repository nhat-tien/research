docs_path := ./docs
python_code_path := .
main_doc_file_name := example

install:
	uv sync --project python

run:
	$(python_code_path)/.venv/bin/jupyter-lab

docs-compile: 
	typst compile --font-path $(docs_path)/fonts $(docs_path)/$(main_doc_file_name).typ $(docs_path)/$(main_doc_file_name).pdf
	pandoc $(docs_path)/$(main_doc_file_name).typ -o $(docs_path)/$(main_doc_file_name).docx

docs-clear: 
	rm -f $(docs_path)/$(main_doc_file_name).docx
	rm -f $(docs_path)/$(main_doc_file_name).pdf



