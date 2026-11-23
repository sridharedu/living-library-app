> **Core Definition:**  
> A Kafka producer is the Java client responsible for creating and sending records to Kafka topics. It is typically implemented using KafkaProducer&lt;K, V&gt;.

---

<section style="color:#4B5563; font-size:16px; line-height:1.7;">
  <p>
    A Kafka <strong style="color:#8B3A3A;">producer</strong> is the Java client responsible for creating and sending records to Kafka topics. It is typically implemented using
    <code style="color:#2F6B67; font-size:0.92em;">KafkaProducer&lt;K, V&gt;</code>.
  </p>

  <p>
    Before sending a record, the producer serializes its key and value into bytes. It then determines the target partition, groups records into batches, and sends those batches to the broker that leads the selected partition.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.72em; line-height:1.55;"><code>ProducerRecord&lt;String, OrderEvent&gt; record =
        new ProducerRecord&lt;&gt;(
                "orders",
                orderId,
                orderEvent
        );

producer.send(record);</code></pre>

  <p>
    In this example,
    <code style="color:#2F6B67; font-size:0.92em;">orders</code>
    is the topic,
    <code style="color:#2F6B67; font-size:0.92em;">orderId</code>
    is the message key, and
    <code style="color:#2F6B67; font-size:0.92em;">orderEvent</code>
    is the value being published.
  </p>

  <p>
    The call to
    <code style="color:#2F6B67; font-size:0.92em;">send()</code>
    is asynchronous. It returns immediately while the producer manages buffering, batching, network communication, acknowledgements, and retries in the background.
  </p>

  <p>
    The producer also maintains metadata about topics, partitions, and partition leaders so that each record is sent to the correct broker.
    <em style="color:#6B7280;">A single producer instance is designed to be reused and is thread-safe.</em>
  </p>

  <p style="color:#243B53;">
    <strong>A Kafka producer is the Java-side component that prepares records and delivers them efficiently to the correct Kafka partition.</strong>
  </p>
</section>