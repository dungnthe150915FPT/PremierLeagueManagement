$(document).ready(function () {
    GetTopRanking();
});

function GetTopRanking() {
    $.ajax({
        type: 'GET',
        url: '/api/Ranking/GetTopRanking',
        dataType: 'json',
        success: function (data) {
            displayTopRanking(data);
        },
        error: function (error) {
            console.error('Error fetching top rankings:', error);
        }
    });
}

function displayTopRanking(data) {
    var tableBody = $('#rankingTable tbody');
    tableBody.empty(); // Xóa nội dung cũ

    // Thêm dữ liệu mới vào bảng
    data.forEach(function (ranking) {
        tableBody.append(`
            <tr>
                <td>${ranking.ClubName}</td>
                <td>${ranking.Score}</td>
                <td>${ranking.NumberDifference}</td>
                <td>${ranking.Goal}</td>
            </tr>`);
    });
}