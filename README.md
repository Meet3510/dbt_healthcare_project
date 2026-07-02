# 📊 dbt Healthcare Analytics Project (Synthea COVID-19)

A production-grade ELT (Extract, Load, Transform) data pipeline constructed using **dbt (Data Build Tool)** and the **Snowflake Cloud Data Warehouse**. This project processes synthetic clinical records from the Synthea COVID-19 dataset, integrates manual clinical configurations dumped via Excel, and transforms raw data structures into clean, analytics-ready data models following the **Medallion Architecture** framework.

---

## Project Architecture & Data Lineage

The data pipeline strictly adheres to the Medallion Architecture pattern, segregating data processing logic into three distinct layers to ensure modularity, data quality, and high-performance querying in BI tools like Tableau.


## Project Structure

- **models/**: Contains your dbt models (SQL files)
  - **bronze/**: Raw data layer - minimal transformations, views of source systems mapped via `sources.yml`
  - **silver/**: Cleaned and standardized data - business logic applied, schemas tested and documented via `stg_model.yml`
  - **gold/**: Analytics-ready data -  star-schema marts (Facts and Dimensions), performance-optimized tables
- **tests/**: Contains custom data validation tests for your models

## Medallion Architecture Layers


### Bronze Layer (Raw Source Layer)
**Directory**: `models/bronze/`
**Purpose**: Houses 1-to-1 representations of the source data with zero business modifications to preserve data lineage and auditing capabilities.
**Implementation**: Managed via the `sources.yml` configuration file, pointing directly to raw Snowflake landing tables. This decouples database structural changes from downstream transformation models.
**Excel Data Ingestion**: Manual clinical configuration data is dumped directly into Snowflake as a database table and registered here as a Bronze source, avoiding local file limitations and taking advantage of cloud compute.


### Silver Layer (Cleaned  Layer)
* **Directory**: `models/silver/`
* **Purpose**: Serves as the single source of truth featuring cleaned, standardized, and business-validated data.
* **Implementation**: The `.sql` files handle data cleaning, type casting (e.g., forcing strings into clean dates or integers), and column renaming into standard `snake_case`.
* **Data Governance (`stg_model.yml`)**: Implements automated data quality testing directly inside dbt to catch human errors or formatting anomalies common in Excel data before they hit analytics layers:
    * `unique` and `not_null` constraints applied to critical primary keys (e.g., `patient_id`, `encounter_id`).
    * Column-level documentation acting as a live, self-updating data dictionary.

### Gold Layer (Analytics & Marts Layer)
* **Directory**: `models/gold/`
* **Purpose**: Houses highly optimized, business-level metric tables and star-schema models ready for downstream dashboards.
* **Implementation**: Combines clean patient clinical records with the static configuration metadata ingested from the Excel sheet via optimized Snowflake joins, building rich Fact tables (`fct_`) and Dimension tables (`dim_`).

## Getting Started

1. Configure your database connection in `profiles.yml`
2. Update `dbt_project.yml` with your project settings
3. Create models in the `models/` directory
4. Run `dbt debug` to verify your connection
5. Run `dbt run` to execute your models
6. Run `dbt test` to run tests on your models
7. Run `dbt docs generate` to generate documentation

## Useful Commands

- `dbt debug` - Test connection and configuration
- `dbt run` - Execute all models
- `dbt run --select model_name` - Execute a specific model
- `dbt test` - Run all tests
- `dbt docs generate` - Generate documentation
- `dbt docs serve` - Serve documentation locally

## Documentation

For more information on dbt, visit: https://docs.getdbt.com
