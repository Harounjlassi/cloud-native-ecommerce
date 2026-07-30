{{- define "my-app.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{- define "my-app.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name -}}
{{- end -}}
