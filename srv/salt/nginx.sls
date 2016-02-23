include:
  - users

nginx.package:
  pkg.installed:
    - pkgs:
      - nginx
    - require:
      - user: nexus-user
  service.running:
    - name: nginx
    - watch:
      - pkg: nginx.package
      - file: /etc/nginx/sites-enabled/jenkins.conf
      - file: /etc/nginx/sites-enabled/nexus.conf
    - require:
      - file: jenkins-config
      - file: nexus-config
remove-default-sites:
  file.absent:
    - name: /etc/nginx/sites-enabled/default
    - require:
      - pkg: nginx.package

nexus-config:
  file.managed:
    - name: /etc/nginx/sites-enabled/nexus.conf
    - source: salt://nginx/nexus.conf
    - group: build
    - user: nexus-user
    - mode: 640

jenkins-config:
  file.managed:
    - name: /etc/nginx/sites-enabled/jenkins.conf
    - source: salt://nginx/jenkins.conf
    - user: nexus-user
    - group: build
    - mode: 640
