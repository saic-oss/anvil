FROM centos:8

LABEL name="anvil"

# Make all shells run in a safer way. Ref: https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
SHELL [ "/bin/bash", "-euxo", "pipefail", "-c" ]

WORKDIR /

# Need root to do rooty things
USER root

# Install containerd.io. Get versions from https://download.docker.com/linux/centos/7/x86_64/stable/Packages/
# This must be installed manually because Red Hat has blocked later versions of containerd.io
# from being installed normally on RHEL/CentOS 8. Their intention is for people to use Podman/Buildah,
# but the support for running Podman/Buildah inside a container is very weak.
# An earlier version of containerd.io is available, but it limits the version of Docker that you are able
# to install and it is also vulnerable to CVE RHSA-2020:0348
ARG CONTAINERD_VERSION="1.2.13-3.1.el7"
ENV CONTAINERD_VERSION=${CONTAINERD_VERSION}

# Specify Docker version to install. Get versions using 'dnf list docker-ce --showduplicates | sort -r'
ARG DOCKER_VERSION="3:19.03.13"
ENV DOCKER_VERION=${DOCKER_VERSION}

# Intentionally do not specify versions for the tools in the Development Tools group and other
# base packages, so that we always get the latest version. These packages are very stable and
# shouldn't ever need version pinning
# Please keep the list alphabetized for maintainability

RUN dnf install -y --refresh \
  bind-utils \
  bzip2 \
  bzip2-devel \
  container-selinux \
  gcc \
  gcc-c++ \
  gettext \
  git \
  jq \
  iptables \
  libffi-devel \
  libxslt-devel \
  make \
  ncurses-devel \
  openssl-devel \
  readline-devel \
  sqlite-devel \
  unixODBC-devel \
  unzip \
  wget \
  which \
  xz \
  && dnf clean all \
  && rm -rf /var/cache/yum/ \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install Docker
RUN dnf install -y "https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-${CONTAINERD_VERSION}.x86_64.rpm" \
  'dnf-command(config-manager)' \
  && dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo \
  && dnf install -y "docker-ce-${DOCKER_VERSION}" \
  && dnf clean all \
  && rm -rf /var/cache/yum/ \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install shellspec. Get versions from https://github.com/shellspec/shellspec/releases
ARG SHELLSPEC_VERSION="0.22.0"
ENV SHELLSPEC_VERSION=${SHELLSPEC_VERSION}
# hadolint ignore=DL3003
RUN git clone --branch "${SHELLSPEC_VERSION}" --depth 1 https://github.com/shellspec/shellspec.git /usr/local/src/shellspec \
  && (cd /usr/local/src/shellspec && make install) \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install go-task. Get versions from https://github.com/go-task/task/releases
ARG GO_TASK_VERSION="3.0.0"
ENV GO_TASK_VERSION=${GO_TASK_VERSION}
# hadolint ignore=DL3003
RUN wget -O /root/task.tar.gz "https://github.com/go-task/task/releases/download/v${GO_TASK_VERSION}/task_linux_amd64.tar.gz" \
  && (cd /usr/local/bin && tar -xzvf /root/task.tar.gz task) \
  && rm -f /root/task.tar.gz \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install shellcheck. Get versions from https://github.com/koalaman/shellcheck/releases
ARG SHELLCHECK_VERSION="0.7.1"
ENV SHELLCHECK_VERSION=${SHELLCHECK_VERSION}
# hadolint ignore=DL3003
RUN wget -O /root/shellcheck.tar.xz "https://github.com/koalaman/shellcheck/releases/download/v${SHELLCHECK_VERSION}/shellcheck-v${SHELLCHECK_VERSION}.linux.x86_64.tar.xz" \
  && (cd /usr/local/bin && tar -xJvf /root/shellcheck.tar.xz --strip-components=1 "shellcheck-v${SHELLCHECK_VERSION}/shellcheck") \
  && rm -f /root/shellcheck.tar.xz \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install hadolint. Get versions from https://github.com/hadolint/hadolint/releases
ARG HADOLINT_VERSION="1.18.0"
ENV HADOLINT_VERSION=${HADOLINT_VERSION}
RUN wget -O /usr/local/bin/hadolint "https://github.com/hadolint/hadolint/releases/download/v${HADOLINT_VERSION}/hadolint-Linux-x86_64" \
  && chmod +x /usr/local/bin/hadolint \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install klar. Get versions from https://github.com/optiopay/klar/releases
