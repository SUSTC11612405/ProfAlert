import datetime
from exts import db
from flask_login import UserMixin, LoginManager
from werkzeug.security import generate_password_hash, check_password_hash

login_manager = LoginManager()

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))


class User(UserMixin, db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    email = db.Column(db.String(50), nullable=False)
    password_hash = db.Column(db.String(128), nullable=False)
    role_id = db.Column(db.Integer, db.ForeignKey('roles.id'))

    @property
    def password(self):
        raise AttributeError('password is not a readable attribute')

    @password.setter
    def password(self, password):
        self.password_hash = generate_password_hash(password)

    def verify_password(self, password):
        return check_password_hash(self.password_hash, password)


class Roles(db.Model):
    __tablename__ = 'roles'
    id = db.Column(db.Integer, primary_key=True)
    type = db.Column(db.String(45), nullable=False)


class Appointment(db.Model):
    __tablename__ = 'appointment'
    appointment_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    appointment_creat_time = db.Column(db.DATETIME, default=datetime.date.today())
    prof_id = db.Column(db.Integer, db.ForeignKey('prof_info.prof_id'))
    student_id = db.Column(db.Integer, db.ForeignKey('student_info.student_id'))
    start_time = db.Column(db.DATETIME, nullable=False)
    end_time = db.Column(db.DATETIME, nullable=False)


class Student(db.Model):
    __tablename__ = 'student_info'
    student_id = db.Column(db.Integer, db.ForeignKey('user.id'), primary_key=True)
    student_name = db.Column(db.String(20), nullable=False)
    student_sex = db.Column(db.String(2), nullable=False)
    student_email = db.Column(db.String(30), nullable=False)
    student_brief = db.Column(db.TEXT)


class Prof(db.Model):
    __tablename__ = 'prof_info'
    prof_id = db.Column(db.Integer, db.ForeignKey('user.id'), primary_key=True)
    prof_name = db.Column(db.String(20), nullable=False)
    prof_pic = db.Column(db.String(100), nullable=False)
    prof_title = db.Column(db.String(10), nullable=False)
    prof_email = db.Column(db.String(30), nullable=False)
    prof_interest = db.Column(db.TEXT, nullable=False)
    prof_search = db.Column(db.TEXT)
    department_id = db.Column(db.Integer, db.ForeignKey('department.department_id'))


class Department(db.Model):
    __tablename__ = 'department'
    department_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    department_name = db.Column(db.String(20), nullable=False)
