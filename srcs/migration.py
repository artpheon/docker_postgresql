import psycopg2

def get_records():
    f = open("/var/www/hrobbin/employees.txt")
    records = []
    for i in f.readlines():
        records.append(i.split("/ "))
    return records


records = get_records()

try:
    connection = psycopg2.connect(database='staff', user='artur', password='python', host='127.0.0.1', port='5432')

except psycopg2.Error as err:
    print('\033[91m' + 'An error occurred!', err, '\033[0m')

else:
    print('\033[92m' + 'Connection to database was successful!' + '\033[0m')

cursor = connection.cursor()

try:
    for i in records:
        cursor.execute("insert into mystaff.employees (id, first_name, last_name, department, phone, address, salary) values (%s, %s, %s, %s, %s, %s, %s);", (i[0], i[1], i[2], i[3], i[4], i[5], i[6]))

except psycopg2.Error as err:
    print('\033[91m' + "An error was generated while adding the records", err, '\033[0m')

else:
    print('\033[92m' + 'Added values successfully!' + '\033[0m')

connection.commit()
connection.close()