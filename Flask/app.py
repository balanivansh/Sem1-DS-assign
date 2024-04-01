from flask import Flask, render_template, request
import mysql.connector as mysql

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'All@nMysql01'
app.config['MYSQL_DB'] = 'registration_db'

db = mysql.connect(
    host=app.config['MYSQL_HOST'],
    user=app.config['MYSQL_USER'],
    password=app.config['MYSQL_PASSWORD'],
    database=app.config['MYSQL_DB']
)

@app.route('/', methods=['GET'])
def registration_form():
    return render_template('register.html')

@app.route('/register', methods=['POST'])
def register():
    if request.method == 'POST':
        student_name = request.form['student_name']
        father_name = request.form['father_name']
        mother_name = request.form['mother_name']
        phone_number = request.form['phone_number']
        email = request.form['email']
        date_of_birth = request.form['date_of_birth']
        address = request.form['address']
        blood_group = request.form['blood_group']
        department = request.form['department']
        course = request.form['course']
        password = request.form['password']

        try:
            cursor = db.cursor()
            cursor.execute("INSERT INTO users (student_name, father_name, mother_name, phone_number, email, date_of_birth, address, blood_group, department, course, password) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                           (student_name, father_name, mother_name, phone_number, email, date_of_birth, address, blood_group, department, course, password))
            db.commit()
            cursor.close()
            return 'Form submitted successfully'
        except Exception as e:
            return f"An error occurred: {e}"
    else:
        return "Method Not Allowed", 405

if __name__ == '__main__':
    app.run(debug=True)