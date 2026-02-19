import psycopg2
from datetime import datetime, timedelta

conn = psycopg2.connect(
    dbname="asset_db",
    user="postgres",
    password="yourpassword",
    host="localhost"
)

cur = conn.cursor()

cur.execute("SELECT id, last_patch_date FROM devices;")
devices = cur.fetchall()

for device in devices:
    device_id, patch_date = device
    if patch_date and patch_date < datetime.now().date() - timedelta(days=60):
        cur.execute(
            "UPDATE devices SET risk_level = 'HIGH' WHERE id = %s;",
            (device_id,)
        )

conn.commit()
cur.close()
conn.close()

print("Risk evaluation complete.")