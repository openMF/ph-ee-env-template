{{- define "common.ingress.apiversion" -}}
apiVersion: networking.k8s.io/v1
{{- end -}}

{{- define "common.ingress.metadata" -}}
metadata:
  name: {{ include "common.names.fullname" . }}
  labels:
    app: {{ .Chart.Name | quote }}
    release: {{ .Release.Name | quote }}
  {{- with .Values.ingress.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end -}}

{{- define "common.ingress.spec" -}}
spec:
  {{- if .Values.ingress.className }}
  ingressClassName: {{ .Values.ingress.className | quote }}
  {{- end }}
  {{- if .Values.ingress.tls }}
  tls:
    {{- range $tls := .Values.ingress.tls }}
    - hosts:
      {{- range $host := $tls.hosts }}
        - {{ $host | quote }}
      {{- end }}
      secretName: {{ $tls.secretName | quote }}
    {{- end }}
  {{- end }}
  rules:
    {{- range .Values.ingress.hosts }}
    - host: {{ .host | quote }}
      http:
        paths:
          {{- range .paths }}
          - path: {{ .path | quote }}
            pathType: {{ $.Values.ingress.pathtype | default "ImplementationSpecific" | quote }}
            backend:
              service:
                name: {{ .backend.service.name | quote }}
                port:
                  number: {{ .backend.service.port.number }}
          {{- end }}
    {{- end }}
{{- end -}}
