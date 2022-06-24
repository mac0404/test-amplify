RUN apt-get -y update && apt-get install -y \
    gconf-service \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgcc1 \
    libgconf-2-4 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxss1 \
    libxtst6 \
    libappindicator1 \
    libnss3 \
    libasound2 \
    libatk1.0-0 \
    libc6 \
    ca-certificates \
    fonts-liberation \
    lsb-release \
    xdg-utils \
    wget \
   

#Set Environment Variables for Project
ENV ROOT_URL https://app.memorizz.com/
ENV MONGO_URL mongodb+srv://memorizz:2Ahsk9WajkFbZcXc29UxFr2wZSKsNP@cluster0.qnp9c.mongodb.net/memorizz?retryWrites=true&w=majority
ENV PORT 3000

#Create Directory
RUN mkdir -p /usr/src/bundle

#Copy your project content to the directory
COPY bundle /usr/src/bundle/

#Set your Working Directory
WORKDIR /usr/src/bundle/programs/server

#Install Node packages
RUN npm install

# Set Workdir
WORKDIR /usr/src/bundle

#Run file on terminal
CMD ["node", "main.js"]

#Expose required port
EXPOSE 3000
