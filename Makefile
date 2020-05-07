SHELL=/bin/bash -o pipefail

.PHONY: petstore
petstore:
	@docker kill local-petstore-ui || true
	@docker run -d --name local-petstore-ui --rm -v "$$(pwd)/petstore:/usr/share/nginx/html/petstore" -v "$$(pwd)/_common:/usr/share/nginx/html/_common" -p 9001:8080 swaggerapi/swagger-ui
	@open http://localhost:9001?url=petstore/v1/openapi.yml

.PHONY: petstore-editor
petstore-editor:
	@docker kill local-petstore-editor || true
	@docker run -d --name local-petstore-editor --rm -v "$$(pwd)/petstore:/usr/share/nginx/html/petstore" -v "$$(pwd)/_common:/usr/share/nginx/html/_common" -p 9002:8080 swaggerapi/swagger-editor
	@open http://localhost:9002?url=petstore/v1/openapi.yml

.PHONY: catalog
catalog:
	@docker kill local-catalog-ui || true
	@docker run -d --name local-catalog-ui --rm -v "$$(pwd)/catalog:/usr/share/nginx/html/catalog" -v "$$(pwd)/_common:/usr/share/nginx/html/_common" -p 9003:8080 swaggerapi/swagger-ui
	@open http://localhost:9003?url=catalog/v1/openapi.yml