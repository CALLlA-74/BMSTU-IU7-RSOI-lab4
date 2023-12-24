{{- define "configmap.template" }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .ctx.Release.Name }}-configmap
  labels:
    app.kubernetes.io/name: {{ .Release.Name }}-configmap
    app.kubernetes.io/version: "{{ .Values.version }}"
    app.kubernetes.io/component: application
    app.kubernetes.io/part-of: simple-backend
    app.kubernetes.io/managed-by: helm
data:
{{- end }}