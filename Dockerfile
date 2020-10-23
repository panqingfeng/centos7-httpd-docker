FROM centos:centos7

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1
USER root

RUN yum -y install epel-release \
        && curl --silent --location https://rpm.nodesource.com/setup_10.x | /bin/bash - \
        && yum -y install wget chromium-headless \
            google-noto-sans-simplified-chinese-fonts \
            google-noto-sans-traditional-chinese-fonts \
            google-noto-sans-cjk-fonts \
            mod_fcgid \
            mod_ssl \
            httpd \
            gcc-c++ \
            nodejs \
            make \
        && yum clean all \
        && npm -g \
            install puppeteer \
            node-fastcgi \
            request \
            mmmagic \
            md5 \
            image-size \
            tld-extract \
            async \
            cheerio

ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
