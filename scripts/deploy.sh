#!/bin/sh

cd /home/programs/nameless-backend/src/Nameless.Backend.Api/
git pull -f
# dotnet restore -r linux-x64
service upchat stop
rm -rf /app
dotnet publish -c Release -f netcoreapp2.1 -r ubuntu.18.04-x64 --self-contained --output /app
# dotnet publish -o /app -c Release -r linux-x64

echo build lambda
cd /home/programs/lambda
git pull -f 	
yarn&&yarn prod 
mkdir /app/wwwroot
cd dist/
cp -r ./ /app/wwwroot/ 

service upchat start


