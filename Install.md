# Development
## dcm4chee
port: 8080, 11112  
AETitle: DCM4CHEE  
Data Dir: ./docker-data  

mac
```bash
docker-compose -f docker-compose-mac.yml up
```
ubuntu  
```bash
docker-compose -f docker-compose-dev.yml up
```
## Viewer
build
```bash
docker build . -f Dockerfile-Viewers-Dev -t viewer
```
run
```bash
docker run -it --rm --volume=$(pwd)/Viewers:/usr/src/app -p 4000:3000 -e APP_CONFIG=config/local_dcm4chee --name viewer viewer
```
## Uploader
```bash
cd ruby_client
docker build -t dclient .
docker run -it --rm --volume=$(pwd):/usr/src/app --volume=$(pwd)/../../../TestDICOM:/usr/src/data --name dclient dclient
```
Be careful. dclient.rb will run immediately.  
 
# Deployment
## dmc4chee
ubuntu
```bash
docker-compose up -d 
```
## Viewer
```bash
cd Viewer
docker build -t ohif/viewer:latest .
docker run -p 80:80 -d -e APP_CONFIG=config/pdcode_dcm4chee ohif/viewer:latest
```
## Uploader
```bash
cd ruby_client
docker build -t dclient .
docker run -it --rm --volume=$(pwd):/usr/src/app --volume=$(pwd)/../../../TestDICOM:/usr/src/data --name dclient dclient
```
Be careful. dclient.rb will run immediately.  
