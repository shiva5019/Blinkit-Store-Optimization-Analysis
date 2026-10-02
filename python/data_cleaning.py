"""
Blinkit Sales Insights & Store Optimization
Data cleaning and preparation

Input:
    ../BlinkIT Grocery Dataset.xlsx

Output:
    ../data/blinkit_cleaned_data.csv
"""

from pathlib import Path
import pandas as pd

BASE_DIR = Path(__file__).resolve().parents[1]
INPUT_FILE = BASE_DIR / "BlinkIT Grocery Dataset.xlsx"
OUTPUT_FILE = BASE_DIR / "data" / "blinkit_cleaned_data.csv"

df = pd.read_excel(INPUT_FILE)

# Standardize column names
df.columns = [c.strip() for c in df.columns]

# Standardize categorical values
df["Item Fat Content"] = (
    df["Item Fat Content"].astype(str).str.strip()
    .replace({
        "LF": "Low Fat",
        "low fat": "Low Fat",
        "reg": "Regular",
        "regular": "Regular"
    })
)

for col in ["Item Type", "Outlet Location Type", "Outlet Size", "Outlet Type"]:
    df[col] = df[col].astype(str).str.strip()

# Convert numeric fields
numeric_cols = [
    "Outlet Establishment Year",
    "Item Visibility",
    "Item Weight",
    "Sales",
    "Rating"
]
for col in numeric_cols:
    df[col] = pd.to_numeric(df[col], errors="coerce")

# Handle missing item weights using item-type medians
df["Item Weight"] = df.groupby("Item Type")["Item Weight"].transform(
    lambda s: s.fillna(s.median())
)
df["Item Weight"] = df["Item Weight"].fillna(df["Item Weight"].median())

# Feature engineering
df["Outlet Age"] = 2025 - df["Outlet Establishment Year"]
df["Sales per Weight"] = df["Sales"] / df["Item Weight"].replace(0, pd.NA)

# Remove exact duplicate rows
df = df.drop_duplicates().reset_index(drop=True)

OUTPUT_FILE.parent.mkdir(exist_ok=True)
df.to_csv(OUTPUT_FILE, index=False)

print(f"Rows after cleaning: {len(df):,}")
print(f"Columns: {len(df.columns)}")
print(f"Saved to: {OUTPUT_FILE}")
