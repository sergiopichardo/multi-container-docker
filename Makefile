
build: 
	docker build -t sergiopichardo/multi-client ./client
	docker build -t sergiopichardo/multi-nginx ./nginx
	docker build -t sergiopichardo/multi-server ./server
	docker build -t sergiopichardo/multi-worker ./worker

push: 
	docker login
	docker push sergiopichardo/multi-client 
	docker push sergiopichardo/multi-nginx 
	docker push sergiopichardo/multi-server 
	docker push sergiopichardo/multi-worker 
	
all: build push 