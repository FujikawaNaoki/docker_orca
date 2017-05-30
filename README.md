# docker_orca


# dev image
docker build -t fujikawa/jma-receipt1604_50:0.1 ./1604_50/0.1
docker build -t fujikawa/jma-receipt1604_50:0.2 ./1604_50/0.2
docker build -t fujikawa/jma-receipt1604_50:0.3 ./1604_50/0.3


# prod image 
docker build -t fujikawa/jma-receipt1604_50:1.0 ./1604_50
docker run --name orca_1604_50 -it -p 8000:8000 fujikawa/jma-receipt1604_50:1.0
