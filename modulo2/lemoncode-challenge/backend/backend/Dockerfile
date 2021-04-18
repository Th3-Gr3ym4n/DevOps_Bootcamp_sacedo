FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS base
WORKDIR /app
EXPOSE 5000

ENV ASPNETCORE_URLS=http://+:5000
ENV MONGO_URI=mongodb://localhost:27017

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-dotnet-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /src
COPY ["modulo2/lemoncode-challenge/backend/backend/backend.csproj", "modulo2/lemoncode-challenge/backend/backend/"]
RUN dotnet restore "modulo2/lemoncode-challenge/backend/backend/backend.csproj"
COPY . .
WORKDIR "/src/modulo2/lemoncode-challenge/backend/backend"
RUN dotnet build "backend.csproj" -c Release -o out

FROM build AS publish
RUN dotnet publish "backend.csproj" -c Release -o /out/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /out/publish .
ENTRYPOINT ["dotnet", "backend.dll"]
