#
# Copyright 2019 gdeignacio.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
# Pull base image
# ---------------

FROM postgres:9.5-alpine

# Maintainer
# ----------

MAINTAINER Guillermo De Ignacio <gdeignacio@gmail.com>

# Environment variables required for this build (do NOT change)
# -------------------------------------------------------------

ENV  PGTABLESPACES $PGDATA/tablespaces

# Copy files needed during database creation
# -------------

COPY ./00_initdb.sh /docker-entrypoint-initdb.d/
COPY ./initdb.d/ /docker-entrypoint-initdb.d/initdb.d/

# Define default entrypoint 

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432
CMD ["postgres"]