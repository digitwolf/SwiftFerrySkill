##
# Copyright IBM Corporation 2016
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##

# Builds a Docker image with all the dependencies for compiling and running the Server sample application.

FROM swiftdocker/swift:latest
MAINTAINER IBM Swift Engineering at IBM Cloud
LABEL Description="Docker image for building and running the Server sample application."

RUN apt-get update && apt-get install -y \
  openssl \
  libssl-dev 

# Expose default port for Kitura
EXPOSE 8080

RUN mkdir /root/Server

ADD Sources /root/Server
ADD Package.swift /root/Server
ADD LICENSE /root/Server
ADD .swift-version /root/Server

RUN cd /root/Server && swift build

USER root
#CMD ["/root/Server/.build/debug/Server"]
CMD [ "sh", "-c", "cd /root/Server && .build/debug/Server" ]
