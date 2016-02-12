include:
  - tools
  - users

nexus-server:
  archive.extracted:
    - name: /srv/nexus
    - source: http://www.sonatype.org/downloads/nexus-latest-bundle.zip
    - source_hash: sha1=e082f4ee8fea2eb7351d522ae304bfdbe05b7efe
    - archive_format: zip 
    - require:
      - pkg: install-unzip
    - user: nexus-user
    - group: build

run-nexus:
  cmd.run:
    - name: /srv/nexus/nexus-2.12.0-01/bin/nexus start
    - require:
      - archive: nexus-server
      - user: nexus-user
    - user: nexus-user
    - group: build
