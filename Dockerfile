# ---- Base Python image ----
FROM python:3.10-slim

# ---- Install OS-level libs that Mediapipe and OpenCV need ----
RUN apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# ---- Set working directory ----
WORKDIR /app

# ---- Copy project files ----
COPY . /app

# ---- Install dependencies ----
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# ---- Expose Render's required port ----
EXPOSE 10000

# ---- Start the Django + Channels app with Daphne ----
CMD ["daphne", "-b", "0.0.0.0", "-p", "10000", "asl_lite.asgi:application"]
