from flask import Flask,render_template,request,session,redirect
import random 
from flask_sqlalchemy import SQLAlchemy
from werkzeug import secure_filename
from flask_mail import Mail
import json
import os
import math
from datetime import datetime


with open('config.json','r') as c:
    params = json.load(c) ["params"]
local_server=True
app=Flask(__name__)
app.secret_key='super-secret-key'
app.config['UPLOAD_FOLDER'] = params['Upload_location']
app.config.update(

    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT ='465',
    MAIL_USE_SSL =True,
    MAIL_USERNAME =params['gmail-user'],
    MAIL_PASSWORD =params['gmail-password']

)
mail=Mail(app)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']
print('hi')
db = SQLAlchemy(app)





class Contact(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(200),nullable=False,unique=False)
    phone_num = db.Column(db.String(120), unique=True,nullable=False)
    email = db.Column(db.String(120),unique=False,nullable=False)
    msg = db.Column(db.String(500),unique=False,nullable=False)
    date = db.Column(db.DateTime,default=datetime.utcnow)
    

class posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(200),nullable=False)
    slug = db.Column(db.String(120), unique=True,nullable=False)
    content=db.Column(db.String(500), unique=True,nullable=False)
    tagline = db.Column(db.String(120), nullable=False)
    img_file = db.Column(db.String(12), nullable=True)
    date = db.Column(db.DateTime,default=datetime.utcnow)




@app.route("/")
def home():
    post = posts.query.filter_by().all()
    last=math.ceil(len(post)/int(params['no_of_posts']))
    print(last)

    page=request.args.get('page')
    if(not str(page).isnumeric()):
        page=1
    page=int(page)
    print(page)
    post=post[(page-1)*int(params['no_of_posts']): (page-1)*int(params['no_of_posts'])+ int(params['no_of_posts'])]
    if (page==1):
        prev="#"
        next="/?page="+str(page+1)
    elif (page==last):
        prev="/?page="+str(page-1)
        next="#"
    else:
        prev="/?page="+str(page-1)
        next="/?page="+str(page+1)
    # post = posts.query.filter_by().all()[0:params['no_of_posts']]
    return render_template('index.html', params=params, posts=post,prev=prev,next=next)

@app.route("/dashbord",methods=['GET','POST'])
def dashbord():
    
    if ('user' in session and session['user']==params['admin_user']):
        post=posts.query.all()
        return render_template('dashbord.html',params=params,posts=post)

    if request.method=='POST':
        username=request.form.get('uname')
        userpass=request.form.get('pass')
        if (username == params['admin_user'] and userpass == params['admin_password']):
            print("hello3")
            session['user']=username
            post=posts.query.all()
            return render_template('dashbord.html',params=params,post=post)
            
    return render_template('login.html',params=params)

@app.route("/about")
def about():
    return render_template('about.html',params=params)
    
@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post)


@app.route("/edit/<string:sno>", methods=['GET','POST'])
def edit(sno):

    print(" beee")
    print(sno)
    if ('user' in session and session['user']==params['admin_user']):

        print("outside")
        if request.method =='POST':
            box_title=request.form.get('Title')
            tline=request.form.get('tline')
            slug=request.form.get('Slug')
            content=request.form.get('content')
            img_file=request.form.get('img_file')
            date=datetime.now()

            if sno =='0':
                print("No")
                n=random.randint(40,90)
                print(n)
                post=posts(title=box_title,slug=slug,content=content,tagline=tline,img_file=img_file,date=date,sno=n)
                db.session.add(post)
                db.session.commit() 
            else:
                post=posts.query.filter_by(sno=sno).first()
                post.title=box_title
                post.slug=slug
                post.content=content
                post.tagline=tline
                post.img_file=img_file
                post.date=date
                db.session.commit()
                return redirect('/edit/'+sno)

        post=posts.query.filter_by(sno=sno).first()
        return render_template('edit.html',params=params,post=post)



@app.route("/uploader", methods=['GET','POST'])
def uploader():
     if ('user' in session and session['user']==params['admin_user']):
         if(request.method=='POST'):
             f=request.files['file1']
             f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename) ))
             return "UPLOADED SUCCESSFULLY"

@app.route("/delete/<string:sno>", methods=['GET','POST'])
def delete(sno):
    if ('user' in session and session['user']==params['admin_user']):
        post=posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashbord')


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashbord')
@app.route("/contact", methods=['GET','POST'])
def contacts():
    if(request.method == "POST"):
        print()
        name =request.form.get('name')
        email =request.form.get('email')
        phone =request.form.get('phone')
        message =request.form.get('message')
        entry = Contact(name=name,msg=message,phone_num=phone,email=email)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message From ' +name,
                        sender=email,
                        recipients = [params['gmail-user']],
                        body = message +"\n"+ phone
                        
                        )
   
    return render_template('contact.html',suc=True,params=params)

if __name__=='__main__':
    app.run(debug=True)