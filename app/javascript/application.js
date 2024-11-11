var select = new SlimSelect({
  select: '#selectElement'

  // Optional - If you want to keep the order of the selected values
  // settings: { keepOrder: true }
})
var values = select.getSelected() // Will return an array of strings
console.log(values)

