> **Core Definition:**  
> ISR means in-sync replicas: replicas sufficiently caught up with the partition leader to remain eligible for leadership.

---

<section style="color:#4B5563; font-size:16px; line-height:1.7;">
  <p style="color:#5B3A42; font-family:Georgia, 'Times New Roman', serif; font-weight:700; letter-spacing:0.01em;">
    ISR means in-sync replicas: replicas sufficiently caught up with the partition leader to remain eligible for leadership.
  </p>

  <p>
    In Kafka, <strong style="color:#8B3A3A;">ISR</strong> stands for
    <code style="color:#2F6B67; font-size:0.92em;">In-Sync Replicas</code>.
    It is the set of partition replicas that are closely synchronized with the current leader.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.72em; line-height:1.55; white-space:pre-wrap; overflow-wrap:anywhere; word-break:break-word;"><code>/**
 * Broker 1 is the current leader.
 * Brokers 2 and 3 are caught up.
 */
Partition: orders-0

Leader  → Broker 1
ISR     → Broker 1, Broker 2, Broker 3</code></pre>

  <p>
    The leader is always part of the ISR. Followers remain in the ISR only while they continue fetching records and do not fall too far behind the leader.
  </p>

  <p>
    If a follower becomes slow, disconnected, or unable to replicate recent records within Kafka’s allowed lag period, it is removed from the ISR.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.72em; line-height:1.55; white-space:pre-wrap; overflow-wrap:anywhere; word-break:break-word;"><code>/**
 * Broker 3 has fallen behind.
 * It is no longer leadership-ready.
 */
Leader  → Broker 1
ISR     → Broker 1, Broker 2
Out     → Broker 3</code></pre>

  <p>
    When the leader fails, Kafka normally chooses a new leader from the ISR because those replicas contain sufficiently current data.
    <em style="color:#6B7280;">A replica outside the ISR is not considered safely synchronized.</em>
  </p>

  <p>
    From a Java producer’s perspective, ISR also affects acknowledgement behavior. With
    <code style="color:#2F6B67; font-size:0.92em;">acks=all</code>,
    the producer waits for the leader and the required in-sync replicas to confirm the write.
  </p>

  <p style="color:#243B53;">
    <strong>ISR represents the healthy, synchronized replica set Kafka can trust for durable writes and safe leader replacement.</strong>
  </p>
</section>