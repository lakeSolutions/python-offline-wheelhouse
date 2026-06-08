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

## Geospatial wheelhouse for Python 3.12

This wheelhouse contains geospatial packages used for working with GeoJSON files, geometry processing, coordinate systems, and geospatial dataframes.

### Packages included

- geojson
- geopandas
- fiona
- shapely
- pyproj

### Build the wheelhouse

From the root of this repository:

```powershell
.\scripts\build-geospatial-py312.ps1

This creates:

wheelhouse-geospatial
wheelhouse-py312-geospatial.zip

The zip file can be uploaded to Google Drive or another approved file transfer location.

Install offline

On the target computer, download and extract:

wheelhouse-py312-geospatial.zip
requirements-geospatial.txt

Recommended folder structure:

C:\PythonPackages\
├── requirements-geospatial.txt
└── wheelhouse-geospatial\

Install with:

python -m pip install --no-index --find-links=C:\PythonPackages\wheelhouse-geospatial -r C:\PythonPackages\requirements-geospatial.txt
Verify installation
python -c "import geojson; import geopandas; import fiona; import shapely; import pyproj; print('Geospatial packages installed successfully')"
Notes
Python version matters.
Wheels marked cp312 are for Python 3.12.
Wheels marked cp311 are for Python 3.11.
Wheels marked py3-none-any are usually compatible across Python 3 versions.
Do not commit .whl, .tar.gz, or .zip files to GitHub.
Store large wheelhouse zip files separately, such as in Google Drive.
