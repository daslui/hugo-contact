FROM quay.io/hummingbird/go:1.26 AS builder

WORKDIR /build

COPY . .

RUN go build -o /build/hugo-contact -buildvcs=false .

FROM quay.io/hummingbird/core-runtime:2

ENV PORT=8080
EXPOSE 8080

WORKDIR /app
COPY --from=builder /build/hugo-contact .

ENTRYPOINT ["./hugo-contact"]
