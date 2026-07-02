# dbt Learning Project

This is a dbt project for learning and practice using the Bronze-Silver-Gold medallion architecture.

## Project Structure

- **models/**: Contains your dbt models (SQL files)
  - **bronze/**: Raw data layer - minimal transformations, views of source systems
  - **silver/**: Cleaned and standardized data - business logic applied, tables
  - **gold/**: Analytics-ready data - business aggregations and marts, tables
- **tests/**: Contains custom tests for your models
-

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

### 🟨 Gold Layer (Analytics & Marts Layer)
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
