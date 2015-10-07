FROM registry.scc.suse.de/sles12_base

RUN zypper --non-interactive --gpg-auto-import-keys ar \
 http://clouddata.cloud.suse.de/repos/SLES12-GA-Pool/ sles12ga

RUN zypper --non-interactive --gpg-auto-import-keys ar \
 http://clouddata.cloud.suse.de/repos/SLES12-GA-Updates/ sles12gaup

RUN zypper --non-interactive --gpg-auto-import-keys ar \
 http://download.opensuse.org/repositories/devel:/languages:/ruby:/extensions/SLE_12/ ruby_ext

RUN zypper --non-interactive --gpg-auto-import-keys ar \
 http://download.suse.de/ibs/Devel:/SCC/SLE_12/ devel_scc
 
RUN zypper --non-interactive --gpg-auto-import-keys ref
RUN zypper --non-interactive --gpg-auto-import-keys in ruby2.1-rubygem-thin\
 ruby2.1-rubygem-sinatra\
 ruby2.1-rubygem-bundler\
 ruby2.1-rubygem-slim

ADD . /app
WORKDIR /app

EXPOSE 3000

CMD thin start
