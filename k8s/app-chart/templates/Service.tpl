{{- define "service.template" }}
apiVersion: v1
kind: Service
metadata:
  name: {{.service.name}}
spec:
  selector:
    app: {{.service.name}}
  ports:
    - protocol: TCP
      port: {{.service.port}}
      targetPort: {{.service.targetPort}}
  type: NodePort
{{- end }}
