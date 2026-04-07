document.addEventListener("DOMContentLoaded", function () {
  const select = document.getElementById("version-switcher");
  if (!select) {
    console.error("Version switcher element not found");
    return;
  }

  fetch(window.location.origin + "/_static/versions.json")
    .then((response) => response.json())
    .then((versions) => {
      const currentPath = window.location.pathname;

      let currentVersion = null;
      let longestMatchLength = -1;
      let rootKey = null;

      Object.entries(versions).forEach(([ver, path], i) => {
        const normalizedPath = path.endsWith("/") ? path : path + "/";
        if (normalizedPath === "/") {
          rootKey = ver; // Store the root version key
        }

        if (
          currentPath.startsWith(normalizedPath) &&
          normalizedPath.length > longestMatchLength
        ) {
          currentVersion = ver;
          longestMatchLength = normalizedPath.length;
        }
      });

      if (!rootKey) {
        throw new Error("No root version found in versions.json");
      }

      if (!currentVersion) {
        currentVersion = rootKey;
      }

      // Update the select element with current version
      Array.from(select.options).forEach((option) => {
        if (option.value === versions[option.textContent]) {
          // Check if this option matches the current version
          Object.entries(versions).forEach(([ver, path]) => {
            if (ver === option.textContent && ver === currentVersion) {
              option.selected = true;
            }
          });
        }
      });

      select.addEventListener("change", () => {
        const selectedPath = select.value; // ex: "/v1.1/"
        const currentPrefix = versions[currentVersion] || "/";
        const normalizedCurrentPrefix = currentPrefix.endsWith("/")
          ? currentPrefix
          : currentPrefix + "/";
        const relativePath = window.location.pathname.replace(
          normalizedCurrentPrefix,
          ""
        );
        const targetUrl = selectedPath.replace(/\/+$/, "") + "/" + relativePath;

        fetch(targetUrl, { method: "HEAD" })
          .then((res) => {
            if (res.ok) {
              window.location.href = targetUrl;
            } else {
              console.warn(
                `Page not found in selected version: ${targetUrl}, redirecting to version root.`
              );
              window.location.href = selectedPath;
            }
          })
          .catch((err) => {
            console.error("Error checking version page:", err);
            window.location.href = selectedPath;
          });
      });
    })
    .catch((error) => {
      console.error("Failed to load versions.json:", error);
    });
});
