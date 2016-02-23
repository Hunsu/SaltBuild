base:
  pkgrepo.managed:
    - humanname: Jenkins Repo
    - name: deb http://pkg.jenkins-ci.org/debian binary/
    - key_url: https://jenkins-ci.org/debian/jenkins-ci.org.key
    - file: /etc/apt/sources.list.d/jenkins.list
    - require_in:
      - pkg: jenkins

jenkins:
  pkg.installed:
    - fromrepo: Jenkins Repo
