FROM python:3.8.5

WORKDIR /app/src

COPY requirements.txt /app/requirements.txt

RUN pip install -r /app/requirements.txt

COPY src /app/src

CMD ["python", "app.py"]
