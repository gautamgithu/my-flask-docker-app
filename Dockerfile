# Stage 1: Build
FROM python:3.9-slim AS builder
WORKDIR /app
COPY requirements.txt .
# --user flag se hum libraries ko user folder mein install karte hain
RUN pip install --user -r requirements.txt

# Stage 2: Final (Lightweight)
FROM python:3.9-slim
WORKDIR /app
# Sirf install ki hui libraries aur code copy karo
COPY --from=builder /root/.local /root/.local
COPY . .
ENV PATH=/root/.local/bin:$PATH
CMD ["python", "app.py"]