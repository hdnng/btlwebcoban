document.addEventListener('DOMContentLoaded', function () {
    // JavaScript để xử lý sự kiện khi nhấn vào biểu tượng tìm kiếm
    document.getElementById('search-icon').addEventListener('click', function () {
        var searchInput = document.getElementById('find');
        if (searchInput.style.display === 'none' || searchInput.style.display === '') {
            searchInput.style.display = 'block'; // Hiện ô tìm kiếm
        } else {
            searchInput.style.display = 'none'; // Ẩn ô tìm kiếm
        }
    });

    // Đóng ô tìm kiếm khi nhấp ra ngoài
    document.addEventListener('click', function (event) {
        var searchInput = document.getElementById('find');
        var searchIcon = document.getElementById('search-icon');
        if (event.target !== searchInput && event.target !== searchIcon) {
            searchInput.style.display = 'none';
        }
    });
});


