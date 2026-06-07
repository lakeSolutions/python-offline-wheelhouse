# Build offline wheelhouse for Data Engineering packages

New-Item -ItemType Directory -Force -Path wheelhouse-data-engineering

py -3.12 -m pip download `    -r requirements\requirements-data-engineering.txt -d wheelhouse-data-engineering

Compress-Archive -Path .\wheelhouse-data-engineering\* -DestinationPath .\wheelhouse-py312-data-engineering.zip -Force
