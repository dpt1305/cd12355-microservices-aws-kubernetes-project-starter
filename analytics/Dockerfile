FROM python:3.9-slim

WORKDIR /src

COPY ./requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . /src

EXPOSE 8080

CMD ["python", "app.py"]
