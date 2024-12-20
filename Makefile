.DEFAULT_GOAL:=help

.PHONY: help # See https://tinyurl.com/makefile-autohelp
help: ## Print help for each target
	@awk -v tab=20 'BEGIN{FS="(:.*## |##@ |@## )";c="\033[36m";m="\033[0m";y="  ";a=2;h()}function t(s){gsub(/[ \t]+$$/,"",s);gsub(/^[ \t]+/,"",s);return s}function u(g,d){split(t(g),f," ");for(j in f)printf"%s%s%-"tab"s%s%s\n",y,c,t(f[j]),m,d}function h(){printf"\nUsage:\n%smake %s<target>%s\n\nRecognized targets:\n",y,c,m}/\\$$/{gsub(/\\$$/,"");b=b$$0;next}b{$$0=b$$0;b=""}/^[-a-zA-Z0-9*\/%_. ]+:.*## /{p=sprintf("\n%"(tab+a)"s"y,"");gsub(/\\n/,p);if($$1~/%/&&$$2~/^%:/){n=split($$2,q,/%:|:% */);for(i=2;i<n;i+=2){g=$$1;sub(/%/,q[i],g);u(g,q[i+1])}}else if($$1~/%/&&$$2~/%:[^%]+:[^%]+:%/){d=$$2;sub(/^.*%:/,"",d);sub(/:%.*/,"",d);n=split(d,q,/:/);for(i=1;i<=n;i++){g=$$1;d=$$2;sub(/%/,q[i],g);sub(/%:[^%]+:%/,q[i],d);u(g,d)}}else u($$1,$$2)}/^##@ /{gsub(/\\n/,"\n");if(NF==3)tab=$$2;printf"\n%s\n",$$NF}END{print""}' $(MAKEFILE_LIST) # v1.62

############################################################################
##@ DOCKER
############################################################################
docker-up: ## (up) Start Docker containers
	docker compose up --build --detach
up: docker-up

docker-down: ## (down) Stop Docker containers
	docker compose down
down: docker-down

docker-run: ## (run) Login to the php container
	docker compose exec php bash
run: docker-run

docker-logs: ## (logs) View logs of containers
	docker compose logs --follow
logs: docker-logs


############################################################################
##@ COMPOSER
############################################################################
composer-outdated: ## (outdated) Check outdated composer packages
	docker compose exec php composer outdated --direct --strict --no-scripts
outdated: composer-outdated

composer-update: ## (update) Update composer packages
	docker compose exec php composer update
update: composer-update
