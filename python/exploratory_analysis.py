"""
Blinkit Sales Insights & Store Optimization
Exploratory analysis aligned with the Power BI dashboard.
"""

from pathlib import Path
import pandas as pd

BASE_DIR = Path(__file__).resolve().parents[1]
INPUT_FILE = BASE_DIR / "data" / "blinkit_cleaned_data.csv"
OUTPUT_DIR = BASE_DIR / "python" / "outputs"
OUTPUT_DIR.mkdir(exist_ok=True)

df = pd.read_csv(INPUT_FILE)

# Overall KPI summary
kpi = pd.DataFrame({
    "Metric": [
        "Total Sales",
        "Average Sales",
        "Items Sold / Records",
        "Average Rating",
        "Unique Items",
        "Unique Outlets"
    ],
    "Value": [
        df["Sales"].sum(),
        df["Sales"].mean(),
        len(df),
        df["Rating"].mean(),
        df["Item Identifier"].nunique(),
        df["Outlet Identifier"].nunique()
    ]
})
kpi.to_csv(OUTPUT_DIR / "kpi_summary.csv", index=False)

# Sales by outlet
df.groupby(
    ["Outlet Identifier", "Outlet Type", "Outlet Size", "Outlet Location Type"],
    dropna=False
)["Sales"].agg(["sum", "mean", "count"]).reset_index().sort_values(
    "sum", ascending=False
).to_csv(OUTPUT_DIR / "outlet_performance.csv", index=False)

# Sales by item type
df.groupby("Item Type")["Sales"].agg(
    Total_Sales="sum",
    Average_Sales="mean",
    Records="count"
).reset_index().sort_values(
    "Total_Sales", ascending=False
).to_csv(OUTPUT_DIR / "item_type_performance.csv", index=False)

# Sales by outlet type
df.groupby("Outlet Type")["Sales"].agg(
    Total_Sales="sum",
    Average_Sales="mean",
    Records="count"
).reset_index().sort_values(
    "Total_Sales", ascending=False
).to_csv(OUTPUT_DIR / "outlet_type_performance.csv", index=False)

# Sales by location tier
df.groupby("Outlet Location Type")["Sales"].agg(
    Total_Sales="sum",
    Average_Sales="mean",
    Records="count"
).reset_index().sort_values(
    "Total_Sales", ascending=False
).to_csv(OUTPUT_DIR / "location_performance.csv", index=False)

# Fat-content analysis
df.groupby("Item Fat Content")["Sales"].agg(
    Total_Sales="sum",
    Average_Sales="mean",
    Records="count"
).reset_index().sort_values(
    "Total_Sales", ascending=False
).to_csv(OUTPUT_DIR / "fat_content_analysis.csv", index=False)

# Establishment-year analysis
df.groupby("Outlet Establishment Year")["Sales"].agg(
    Total_Sales="sum",
    Average_Sales="mean",
    Records="count"
).reset_index().sort_values(
    "Outlet Establishment Year"
).to_csv(OUTPUT_DIR / "establishment_year_analysis.csv", index=False)

# Rating analysis
df.groupby("Rating")["Sales"].agg(
    Total_Sales="sum",
    Average_Sales="mean",
    Records="count"
).reset_index().sort_values(
    "Rating"
).to_csv(OUTPUT_DIR / "rating_analysis.csv", index=False)

print("EDA outputs created in python/outputs/")
