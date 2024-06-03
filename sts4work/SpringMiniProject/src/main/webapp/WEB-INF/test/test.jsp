<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>호텔 예약</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/moment/min/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<style>
        .invalid-date {
            background-color: #f0ad4e;
            color: white;
            pointer-events: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>호텔 예약</h1>
        <form>
            <div class="mb-3" style="width: 240px;">
                <label for="daterange" class="form-label">체크인 및 체크아웃 날짜:</label>
                <input type="text" id="daterange" class="form-control" name="daterange">
                <input type="hidden" id="checkin" name="checkin">
                <input type="hidden" id="checkout" name="checkout">
            </div>
            <button type="submit" class="btn btn-primary">예약</button>
        </form>
    </div>

    <script>
        $(function() {
            var disabledDates = ['2024-06-04', '2024-06-05', '2024-06-06'];

            function isDateDisabled(date) {
                var formattedDate = moment(date).format('YYYY-MM-DD');
                return disabledDates.includes(formattedDate);
            }

            function isRangeValid(start, end) {
                var currentDate = moment(start);
                while (currentDate.isBefore(end) || currentDate.isSame(end, 'day')) {
                    if (isDateDisabled(currentDate)) {
                        return false;
                    }
                    currentDate.add(1, 'day');
                }
                return true;
            }

            $('#daterange').daterangepicker({
                locale: {
                    format: 'YYYY-MM-DD'
                },
                autoApply: false,
                minDate: moment().startOf('day'),
                isInvalidDate: isDateDisabled,
                isCustomDate: function(date) {
                    if (isDateDisabled(date)) {
                        return 'invalid-date';
                    }
                }
            }, function(start, end, label) {
                if (!isRangeValid(start, end)) {
                    alert('선택한 날짜 범위에 사용할 수 없는 날짜가 포함되어 있습니다.');
                    $('#daterange').val('');
                    $('#checkin').val('');
                    $('#checkout').val('');
                } else {
                    $('#checkin').val(start.format('YYYY-MM-DD'));
                    $('#checkout').val(end.format('YYYY-MM-DD'));
                }
            });
        });
    </script>
</body>
</html>