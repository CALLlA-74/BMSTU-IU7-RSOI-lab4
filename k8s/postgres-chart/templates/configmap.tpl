{{- define "configmap.template" }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .ctx.Release.Name }}-configmap-{{ .service.name }}
  labels:
    app.kubernetes.io/name: {{ .ctx.Release.Name }}-configmap-{{ .service.name }}
    app.kubernetes.io/version: "{{ .ctx.Values.version }}"
    app.kubernetes.io/component: application
    app.kubernetes.io/part-of: simple-backend
    app.kubernetes.io/managed-by: helm
data: 
	{{ .service.name }}-init-db.sql: {{ .{{ .service.name }}-init-db.sql }}
{{- end }}
