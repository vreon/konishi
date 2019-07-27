FROM python:3.7.4-alpine
RUN mkdir -p /app
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY sms_sender.py .
CMD ["faust", "-A", "sms_sender", "worker", "-l", "info"]
