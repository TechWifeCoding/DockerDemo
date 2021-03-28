FROM python:3.8.5

WORKDIR /app/src

COPY requirements.txt /app/requirements.txt

RUN pip install -r /app/requirements.txt

COPY src /app/src

ENV FLASK_APP=app.py
ENV FLASK_ENV=production
ENV FLASK_RUN_PORT=5000

CMD ["flask", "run", "-h","0.0.0.0"]
