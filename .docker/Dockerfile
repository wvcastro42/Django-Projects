FROM python:3.12.1

RUN pip install --upgrade pip

RUN mkdir /code
WORKDIR /code

COPY requirements/production.txt /code/
RUN pip install -r production.txt

RUN cd /bin && \
    wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
    chmod +x wait-for-it.sh

CMD /bin/wait-for-it.sh database:5432 && \
    python manage.py migrate && \
    python manage.py runserver 0.0.0.0:8000
