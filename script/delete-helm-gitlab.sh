
 helm delete  gitlab -n gitlab
 kubectl delete PodDisruptionBudget --all -n gitlab
 kubectl delete HorizontalPodAutoscaler --all -n gitlab
 kubectl delete pvc --all -n gitlab
