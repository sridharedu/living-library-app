<section style="color:#4B5563; font-size:16px; line-height:1.7;">
  <p style="color:#5B3A42; font-family:Georgia, 'Times New Roman', serif; font-weight:700; letter-spacing:0.01em;">
    The Kafka controller manages partition leadership, broker changes, and cluster metadata coordination.
  </p>

  <p>
    The <strong style="color:#8B3A3A;">Kafka controller</strong> is the cluster component responsible for coordinating important metadata decisions. It tracks brokers, partition replicas, and the current leader of every partition.
  </p>

  <p>
    When a broker joins, leaves, or fails, the controller detects the change and updates the cluster state. If the failed broker was leading a partition, the controller selects an eligible replica and assigns it as the new leader.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.72em; line-height:1.55; white-space:pre-wrap; overflow-wrap:anywhere; word-break:break-word;"><code>/**
 * Broker 1 currently leads
 * the orders-0 partition.
 */
Leader   → Broker 1
Follower → Broker 2
Follower → Broker 3

// Broker 1 becomes unavailable.
Broker 1 → failed

/**
 * The controller selects an
 * eligible synchronized replica.
 */
New leader → Broker 2</code></pre>

  <p>
    After making the decision, the controller propagates updated metadata so brokers, Java producers, and Java consumers can discover the new partition leader.
  </p>

  <p>
    The controller does not normally carry application records between producers and consumers.
    <em style="color:#6B7280;">Its role is cluster coordination rather than message processing.</em>
  </p>

  <p>
    In modern Kafka clusters using
    <code style="color:#2F6B67; font-size:0.92em;">KRaft</code>,
    controller nodes participate in a metadata quorum. One controller acts as the active leader while the others maintain replicated metadata and can take over if required.
  </p>

  <p style="color:#243B53;">
    <strong>The Kafka controller keeps the cluster operational by coordinating metadata, reacting to broker changes, and ensuring every partition has the correct leader.</strong>
  </p>
</section>