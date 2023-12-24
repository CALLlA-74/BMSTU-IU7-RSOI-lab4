{{- define "service.template" }}
apiVersion: v1
kind: Service
metadata:
  name: {{.ctx.Release.Name}}-{{.service.name}}-service
spec:
  selector:
    app: {{.ctx.Release.Name}}-{{.service.name}}
  ports:
    - protocol: TCP
      port: 5432
      targetPort: 5432
  type: NodePort
{{- end }}