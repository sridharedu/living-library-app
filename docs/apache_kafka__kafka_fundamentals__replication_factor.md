> **Core Definition:**  
> Replication factor defines how many broker copies each partition has, improving durability and availability.

---

<section style="color:#4B5563; font-size:16px; line-height:1.7;">
  <p style="color:#5B3A42; font-family:Georgia, 'Times New Roman', serif; font-weight:700; letter-spacing:0.01em;">
    Replication factor defines how many broker copies each partition has, improving durability and availability.
  </p>

  <p>
    In Kafka, the <strong style="color:#8B3A3A;">replication factor</strong> is the number of replicas maintained for every partition of a topic.
    A replication factor of
    <code style="color:#2F6B67; font-size:0.92em;">3</code>
    means each partition exists on three different brokers.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.72em; line-height:1.55;"><code>/**
 * One leader handles requests.
 * Two followers keep copies.
 */
Partition 0
Leader   → Broker 1
Follower → Broker 2
Follower → Broker 3</code></pre>

  <p>
    One replica is selected as the
    <strong style="color:#8B3A3A;">leader</strong>.
    Producers and consumers normally communicate with that leader, while follower replicas continuously copy its data.
  </p>

  <p>
    If the leader broker fails, Kafka can promote an eligible follower to become the new leader.
    <em style="color:#6B7280;">The partition can remain available as long as a valid replica is still present.</em>
  </p>

  <p>
    In Java, the replication factor is usually specified while creating a topic through
    <code style="color:#2F6B67; font-size:0.92em;">AdminClient</code>.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.72em; line-height:1.55;"><code>/**
 * Create three partitions.
 * Keep three copies of each.
 */
NewTopic topic = new NewTopic(
    "orders",
    3,
    (short) 3
);</code></pre>

  <p>
    The replication factor cannot be greater than the number of available brokers because Kafka places replicas of the same partition on different brokers.
  </p>

  <p style="color:#243B53;">
    <strong>A higher replication factor gives each partition more redundant copies, reducing the risk of data loss and service interruption when a broker fails.</strong>
  </p>
</section>