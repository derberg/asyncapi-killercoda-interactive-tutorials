To generate your code you'll use the [AsyncAPI Generator](https://github.com/asyncapi/generator) Node.js template.

# Generating code

1. Install the generator to use is at a command-line tool: `npm install -g @asyncapi/generator`{{exec}}

1. Trigger generation of the Node.js code: `ag asyncapi.yaml @asyncapi/nodejs-template -o output -p server=mosquitto`{{exec}}

1. And voilà! In the editor you can see a new folder is created with generated Node.js application. Enter the folder in the terminal: `cd output`{{exec}}

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

[ACCESS MQTT]({{TRAFFIC_HOST1_1883}})

> Run this in another terminal. With **+** icon open Tab3

> This runs in yet another terminal. To see the message goes to your service logs check out the main terminal.

Use MQTT client to send a message to the broker you started in the previous step:

1. Install the MQTT.js library: `npm install mqtt -g`{{exec}}
1. Send message to your application: `mqtt pub -t 'light/measured' -h 'localhost' -m '{"id": 1, "lumens": 3, "sentAt": "2017-06-07T12:34:32.000Z"}'`{{exec}}

Check the first terminal to see that your generated service received a message. 