/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */



// sortProducts.js
function sortProducts(containerClass, order) {
    const productContainer = document.querySelector(containerClass);
    const products = Array.from(productContainer.querySelectorAll('.each-product'));
    products.sort((a, b) => {
        const priceA = parseFloat(a.querySelector('.price').textContent.replace(/[^0-9.-]+/g,""));
        const priceB = parseFloat(b.querySelector('.price').textContent.replace(/[^0-9.-]+/g,""));
        return order === 'asc' ? priceA - priceB : priceB - priceA;
    });
    products.forEach(product => productContainer.appendChild(product));
}



