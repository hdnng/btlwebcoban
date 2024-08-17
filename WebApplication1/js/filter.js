function applyPriceFilter() {
    var minPrice = parseFloat(document.getElementById('minPrice').value) || 0;
    var maxPrice = parseFloat(document.getElementById('maxPrice').value) || Infinity;

    document.querySelectorAll('.product-item').forEach(item => {
        var priceText = item.querySelector('p').textContent;
        var price = parseFloat(priceText.replace('$', ''));

        if (price >= minPrice && price <= maxPrice) {
            item.style.display = 'block';
        } else {
            item.style.display = 'none';
        }
    });
}