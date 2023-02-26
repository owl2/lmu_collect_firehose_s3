import datetime
import json
import random
import boto3


boto3 = boto3.Session(profile_name='lmu')
FIREHOSE_DELIVERY_NAME = "lmu_kinesis_firehose_s3"


def get_data():
    return {
        'event_time': datetime.datetime.now().isoformat(),
        'ticker': random.choice(['AAPL', 'AMZN', 'MSFT', 'INTC', 'TBV']),
        'price': round(random.random() * 100, 2)}


def generate(stream_name, firehose_client):
    while True:
        data = get_data()
        print("Data to PUT :")
        print(data)
        firehose_client.put_record(
            DeliveryStreamName=FIREHOSE_DELIVERY_NAME,
            Record={'Data': json.dumps(data)},
        )


if __name__ == '__main__':
    generate(FIREHOSE_DELIVERY_NAME, boto3.client('firehose', region_name='us-east-2'))