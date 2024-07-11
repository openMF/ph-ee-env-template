{{- define "common.resourceTemplate" -}}
resources:
  {{- toYaml .Values.resources | nindent 2 }}
{{- end -}}

{{- define "common.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end -}}

{{- define "common.labels" -}}
app.kubernetes.io/name: {{ include "common.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "common.selectorLabels" -}}
app.kubernetes.io/name: {{ include "common.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
