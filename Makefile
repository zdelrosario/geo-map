# ${RSTUDIO_PASS} # Set in environment variables

start:
	open http://localhost:8787
	docker run -e PASSWORD=${RSTUDIO_PASS} \
	--rm -p 8787:8787 --name rstudio \
	--mount type=bind,source="${PWD}"/scripts,target=/home/rstudio/src \
	--mount type=bind,source="${PWD}"/data,target=/home/rstudio/data \
	rocker/geospatial 

setup:
	docker pull rocker/geospatial

clean:
	docker rm rstudio
