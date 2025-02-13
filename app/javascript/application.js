import "@hotwired/turbo-rails";
import "controllers";
import Rails from "@rails/ujs";

Rails.start();

function hideAlertAfterTimeout() {
  setTimeout(function () {
    const alert = document.getElementById("alert");
    if (alert) {
      alert.style.display = "none";
    }
    const notice = document.getElementById("notice");
    if (notice) {
      notice.style.display = "none";
    }
  }, 5000);
}

document.addEventListener("turbo:load", hideAlertAfterTimeout);
document.addEventListener("turbo:render", hideAlertAfterTimeout);
