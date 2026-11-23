> **Core Definition:**  
> KRaft is Kafka's built-in Raft-based metadata quorum that replaces ZooKeeper.

---

<section style="color:#4B5563; font-size:16px; line-height:1.7;">
  <p style="color:#5B3A42; font-family:Georgia, 'Times New Roman', serif; font-weight:700; letter-spacing:0.01em;">
    KRaft is Kafka's built-in Raft-based metadata quorum that replaces ZooKeeper.
  </p>

  <p>
    <strong style="color:#8B3A3A;">KRaft</strong> stands for
    <code style="color:#2F6B67; font-size:0.92em;">Kafka Raft</code>.
    It is Kafka’s internal mechanism for storing, replicating, and coordinating cluster metadata without depending on ZooKeeper.
  </p>

  <p>
    The metadata includes information such as registered brokers, topics, partitions, replica assignments, and partition leaders. KRaft stores these changes in a replicated metadata log maintained by a group of controller nodes.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.72em; line-height:1.55; white-space:pre-wrap; overflow-wrap:anywhere; word-break:break-word;"><code>/**
 * Controller nodes form the
 * KRaft metadata quorum.
 */
Controller 1 → active leader
Controller 2 → follower
Controller 3 → follower

/**
 * Metadata updates are written
 * to the replicated metadata log.
 */
Topic created
Partition leader changed
Broker registered</code></pre>

  <p>
    One controller acts as the active leader and makes metadata decisions. The remaining controllers replicate the metadata log and stay ready to elect a new leader if the active controller fails.
  </p>

  <p>
    Kafka brokers receive metadata updates from the KRaft controllers and use them to serve Java producers and consumers correctly.
    <em style="color:#6B7280;">Application code normally does not interact with KRaft directly.</em>
  </p>

  <p>
    A Kafka process may run as a broker, a controller, or both, depending on its
    <code style="color:#2F6B67; font-size:0.92em;">process.roles</code>
    configuration.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:auto; font-size:0.72em; line-height:1.55; white-space:pre-wrap; overflow-wrap:anywhere; word-break:break-word;"><code>/**
 * This node serves client traffic
 * and participates in metadata control.
 */
process.roles=broker,controller</code></pre>

  <p style="color:#243B53;">
    <strong>KRaft is Kafka’s native metadata coordination system, using a replicated controller quorum to manage cluster state and controller failover.</strong>
  </p>
</section>