echo -----------------------
echo -----[ starting ]------
echo -----------------------
docker pull shellngn/pro:latest
docker run --mount source=shellngn-data,target=/home/node/server/data -p 8080:8080 -e HOST=0.0.0.0 shellngn/pro:latest
