# Dockerfile для go-api
FROM golang:1.21-alpine

WORKDIR /app

# Копируем зависимости
COPY go-api/go.mod ./
COPY go-api/go.sum ./
RUN go mod download

# Копируем весь исходник
COPY go-api/ ./

# Собираем приложение
RUN go build -o main ./cmd/main.go

# Указываем порт, который открывает сервер
EXPOSE 8080

CMD ["./main"]
