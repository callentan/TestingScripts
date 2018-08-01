FROM microsoft/azure-cli:latest

RUN apk update
RUN apk add git
RUN apk add jq

ARG GIT_TOKEN
ARG VSTS_TOKEN

ENV GIT_TOKEN $GIT_TOKEN
ENV VSTS_TOKEN $VSTS_TOKEN

COPY syncrepos/repos.json .
COPY syncrepos/syncrepos.sh .

ENTRYPOINT ["./syncrepos.sh"]
CMD []