from users.models import EmailVerifyRecord
from django.core.mail import send_mail, EmailMessage
from django.template import loader
from random import Random, choice

from online_education.settings import EMAIL_FROM


def random_str(random_length):
    code_str = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    for i in range(random_length):
        code_str += choice(chars)
    return code_str


def send_register_email(email, send_type):
    email_verify_record = EmailVerifyRecord()
    code = random_str(16)
    email_verify_record.code = code
    email_verify_record.email = email
    email_verify_record.send_type = send_type
    email_verify_record.save()

    if send_type == 'register':
        email_title = '注册激活测试邮件'
        email_body = loader.render_to_string(
            "email/email_register.html",  # 需要渲染的html模板
            {
                "active_code": code  # 参数
            }
        )
        msg = EmailMessage(email_title, email_body, EMAIL_FROM, [email])
        msg.content_subtype = "html"
        send_status = msg.send()
    elif send_type == 'forget':
        email_title = '找回密码测试邮件'
        # email_body = loader.render_to_string(
        #     "email/email_forget.html",  # 需要渲染的html模板
        #     {
        #         "active_code": code  # 参数
        #     }
        # )
        # msg = EmailMessage(email_title, email_body, EMAIL_FROM, [email])
        # msg.content_subtype = "html"
        # send_status = msg.send()
        send_mail(email_title, 'test', EMAIL_FROM, [email])
    elif send_type == 'update_email':
        email_title = '修改邮箱验证码'
        email_body = loader.render_to_string(
            "email/email_update.html",  # 需要渲染的html模板
            {
                "active_code": code  # 参数
            }
        )
        msg = EmailMessage(email_title, email_body, EMAIL_FROM, [email])
        msg.content_subtype = "html"
        send_status = msg.send()


