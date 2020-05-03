import consumer from "./consumer"

consumer.subscriptions.create("CurrencyChannel", {
  connected() {
    console.log("Websocket is connected")
  },

  received(data) {
    console.log(data["value"])
    document.querySelector("#carrency").innerText = data["value"]
  }
});
