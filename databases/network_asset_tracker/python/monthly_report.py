import psycopg2
import pandas as pd

conn = psycopg2.connect(
    dbname="asset_db",
    user="postgres",
    password="yourpassword",
    host="localhost"
)

query = "SELECT hostname, risk_level, last_patch_date FROM devices;"
df = pd.read_sql(query, conn)

df.to_csv("monthly_report.csv", index=False)

print("Monthly report generated.")