# Copyright 2016 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM centos
RUN yum -y install /usr/bin/ps nfs-utils && yum clean all
ADD run_nfs.sh /usr/local/bin/

# mark /exports as a mount point
VOLUME ["/exports"]
# expose mountd 20048/tcp and nfsd 2049/tcp
EXPOSE 111/tcp 111/udp 2049/tcp 2049/udp 20048/tcp

ENTRYPOINT ["/usr/local/bin/run_nfs.sh"]
CMD ["/exports/data-0", "/exports/data-1", "/exports/data-2", "/exports/data-3", "/exports/data-4", "/exports/data-5", "/exports/data-6", "/exports/data-7", "/exports/data-8", "/exports/data-9"]
