> **In Apache Kafka, a message key is the value a producer sends along with a record to influence which partition receives it. In Java, the key is the first generic type in ProducerRecord&lt;K, V&gt;.**

---

<section style="color:#4B5563; font-size:16px; line-height:1.7;">
 
  <p>
    In Apache Kafka, a <strong style="color:#8B3A3A;">message key</strong> is the value a producer sends along with a record to influence which partition receives it.
    In Java, the key is the first generic type in
    <code style="color:#2F6B67; font-size:0.92em;">ProducerRecord&lt;K, V&gt;</code>.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.92em; line-height:1.55;"><code>ProducerRecord&lt;String, OrderEvent&gt; record =
        new ProducerRecord&lt;&gt;(
                "orders",
                order.getCustomerId(),
                orderEvent
        );

producer.send(record);</code></pre>

  <p>
    Here,
    <code style="color:#2F6B67; font-size:0.92em;">customerId</code>
    is the message key. Kafka serializes the key and normally applies a partitioning strategy to it. Records with the same serialized key are usually routed to the same partition while the partition count remains unchanged.
  </p>

  <p>
    This matters because Kafka preserves ordering
    <em style="color:#6B7280;">within a partition, not across the entire topic</em>.
    Therefore, using
    <code style="color:#2F6B67; font-size:0.92em;">customerId</code>,
    <code style="color:#2F6B67; font-size:0.92em;">orderId</code>, or another stable business identifier as the key keeps related events together and allows them to be processed in sequence.
  </p>

  <p>
    A key should match the entity whose event order must be preserved. For example, order events can use
    <code style="color:#2F6B67; font-size:0.92em;">orderId</code>
    so that events such as
    <code style="color:#2F6B67; font-size:0.92em;">CREATED</code>,
    <code style="color:#2F6B67; font-size:0.92em;">PAID</code>, and
    <code style="color:#2F6B67; font-size:0.92em;">SHIPPED</code>
    reach the same partition.
  </p>

  <p>
    When the key is
    <code style="color:#2F6B67; font-size:0.92em;">null</code>,
    the producer does not have a business key to guide partition selection, so records may be distributed across available partitions according to the producer's partitioning behavior.
  </p>

  <p style="color:#243B53;">
    <strong>A message key is therefore a partitioning and ordering decision: choose a stable key based on the business entity whose records must remain together.</strong>
  </p>
</section>