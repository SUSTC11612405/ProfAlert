from flask import Flask, render_template, request, session, url_for, redirect, jsonify
from flask_sqlalchemy import SQLAlchemy
from elasticsearch import Elasticsearch
from models import User, Appoint
import config
from exts import db
from flask_bootstrap import Bootstrap

app = Flask(__name__)
app.config.from_object(config)
#bootstrap = Bootstrap(app)
db.init_app(app)
from flask import Flask, render_template, request, session, url_for, redirect, jsonify
from flask_sqlalchemy import SQLAlchemy
from elasticsearch import Elasticsearch
from models import *
import config
from exts import db
from flask_bootstrap import Bootstrap

app = Flask(__name__)
app.config.from_object(config)
#bootstrap = Bootstrap(app)
db.init_app(app)

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'GET':
        return render_template('index.html')
    elif request.method == 'POST':

        content = request.form.get('search_content')
        es = Elasticsearch()
        body = {
            "query": {
                "match": {
                    "age": 21
                }
            }
        }
        # Match默认匹配某个字段
        response = es.search(index="my-index", doc_type="my-index", body=body)
        size = response['hits']['total']


        a = (response['hits']['hits'][0]['_source']['name'])

        return render_template('index.html', name=a, age=21)



@app.route('/signin', methods=['GET', 'POST'])
def signin():
    if request.method == 'GET':
        return render_template('signin.html')
    else:
        email = request.form.get('email')
        password = request.form.get('password')
        user = User.query.filter(User.email == email).first()
        if user:
            if user.verify_password(password):
                session['user_id'] = user.id
                session.permanent = True
                return redirect(url_for('index'))
            else:
                return '密码错误'
        else:
            return '当前用户不存在'


@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'GET':
        return render_template('signup.html')
    else:
        email = request.form.get('email')
        password1 = request.form.get('password1')
        password2 = request.form.get('password2')

        if password1 != password2:
            return '两次密码不一致，请核对'
        else:
            user = User.query.filter(User.email == email).first()
            if user:
                return '该邮箱已经被注册，请更换邮箱'
            else:
                user = User()
                user.password = password1
                user.email = email
                db.session.add(user)
                db.session.commit()
                return "注册成功"

@app.route('/result', methods=['GET', 'POST'])
def result():
    if request.method == 'GET':
        return render_template('signin.html')
    else:
        return render_template('result.html')
    # es = Elasticsearch()
    # body = {
    #     "query": {
    #         "match": {
    #             "age": "21"
    #         }
    #     }
    # }
    # # Match默认匹配某个字段
    # response = es.search(index="my-index", doc_type="my-index", body=body)
    # size = response['hits']['total']
    # for index in range(size):
    #     print(response['hits']['hits'][index]['_source'])



@app.route('/teachersInfo', methods=['GET', 'POST'])
def teachersInfo():
    if request.method == "GET":
        return render_template('teacher_base.html')
    else:
        pass


@app.route('/student/<id>', methods=['GET', 'POST'])
def student(id):
    if request.method == "GET":
        student_name = Student.query.filter(Student.student_id == id).first().student_name
        appointment = Appointment.query.filter(Appointment.student_id == id)
        for i in appointment:
            i.prof_name = Prof_info.query.filter(Prof_info.prof_id == Appointment.prof_id).first().prof_name
        return render_template('student.html', student_name=student_name, appointment=appointment)
    else:
        pass


if __name__ == '__main__':
    app.run()

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'GET':
        return render_template('index.html')
    elif request.method == 'POST':

        content = request.form.get('search_content')
        es = Elasticsearch()
        body = {
            "query": {
                "match": {
                    "age": 21
                }
            }
        }
        # Match默认匹配某个字段
        response = es.search(index="my-index", doc_type="my-index", body=body)
        size = response['hits']['total']


        a = (response['hits']['hits'][0]['_source']['name'])

        return render_template('index.html', name=a, age=21)



@app.route('/signin', methods=['GET', 'POST'])
def signin():
    if request.method == 'GET':
        return render_template('signin.html')
    else:
        email = request.form.get('email')
        password = request.form.get('password')
        user = User.query.filter(User.email == email).first()
        if user:
            if user.verify_password(password):
                session['user_id'] = user.id
                session.permanent = True
                return redirect(url_for('index'))
            else:
                return '密码错误'
        else:
            return '当前用户不存在'


@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'GET':
        return render_template('signup.html')
    else:
        email = request.form.get('email')
        password1 = request.form.get('password1')
        password2 = request.form.get('password2')

        if password1 != password2:
            return '两次密码不一致，请核对'
        else:
            user = User.query.filter(User.email == email).first()
            if user:
                return '该邮箱已经被注册，请更换邮箱'
            else:
                user = User()
                user.password = password1
                user.email = email
                db.session.add(user)
                db.session.commit()
                return "注册成功"

@app.route('/result', methods=['GET', 'POST'])
def result():
    if request.method == 'GET':
        return render_template('signin.html')
    else:
        return render_template('result.html')
    # es = Elasticsearch()
    # body = {
    #     "query": {
    #         "match": {
    #             "age": "21"
    #         }
    #     }
    # }
    # # Match默认匹配某个字段
    # response = es.search(index="my-index", doc_type="my-index", body=body)
    # size = response['hits']['total']
    # for index in range(size):
    #     print(response['hits']['hits'][index]['_source'])



@app.route('/teachersInfo', methods=['GET', 'POST'])
def teachersInfo():
    if request.method == "GET":
        return render_template('teacher_base.html')
    else:
        pass

if __name__ == '__main__':
    app.run()
