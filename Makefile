check-var-%:
	@ if [ "${${*}}" = "" ]; then echo "Variable $* must be set or passed as an argument."; exit 1; fi

serve:
	sudo bundle exec jekyll serve --livereload

build:
	sudo bundle exec jekyll build

post: check-var-name
	@ rm _posts/`date +"%F"`-${name}.markdown
	@ echo "---\nlayout: post\ntitle: \"${name}\"\ndate: `date +"%Y-%m-%d"`\n---\nHello World!" >> _posts/`date +"%F"`-${name}.markdown
	@ echo "Created blank post at _posts/`date +"%F"`-${name}.markdown"
