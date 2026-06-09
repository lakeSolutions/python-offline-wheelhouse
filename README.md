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

## Databricks wheelhouse for Python 3.12

This wheelhouse contains the core packages required to connect to and interact with Databricks environments from Python.

### Packages included

* databricks-sdk
* databricks-sql-connector
* python-dotenv

### Purpose

These packages provide:

* Databricks Workspace API access
* Databricks SQL Warehouse connectivity
* Authentication and configuration management
* Local Python integration with Databricks services

### Build the wheelhouse

From the root of this repository:

```powershell
.\scripts\build-databricks-py312.ps1
```

This creates:

```text
wheelhouse-databricks
wheelhouse-py312-databricks.zip
```

The zip file can be uploaded to Google Drive or another approved file transfer location.

### Install offline

On the target computer, download and extract:

```text
wheelhouse-py312-databricks.zip
requirements-databricks.txt
```

Recommended folder structure:

```text
C:\PythonPackages\
├── requirements-databricks.txt
└── wheelhouse-databricks\
```

Install with:

```powershell
python -m pip install --no-index --find-links=C:\PythonPackages\wheelhouse-databricks -r C:\PythonPackages\requirements-databricks.txt
```

### Verify installation

```powershell
python -c "from databricks.sdk import WorkspaceClient; import databricks.sql; import dotenv; print('Databricks packages installed successfully')"
```

### Example Databricks SQL connection

```python
from databricks import sql

connection = sql.connect(
    server_hostname="your-workspace-hostname",
    http_path="your-sql-warehouse-http-path",
    access_token="your-personal-access-token"
)

cursor = connection.cursor()
cursor.execute("SELECT current_date()")

for row in cursor.fetchall():
    print(row)

cursor.close()
connection.close()
```

### Notes

* Python version matters.
* Wheels marked `cp312` are for Python 3.12.
* Wheels marked `cp311` are for Python 3.11.
* Wheels marked `py3-none-any` are usually compatible across Python 3 versions.
* Some dependencies may include source distributions (`.tar.gz`). Where possible, build wheel files before deployment.
* Do not commit `.whl`, `.tar.gz`, or `.zip` files to GitHub.
* Store large wheelhouse zip files separately, such as in Google Drive.

