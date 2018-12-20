from flask import Flask, render_template, request, session, url_for, redirect, flash
from elasticsearch import Elasticsearch
from models import *
import config
from exts import db
from flask_login import current_user, login_required


es = Elasticsearch()
app = Flask(__name__)
app.config.from_object(config)
db.init_app(app)
login_manager.init_app(app)


@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'GET':
        #prof_info = Prof.query.filter(Prof.prof_id == 2).first()
        #return render_template('prof_info.html', prof_info=prof_info)
        #return render_template('result_test.html')
        return render_template('index.html')

    elif request.method == 'POST':
        content = request.form.get('v_value')

        body = {
            "query": {
                "match": {
                    "age": content
                }
            }
        }

        # Match默认匹配某个字段
        result = es.search(index="my-index", doc_type="my-index", body=body)

        return render_template('result_test.html', result=result)


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
                flash('密码错误')
                return redirect(url_for('signin'))
        else:
            flash('当前用户不存在')
            return redirect(url_for('signin'))


@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'GET':
        return render_template('signup.html')
    else:
        email = request.form.get('email')
        password1 = request.form.get('password1')
        password2 = request.form.get('password2')

        if password1 != password2:
            flash('两次密码不一致，请核对')
            return redirect(url_for('signup'))
        else:
            user = User.query.filter(User.email == email).first()
            if user:
                flash('该邮箱已经被注册，请更换邮箱')
                return redirect(url_for('signup'))
            else:
                user = User()
                user.password = password1
                user.email = email
                user.role_id = 2
                db.session.add(user)
                db.session.commit()
                flash("注册成功")
                return redirect(url_for('signin'))


@app.route('/signout')
@login_required
def signout():
    session.clear()
    flash("您已成功登出")
    return redirect(url_for('index'))


@app.route('/change_password', methods=['GET', 'POST'])
@login_required
def change_password():
    if request.method == 'GET':
        return render_template("change_password.html")
    else:
        old_password = request.form.get('old_password')
        new_password1 = request.form.get('new_password1')
        new_password2 = request.form.get('new_password2')

        if current_user.verify_password(old_password):
            if new_password1 == new_password2:
                current_user.password = new_password1
                db.session.add(current_user)
                db.session.commit()
                flash('您的密码已被重置')
                return redirect(url_for('change_password'))
            else:
                flash('两次新密码不一致')
                return redirect(url_for('change_password'))
        else:
            flash('原密码错误')
            return redirect(url_for('change_password'))


@app.route('/edit_profile', methods=['GET', 'POST'])
@login_required
def edit_profile():
    if request.method == 'GET':
        return render_template("edit_profile.html")
    else:
        if current_user.role_id == 1:
            student = Student.query.filter(Student.student_id == current_user.id).first()
            modified = False
            student_name = request.form.get('student_name')
            student_email = request.form.get('student_email')
            student_brief = request.form.get('student_brief')
            if student_name:
                student.student_name = student_name
                modified = True
            if student_email:
                student.student_email = student_email
                modified = True
            if student_brief:
                student.student_brief = student_brief
                modified = True
            if modified:
                db.session.add(student)
                db.session.commit()
                flash('修改成功')
            return redirect(url_for('student', id=current_user.id))

        elif current_user.role_id == 2:

            prof = Prof.query.filter(Prof.prof_id == current_user.id).first()
            modified = False
            prof_name = request.form.get('prof_name')
            prof_email = request.form.get('prof_email')
            prof_interest = request.form.get('prof_interest')
            if prof_name:
                prof.prof_name = prof_name
                modified = True
            if prof_email:
                prof.prof_email = prof_email
                modified = True
            if prof_interest:
                prof.prof_interest = prof_interest
                modified = True
            if modified:
                db.session.add(prof)
                db.session.commit()
                flash('修改成功')
            return redirect(url_for('prof', id=current_user.id))
        else:
            return '404'


@app.route('/result', methods=['GET', 'POST'])
def result():
    if request.method == 'GET':
        return render_template('signin.html')
    else:
        return render_template('result.html')


@app.route('/student/<id>', methods=['GET', 'POST'])
def student(id):
    if request.method == "GET":
        student_name = Student.query.filter(Student.student_id == id).first().student_name
        appointment = Appointment.query.filter(Appointment.student_id == id)
        for i in appointment:
            i.prof_name = Prof.query.filter(Prof.prof_id == Appointment.prof_id).first().prof_name
        return render_template('student.html', student_name=student_name, appointment=appointment)
    else:
        pass


@app.route('/prof/<id>', methods=['GET', 'POST'])
def prof(id):
    if request.method == "GET":
        prof_name = Prof.query.filter(Prof.prof_id == id).first().prof_name
        appointment = Appointment.query.filter(Appointment.prof_id == id)
        for i in appointment:
            i.student_name = Student.query.filter(Student.student_id == Appointment.student_id).first().student_name
        return render_template('prof.html', prof_name=prof_name, appointment=appointment)
    else:
        pass


@app.route('/profBase', methods=['GET', 'POST'])
def prof_base():
    if request.method == "GET":
        return render_template('prof_base.html')


@app.route('/prof_info/<prof_info_id>', methods=['GET', 'POST'])
def prof_info(prof_info_id):
    if request.method == "GET":
        prof_info = Prof.query.filter(Prof.prof_id == prof_info_id).first()
        return render_template('prof_info.html', prof_info=prof_info)


@app.context_processor
def my_context_processor():
    user_id = session.get('user_id')
    if user_id:
        user = User.query.filter(User.id == user_id).first()
        if user:
            if user.role_id == 1:
                student = Student.query.filter(Student.student_id == user_id).first()
                return {'user': user, 'student': student}
            elif user.role_id == 2:
                prof = Prof.query.filter(Prof.prof_id == user_id).first()
                return {'user': user, 'prof': prof}
    return {}
    # 必须返回一个字典，即使是空的


@app.route('/profCancel/<id>')
def prof_cancel(id):
    if request.method == "GET":
        appointment = Appointment.query.filter(Appointment.student_id == id)
        for i in appointment:
            i.prof_name = Prof.query.filter(Prof.prof_id == Appointment.prof_id).first().prof_name
    return redirect(url_for('prof', id=id))


@app.route('/studentCancel/<id>')
def student_cancel(id):
    appointment = Appointment.query.filter(Appointment.appointment_id == id)
    for i in appointment:
        i.prof_name = Prof.query.filter(Prof.prof_id == Appointment.prof_id).first().prof_name

    return redirect(url_for('student', id=id))


@app.route('/search', methods=['GET', 'POST'])
def search():

    return render_template('result_test.html')
#
# @app.errorhandler(404)
# def not_found():
#     return "一百年专业错误处理"

if __name__ == '__main__':
    app.run()
