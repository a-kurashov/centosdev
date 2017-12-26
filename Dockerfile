FROM centos:7

# Stuff to build stuff
RUN yum install -y epel-release && yum clean all
RUN yum groupinstall -y "Development Tools" && yum clean all

# LevelDB
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm && yum clean all
RUN yum install -y leveldb-devel && yum clean all

# Miniconda
RUN yum install -y wget && yum clean all
RUN wget http://repo.continuum.io/miniconda/Miniconda3-4.3.31-Linux-x86_64.sh -O /root/miniconda.sh
RUN bash /root/miniconda.sh -b -p /root/miniconda
RUN rm /root/miniconda.sh
ENV PATH="/root/miniconda/bin:$PATH"

# Conda packages
RUN conda install tensorflow
RUN conda install keras
RUN conda install scikit-learn
RUN conda install matplotlib
RUN conda install flask
RUN conda install pandas
RUN conda install seaborn
RUN conda install click
RUN conda install pymongo
RUN conda install graphviz
RUN pip install plyvel

# TypeScript and friends
RUN yum install -y nodejs && yum clean all
RUN yum install -y npm && yum clean all
RUN npm install webpack --global
RUN npm install typescript --global
RUN npm install types --global
RUN npm install ts-loader --global
RUN npm install css-loader --global
RUN npm install react @types/react --global
RUN npm install redux @types/redux --global

