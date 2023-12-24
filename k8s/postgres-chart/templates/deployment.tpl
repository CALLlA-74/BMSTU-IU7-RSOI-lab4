{{- define "deployment.template" }}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .ctx.Release.Name }}-{{.service.name}}-dep
  labels:
    app: {{ .ctx.Release.Name }}-{{.service.name}}
spec:
  replicas: {{.service.replicaCount}}
  selector:
    matchLabels:
      app: {{ .ctx.Release.Name }}-{{.service.name}}
  template:
    metadata:
      name: {{ .ctx.Release.Name }}-{{.service.name}}
      labels:
        app: {{ .ctx.Release.Name }}-{{.service.name}}
    spec:
      containers:
        - name: {{ .ctx.Release.Name }}-{{.service.name}}
          image: "library/postgres:{{ .Values.version }}-alpine"
          imagePullPolicy: IfNotPresent
          env:
            - name: POSTGRES_USER
              value: {{ .Values.default_database.user }}
			- name: POSTGRES_PASSWORD
              value: {{ .Values.default_database.password }}
			- name: POSTGRES_DB
              value: {{.service.name}}
		  resources:
            requests:
              memory: "{{ .Values.resources.requests.memory }}"
              cpu: "{{ .Values.resources.requests.cpu }}"
            limits:
              memory: "{{ .Values.resources.limits.memory }}"
              cpu: "{{ .Values.resources.limits.cpu }}"
		  ports:
            - name: {{.service.name}}
              containerPort: {{ .Values.port }}
              hostPort: {{ .service.hostPort }}
          volumeMounts:
            - name: db-{{.service.name}}
              mountPath: /var/lib/postgresql/data
            - name: postgres-config-map
              mountPath: /docker-entrypoint-initdb.d/init_db.sql
      restartPolicy: Always
	  
	  volumes:
        - name: db-{{.service.name}}
        - name: postgres-config-map
          configMap:
            name: {{ .ctx.Release.Name }}-configmap
{{- end}}