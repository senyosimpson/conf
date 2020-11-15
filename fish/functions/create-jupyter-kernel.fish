function create-jupyter-kernel
	set name $argv
	ipython kernel install --user --name=$name
end
