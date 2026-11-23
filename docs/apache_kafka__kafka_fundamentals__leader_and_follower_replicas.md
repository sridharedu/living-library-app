> **Core Definition:**  
> The leader replica handles reads and writes, while follower replicas copy its log and can take over after failure.

---

<section style="color:#4B5563; font-size:16px; line-height:1.7;">
  <p style="color:#5B3A42; font-family:Georgia, 'Times New Roman', serif; font-weight:700; letter-spacing:0.01em;">
    The leader replica handles reads and writes, while follower replicas copy its log and can take over after failure.
  </p>

  <p>
    Every replicated Kafka partition has one
    <strong style="color:#8B3A3A;">leader replica</strong>
    and one or more
    <strong style="color:#8B3A3A;">follower replicas</strong>
    stored on different brokers.
  </p>

  <p>
    Java producers and consumers normally communicate with the broker hosting the leader. The leader accepts new records, appends them to the partition log, assigns offsets, and serves read requests for that partition.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:hidden; font-size:0.72em; line-height:1.55; white-space:pre-wrap; overflow-wrap:anywhere; word-break:break-word;"><code>/**
 * The leader serves traffic.
 * Followers copy its log.
 */
Partition: orders-0

Leader   → Broker 1
Follower → Broker 2
Follower → Broker 3</code></pre>

  <p>
    Follower replicas do not independently accept normal producer writes. They continuously fetch records from the leader and reproduce the same ordered log on their own brokers.
  </p>

  <p>
    A follower that remains sufficiently caught up with the leader is considered an
    <code style="color:#2F6B67; font-size:0.92em;">in-sync replica</code>.
    Such a follower can be selected as the new leader when the current leader becomes unavailable.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:hidden; font-size:0.72em; line-height:1.55; white-space:pre-wrap; overflow-wrap:anywhere; word-break:break-word;"><code>// The current leader fails.
Broker 1 → unavailable

/**
 * An eligible follower becomes
 * the new partition leader.
 */
Broker 2 → new leader</code></pre>

  <p>
    After leadership changes, Java clients refresh their Kafka metadata and direct later requests to the new leader.
    <em style="color:#6B7280;">The leader is the active access point, while followers provide synchronized recovery copies.</em>
  </p>

  <p style="color:#243B53;">
    <strong>Leader and follower replicas give each partition one authoritative replica for traffic and additional copies that protect availability when a broker fails.</strong>
  </p>
</section>