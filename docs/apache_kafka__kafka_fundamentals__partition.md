> **A Kafka partition is an ordered, append-only sequence of records inside a topic. Every new record is added to the end of the partition and receives a unique, increasing offset.**

---

<section style="color:#4B5563; font-size:16px; line-height:1.7;">
  <p>
    A Kafka <strong style="color:#8B3A3A;">partition</strong> is an ordered, append-only sequence of records inside a topic. Every new record is added to the end of the partition and receives a unique, increasing
    <code style="color:#2F6B67; font-size:0.92em;">offset</code>.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.92em; line-height:1.55;"><code>Partition 0

Offset:   0        1        2        3
Record: [CREATED][PAID][PACKED][SHIPPED]</code></pre>

  <p> <strong>
    Kafka guarantees record order
    <em style="color:#6B7280;">within a single partition</em>.
    It does not provide one global order across all partitions of a topic. Therefore, records that must remain in sequence should be routed to the same partition, usually by using a stable message key.</strong>
  </p>

  <p>
    In Java, the producer may specify a key while creating a
    <code style="color:#2F6B67; font-size:0.92em;">ProducerRecord</code>.
    Kafka uses that key during partition selection.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.92em; line-height:1.55;"><code>new ProducerRecord&lt;&gt;(
        "orders",
        orderId,
        orderEvent
);</code></pre>

  <p>
    Partitions are also Kafka's main unit of
    <strong style="color:#8B3A3A;">parallelism</strong>.
    Different partitions can be read by different consumers in the same consumer group, allowing records to be processed concurrently.
  </p>

  <p>
    A partition is stored on a broker and may have replicas on other brokers. One replica acts as the leader, while the others maintain copies for fault tolerance.
  </p>

  <p style="color:#243B53;">
    <strong>A partition provides ordered storage for records while enabling Kafka to distribute data, processing, and replication across the cluster.</strong>
  </p>
</section>