window.addEventListener('load', function(){

  const inputPrice = document.getElementById("item-price");
  const addTax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  inputPrice.addEventListener('input', function(){
    const price = document.getElementById("item-price").value;
    addTax.innerHTML = Math.floor(price * 0.1);
    profit.innerHTML = Math.floor(price  * 0.9);
  })
});