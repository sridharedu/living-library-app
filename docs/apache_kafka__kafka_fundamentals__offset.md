> **A Kafka offset is the numeric position of a record inside one partition. Each record receives an increasing offset when it is appended to that partition.**

---

<section style="color:#4B5563; font-size:16px; line-height:1.7;">
  <p>
    A Kafka <strong style="color:#8B3A3A;">offset</strong> is the numeric position of a record inside one partition. Each record receives an increasing offset when it is appended to that partition.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.92em; line-height:1.55;"><code>Partition 0

Offset:   0        1        2        3
Record: [CREATED][PAID][PACKED][SHIPPED]</code></pre>

  <p>
    Offsets are unique only within a partition. For example,
    <code style="color:#2F6B67; font-size:0.92em;">Partition 0</code>
    and
    <code style="color:#2F6B67; font-size:0.92em;">Partition 1</code>
    can both contain a record at offset
    <code style="color:#2F6B67; font-size:0.92em;">5</code>.
  </p>

  <p>
    A Java consumer uses offsets to track how far it has processed. After reading records, it can commit its progress so that it knows where to continue after a restart or partition reassignment.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.92em; line-height:1.55;"><code>ConsumerRecords&lt;String, OrderEvent&gt; records =
        consumer.poll(Duration.ofMillis(500));

for (ConsumerRecord&lt;String, OrderEvent&gt; record : records) {
    System.out.println(record.offset());
}</code></pre>

  <p>
    The offset returned by
    <code style="color:#2F6B67; font-size:0.92em;">record.offset()</code>
    identifies that record's exact location in its partition.
  </p>

  <p>
    <em style="color:#6B7280;">An offset does not belong to the entire topic and does not identify a record globally.</em>
    It must always be understood together with the topic and partition.
  </p>

  <p style="color:#243B53;">
    <strong>An offset is the partition-local position that allows Kafka consumers to track progress and resume processing from the correct record.</strong>
  </p>
</section>