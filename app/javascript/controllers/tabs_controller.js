import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "content" ]
  showAudio(event) {
    // Crea una solicitud AJAX para obtener el contenido de audio desde el servidor
    event.preventDefault();
    var xhr = new XMLHttpRequest();
    xhr.open('GET', `/audio-content?id=${this.element.dataset.id}`);
    xhr.onload = function() {
      if (xhr.status === 200) {
        // Muestra el contenido de audio en el contenedor de contenido de la pestaña
        this.contentTarget.innerHTML = xhr.responseText;
      }
    };
    xhr.send();
  }

  showVideo(event) {
    // Create an AJAX request to get the video content from the server
    event.preventDefault();
    var xhr = new XMLHttpRequest();
    xhr.open('GET', `/video-content?id=${this.element.dataset.id}`);
    xhr.onload = function() {
      if (xhr.status === 200) {
        // Display the video content in the tab content container
        this.contentTarget.innerHTML = xhr.responseText;
      }
    };
    xhr.send();
  }

  showImages(event) {
    // Create an AJAX request to get the image content from the server
    event.preventDefault();
    var xhr = new XMLHttpRequest();
    xhr.open('GET', `/images-content?id=${this.element.dataset.id}`);
    xhr.onload = function() {
      if (xhr.status === 200) {
        // Display the image content in the tab content container
        this.contentTarget.innerHTML = xhr.responseText;
      }
    };
    xhr.send();
  }
}
