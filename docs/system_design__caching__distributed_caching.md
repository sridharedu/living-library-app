> **Core Definition:**  
> A distributed cache shares cached data across multiple application instances and usually requires network access, partitioning, replication, and consistency choices.

---

<section style="color:#4B5563; font-size:16px; line-height:1.7;">
  <p style="color:#5B3A42; font-family:Georgia, 'Times New Roman', serif; font-weight:700; letter-spacing:0.01em;">
    A distributed cache shares cached data across multiple application instances and usually requires network access, partitioning, replication, and consistency choices.
  </p>

  <p>
    In Java system design, <strong style="color:#8B3A3A;">distributed caching</strong> stores frequently accessed data in a shared cache cluster so that multiple application instances can reuse the same cached values instead of repeatedly querying the primary database.
  </p>

  <p>
    Unlike an in-memory cache inside a single application, a distributed cache is accessed over the network. Every application instance reads from and writes to the same cache, providing a common view of cached data.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:hidden; font-size:0.72em; line-height:1.55; white-space:pre-wrap; overflow-wrap:anywhere; word-break:break-word;"><code>/**
 * Read from the shared cache first.
 * Query the database only on a miss.
 */
Order order =
    cache.get(orderId);

if (order == null) {

    // Load the missing data.
    order =
        orderRepository.findById(
            orderId
        ).orElseThrow();

    // Share it with all instances.
    cache.put(orderId, order);
}</code></pre>

  <p>
    Because the cache is shared, data is available regardless of which application instance handles the request. This helps reduce database load and improves response time across a distributed system.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:hidden; font-size:0.72em; line-height:1.55; white-space:pre-wrap; overflow-wrap:anywhere; word-break:break-word;"><code>/**
 * Multiple Java instances use
 * the same cache cluster.
 */
App 1 ─┐
        ├── Shared Cache
App 2 ─┤
        └── Database</code></pre>

  <p>
    A distributed cache may partition data across multiple cache nodes and replicate important entries for availability. Since cached data can become outdated, applications must decide when to refresh, update, or invalidate cached values.
    <em style="color:#6B7280;">These consistency decisions directly influence cache correctness.</em>
  </p>

  <p style="color:#243B53;">
    <strong>Distributed caching provides a shared, network-accessible cache that allows multiple Java application instances to reuse cached data while balancing performance, availability, and data consistency.</strong>
  </p>
</section>