import consumer from "./consumer"

consumer.subscriptions.create("CurrencyChannel", {
  connected() {
    
  },

  received(data) {
    var currency = document.querySelector("#carrency")

    if (currency) {
      changeCurrencyValue(data["value"], currency)
    }
  }
});

function changeCurrencyValue(value, el) {
  var classColor = value > el.innerText ? "text-success" : "text-danger"

  if (value != el.innerText) { 
    el.innerText = value
    el.classList.remove("text-success", "text-danger")
    el.classList.add(classColor)
    setTimeout(removeCurrencyColorClass, 700, el)
  }
  
}

function removeCurrencyColorClass(el) {
  el.classList.remove("text-success", "text-danger")
}