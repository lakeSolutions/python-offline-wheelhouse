mkdir wheelhouse-spark -Force

py -3.12 -m pip download setuptools wheel -d wheelhouse-spark
py -3.12 -m pip wheel -r requirements/requirements-spark.txt -w wheelhouse-spark

Compress-Archive -Path .\wheelhouse-spark\* -DestinationPath .\wheelhouse-py312-spark.zip -Force