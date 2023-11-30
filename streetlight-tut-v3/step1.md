Let's start by creating an AsyncAPI file to describe your API. It will help you generate the code and the documentation later.

In the **Editor** tab, create `asyncapi.yaml` file in the root and put below content inside. You can do it while the setup script is still running in **Tab1** terminal tab:

```yaml
asyncapi: 3.0.0
info:
  title: Streetlights App
  version: '1.0.0'
  description: |
    The Smartylighting Streetlights application allows you
    to remotely manage the city lights.
  license:
    name: Apache 2.0
    url: 'https://www.apache.org/licenses/LICENSE-2.0'
servers:
  mosquitto:
    host: test.mosquitto.org
    protocol: mqtt
channels:
  lightMeasured:
    address: 'light/measured'
    messages:
      lightMeasuredMessage:
        name: LightMeasured
        payload:
          type: object
          properties:
            id:
              type: integer
              minimum: 0
              description: Id of the streetlight.
            lumens:
              type: integer
              minimum: 0
              description: Light intensity measured in lumens.
            sentAt:
              type: string
              format: date-time
              description: Date and time when the message was sent.
operations:
  onLightMeasured:
    action: 'receive'
    summary: Information about environmental lighting conditions for a particular streetlight.
    channel:
      $ref: '#/channels/lightMeasured'
```{{copy}}

Let's break it down into pieces:

```yaml
asyncapi: 3.0.0
info:
  title: Streetlights App
  version: '1.0.0'
  description: |
    The Smartylighting Streetlights application allows you
    to remotely manage the city lights.
  license:
    name: Apache 2.0
    url: 'https://www.apache.org/licenses/LICENSE-2.0'
```

- The `asyncapi` field indicates you use the AsyncAPI version 3.0.0.
- The `info` field holds information about the Streetlights application. Here, the title, version, description, and license were defined.

Moving on, let's talk about the `servers` section:

```yaml
servers:
  mosquitto:
    host: test.mosquitto.org
    protocol: mqtt
```

In this section, you point to the Eclipse Mosquitto message broker. The `url` points to a real broker instance [hosted by the Mosquitto community](https://test.mosquitto.org/), and the `protocol` is MQTT. If you do not want to use the test instance, you can spin up your own broker locally with `docker run -it -p 1883:1883 eclipse-mosquitto:1.5`. Remember to change the `url` to `mqtt://localhost`.

Now, let's move on to the `channels` section. In the `servers` section, you specified how to connect to the broker where the application sends messages to or receives messages from. In `channels`, you go into more details about the connection `address` inside the broker. (Example: A topic name that specifies what `messages` are available in the channel.)

```yaml
channels:
  lightMeasured:
    address: 'light/measured'
    messages:
      lightMeasuredMessage:
        name: LightMeasured
        payload:
          redacted for brevity
```

In this example, `light/measured` is the channel address. From the Streetlight application example perspective, it means that `light/measured` is the topic's name in the MQTT broker.

Next is the `payload` property, which is used to understand how the event should look like when transfered over the specific channel:

```yaml
payload:
type: object
properties:
  id:
    type: integer
    minimum: 0
    description: Id of the streetlight.
  lumens:
    type: integer
    minimum: 0
    description: Light intensity measured in lumens.
  sentAt:
    type: string
    format: date-time
    description: Date and time when the message was sent.
```

The `payload` property defines the event's content using AsyncAPI schemas. It means that your event payload should contain an `id` and a `lumens` property —which are integers bigger than zero—and a `sentAt` property which should be a string containing a date and time.

>  JSON Schema Draft 07 is 100% compatible with AsyncAPI schemas. You can also use other standards to describe payload schema, such as [Avro](https://github.com/asyncapi/avro-schema-parser#usage).

The last section is `operations`, where you describe what the application described in the AsyncAPI document is doing. 

```yaml
operations:
  onLightMeasured:
    action: 'receive'
    summary: Information about environmental lighting conditions for a particular streetlight.
    channel:
      $ref: '#/channels/lightMeasured'
```

You can see that the Streetlight application is a consumer that only receives events from the broker. Using the mandatory `channel` field, you specify with `$ref` what channel the events come from.

The `onLightMeasured` key property describes the function or method name that takes care of this functionality in the generated code. It is a unique ID of the operation across the whole document.

Cool! So you're done with your AsyncAPI file! Let's get into generating code.
