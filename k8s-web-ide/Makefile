VERSION=v2.1.1
all: build
build:
	docker build --pull -t maha/k8s-web-ide:$(VERSION) .

push: build
	docker push maha/k8s-web-ide:$(VERSION)

run: build
	# Sample usage locally
	docker run -it -p 127.0.0.1:8080:8080 -e TUTORIALS_REPO=https://github.com/Maha41/k8-ide.git -e TUTORIALS_DIR=tutorials -v /var/run/docker.sock:/var/run/docker.sock maha/k8s-web-ide:$(VERSION)