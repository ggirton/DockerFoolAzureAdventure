FROM trestletech/plumber
ADD api /api
ADD www /www

CMD ["/api/plumber.R"]
