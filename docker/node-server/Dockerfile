FROM node:20

WORKDIR /usr/src/app

# Kopiere die Abhängigkeiten und den Code in das Arbeitsverzeichnis
COPY ../package*.json ./
COPY ../server.js ./

# Installiere die Abhängigkeiten
RUN npm install

# Exponiere den Port 3000
EXPOSE 80

# Starte die Anwendung
CMD [ "node", "server.js" ]
