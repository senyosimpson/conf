function create-env
	set name $argv
	python3 -m venv /media/senyo/senYeezus/envs/$name
	source /media/senyo/senYeezus/envs/$name/bin/activate
	python3 /media/senyo/senYeezus/envs/get-pip.py 
	pip3 install --upgrade pip
	pip3 install flake8 jupyter jupyterlab pandas numpy
	pip3 install -e /media/senyo/senYeezus/Aerobotics/debussy
	pip3 install aerods aeroio aeroless
	deactivate
end
