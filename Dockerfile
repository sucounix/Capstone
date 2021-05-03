FROM python:3.7.2-slim

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip &&\
	 pip install -r requirements.txt


EXPOSE 8080

ENTRYPOINT ["python", "app.py"]