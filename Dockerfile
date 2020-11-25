FROM mcr.microsoft.com/dotnet/sdk:3.1

EXPOSE 5000

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

COPY DotnetTemplate.Web DotnetTemplate.Web
COPY DotnetTemplate.Web.Tests DotnetTemplate.Web.Tests
COPY DotnetTemplate.sln DotnetTemplate.sln

RUN dotnet build

WORKDIR DotnetTemplate.Web

RUN npm install && \
    npm run build

ENTRYPOINT dotnet run