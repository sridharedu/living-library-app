> **Core Definition:**  
> HandlerAdapter invokes the selected handler using the correct calling strategy and converts its result into the MVC processing flow.

---

<section style="color:#4B5563; font-size:16px; line-height:1.7;">
  <p style="color:#5B3A42; font-family:Georgia, 'Times New Roman', serif; font-weight:700; letter-spacing:0.01em;">
    HandlerAdapter invokes the selected handler using the correct calling strategy and converts its result into the MVC processing flow.
  </p>

  <p>
    In Spring MVC, <strong style="color:#8B3A3A;">HandlerAdapter</strong> is the component that knows how to execute the handler selected for an incoming request.
  </p>

  <p>
    For annotation-based controllers, Spring commonly uses
    <code style="color:#2F6B67; font-size:0.92em;">RequestMappingHandlerAdapter</code>.
    It prepares the method arguments, invokes the controller method, and interprets the returned value.
  </p>

  <pre style="background:rgba(71,85,105,0.08); color:#7C4A2D; padding:14px 16px; border-radius:8px; overflow:hidden; font-size:0.72em; line-height:1.55; white-space:pre-wrap; overflow-wrap:anywhere; word-break:break-word;"><code>/**
 * The adapter resolves the path
 * variable before invocation.
 */
@GetMapping("/orders/{id}")
public Order getOrder(
    @PathVariable Long id
) {
    // Invoke application logic.
    return orderService.find(id);
}</code></pre>

  <p>
    Before calling this method, the HandlerAdapter resolves values such as
    <code style="color:#2F6B67; font-size:0.92em;">@PathVariable</code>,
    <code style="color:#2F6B67; font-size:0.92em;">@RequestParam</code>, and
    <code style="color:#2F6B67; font-size:0.92em;">@RequestBody</code>
    into the required Java arguments.
  </p>

  <p>
    After the method finishes, the adapter processes the returned object and places it into the form expected by the remaining MVC flow.
  </p>

  <p>
    <em style="color:#6B7280;">HandlerAdapter does not choose which controller method matches the request.</em>
    It executes the handler that has already been selected.
  </p>

  <p style="color:#243B53;">
    <strong>HandlerAdapter is the execution bridge that prepares controller arguments, invokes the selected method, and hands its result back to Spring MVC.</strong>
  </p>
</section>