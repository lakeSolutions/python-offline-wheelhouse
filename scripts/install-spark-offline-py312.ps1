py -3.12 -m venv .venv-spark
.\.venv-spark\Scripts\activate

python -m pip install --no-index --find-links=wheelhouse-spark -r requirements/requirements-spark.txt

python -c "import pyspark; print(pyspark.__version__)"