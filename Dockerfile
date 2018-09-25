FROM busybox
COPY govuk/email/ /aareon_theme/email/
COPY govuk/login/ /aareon_theme/login/

LABEL com.aareon.kubernetes.keycloak.themes.docker.version="0.0.1"