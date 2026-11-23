<section style="color:#4B5563; font-size:16px; line-height:1.7;">
  <p style="color:#5B3A42; font-family:Georgia, 'Times New Roman', serif; font-weight:700; letter-spacing:0.01em;">
    Horizontal partitioning splits rows across partitions based on a key or range.
  </p>

  <p>
    In Java system design, <strong style="color:#8B3A3A;">horizontal partitioning</strong> distributes table rows across multiple partitions while keeping the same table structure in each partition. Every partition contains a subset of the data rather than all rows.
  </p>

  <p>
    The partition is selected using a partitioning rule such as an ID, customer identifier, geographic region, or value range. Each row belongs to exactly one partition based on that rule.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:hidden; font-size:0.72em; line-height:1.55; white-space:pre-wrap; overflow-wrap:anywhere; word-break:break-word;"><code>/**
 * Rows are divided by customer ID.
 */
Customers

ID 1-1000
 └─ Partition A

ID 1001-2000
 └─ Partition B

ID 2001-3000
 └─ Partition C</code></pre>

  <p>
    When a Java application requests a record, the partitioning key determines which partition should be accessed. The application or database routes the request directly to that partition instead of searching all partitions.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:hidden; font-size:0.72em; line-height:1.55; white-space:pre-wrap; overflow-wrap:anywhere; word-break:break-word;"><code>/**
 * The partition key identifies
 * the target partition.
 */
Long customerId = 1250;

// Routed to Partition B.
Customer customer =
    customerRepository
        .findById(customerId)
        .orElseThrow();</code></pre>

  <p>
    As more data is added, additional partitions can hold new rows while existing partitions continue storing their own subsets. This keeps the data organized according to the chosen partitioning rule.
    <em style="color:#6B7280;">The table schema remains the same; only the rows are distributed.</em>
  </p>

  <p style="color:#243B53;">
    <strong>Horizontal partitioning organizes a table by spreading its rows across multiple partitions, allowing Java applications to locate data using the partition key.</strong>
  </p>
</section>