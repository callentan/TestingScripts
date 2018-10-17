FROM scratch
COPY hello /
COPY test.txt /
CMD ["/hello"]