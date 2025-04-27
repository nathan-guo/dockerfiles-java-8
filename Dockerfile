# 使用 openjdk:8-jre-slim-buster 作为基础镜像
FROM openjdk:8-jre-slim-buster

# 安装中文字体和字体配置工具
RUN apt-get update && \
    apt-get install -y \
    fonts-noto-cjk \
    fontconfig \
    && apt-get install -y --no-install-recommends tzdata \
    && rm -rf /var/lib/apt/lists/*

# 刷新字体缓存
RUN fc-cache -fv

# 设置时区（Asia/Shanghai）
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata

# 默认命令，查看 Java 版本
CMD ["java", "-version"]
