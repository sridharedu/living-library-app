<section style="color:#4B5563; font-size:16px; line-height:1.7;">
  <p style="color:#5B3A42; font-family:Georgia, 'Times New Roman', serif; font-weight:700; letter-spacing:0.01em;">
    A consumer group shares topic partitions among members so each partition is processed by only one member at a time.
  </p>

  <p>
    A Kafka <strong style="color:#8B3A3A;">consumer group</strong> is a set of Java consumers that work together to process records from one or more topics. Every consumer in the group uses the same
    <code style="color:#2F6B67; font-size:0.92em;">group.id</code>.
  </p>

  <p>
    Kafka distributes the topic’s partitions among the active members of the group. At any moment, one partition is assigned to only one consumer within that group, preventing two members from processing the same partition simultaneously.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.72em; line-height:1.55;"><code>/**
 * Three partitions are shared
 * across two group members.
 */
Topic: orders
Partitions: P0, P1, P2

// Consumer A handles two partitions.
Consumer A → P0, P1

// Consumer B handles one partition.
Consumer B → P2</code></pre>

  <p>
    This assignment allows consumers to share the workload. Adding consumers can increase parallel processing, but only up to the number of available partitions. If a topic has three partitions and the group has four consumers, one consumer remains idle.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.72em; line-height:1.55;"><code>/**
 * Consumers sharing this value
 * join the same consumer group.
 */
properties.put(
    ConsumerConfig.GROUP_ID_CONFIG,
    "order-service"
);</code></pre>

  <p>
    The group tracks its processing progress through committed offsets. Another consumer group can read the same topic independently because it maintains its own partition assignments and offsets.
  </p>

  <p>
    When a consumer joins, leaves, or fails, Kafka redistributes the partitions among the remaining members. This process is called a
    <em style="color:#6B7280;">rebalance</em>.
  </p>

  <p style="color:#243B53;">
    <strong>A consumer group provides coordinated parallel processing by dividing topic partitions among consumers that share the same group identity.</strong>
  </p>
</section>