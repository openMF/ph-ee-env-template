{{- define "common.ingress" -}}
{{- $ingress := . -}}
{{- $pathtype := $ingress.Values.ingress.pathtype | default "ImplementationSpecific" -}}
{{- $ingressPath := $ingress.Values.ingress.path | default "/" -}}
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ $ingress.Values.ingress.name | default $ingress.Chart.Name }}
  labels:
    app: {{ $ingress.Chart.Name }}
    release: {{ $ingress.Release.Name }}
    heritage: {{ $ingress.Release.Service }}
  {{- with $ingress.Values.ingress.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  {{- if $ingress.Values.ingress.className }}
  ingressClassName: {{ $ingress.Values.ingress.className | quote }}
  {{- end }}
  {{- if $ingress.Values.ingress.tls }}
  tls:
    {{- range $tls := $ingress.Values.ingress.tls }}
    - hosts:
      {{- range $host := $tls.hosts }}
        - {{ $host }}
      {{- end }}
      secretName: {{ $tls.secretName }}
    {{- end }}
  {{- end }}
  rules:
    {{- range $host := $ingress.Values.ingress.hosts }}
    - host: {{ $host.host }}
      http:
        paths:
          {{- range $path := $host.paths }}
          - path: {{ $path.path }}
            pathType: {{ $pathtype }}
            backend:
              service:
                name: {{ $path.backend.service.name }}
                port:
                  number: {{ $path.backend.service.port.number }}
          {{- end }}
{{- end }}
{{- end -}}
