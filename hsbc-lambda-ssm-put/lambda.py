import json
import os
import boto3
import base64
from botocore.exceptions import ClientError

def put_secret(secret_name, region_name):

    secret_name = "cmk_newnewnew_example"
    secret_value = "supersecret"
    region_name = "us-east-1"
    key_id = '20a7ba6d-7b62-460d-a9ec-6aba8c9cde58'
    xft_id = 'ABCD'
    
    # Create a Secrets Manager client
    session = boto3.session.Session()
    client = session.client(
        service_name='secretsmanager',
        region_name=os.environ['AWS_REGION']
    )

    try:
        get_secret_value_response = client.get_secret_value(SecretId=secret_name)
            
    except ClientError as e:
        if e.response['Error']['Code'] == 'DecryptionFailureException':
            # Secrets Manager can't decrypt the protected secret text using the provided KMS key.
            # Deal with the exception here, and/or rethrow at your discretion.
            raise e
        elif e.response['Error']['Code'] == 'InternalServiceErrorException':
            # An error occurred on the server side.
            # Deal with the exception here, and/or rethrow at your discretion.
            raise e
        elif e.response['Error']['Code'] == 'InvalidParameterException':
            # You provided an invalid value for a parameter.
            # Deal with the exception here, and/or rethrow at your discretion.
            raise e
        elif e.response['Error']['Code'] == 'InvalidRequestException':
            # You provided a parameter value that is not valid for the current state of the resource.
            # Deal with the exception here, and/or rethrow at your discretion.
            raise e
        elif e.response['Error']['Code'] == 'ResourceNotFoundException':
            # We can't find the resource that you asked for.
            # Deal with the exception here, and/or rethrow at your discretion.
            
            client.create_secret(
                Name=secret_name,
                Description='string',
                KmsKeyId=key_id,
                SecretString=secret_value,
                Tags=[
                    {
                        'Key': 'xft-id',
                        'Value': xft_id
                    },
                ]
            )
            return 'New Secret created'
    else:
        if 'SecretString' in get_secret_value_response:
            return 'Secret exsits already'
