/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function updateData(el) {
  var item = $(el).parents(".item");
  var price = getPrice(item);
  var cost = price * $(el).val();
  // console.log(cost);
  updateCost(item, cost);
  var subTotal = updateSubTotal();
  var discount = getDiscount();
  updateTotal(subTotal, discount);
}

function getPrice(item) {
  var priceStr = $(item).find(".price").text();
  var index = priceStr.lastIndexOf(" Tk");
  var price = priceStr.substring(0, index);
  // console.log(price);
  return price;
}

function updateCost(item, cost) {
  $(item).find(".cost").text(cost + " Tk");
}

function updateSubTotal() {
  var cost = 0, index = 0, subTotal = 0;
  var costs = document.getElementsByClassName("cost");
  for (var i = 0; i < costs.length; i++) {
    cost = costs[i].textContent;
    index = cost.lastIndexOf(" Tk");
    cost = cost.substring(0, index);
    subTotal += parseInt(cost);
  }
  // console.log(subTotal);
  $("#subTotal").text(subTotal + " Tk");
  return subTotal;
}

function getDiscount() {
  var discountStr = $("#discount").text();
  var index = discountStr.lastIndexOf(" Tk");
  var discount = discountStr.substring(0, index);
  // console.log(discount);
  return discount;
}

function updateTotal(subTotal, discount) {
  $("#total").text(subTotal-discount + " Tk");
}

function resetItem(el) {
  var item = $(el).parents(".item");
  var qty = $(item).find(".qty");
  $(qty).val("1");
  updateData(qty);
  //prevent further execution of calling element. like entering given link calling element
  return false;
}

function deleteItem(el) {
  $(el).parents(".item").remove();
  //prevent further execution of calling element. like entering given link calling element
  return false;
}