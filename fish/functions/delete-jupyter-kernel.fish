function delete-jupyter-kernel
	set name $argv
	jupyter kernelspec uninstall $name
end