ARG KLAR_VERSION="2.4.0"
ENV KLAR_VERSION=${KLAR_VERSION}
RUN wget -O /usr/local/bin/klar "https://github.com/optiopay/klar/releases/download/v${KLAR_VERSION}/klar-${KLAR_VERSION}-linux-amd64" \
  && chmod +x /usr/local/bin/klar \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install Fossa cli. Get versions from https://github.com/fossas/fossa-cli/releases
ARG FOSSA_VERSION="1.0.30"
ENV FOSSA_VERSION=${FOSSA_VERSION}
# hadolint ignore=DL3003
RUN wget -O /root/fossa.tar.gz "https://github.com/fossas/fossa-cli/releases/download/v${FOSSA_VERSION}/fossa-cli_${FOSSA_VERSION}_linux_amd64.tar.gz" \
  && (cd /usr/local/bin && tar -xzvf /root/fossa.tar.gz fossa) \
  && chmod +x /usr/local/bin/fossa \
  && rm -f /root/fossa.tar.gz \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install Gomplate. Get versions from https://github.com/hairyhenderson/gomplate/releases
ARG GOMPLATE_VERSION="3.7.0"
ENV GOMPLATE_VERSION=${GOMPLATE_VERSION}
RUN wget -O /usr/local/bin/gomplate "https://github.com/hairyhenderson/gomplate/releases/download/v${GOMPLATE_VERSION}/gomplate_linux-amd64-slim" \
  && chmod +x /usr/local/bin/gomplate \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install docker-compose. Get versions from https://github.com/docker/compose/releases
ARG DOCKER_COMPOSE_VERSION="1.26.2"
ENV DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION}
RUN wget -O /usr/local/bin/docker-compose "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64" \
  && chmod +x /usr/local/bin/docker-compose \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install Podman. Get available versions by running the command `dnf list podman`
ARG PODMAN_VERSION="2.2.1"
ENV PODMAN_VERSION=${PODMAN_VERSION}
RUN dnf -y install podman-${PODMAN_VERSION} \
  && dnf clean all \
  && rm -rf /var/cache/yum/ \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install Skopeo. Get available versions by running the command `dnf list skopeo`
ARG SKOPEO_VERSION="1.2.0"
ENV SKOPEO_VERSION=${SKOPEO_VERSION}
RUN dnf -y install skopeo-${SKOPEO_VERSION} \
  && dnf clean all \
  && rm -rf /var/cache/yum/ \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

RUN useradd -ms /bin/bash anvil

USER anvil
WORKDIR /home/anvil

# Install asdf. Get versions from https://github.com/asdf-vm/asdf/releases
ARG ASDF_VERSION="0.8.0"
ENV ASDF_VERSION=${ASDF_VERSION}
# hadolint ignore=SC2016
RUN git clone --branch "v${ASDF_VERSION}" --depth 1 https://github.com/asdf-vm/asdf.git "${HOME}/.asdf" \
  && echo -e '\nsource $HOME/.asdf/asdf.sh' >> "${HOME}/.bashrc" \
  && echo -e '\nsource $HOME/.asdf/asdf.sh' >> "${HOME}/.profile" \
  && source "${HOME}/.asdf/asdf.sh" \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

ENV PATH="/home/anvil/.asdf/shims:/home/anvil/.asdf/bin:${PATH}"

# Install nodejs. Get versions using 'asdf list all nodejs'
ARG NODEJS_VERSION="12.18.3"
ENV NODEJS_VERSION=${NODEJS_VERSION}
RUN asdf plugin add nodejs \
  && bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring \
  && asdf install nodejs "${NODEJS_VERSION}" \
  && asdf global nodejs "${NODEJS_VERSION}" \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install python. Get versions using 'asdf list all python'
ARG PYTHON_VERSION="3.8.2"
ENV PYTHON_VERSION=${PYTHON_VERSION}
RUN asdf plugin add python \
  && asdf install python "${PYTHON_VERSION}" \
  && asdf global python "${PYTHON_VERSION}" \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install pipenv. Get versions using 'pip install pipenv=='
# NOTE: PIPENV_VERSION is an env var that is used by pipenv, so it can't be used here. ref: https://github.com/pypa/pipenv/issues/3633#issuecomment-478250721
ARG PIP_ENV_VERSION="2020.11.15"
ENV PIP_ENV_VERSION=${PIP_ENV_VERSION}
RUN pip install "pipenv==${PIP_ENV_VERSION}" \
  && asdf reshim python \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install pre-commit. Get versions using 'pip install pre-commit=='
