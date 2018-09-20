# Use an official Ubuntu runtime as a parent image
FROM ubuntu

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
Copy . /app

# Install any needed packages specified in requirements.txt
RUN apt-get update && apt-get -y install apt-utils default-jre openjfx

# Make port 80 available to the world outside this container
EXPOSE 29809

# Define environment variable
# ENV NAME World

# Run app.py when the container launches
CMD [ "/usr/bin/java", "-jar", "tplinkconfigutil.jar" ]
