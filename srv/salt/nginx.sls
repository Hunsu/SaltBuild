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
      - file: /etc/nginx/sites-available/jenkins.conf
    - require:
      - file: jenkins-config
 
remove-default-sites:
  file.absent:
    - name: /etc/nginx/sites-available/default
    - require:
      - pkg: nginx.package

jenkins-config:
  file.managed:
    - name: /etc/nginx/sites-available/jenkins.conf
    - source: salt://nginx/jenkins.conf
    - user: nexus-user
    - group: build
    - mode: 640
