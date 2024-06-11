import json
import boto3
from botocore.exceptions import ClientError

email_address = 'jmesthy@gmail.com'

def lambda_handler(event, context):
    # Retrieve data from the POST request
    try:
        data = json.loads(event['body'])
        sender = data['sender']
        subject = data['subject']
        body_html = data['body_html']
    except KeyError as e:
        return {
            'statusCode': 400,
            'body': json.dumps(f"Missing required field: {str(e)}")
        }
    except json.JSONDecodeError:
        return {
            'statusCode': 400,
            'body': json.dumps("Invalid JSON in request body")
        }

    # The AWS Region you're using for SES
    AWS_REGION = "us-east-1"

    # Create a new SES resource and specify a region.
    client = boto3.client('ses', region_name=AWS_REGION)

    # Try to send the email.
    try:
        response = client.send_email(
            Destination={
                'ToAddresses': [
                    email_address,
                ],
            },
            Message={
                'Body': {
                    'Html': {
                        'Charset': "UTF-8",
                        'Data': body_html,
                    },
                },
                'Subject': {
                    'Charset': "UTF-8",
                    'Data': subject,
                },
            },
            Source=sender,
        )
    except ClientError as e:
        return {
            'statusCode': 500,
            'headers': {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
                'Access-Control-Allow-Headers': 'Content-Type',
            },
            'body': json.dumps(f"Error sending email: {e.response['Error']['Message']}")
        }
    else:
        return {
            'statusCode': 200,
            'headers': {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
                'Access-Control-Allow-Headers': 'Content-Type',
            },
            'body': json.dumps(f"Email sent! Message ID: {response['MessageId']}")
        }

