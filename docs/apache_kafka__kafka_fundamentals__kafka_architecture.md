> **Core Definition:**  
> Apache Kafka is built as a distributed append-only log. Producers write records to named topics, Kafka stores those records across brokers, and consumers read them independently at their own pace.

---

<section style="color:#4B5563; font-size:16px; line-height:1.7;">
  <p>
    Apache Kafka is built as a <strong style="color:#8B3A3A;">distributed append-only log</strong>. Producers write records to named topics, Kafka stores those records across brokers, and consumers read them independently at their own pace.
  </p>

  <p>
    A Kafka cluster contains multiple
    <code style="color:#2F6B67; font-size:0.92em;">brokers</code>.
    Each broker stores part of the cluster's data. A topic is divided into
    <code style="color:#2F6B67; font-size:0.92em;">partitions</code>, and each partition is an ordered sequence of records identified by increasing offsets.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.92em; line-height:1.55;"><code>Producer
   |
   v
Topic: orders
   ├── Partition 0  → Broker 1
   ├── Partition 1  → Broker 2
   └── Partition 2  → Broker 3
                         |
                         v
                  Consumer Group</code></pre>

  <p>
    The producer chooses a topic and sends a Java record using
    <code style="color:#2F6B67; font-size:0.92em;">KafkaProducer</code>.
    Kafka places that record into one partition. Records inside a partition remain ordered, while different partitions can be processed in parallel.
  </p>

  <p>
    Consumers use
    <code style="color:#2F6B67; font-size:0.92em;">KafkaConsumer</code>
    and normally belong to a
    <strong style="color:#8B3A3A;">consumer group</strong>.
    Within one group, a partition is assigned to only one consumer at a time. This allows the group to share work without processing the same partition concurrently.
  </p>

  <p>
    Kafka does not remove a record immediately after it is read. It keeps records according to the topic's retention policy, while each consumer group tracks its own position using offsets.
    <em style="color:#6B7280;">This is why multiple applications can read the same topic independently.</em>
  </p>

  <p>
    Partitions may also have replicas on other brokers. One replica acts as the leader for reads and writes, while follower replicas maintain copies for fault tolerance.
  </p>

  <p style="color:#243B53;">
    <strong>Kafka architecture combines brokers, topics, partitions, replicas, producers, consumer groups, and offsets to provide scalable, ordered, and independently consumable event storage.</strong>
  </p>
</section>