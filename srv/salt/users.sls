nexus-user:
  user.present:
    - fullname: nexus
    - home: /home/nexus
    - shell: /bin/bash
    - groups:
      - build
      - nexus
    - uid: 4000
    - gid: 4000
    - require:
      - group: nexus
      - group: build

nexus:
  group.present:
    - gid: 4000
    - system: True
build:  
  group.present:
    - gid: 5000
    - system: True

