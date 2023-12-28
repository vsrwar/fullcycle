FROM golang as builder

WORKDIR /app

RUN go mod init fullcycle
RUN go mod download && go mod verify

COPY . .
RUN go build -v -o fullcycle .

FROM scratch
WORKDIR /app
COPY --from=builder /app/fullcycle .

CMD ["./fullcycle"]
