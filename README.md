
dbt-dimensional-modelling is a clone of https://github.com/Data-Engineer-Camp/dbt-dimensional-modelling.git


# Create virtual environment
python -m venv .venv

# Activate it
.\.venv\Scripts\Activate.ps1

# Upgrade pip
python -m pip install --upgrade pip
# Install requirements
python -m pip install -r requirements.txt


# Check that dbt is working.
cd dbt-dimensional-modelling\adventureworks\
dbt deps
mkdir target
dbt debug
dbt seed
dbt run

# check that duckdb cli is working
duckdb target\adventureworks.duckdb -c "SELECT date_day, prior_date_day, day_of_month, day_of_year FROM date.date LIMIT 5;"

