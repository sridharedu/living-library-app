> **Maven dependency scopes define where a dependency is visible and how long it participates in the Maven build lifecycle.**

---

<section class="offline-rich-content">
  <p class="offline-rich-lead">
    <strong>Maven dependency scopes</strong> define where a dependency is visible
    and how long it participates in the Maven build lifecycle.
  </p>

  <p>
    They determine whether a library is available during
    <strong>compilation</strong>, <strong>testing</strong>,
    <strong>runtime</strong>, and whether it is included in the final package.
    Choosing the correct scope keeps the build clean, avoids unnecessary
    dependencies, and prevents runtime surprises.
  </p>

  <h3>Core dependency scopes</h3>

  <ul class="offline-rich-list">
    <li>
      <strong>COMPILE</strong>
      <span>
        The default scope. The dependency is available during compilation,
        testing, and runtime, and is included in the final application package.
      </span>
    </li>
    <li>
      <strong>PROVIDED</strong>
      <span>
        Available during compilation and testing, but not packaged with the
        application because the runtime environment is expected to provide it.
        A common example is the Servlet API supplied by an application server.
      </span>
    </li>
    <li>
      <strong>RUNTIME</strong>
      <span>
        Not required to compile the application, but required when the
        application runs. A JDBC driver is a common example.
      </span>
    </li>
    <li>
      <strong>TEST</strong>
      <span>
        Available only while compiling and running tests. It is not available
        to normal application code and is not included in the production package.
        JUnit and Mockito commonly use this scope.
      </span>
    </li>
  </ul>

  <h3>Import scope</h3>

  <p>
    <strong>IMPORT</strong> is used only inside the
    <code>&lt;dependencyManagement&gt;</code> section and only with a dependency
    whose type is <code>pom</code>. It imports dependency-management information
    from another POM, usually a BOM, into the current project.
  </p>

  <div class="offline-rich-note">
    <strong>Important:</strong>
    Import scope does not add the imported libraries directly. It only brings
    their managed versions and configuration into the current POM.
  </div>
</section>