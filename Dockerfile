FROM trestletech/plumber
ADD api /api
ADD www /www
Add randoms /randoms

CMD ["/api/plumber.R"]
