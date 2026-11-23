<section style="margin:0; padding:8px; background:#ffffff; border:1px solid #e5e7eb; border-radius:8px; overflow:hidden;">
  <pre style="margin:0; padding:8px; box-sizing:border-box; background:#ffffff; color:#333333; white-space:pre-wrap; overflow-wrap:anywhere; word-break:break-word; overflow-x:hidden; font-size:0.70em; line-height:1.2; font-family: 'Consolas', 'Monaco', 'Courier New', monospace;"><code><span style="color:#008000;">/**
 * KAFKA FUNDAMENTALS CODE WALKTHROUGH
 *
 * Topics covered: Kafka architecture, Broker, Topic, Partition, Offset, Producer,
 * Message key, Consumer group, Replication factor, Leader and follower replicas
 *
 * Runtime goal: Publish an order event, route it to a partition, replicate it 
 * across brokers, and process it through a consumer group.
 */</span>

<span style="color:#008000;">/**
 * KafkaTopicConfig.java
 * The topic contains three partitions. Each partition has three broker copies.
 */</span>
<span style="color:#808080;">@Configuration</span>
<span style="color:#0000ff;">class</span> <span style="color:#267f99;">KafkaTopicConfig</span> {

    <span style="color:#808080;">@Bean</span>
    <span style="color:#267f99;">NewTopic</span> <span style="color:#795e26;">ordersTopic</span>() {
        <span style="color:#008000;">// Name of the logical event stream.</span>
        <span style="color:#267f99;">String</span> topicName = <span style="color:#a31515;">"orders"</span>;

        <span style="color:#008000;">// Enables three-way parallelism.</span>
        <span style="color:#0000ff;">int</span> partitions = <span style="color:#098658;">3</span>;

        <span style="color:#008000;">// Keeps three copies per partition.</span>
        <span style="color:#0000ff;">short</span> replicas = <span style="color:#098658;">3</span>;

        <span style="color:#0000ff;">return new</span> <span style="color:#267f99;">NewTopic</span>(topicName, partitions, replicas);
    }
}

<span style="color:#008000;">/**
 * OrderEvent.java
 * This Java record is the value published to the Kafka topic.
 */</span>
<span style="color:#0000ff;">public record</span> <span style="color:#267f99;">OrderEvent</span>(<span style="color:#267f99;">String</span> orderId, <span style="color:#267f99;">String</span> status) {}

<span style="color:#008000;">/**
 * OrderProducer.java
 * KafkaTemplate serializes and sends the key-value record to Kafka.
 */</span>
<span style="color:#808080;">@Service</span>
<span style="color:#0000ff;">class</span> <span style="color:#267f99;">OrderProducer</span> {

    <span style="color:#0000ff;">private final</span> <span style="color:#267f99;">KafkaTemplate</span>&lt;<span style="color:#267f99;">String</span>, <span style="color:#267f99;">OrderEvent</span>&gt; kafkaTemplate;

    <span style="color:#795e26;">OrderProducer</span>(<span style="color:#267f99;">KafkaTemplate</span>&lt;<span style="color:#267f99;">String</span>, <span style="color:#267f99;">OrderEvent</span>&gt; kafkaTemplate) {
        <span style="color:#0000ff;">this</span>.kafkaTemplate = kafkaTemplate;
    }

    <span style="color:#0000ff;">void</span> <span style="color:#795e26;">publish</span>(<span style="color:#267f99;">OrderEvent</span> event) {
        <span style="color:#008000;">/**
         * Use the order ID as the key so all events for one order reach the same partition.
         */</span>
        <span style="color:#267f99;">String</span> messageKey = event.<span style="color:#795e26;">orderId</span>();

        <span style="color:#008000;">// Send the record asynchronously.</span>
        kafkaTemplate.<span style="color:#795e26;">send</span>(<span style="color:#a31515;">"orders"</span>, messageKey, event);
    }
}

<span style="color:#008000;">/**
 * PRODUCER INTERNAL FLOW
 * 1. Serialize key/value  2. Select partition  3. Batch records  4. Find leader  5. Send
 */</span>

<span style="color:#008000;">/**
 * Example partition result: Topic 'orders' -&gt; Partition 0:
 * Offset 0: ORD-101 CREATED | Offset 1: ORD-101 PAID | Offset 2: ORD-101 SHIPPED
 * A partition is an ordered append-only log.
 */</span>

<span style="color:#008000;">/**
 * BROKER AND REPLICA FLOW
 * Partition: orders-0 | Leader -&gt; Broker 1 | Follower -&gt; Broker 2 | Follower -&gt; Broker 3
 * Followers copy the leader's partition log. In-sync followers can replace a failed leader.
 */</span>

<span style="color:#008000;">/**
 * OrderConsumer.java
 * Consumers sharing the same group ID divide the available topic partitions.
 */</span>
<span style="color:#808080;">@Component</span>
<span style="color:#0000ff;">class</span> <span style="color:#267f99;">OrderConsumer</span> {

    <span style="color:#808080;">@KafkaListener</span>(topics = <span style="color:#a31515;">"orders"</span>, groupId = <span style="color:#a31515;">"order-service"</span>)
    <span style="color:#0000ff;">void</span> <span style="color:#795e26;">consume</span>(<span style="color:#267f99;">ConsumerRecord</span>&lt;<span style="color:#267f99;">String</span>, <span style="color:#267f99;">OrderEvent</span>&gt; record) {
        
        <span style="color:#008000;">// Partition containing this record &amp; Position inside that partition.</span>
        <span style="color:#0000ff;">int</span> partition = record.<span style="color:#795e26;">partition</span>();
        <span style="color:#0000ff;">long</span> offset = record.<span style="color:#795e26;">offset</span>();

        <span style="color:#008000;">// Deserialize the business event.</span>
        <span style="color:#267f99;">OrderEvent</span> event = record.<span style="color:#795e26;">value</span>();

        <span style="color:#795e26;">process</span>(event, partition, offset);
    }

    <span style="color:#0000ff;">private void</span> <span style="color:#795e26;">process</span>(<span style="color:#267f99;">OrderEvent</span> event, <span style="color:#0000ff;">int</span> partition, <span style="color:#0000ff;">long</span> offset) {
        <span style="color:#008000;">/**
         * Perform the business operation.
         * Successful progress allows the group to resume from the correct offset.
         */</span>
    }
}

<span style="color:#008000;">/**
 * CONSUMER-GROUP ASSIGNMENT
 * Topic partitions: P0, P1, P2 | Consumer A -&gt; P0, P1 | Consumer B -&gt; P2
 * One partition is handled by only one member of this group at a time.
 */</span>

<span style="color:#008000;">/**
 * COMPLETE RUNTIME FLOW
 * Java producer -&gt; Topic: orders -&gt; Key selects partition -&gt; Leader broker appends record -&gt; 
 * Followers copy log -&gt; Consumer reads record -&gt; Offset tracks processing position
 */</span></code></pre>
</section>