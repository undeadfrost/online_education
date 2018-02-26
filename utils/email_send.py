from users.models import EmailVerifyRecord
from django.core.mail import send_mail
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
        email_content = '请点击下面链接进行激活 http://127.0.0.1:8000/active/{0}'.format(code)

        send_status = send_mail(email_title, email_content, EMAIL_FROM, [email])
        if send_status:
            pass
