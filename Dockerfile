# Use the official golang image as a base image
FROM golang:latest

# Set the Current Working Directory inside the container
WORKDIR /root/go-project/helloWorld-Go

# Copy go mod file
COPY go.mod ./

# Download all dependencies. Dependencies will be cached if the go.mod file is not changed
RUN go mod download

# Copy the source code from the current directory to the Working Directory inside the container
COPY . .

# Build the Go app
RUN go build -o hello .

# Expose port 8085 to the outside world
EXPOSE 8085

# Command to run the executable
CMD ["./hello"]

