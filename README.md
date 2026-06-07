# Python Offline Wheelhouse

This repository contains recipes for building offline Python package wheelhouses.

The wheel files themselves are not stored in GitHub. They are zipped and stored separately, for example in Google Drive.

## Spark wheelhouse for Python 3.12

Build:

```powershell
.\scripts\build-spark-py312.ps1

Notes:

- Python version matters
- Python 3.12 wheels contain cp312
- Python 3.11 wheels contain cp311
Pure Python wheels may contain py3-none-any

## Data Engineering wheelhouse for Python 3.12

Packages included:

- polars
- pyarrow
- networkx
- duckdb

Build:

```powershell
.\scripts\build-data-engineering-py312.ps1
