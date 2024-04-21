name: Deploy to Portainer

on:
  push:
    branches:
      - master

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v3

      - name: Set up Node.js
        uses: actions/setup-node@v2
        with:
          node-version: '20'

      - name: Login to Docker Registry
        run: docker login -u ${{ secrets.DOCKER_USERNAME }} -p ${{ secrets.DOCKER_PASSWORD }} my.registry.com

      - name: Pull Docker Image
        run: docker pull my.registry.com/my-image:latest

      - name: Stop and Remove Existing Container
        run: |
          docker stop my_container || true
          docker rm my_container || true

      - name: Run New Container
        run: docker run -d --name my_container -p 8080:80 my.registry.com/my-image:latest
