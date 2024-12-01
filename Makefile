docker-build:
	docker build -t vercel-example .

docker-run: docker-build
	docker run -p 3000:3000 --rm -it --name vercel-container vercel-example
