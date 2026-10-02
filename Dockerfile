FROM ghcr.io/cirruslabs/flutter:3.29.0 AS builder

WORKDIR /app

COPY pubspec.yaml ./
RUN flutter pub get

COPY . .

ARG API_BASE_URL=https://uat-api.kincore.com
RUN flutter build web --release --dart-define=API_BASE_URL=${API_BASE_URL}

FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build/web /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
