import boto3

client = boto3.client('ssm')

def get_secret(key):
	result = client.get_parameter(
		Name=key,
		WithDecryption=True
	)
	return result['Parameter']['Value']

my_secret = get_secret('${my_secret}')