{{- define "service.template" }}
apiVersion: v1
kind: Service
metadata:
  name: {{.ctx.Release.Name}}-{{.service.name}}-service
spec:
  selector:
    app: {{.ctx.Release.Name}}-{{.service.name}}
    app.kubernetes.io/version: "{{ .ctx.Values.version }}"
    app.kubernetes.io/component: database
    app.kubernetes.io/part-of: simple-backend
    app.kubernetes.io/managed-by: helm
  ports:
    - protocol: TCP
      port: 5432
      targetPort: 5432
{{- end }}