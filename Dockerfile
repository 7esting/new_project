# our base image
#FROM alpine:3.5
FROM alpine:latest

# Identify the maintainer of an image
LABEL maintainer="Hector"

USER root

# Install python and pip
RUN apk add --update py2-pip

# install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# copy files required for the app to run
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/
COPY templates/page.html /usr/src/app/templates/
COPY static/css/style.css /usr/src/app/static/css/

# tell the port number the container should expose
EXPOSE 80

# run the application
CMD ["python", "/usr/src/app/app.py"]
