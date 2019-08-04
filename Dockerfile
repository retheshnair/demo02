FROM golang:alpine

# Add dependencies and create source directory
RUN apk add --no-cache git        
RUN go get github.com/gorilla/mux  
RUN apk del git                    
RUN mkdir -p $GOPATH/src/apiserver

# Set working directory
WORKDIR $GOPATH/src/apiserver

# Copy src into image
COPY ./src/ ./

# Build simple api server
RUN go build -o apiserver

# Expose port for service to be consumed
EXPOSE 80

# Define entrypoint for container
ENTRYPOINT ["./apiserver"]
