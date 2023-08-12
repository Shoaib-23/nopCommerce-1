FROM mcr.microsoft.com/dotnet/sdk:7.0

LABEL author="shoaib" organization="ms" project="learning"

ADD https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.3/nopCommerce_4.60.3_NoSource_linux_x64.zip /nop/nopCommerce_4.60.3.zip

WORKDIR /nop

RUN apt update && apt install unzip -y && \
    unzip /nop/nopCommerce_4.60.3.zip && \
    mkdir /nop/bin && mkdir /nop/logs

EXPOSE 5000

CMD [ "dotnet", "Nop.Web.dll", "--urls", "http://0.0.0.0:5000" ]
