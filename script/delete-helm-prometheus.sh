helm delete prometheus -n monitor

kubectl delete secret prometheus-kube-prometheus-admission prometheus-tls -n monitor

kubectl delete pvc prometheus-prometheus-kube-prometheus-prometheus-db-prometheus-prometheus-kube-prometheus-prometheus-0 -n  monitor
kubectl delete alertmanagerconfigs --all -n monitor
kubectl delete alertmanagers --all -n monitor
kubectl delete probes --all -n monitor
kubectl delete prometheuses --all -n monitor
kubectl delete prometheusrules --all -n monitor
kubectl delete servicemonitors --all -n monitor
kubectl delete thanosrulers --all -n monitor
kubectl delete podmonitors --all -n monitor

kubectl delete crd alertmanagerconfigs.monitoring.coreos.com -n monitor
kubectl delete crd alertmanagers.monitoring.coreos.com -n monitor
kubectl delete crd probes.monitoring.coreos.com -n monitor
kubectl delete crd prometheuses.monitoring.coreos.com -n monitor
kubectl delete crd prometheusrules.monitoring.coreos.com -n monitor
kubectl delete crd servicemonitors.monitoring.coreos.com -n monitor
kubectl delete crd thanosrulers.monitoring.coreos.com -n monitor
kubectl delete crd podmonitors.monitoring.coreos.com -n monitor


