# ML-API-Demo
NLI-based Zero Shot Text Classification

How to run the code.
I've tried my best to document stuff below. But if in doubt, start from the Makefile, and "follow the white rabbit".

Pre-requisites
You'll need docker and docker-compose installed on your machine to use this. Also, don't forget to increase the memory and disk space allocated to it from docker preferences.

Serving the model using an HTTP endpoint
Running the Server
To run the server in detached mode, we run:

make serve
To run the server not without detaching, we run:

make run
Hitting the predict endpoint
Docker compose exposes the container at http://localhost:8080.

Using cURL
To get a prediction we run a cURL request:

curl -X POST http://localhost:8080/predict  \
    -H 'Content-Type: application/json'  \
    -d '{"text":"I am feeling great!","candidate_labels":["sad", "happy"]}'
You will see the JSON response like:

{
  "label": "happy",
  "score": 0.9991405010223389
}
Using Python Requests Module
A predict request using the requests module can be made like this:

request_obj = {
  "text": "I am feeling great!",
  "candidate_labels": ["sad", "happy"],
}
resp = requests.post(f"{server_url}/predict", json=request_obj)
resp.raise_for_status()

prediction = resp.json()
# 'prediction' will be {'label': 'happy', 'score': 0.9991405010223389}
The full example can be found in http_client.py. You might also want to install the requirements in requirements.txt, and check out the environment variables.

Logs
You can check the logs of the container using:

docker logs -f zero_shot
Shutdown
You can shut down the server using

make stop
