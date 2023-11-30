

chmod 777 -R /ap/test/pts_592_jupyterlab/data/	

docker run -it --name=pts_592_jupyterlab -p 18888:8888 -v "${PWD}/data/jlab":/home/jovyan quay.io/jupyter/scipy-notebook:2023-10-31 

 
 # http://10.4.1.231:18888/lab?token=1643c58c6a9cfd37854d343665778f7456a1c8f7d6f26e1d

 # http://192.168.88.55:18888/lab?token=3f7795d94e6ee6d4bbd9a9830d6f47a42505827ee0c03aa3


# junk:

docker run -it --rm --name=pts_592_jupyterlab -p 18888:8888 -v "${PWD}/data/jlab":/home/jovyan/work quay.io/jupyter/r-notebook:2023-10-31 start-notebook.py --ServerApp.root_dir=/home/jovyan/work



