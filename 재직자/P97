import psycopg2 as db

conn = db.connect("host=localhost dbname=dht11 user=postgres password=1234")
cur = conn.cursor()

cur.execute("""select column_name from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'dht11' """)
describe = cur.fetchall()

for desc in describe :
    print(desc[0], end = '\t\t')

print('\n-------------------------------------------------------------')

cur.execute("select * from dht11")
rows = cur.fetchall()

for row in rows :
    for r in row :
        print(r, end = '\t')
        if row[len(row) - 2] == r:
            print('\t\t', end = '')
    print()
cur.close()
conn.close()
