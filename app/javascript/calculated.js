function calculation (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const taxPrice = itemPrice.value * 0.1;
    const fee = parseInt(taxPrice, 10);
    const addTaxPrice  = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${fee}`;

    const profitCalculation = itemPrice.value - fee;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${profitCalculation}`;
  });
}

setInterval(calculation, 1000);