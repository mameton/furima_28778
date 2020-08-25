// イベントの発火じょうけんを記述
//item-priceを取得→定数にいれる
// const test = item-price
// item-priceに値が入力されたらイベントが発火する
// item-priceの値を取得→メソッド
window.addEventListener('load', function(){
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