
{{- define "common.resourceTemplate" -}}
resources:
  {{- toYaml .Values.resources | nindent 2 }}
{{- end -}}


{{- define "common.imagepullpolicy" -}}
imagePullPolicy: {{ .Values.imagePullPolicy | default "IfNotPresent" }} 
{{- end -}}


{{- define "common.labels" -}}
app.kubernetes.io/name: {{ include "common.names.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "common.selectorLabels" -}}
app.kubernetes.io/name: {{ include "common.names.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