ARG PRE_COMMIT_VERSION="2.7.1"
ENV PRE_COMMIT_VERSION=${PRE_COMMIT_VERSION}
RUN pip install "pre-commit==${PRE_COMMIT_VERSION}" \
  && asdf reshim python \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install aws cli. Get versions using pip install awscli=='
ARG AWS_CLI_VERSION="1.18.108"
ENV AWS_CLI_VERSION=${AWS_CLI_VERSION}
RUN pip install "awscli==${AWS_CLI_VERSION}" \
  && asdf reshim python \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install Java. Get versions using 'asdf list all java'
ARG JAVA_VERSION="adoptopenjdk-11.0.8+10"
ENV JAVA_VERSION=${JAVA_VERSION}
RUN asdf plugin add java \
  && asdf install java "${JAVA_VERSION}" \
  && asdf global java "${JAVA_VERSION}" \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install kubectl. Get versions using 'asdf list all kubectl'
# Note: It is very important to use the right version of kubectl for your kubernetes cluster.
# Kubernetes only supports a version skew of one minor version (older or newer) compared to the cluster.
# For example, if your cluster version is version 1.12, you should use kubectl version 1.11.X, 1.12.X, or 1.13.X.
# Multiple versions of kubectl are installed. You can choose which one to use by using 'asdf local kubectl X.Y.Z'.
# It will create a file called '.tool-versions' that asdf will look for.
# The env var KUBECTL_VERSION is used to set the global version of kubectl.
ARG KUBECTL_VERSION="1.18"
ENV KUBECTL_VERSION=${KUBECTL_VERSION}
RUN asdf plugin add kubectl \
  && asdf install kubectl "$(asdf list all kubectl 1.17 | tail -1)" \
  && asdf install kubectl "$(asdf list all kubectl 1.19 | tail -1)" \
  && asdf install kubectl "$(asdf list all kubectl 1.20 | tail -1)" \
  && asdf install kubectl "$(asdf list all kubectl ${KUBECTL_VERSION} | tail -1)" \
  && asdf global kubectl "$(asdf list all kubectl ${KUBECTL_VERSION} | tail -1)" \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install Helm. Get versions using 'asdf list all helm'.
# Note: Please don't use Helm 2. Friends don't let friends use Tiller.
ARG HELM_VERSION="3.2.4"
ENV HELM_VERSION=${HELM_VERSION}
RUN asdf plugin add helm \
  && asdf install helm "${HELM_VERSION}" \
  && asdf global helm "${HELM_VERSION}" \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install helm-diff plugin. Get versions from https://github.com/databus23/helm-diff/releases
ARG HELM_DIFF_VERSION="3.1.2"
ENV HELM_DIFF_VERSION=${HELM_DIFF_VERSION}
RUN helm plugin install https://github.com/databus23/helm-diff --version "${HELM_DIFF_VERSION}" \
  && asdf reshim helm \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install helm-git plugin. Get versions from https://github.com/aslafy-z/helm-git/releases
ARG HELM_GIT_VERSION="0.8.1"
ENV HELM_GIT_VERSION=${HELM_GIT_VERSION}
RUN helm plugin install https://github.com/aslafy-z/helm-git.git --version "${HELM_GIT_VERSION}" \
  && asdf reshim helm \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install helmfile. Get versions using 'asdf list all helmfile'.
ARG HELMFILE_VERSION="0.138.2"
ENV HELMFILE_VERSION=${HELMFILE_VERSION}
RUN asdf plugin add helmfile \
  && asdf install helmfile "${HELMFILE_VERSION}" \
  && asdf global helmfile "${HELMFILE_VERSION}" \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install Terraform. Get versions using 'asdf list all terraform'
ARG TERRAFORM_VERSION="0.12.29"
ENV TERRAFORM_VERSION=${TERRAFORM_VERSION}
RUN asdf plugin add terraform \
  && asdf install terraform "${TERRAFORM_VERSION}" \
  && asdf global terraform "${TERRAFORM_VERSION}" \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install terraform-docs. Get versions using 'asdf list all terraform-docs'
ARG TERRAFORM_DOCS_VERSION="0.9.1"
ENV TERRAFORM_DOCS_VERSION=${TERRAFORM_DOCS_VERSION}
RUN asdf plugin add terraform-docs \
  && asdf install terraform-docs "${TERRAFORM_DOCS_VERSION}" \
  && asdf global terraform-docs "${TERRAFORM_DOCS_VERSION}" \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install tflint. Get versions using 'asdf list all tflint'
