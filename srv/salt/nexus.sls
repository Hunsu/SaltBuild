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

manage-nexus:
  file.managed:
    - name: /srv/nexus/nexus-2.12.0-01/bin/nexus
    - user: nexus-user
    - group: build
    - mode: 555
    - require:
      - archive: nexus-server

run-nexus:
  cmd.run:
    - cwd: /srv/nexus/nexus-2.12.0-01/bin
    - name: /srv/nexus/nexus-2.12.0-01/bin/nexus start
    - require:
      - archive: nexus-server
      - user: nexus-user
      - file: manage-nexus
    - user: nexus-user
    - group: build
    - unless: /srv/nexus/nexus-2.12.0-01/bin/nexus
