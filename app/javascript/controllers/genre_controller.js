import { Controller } from "@hotwired/stimulus"



// <%= link_to events_path(genre: genre), class: "text-decoration-none text-secondary lh-lg icon-link #{genre}", data: {"genre-target": "genreButton", action: "click->genre#toggleColor" } do %>
//   <i data-genre="<%= genre %>" class="<%= @genre_icon_classes[genre] %>" style="font-size: 20px;"></i>
//   <p data-genre="<%= genre %>"><%= genre %></p>
// <% end %>

// Connects to data-controller="genre"
export default class extends Controller {

  static targets = [ "genreButton" ]

  toggleColor(event) {
    this.#resetAll()
    event.currentTarget.classList.toggle("text-white")
  }

  #resetAll() {
    this.genreButtonTargets.forEach((element) => {
      element.classList.remove("text-white")
    })
  }
}
