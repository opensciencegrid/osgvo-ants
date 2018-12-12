FROM opensciencegrid/osgvo-el7

RUN yum install -y cmake

RUN VERSION=2.1.0 && \
    cd /tmp && \
    git clone https://github.com/stnava/ANTs.git && \
    cd ANTs && \
    git checkout v$VERSION && \
    mkdir -p /opt/ANTs/$VERSION && \
    cd /opt/ANTs/$VERSION && \
    cmake /tmp/ANTs && \
    make -j 2 && \
    cp /tmp/ANTs/Scripts/* bin/ && \
    cd /tmp && \
    rm -rf v${VERSION}* ANTs*

# build info
RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

