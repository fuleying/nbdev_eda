SRC = $(wildcard ./*.ipynb)

all: nbdev_eda docs

nbdev_eda: $(SRC)
	nbdev_build_lib
	touch nbdev_eda

docs: $(SRC)
	nbdev_build_docs
	touch docs

test:
	nbdev_test_nbs

pypi: dist
	twine upload --repository pypi dist/*

dist: clean
	python setup.py sdist bdist_wheel

clean:
	rm -rf dist