include ./.config.mk

docker-build:
	docker build . -t vercel-example \
		--build-arg AUTH_SECRET=$(AUTH_SECRET) \
		--build-arg AUTH_URL=$(AUTH_URL) \
		--build-arg DATABASE_URL=$(DATABASE_URL) \
		--build-arg DATABASE_URL_UNPOOLED=$(DATABASE_URL_UNPOOLED) \
		--build-arg PGHOST=$(PGHOST) \
		--build-arg PGHOST_UNPOOLED=$(PGHOST_UNPOOLED) \
		--build-arg PGUSER=$(PGUSER) \
		--build-arg PGDATABASE=$(PGDATABASE) \
		--build-arg PGPASSWORD=$(PGPASSWORD) \
		--build-arg POSTGRES_URL=$(POSTGRES_URL) \
		--build-arg POSTGRES_URL_NON_POOLING=$(POSTGRES_URL_NON_POOLING) \
		--build-arg POSTGRES_USER=$(POSTGRES_USER) \
		--build-arg POSTGRES_HOST=$(POSTGRES_HOST) \
		--build-arg POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) \
		--build-arg POSTGRES_DATABASE=$(POSTGRES_DATABASE) \
		--build-arg POSTGRES_URL_NO_SSL=$(POSTGRES_URL_NO_SSL) \
		--build-arg POSTGRES_PRISMA_URL=$(POSTGRES_PRISMA_URL)

docker-run: docker-build
	docker run -p 3000:3000 --rm -it --name vercel-container vercel-example
