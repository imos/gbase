gbase.zip: output
	bash archive.sh

test: output
	cd output && bazel test -c dbg //...

output: repository
	bash generate.sh

repository:
	bash repository.sh
