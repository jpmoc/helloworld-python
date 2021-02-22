DKR_IMAGE_FAMILY_NAME?= emayssatware/helloworld-python
DKR_IMAGE_TAG?= :latest
DKR_IMAGE_CNAME?= $(DKR_IMAGE_FAMILY_NAME)$(DKR_IMAGE_TAG)

build_image:
	docker build -t $(DKR_IMAGE_CNAME) .

push_image:
	docker push $(DKR_IMAGE_CNAME)

apply_kservice:
	# Make sure to update the image
	kubectl apply -f kservice-v1.yaml
	# kubectl apply -f kservice-v2.yaml

apply_service:
	kubectl apply -f service.yaml

curl_kservice:
	curl http://helloworld-python.default.example.com
	# curl http://helloworld-python.default.127.0.0.1.xip.io

curl_service: URL= http://helloworld-python--service.toto:80
curl_service:
	kubectl exec curl -c curl -it -- curl $(URL)
	kubectl exec curl -c curl -it -- curl $(URL)/
	kubectl exec curl -c curl -it -- curl $(URL)/delay
	kubectl exec curl -c curl -it -- curl $(URL)/headers
	kubectl exec curl -c curl -it -- curl $(URL)/ip
	kubectl exec curl -c curl -it -- curl $(URL)/status

unapply_kservice:
	kubectl delete -f kservice-v1.yaml
	# kubectl delete -f kservice-v2.yaml
	#
unapply_service:
	kubectl delete -f service.yaml
