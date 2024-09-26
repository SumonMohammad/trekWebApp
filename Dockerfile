# Use an official Node.js image
FROM node:14

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json, then install dependencies
COPY package.json package-lock.json ./
RUN npm install
RUN npx playwright install
RUN apt-get update && apt-get install -y \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libxdamage1 \
    libxrandr2 \
    libgbm1 \
    libasound2 \
    libxshmfence1 \
    libgtk-3-0 \
    libx11-xcb1 \
    libxcb-dri3-0 \
    libxtst6 \
    libxcomposite1 \
    libxfixes3 \
    libxi6 \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    libpango1.0-0 \
    fonts-liberation \
    libappindicator3-1 \
    libxss1 \
    lsb-release \
    xdg-utils \
    wget \
    && rm -rf /var/lib/apt/lists/*
# Copy the rest of the application code
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Command to run the application
CMD ["npx", "playwright", "test"]
