Now you'll learn how to generate an application that uses [Glee](https://github.com/asyncapi/glee) framework. You'll do it with AsyncAPI document and [AsyncAPI CLI](/tools/cli).

# Generating code

1. Install the AsyncAPI CLI, with generator included, to use is at a command-line tool: `npm install -g @asyncapi/cli@1.2.0`{{exec}}

1. Trigger the creation of the Glee project: `asyncapi new glee --name=tutorial --template tutorial`{{exec}}

1. And voilà! In the editor, you can see a new folder is created with generated application. Go to your `Tab1` terminal and enter the `tutorial` folder from there: `cd tutorial`{{exec}}

# Start your generated service

> Run this in terminal in Tab1

Install and start the service:

1. Install dependencies of newly generated application: `npm install`{{exec}}
1. Clear the terminal from all the previous noise `clear`{{exec}}
1. Update AsyncAPI document to point to MQTT broker on localhost to make sure it works in this interactive tutorial: `sed -i.bak 's/host: test\.mosquitto\.org/host: localhost/' asyncapi.yaml`{{exec}}
1. Start the application: `npm run dev`{{exec}}

# Start MQTT broker

> Run this in another terminal. With **+** icon open Tab2

In this tutorial you use [Eclipse Mosquitto](https://mosquitto.org/) broker and runs it on localhost:

`docker run -it -p 1883:1883 eclipse-mosquitto:1.5`{{exec}}

# Connect to broker with MQTT client - message producer

> Run this in another terminal. With **+** icon open Tab3

> This runs in yet another terminal. To see the message goes to your service logs check out the main terminal.

Use MQTT client to send a message to the broker you started in the previous step:

1. Install the MQTT.js library: `npm install mqtt -g`{{exec}}
1. Send message to your application: `mqtt pub -t 'light/measured' -h 'localhost' -m '{"id": 1, "lumens": 3, "sentAt": "2017-06-07T12:34:32.000Z"}'`{{exec}}

Check the first terminal to see that your generated service received a message.