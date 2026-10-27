# because of dotnet, we always build on amd64, and target platforms in cli
# dotnet doesn't support QEMU for building or running.
# (errors common in arm/v7 32bit) https://github.com/dotnet/dotnet-docker/issues/1537
# https://hub.docker.com/_/microsoft-dotnet
# hadolint ignore=DL3029
# to build for a different platform than your host, use --platform=<platform>
# for example, if you were on Intel (amd64) and wanted to build for ARM, you would use:
# docker buildx build --platform "linux/arm64/v8" .

# build compiles the program for the builder's local platform
FROM --platform=${BUILDPLATFORM} mcr.microsoft.com/dotnet/sdk:7.0-bookworm-slim@sha256:cfa3db6c98cf58da9135d0641b03db4f7eb2e43bdbf97b7294e70908abc3d99b AS build
ARG TARGETPLATFORM
ARG TARGETARCH
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM"

WORKDIR /source
COPY *.csproj .
RUN dotnet restore -a $TARGETARCH

COPY . .
RUN dotnet publish -c release -o /app -a $TARGETARCH --self-contained false --no-restore

# app image (bookworm = Debian 12; bullseye/11 is EOL and fails Trivy)
FROM mcr.microsoft.com/dotnet/runtime:7.0-bookworm-slim@sha256:f24ddd398454193219bd21979029cdefb51fcda577a497eff519c84ac736c110
RUN apt-get -o Acquire::Retries=5 update && \
    apt-get -o Acquire::Retries=5 upgrade -y --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    groupadd --gid 10001 app && \
    useradd --uid 10001 --gid app --home-dir /app --shell /usr/sbin/nologin app
WORKDIR /app
COPY --from=build --chown=app:app /app .
USER app
ENTRYPOINT ["dotnet", "Worker.dll"]
