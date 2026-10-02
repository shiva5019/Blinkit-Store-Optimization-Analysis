# Blinkit Sales Insights & Store Optimization Analysis


An end-to-end analytics project on the Blinkit grocery dataset. Data is cleaned and engineered in Python, analysed with SQL in MySQL, and presented in an interactive Power BI dashboard that shows which outlets, outlet formats, location tiers and product categories drive sales.

## Table of Contents

- [Business Problem](#business-problem)
- [Dataset](#dataset)
- [Tech Stack](#tech-stack)
- [Repository Structure](#repository-structure)
- [Project Workflow](#project-workflow)
- [Key KPIs](#key-kpis)
- [Key Insights](#key-insights)
- [Recommendations](#recommendations)
- [How to Run](#how-to-run)
- [Author](#author)

## Business Problem

Blinkit operates across outlets of different sizes, formats and location tiers. Management needs to know where sales come from and where store-level optimization will have the highest impact.

Questions answered:

- Which outlets, outlet types and location tiers generate the most sales?
- Which product categories contribute the most revenue?
- Do outlet size, outlet age, fat content, item visibility or rating influence sales?
- Which outlets are underperforming and need attention?

## Dataset

| Attribute | Details |
|---|---|
| Records | 8,523 |
| Unique items | 1,559 |
| Unique outlets | 10 |
| Item fields | Identifier, type, fat content, weight, visibility |
| Outlet fields | Identifier, establishment year, size, location tier, outlet type |
| Measures | Sales, customer rating |
| Engineered features | Outlet Age, Sales per Weight |

## Tech Stack

| Layer | Tools |
|---|---|
| Data cleaning and EDA | Python, Pandas |
| Database and analysis | MySQL |
| Visualization | Power BI, DAX |
| Version control | Git, GitHub |

## Repository Structure

~~~
Blinkit-Store-Optimization-Analysis/
├── data/
│   ├── BlinkIT Grocery Dataset.xlsx
│   └── blinkit_cleaned_data.csv
├── python/
│   ├── data_cleaning.py
│   ├── exploratory_analysis.py
│   └── outputs/
│       └── kpi_summary.csv
├── sql/
│   ├── 01_create_database.sql
│   ├── 02_create_table.sql
│   ├── 03_dashboard_analysis.sql
│   └── 04_business_insights.sql
├── powerbi/
│   └── DAX_Measures.txt
├── blinkit_report.pbix
└── README.md
~~~

## Project Workflow

### 1. Data Cleaning (Python)

- Standardized column names and categorical values (`LF` and `low fat` became `Low Fat`, `reg` became `Regular`)
- Converted numeric columns safely and filled missing item weights using item-type medians
- Engineered `Outlet Age` and `Sales per Weight`
- Removed duplicate rows and exported `blinkit_cleaned_data.csv`

### 2. Exploratory Analysis (Python)

- Built a KPI summary and sales breakdowns by outlet, item type, outlet type, location tier, fat content, establishment year and rating
- Exported every breakdown as a CSV to `python/outputs/`

### 3. SQL Analysis (MySQL)

- Created the `blinkit_analytics` database and the `blinkit_sales` table
- Ten dashboard-aligned queries covering KPIs and sales by outlet, category, outlet type, tier, size, fat content, year and rating
- Business-insight queries using CTEs and window functions for outlet and category contribution percentage, outlet type performance and high-sales category identification

### 4. Power BI Dashboard

- Core DAX measures: Total Sales, Average Sales, Items Sold, Average Rating, Unique Items, Unique Outlets, Sales Contribution %, Average Visibility, Average Item Weight
- Full definitions are in `powerbi/DAX_Measures.txt`

## Key KPIs

| Metric | Value |
|---|---|
| Total Sales | 1.20M |
| Average Sales per Record | 140.99 |
| Records | 8,523 |
| Average Rating | 3.97 |
| Unique Items | 1,559 |
| Unique Outlets | 10 |

## Key Insights

- Supermarket Type1 outlets contribute about 65% of total sales (around 788K), well ahead of Grocery Store, Supermarket Type2 and Supermarket Type3
- Tier 3 locations lead on total sales (around 472K), followed by Tier 2 and Tier 1
- Fruits and Vegetables (around 178K) and Snack Foods (around 175K) are the top two categories, followed by Household, Frozen Foods and Dairy
- Low Fat items contribute about 65% of sales compared with Regular items
- Eight outlets generate roughly 129K to 133K each, while the two Grocery Store outlets (OUT010 and OUT019) sit at roughly 78K and 74K, making them the clearest optimization targets
- Average sales per record is almost identical across outlet types, tiers and sizes (about 140 to 142), so differences in total sales come mainly from record volume and not from higher-value items
- Item visibility has almost no correlation with sales, so extra shelf placement alone is unlikely to lift revenue

## Recommendations

- Prioritize the two low-performing Grocery Store outlets through better assortment and category mix
- Expand and protect Supermarket Type1 formats, the main revenue engine
- Keep high availability of Fruits and Vegetables and Snack Foods, the top revenue categories
- Focus on growing order volume per outlet, since per-record sales value is already uniform

## How to Run

1. Clone the repository

~~~
git clone https://github.com/<your-username>/Blinkit-Store-Optimization-Analysis.git
cd Blinkit-Store-Optimization-Analysis
~~~

2. Install the dependencies

~~~
pip install pandas openpyxl
~~~

3. Clean the data

~~~
python python/data_cleaning.py
~~~

4. Run the exploratory analysis

~~~
python python/exploratory_analysis.py
~~~

5. Run the SQL scripts in `sql/` in order (01 to 04) after loading the cleaned CSV into the `blinkit_sales` table
6. Open `blinkit_report.pbix` in Power BI Desktop

## Author

Shiva
B.Tech, Metallurgical Engineering and Materials Science, IIT Indore
