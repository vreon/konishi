import os
from faust import App
from twilio.rest import Client


app = App("sms-sender", broker="kafka://kafka-kafka-bootstrap.kafka:9092")
topic = app.topic("sms.send", value_serializer="json")
twilio = Client(os.environ["TWILIO_ACCOUNT_SID"], os.environ["TWILIO_AUTH_TOKEN"])


@app.agent(topic)
async def sms_sender(messages):
    async for message in messages:
        try:
            to = message.get("to", os.environ["TWILIO_DEFAULT_TO"])
            from_ = message.get("from", os.environ["TWILIO_DEFAULT_FROM"])
            body = message["body"]
        except KeyError:
            print(f"Malformed: {repr(message)}")
            continue

        twilio.messages.create(to=to, from_=from_, body=body)


if __name__ == "__main__":
    app.main()
