document.addEventListener("DOMContentLoaded", function () {
  fetch("../../_static/versions.json")
    .then((response) => response.json())
    .then((versions) => {
      const currentPath = window.location.pathname;

      let currentVersion = null;
      let longestMatchLength = -1;
      let rootKey = null;

      for (const [ver, path] of Object.entries(versions)) {
        const normalizedPath = path.endsWith("/") ? path : path + "/";
        if (
          currentPath.startsWith(normalizedPath) &&
          normalizedPath.length > longestMatchLength
        ) {
          currentVersion = ver;
          longestMatchLength = normalizedPath.length;
        }
      }

      if (!rootKey) {
        throw new Error("No root version found in versions.json");
      }

      if (!currentVersion) {
        currentVersion = rootKey;
      }

      const select = document.createElement("select");
      select.className = "version-switcher";
      select.id = "version-switcher";
      select.name = "version";

      for (const [ver, path] of Object.entries(versions)) {
        const option = document.createElement("option");
        option.value = path;
        option.textContent = ver;
        if (ver === currentVersion) {
          option.selected = true;
        }
        select.appendChild(option);
      }

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

      const searchbox = document.querySelector("#searchbox");
      const scrollTarget = document.querySelector(".sidebar-scroll");
      if (searchbox && scrollTarget) {
        searchbox.insertAdjacentElement("afterend", select);
      }
    })
    .catch((error) => {
      console.error("Failed to load versions.json:", error);
    });
});
