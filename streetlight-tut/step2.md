To generate your code you'll use the [AsyncAPI CLI](https://github.com/asyncapi/cli) Node.js template.

# Generating code

1. Install the generator to use is at a command-line tool: `npm install -g @asyncapi/cli`{{exec}}

1. Trigger generation of the Node.js code: `asyncapi generate fromTemplate asyncapi.yaml @asyncapi/nodejs-template@0.13.3 -o output -p server=mosquitto`{{exec}}

1. And voilà! In the editor, you can see a new folder is created with generated Node.js application. Go to your `Tab1` terminal and enter the `output` folder from there: `cd output`{{exec}}

# Start your generated service

> Run this in terminal in Tab1

Install and start the service:

1. Install dependencies of newly generated application: `npm install`{{exec}}
1. Clear the terminal from all the previous noise `clear`{{exec}}
1. Start the application: `npm start`{{exec}}

# Start MQTT broker

> Run this in another terminal. With **+** icon open Tab2

In this tutorial you use [Eclipse Mosquitto](https://mosquitto.org/) broker:

`docker run -it -p 1883:1883 eclipse-mosquitto:1.5`{{exec}}

# Connect to broker with MQTT client - message producer

> Run this in another terminal. With **+** icon open Tab3

> This runs in yet another terminal. To see the message goes to your service logs check out the main terminal.

Use MQTT client to send a message to the broker you started in the previous step:

1. Install the MQTT.js library: `npm install mqtt -g`{{exec}}
1. Send message to your application: `mqtt pub -t 'light/measured' -h 'localhost' -m '{"id": 1, "lumens": 3, "sentAt": "2017-06-07T12:34:32.000Z"}'`{{exec}}

Check the first terminal to see that your generated service received a message. 
