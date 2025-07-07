document.addEventListener("DOMContentLoaded", function () {
  fetch(window.location.origin + "/_static/versions.json")
    .then((response) => response.json())
    .then((versions) => {
      const currentPath = window.location.pathname;

      let currentVersion = null;
      for (const [ver, path] of Object.entries(versions)) {
        if (currentPath.startsWith(path)) {
          currentVersion = ver;
          break;
        }
      }

      const select = document.createElement("select");
      select.className = "version-switcher";
      select.id = "version-switcher";

      for (const [ver, path] of Object.entries(versions)) {
        const option = document.createElement("option");
        option.value = path;
        option.textContent = ver;
        if (ver === currentVersion) option.selected = true;
        select.appendChild(option);
      }

      select.addEventListener("change", () => {
        window.location.href = select.value;
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
