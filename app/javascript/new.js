window.addEventListener('input', function(){
const fee = document.getElementById("item-price")
fee.addEventListener('input', function(){
    const price = document.getElementById('item-price').value
    const tax = (document.getElementById('item-price').value)*0.1
    const profit = (document.getElementById('item-price').value)-((document.getElementById('item-price').value)*0.1)
  })

  const tax_price = document.getElementById("add-tax-price")
  tax_price.innerHTML = (document.getElementById('item-price').value)*0.1

  const profit = document.getElementById("profit")
  profit.innerHTML = (document.getElementById('item-price').value)-((document.getElementById('item-price').value)*0.1)
})