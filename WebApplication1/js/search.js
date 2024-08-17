function hideSearchContainer() {
    var searchContainer = document.getElementById('searchContainer');
    var overlay = document.getElementById('overlay');

    searchContainer.style.display = 'none';
    overlay.style.display = 'none';
}

function toggleSearch() {
    console.log('Toggle search triggered');
    var searchContainer = document.getElementById('searchContainer');
    if (searchContainer.style.display === 'block') {
        searchContainer.style.display = 'none';
    } else {
        searchContainer.style.display = 'block';
    }
}

function performSearch() {
    var searchInput = document.getElementById('searchInput').value;
    if (searchInput.trim() === '') {
        // Alert the user if the search input is empty
        alert('Please enter a search query.');
        return;
    }

    var searchUrl = 'Search.aspx?do=search&search=' + encodeURIComponent(searchInput);

    // Redirect to the search URL or perform other actions as needed
    window.location.href = searchUrl;
}

// Thêm sự kiện lắng nghe cho nút Enter
document.addEventListener('DOMContentLoaded', function () {
    var searchInput = document.getElementById('searchInput');
    searchInput.addEventListener('keypress', function (event) {
        if (event.key === 'Enter') {
            event.preventDefault(); // Ngăn chặn hành động mặc định của Enter
            performSearch();
        }
    });
});