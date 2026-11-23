> **Core Definition:**  
> A Kafka topic is a named logical stream where related records are published and stored. In a Java application, producers send records to a topic name, and consumers subscribe to that same topic to read them.

---

<section style="color:#4B5563; font-size:16px; line-height:1.7;">
  <p>
    A Kafka <strong style="color:#8B3A3A;">topic</strong> is a named logical stream where related records are published and stored. In a Java application, producers send records to a topic name, and consumers subscribe to that same topic to read them.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.92em; line-height:1.55;"><code>ProducerRecord&lt;String, OrderEvent&gt; record =
        new ProducerRecord&lt;&gt;(
                "orders",
                orderId,
                orderEvent
        );</code></pre>

  <p>
    Here,
    <code style="color:#2F6B67; font-size:0.92em;">orders</code>
    is the topic name. It identifies the stream to which the record belongs.
  </p>

  <p>
    A topic is divided into one or more
    <strong style="color:#8B3A3A;">partitions</strong>.
    Each partition stores an ordered sequence of records, while multiple partitions allow the topic to handle more data and parallel processing.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.92em; line-height:1.55;"><code>Topic: orders
   ├── Partition 0
   ├── Partition 1
   └── Partition 2</code></pre>

  <p>
    Topics normally represent a clear business stream such as
    <code style="color:#2F6B67; font-size:0.92em;">orders</code>,
    <code style="color:#2F6B67; font-size:0.92em;">payments</code>, or
    <code style="color:#2F6B67; font-size:0.92em;">user-events</code>.
    Producers and consumers depend on the topic name as their shared communication boundary.
  </p>

  <p>
    Kafka retains records in the topic according to its configured retention rules.
    <em style="color:#6B7280;">Reading a record does not immediately remove it from the topic.</em>
    Different consumer groups can therefore read the same topic independently.
  </p>

  <p style="color:#243B53;">
    <strong>A topic is the named event stream that organizes related Kafka records and distributes them across partitions.</strong>
  </p>
</section>