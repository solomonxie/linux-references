# Step 2: Dockerfile basics
# Build: docker build -f docker_02_dockerfile.dockerfile -t docker_demo:latest .
# Run:   docker run --rm docker_demo:latest

FROM alpine:3.20              # base image — a small Linux userland to build on
RUN apk add --no-cache curl   # each instruction adds one layer; --no-cache skips apk's local cache
COPY app.sh /app.sh           # copy a file from the build context (this folder) into the image
RUN chmod +x /app.sh
CMD ["/app.sh"]                # default command when a container starts from this image
