test:
	PYTHONPATH=. MPLBACKEND="agg" coverage run --source peartree -m py.test --verbose

performance:
	PYTHONPATH=. MPLBACKEND="agg" pytest profiler/test_graph_assembly.py -s

notebook:
	docker-compose build
	mkdir -p ./notebooks
	docker-compose up notebook

docker-clean:
	docker network prune --force
	docker volume prune --force
	docker image prune --force

install-graph-tool:
	sed -i -e '$$a\
	deb http://downloads.skewed.de/apt/stretch stretch main\
	deb-src http://downloads.skewed.de/apt/stretch stretch main' /etc/apt/sources.list && \
	apt-get update && \
	apt-get install python3-graph-tool
