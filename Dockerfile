FROM python:3.8.5-slim

COPY . /app
WORKDIR /app

RUN pip install pip==21.1.1
RUN pip install -r requirements.txt
     


EXPOSE 8080

ENTRYPOINT ["python", "scr/app.py"]