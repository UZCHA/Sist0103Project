<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>호텔 예약</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
</head>
<body>
    <div class="container">
        <h1>호텔 예약</h1>
        <form>
            <div class="mb-3">
                <label for="checkin" class="form-label">체크인 날짜:</label>
                <div id="checkin-container"></div>
                <input type="hidden" id="checkin" name="checkin">
            </div>
            <div class="mb-3">
                <label for="checkout" class="form-label">체크아웃 날짜:</label>
                <div id="checkout-container"></div>
                <input type="hidden" id="checkout" name="checkout">
            </div>
            <button type="submit" class="btn btn-primary">예약</button>
        </form>
    </div>

    <script>
        $(function() {
            $('#checkin-container').datepicker({
                format: 'yyyy-mm-dd',
                startDate: '0d',
                autoclose: true,
                inline: true,
                container: '#checkin-container'
            }).on('changeDate', function(e) {
                var date = e.format();
                $('#checkin').val(date);
                var startDate = new Date(e.date);
                startDate.setDate(startDate.getDate() + 1);
                $('#checkout-container').datepicker('setStartDate', startDate);
            });

            $('#checkout-container').datepicker({
                format: 'yyyy-mm-dd',
                startDate: '0d',
                autoclose: true,
                inline: true,
                container: '#checkout-container'
            }).on('changeDate', function(e) {
                var date = e.format();
                $('#checkout').val(date);
            });
        });
    </script>
</body>
</html>