ARG TFLINT_VERSION="0.18.0"
ENV TFLINT_VERSION=${TFLINT_VERSION}
RUN asdf plugin add tflint \
  && asdf install tflint "${TFLINT_VERSION}" \
  && asdf global tflint "${TFLINT_VERSION}" \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install tfsec. Get versions using 'asdf list all tfsec'
ARG TFSEC_VERSION="0.24.1"
ENV TFSEC_VERSION=${TFSEC_VERSION}
RUN asdf plugin add tfsec \
  && asdf install tfsec "${TFSEC_VERSION}" \
  && asdf global tfsec "${TFSEC_VERSION}" \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install Apache Maven.  Get versions using 'asdf list all maven'
ARG MAVEN_VERSION="3.6.3"
ENV MAVEN_VERSION=${MAVEN_VERSION}
RUN asdf plugin add maven \
  && asdf install maven "${MAVEN_VERSION}" \
  && asdf global maven "${MAVEN_VERSION}" \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install chart-releaser. Get versions using 'asdf list all helm-cr'
ARG CHART_RELEASER_VERSION="1.1.1"
ENV CHART_RELEASER_VERSION=${CHART_RELEASER_VERSION}
RUN asdf plugin add helm-cr \
  && asdf install helm-cr "${CHART_RELEASER_VERSION}" \
  && asdf global helm-cr "${CHART_RELEASER_VERSION}" \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install golang. Get versions using 'asdf list all golang'
ARG GO_VERSION="1.15.6"
ENV GO_VERSION=${GO_VERSION}
RUN asdf plugin-add golang https://github.com/kennyp/asdf-golang.git \
  && asdf install golang "${GO_VERSION}" \
  && asdf global golang "${GO_VERSION}" \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*
ENV GOPATH="/home/anvil/go"
ENV PATH="${PATH}:${GOPATH}/bin"

# Install golangci-lint. Get versions using asdf list all golangci-lint
ARG GOLANGCI_LINT_VERSION="1.34.1"
ENV GOLANGCI_LINT_VERSION=${GOLANGCI_LINT_VERSION}
RUN asdf plugin add golangci-lint https://github.com/hypnoglow/asdf-golangci-lint.git \
  && asdf install golangci-lint "${GOLANGCI_LINT_VERSION}" \
  && asdf global golangci-lint "${GOLANGCI_LINT_VERSION}" \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install goreleaser. Get versions using 'asdf list all goreleaser'
ARG GORELEASER_VERSION="0.151.1"
ENV GORELEASER_VERSION=${GORELEASER_VERSION}
RUN asdf plugin-add goreleaser https://github.com/kforsthoevel/asdf-goreleaser.git \
  && asdf install goreleaser "${GORELEASER_VERSION}" \
  && asdf global goreleaser "${GORELEASER_VERSION}" \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install golint. "go get" doesn't really support specifying versions, so we just get the latest
RUN go get -u golang.org/x/lint/golint \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install gocyclo. "go get" doesn't really support specifying versions, so we just get the latest
RUN go get -u github.com/fzipp/gocyclo/cmd/gocyclo \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Install gocritic. "go get" doesn't really support specifying versions, so we just get the latest
RUN go get -u github.com/go-critic/go-critic/cmd/gocritic \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

ARG SONARSCANNER_VERSION="4.6.0.2311"
ENV SONARSCANNER_VERSION=${SONARSCANNER_VERSION}
RUN asdf plugin-add sonarscanner https://github.com/virtualstaticvoid/asdf-sonarscanner.git \
  && asdf install sonarscanner "${SONARSCANNER_VERSION}" \
  && asdf global sonarscanner "${SONARSCANNER_VERSION}" \
  && rm -rf /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

# Support tools installed as anvil when running as root user
USER root
ENV ASDF_DATA_DIR="/home/anvil/.asdf"
RUN cp /home/anvil/.tool-versions /root/.tool-versions
ENV HELM_PLUGINS="/home/anvil/.local/share/helm/plugins"
ENV HELM_REGISTRY_CONFIG="/home/anvil/.config/helm/registry.json"
ENV HELM_REPOSITORY_CACHE="/home/anvil/.cache/helm/repository"
ENV HELM_REPOSITORY_CONFIG="/home/anvil/.config/helm/repositories.yaml"
USER anvil

CMD ["/bin/bash"]
