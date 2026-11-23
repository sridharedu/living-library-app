> **Core Definition:**  
> HandlerMapping selects the controller method or handler that should process an incoming Spring MVC request.

---

<section style="color:#4B5563; font-size:16px; line-height:1.7;">
  <p style="color:#5B3A42; font-family:Georgia, 'Times New Roman', serif; font-weight:700; letter-spacing:0.01em;">
    HandlerMapping selects the controller method or handler that should process an incoming Spring MVC request.
  </p>

  <p>
    In Spring MVC, <strong style="color:#8B3A3A;">HandlerMapping</strong> is the component that examines an incoming HTTP request and identifies the matching handler.
  </p>

  <p>
    For annotation-based controllers, Spring usually uses
    <code style="color:#2F6B67; font-size:0.92em;">RequestMappingHandlerMapping</code>.
    It matches request details such as the URL path, HTTP method, parameters, headers, and media types against mappings declared with annotations like
    <code style="color:#2F6B67; font-size:0.92em;">@GetMapping</code>
    or
    <code style="color:#2F6B67; font-size:0.92em;">@PostMapping</code>.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:hidden; font-size:0.72em; line-height:1.55; white-space:pre-wrap; overflow-wrap:anywhere; word-break:break-word;"><code>/**
 * This mapping matches GET requests
 * sent to /orders/{id}.
 */
@GetMapping("/orders/{id}")
public Order getOrder(
    @PathVariable Long id
) {
    return orderService.find(id);
}</code></pre>

  <p>
    When a request such as
    <code style="color:#2F6B67; font-size:0.92em;">GET /orders/101</code>
    arrives, the HandlerMapping locates this controller method and returns its mapping information to the
    <code style="color:#2F6B67; font-size:0.92em;">DispatcherServlet</code>.
  </p>

  <p>
    <em style="color:#6B7280;">HandlerMapping does not execute the controller method itself.</em>
    Its responsibility is only to determine which handler matches the request.
  </p>

  <p>
    If no mapping matches, Spring cannot route the request to a controller, which normally results in a not-found response.
  </p>

  <p style="color:#243B53;">
    <strong>HandlerMapping is the routing lookup mechanism that connects an incoming Spring MVC request to the correct controller method.</strong>
  </p>
</section>