> **A Kafka broker is a server in the Kafka cluster that stores topic partitions and handles requests from Java producers and consumers.**

---

<section style="color:#4B5563; font-size:16px; line-height:1.7;">
  <p>
    A Kafka <strong style="color:#8B3A3A;">broker</strong> is a server in the Kafka cluster that stores topic partitions and handles requests from Java producers and consumers.
  </p>

  <p>
    When a Java producer sends a record using
    <code style="color:#2F6B67; font-size:0.92em;">KafkaProducer</code>,
    the request reaches the broker that currently leads the target partition. That broker appends the record to the partition log and returns an acknowledgement according to the producer configuration.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.92em; line-height:1.55;"><code>KafkaProducer
      |
      v
Broker 1  → leader for orders-0
Broker 2  → follower for orders-0
Broker 3  → leader for orders-1</code></pre>

  <p>
    A broker can store many partitions from different topics. For each partition, one broker acts as the
    <strong style="color:#8B3A3A;">leader</strong>, while other brokers may hold follower replicas. Producers and consumers normally communicate with the leader replica.
  </p>

  <p>
    Java consumers use
    <code style="color:#2F6B67; font-size:0.92em;">KafkaConsumer</code>
    to fetch records from brokers. The broker reads data from the requested partition and returns records starting from the consumer's current offset.
  </p>

  <p>
    Brokers also exchange cluster metadata so clients can discover where partitions are located. A producer may initially connect to any configured bootstrap broker, receive metadata, and then communicate directly with the correct partition leader.
  </p>

  <p>
    <em style="color:#6B7280;">A broker is not a separate queue for one application.</em>
    It is a shared Kafka server responsible for storing partitions, serving client requests, maintaining replicas, and participating in cluster operation.
  </p>

  <p style="color:#243B53;">
    <strong>In simple terms, a Kafka broker is the storage and request-processing node that makes topic partitions available to producers and consumers.</strong>
  </p>
</section>