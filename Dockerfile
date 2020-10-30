FROM pinzhikeji/alpine-zh

RUN echo "Downloading jdk" \ 
    && wget http://image.xiniudada.top/file/jdk-8u271-linux-x64.tar.gz \
    -q -O /tmp/jdk8.tar.gz

RUN mkdir /usr/local/jdk8 \
    && tar -xzvf /tmp/jdk8.tar.gz -C /usr/local/jdk8/ \
    && mv /usr/local/jdk8/jdk1.8.0_271/* /usr/local/jdk8/ \
    && rm -rf /usr/local/jdk8/jdk1.8.0_271/ \
    && rm /tmp/jdk8.tar.gz

ENV JAVA_HOME=/usr/local/jdk8 \
    JRE_HOME=/usr/local/jdk8/jre  \
    TZ=Asia/Shanghai

ENV PATH=$JAVA_HOME/bin:$PATH

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

CMD ["sh"]