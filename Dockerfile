# Stage 1: Build
FROM python:3.9-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user -r requirements.txt

# Stage 2: Final (Lightweight)
FROM python:3.9-slim
WORKDIR /app
# Sirf install ki hui libraries copy karo
COPY --from=builder /root/.local /root/.local
COPY . .
ENV PATH=/root/.local/bin:$PATH

# Gunicorn setup
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]