docker:
	docker build -t jizu/docker-buildx-demo --progress=plain .

buildx:
	docker buildx build \
		--platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
        --tag jizu/docker-buildx-demo .
# --platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
