# dbt Learning Project

This is a dbt project for learning and practice using the Bronze-Silver-Gold medallion architecture.

## Project Structure

- **models/**: Contains your dbt models (SQL files)
  - **bronze/**: Raw data layer - minimal transformations, views of source systems
  - **silver/**: Cleaned and standardized data - business logic applied, tables
  - **gold/**: Analytics-ready data - business aggregations and marts, tables
- **tests/**: Contains custom tests for your models
- **macros/**: Contains reusable SQL macros
- **seeds/**: Contains CSV files for reference data
- **analysis/**: Contains ad-hoc analysis queries
- **data/**: Contains data files for seeds

## Medallion Architecture Layers

### Bronze Layer (Raw)
- Views over raw source data
- Minimal transformations (data type casting, field renaming)
- Schema: `bronze`
- Purpose: Preserve data lineage and enable auditing

### Silver Layer (Transformed)
- Cleaned, deduplicated, and business-validated data
- Schema: `silver`
- Purpose: Trustworthy foundation for analytics

### Gold Layer (Analytics)
- Business aggregations and metrics
- Schema: `gold`
- Purpose: Ready for reporting and dashboards

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
