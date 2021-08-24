import psycopg2

try:
    connection = psycopg2.connect(database='staff', user='artur', password='python', host='127.0.0.1', port='5432')

except psycopg2.Error as err:
    print('\033[91m' + 'An error occurred!', err, '\033[0m')

else:
    print('\033[92m' + 'Connection to database was successful!' + '\033[0m')

cursor = connection.cursor()
cursor.execute("select * from mystaff.employees where department in ('Sales', 'IT');")
records = cursor.fetchall()
for record in records:
    print(record)

cursor.execute("select * from mystaff.employees where salary between 40000 and 55000;")
records = cursor.fetchall()
for record in records:
    print(record)
print()

cursor.execute("select * from mystaff.employees where salary between 40000 and 55000;")
records = cursor.fetchone()
for i in records:
    print(i)
records = cursor.fetchone()
for i in records:
    print(i)
print()

cursor.execute("select * from mystaff.employees where salary between 40000 and 55000;")
records = cursor.fetchmany(size=2)
for i in records:
    print(i)

connection.rollback()
connection.commit()
connection.close()