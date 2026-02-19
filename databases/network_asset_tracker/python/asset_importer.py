import psycopg2
import csv

conn = psycopg2.connect(
    dbname="asset_db",
    user="postgres",
    password="yourpassword",
    host="localhost"
)

cur = conn.cursor()

with open("sample_scan.csv", newline="") as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        cur.execute("""
            INSERT INTO devices (hostname, mac_address, os_version, last_patch_date)
            VALUES (%s, %s, %s, %s)
            ON CONFLICT (hostname) DO NOTHING;
        """, (
            row["hostname"],
            row["mac_address"],
            row["os_version"],
            row["last_patch_date"]
        ))

conn.commit()
cur.close()
conn.close()

print("Assets imported successfully.")