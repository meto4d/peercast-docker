FROM ubuntu:20.04 AS builder
ENV ARCH=x86_64 \
    PECA_VER='peercast-0.1218+svn20080104.orig' \
    PECA_URL='https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/peercast/0.1218+svn20080104-1.1/peercast_0.1218+svn20080104.orig.tar.gz'
#ADD peercast_0.1218+svn20080104.orig.tar.gz /
RUN set -x \
 && apt-get -y update \
 && apt-get -y install vim less \
 && apt-get -y install wget make gcc g++\
 && wget -O - ${PECA_URL} | tar zxvf - \
 && cd /${PECA_VER}/ui/linux \
  && sed -i -z 's/typedef long long int64_t;/#ifdef _BIT_TYPES_H\ntypedef long long int64_t;\n#endif/g' ../../core/common/sys.h \
  && sed -i 's/#include <stdio.h>/#include <sys\/types.h>\n#include <stdio.h>/g' ../../core/common/common.h \
  && sed -i 's/= strstr(str,arg);/= (char *)strstr(str,arg);/g' ../../core/common/sys.cpp \
  && make \
  && apt-get -y purge wget make gcc g++ \
  && apt-get clean \
  && echo 'finish'
WORKDIR /${PECA_VER}/ui
COPY peercast.ini /${PECA_VER}/ui/
CMD ["linux/peercast"]
