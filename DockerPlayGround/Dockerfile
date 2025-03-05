# ------------------------------------------------------------------------------
# The image we are building with THIS Dockerfile is based on the ubuntu:18.04
# Docker image from dockerhub (hub.docker.com).
# ------------------------------------------------------------------------------
    FROM ubuntu:20.04

    ENV TZ=Europe/Moscow
    RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

    # ------------------------------------------------------------------------------
    # Install Trick Dependencies identified at
    # https://nasa.github.io/trick/documentation/install_guide/Install-Guide#ubuntu
    # ------------------------------------------------------------------------------
    RUN apt-get update && apt-get install -y \
    bison \
    clang \
    flex \
    git \
    llvm \
    make \
    maven \
    swig \
    cmake \
    curl \
    g++ \
    libx11-dev \
    libxml2-dev \
    libxt-dev \
    libmotif-common \
    libmotif-dev \
    python3-dev \
    zlib1g-dev \
    llvm-dev \
    libclang-dev \
    libudunits2-dev \
    libgtest-dev \
    openjdk-11-jdk \
    zip
    
    ENV PYTHON_VERSION=3
    
    # ------------------------------------------------------------------------------
    # Get Trick version 19.7.3 from GitHub, configure and build it.
    # ------------------------------------------------------------------------------
    # We want to clone Trick into the /apps directory of our image.
    WORKDIR /apps
    # Get the 19.7.3 branch (an official release) of Trick from Github.
    RUN git clone -b 19.7.3 https://github.com/nasa/trick.git
    # cd into the directory we just created and ..
    WORKDIR /apps/trick
    # configure and make Trick.
    RUN ./configure && make
    
    RUN useradd -ms /bin/bash tuan
    USER tuan

    # ------------------------------------------------------------------------------
    # Add ${TRICK_HOME}/bin to the PATH variable.
    # ------------------------------------------------------------------------------
    ENV TRICK_HOME="/apps/trick"
    RUN echo "export PATH=${PATH}:${TRICK_HOME}/bin" >> ~/.bashrc
    
    CMD ["/bin/bash"]
    
    