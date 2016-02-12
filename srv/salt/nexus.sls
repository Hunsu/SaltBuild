include:
  - tools

nexus-server:
  archive.extracted:
    - name: /srv/nexus
    - source: http://www.sonatype.org/downloads/nexus-latest-bundle.zip
    - source_hash: sha1=e082f4ee8fea2eb7351d522ae304bfdbe05b7efe
    - archive_format: zip 
    - require:
      - pkg: install-unzip
run-nexus:
  cmd.wait:
    - watch: 
      - archive: nexus-server
    - cwd: /srv/nexus/nexus-2.12.0-01-bundle/bin
    - name: nexus start
