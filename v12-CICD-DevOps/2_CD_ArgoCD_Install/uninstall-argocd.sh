#!/bin/bash

set -e

echo "========================================="
echo "   REMOVING ARGO CD COMPLETELY"
echo "========================================="

echo "[1/5] Deleting Argo CD resources..."

kubectl delete -n argocd \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml \
  --ignore-not-found \
  --timeout=120s || true

echo "[2/5] Deleting argocd namespace..."

kubectl delete namespace argocd \
  --ignore-not-found \
  --timeout=120s || true

echo "[3/5] Deleting Argo CD CRDs..."

kubectl get crd -o name 2>/dev/null \
  | grep 'argoproj.io' \
  | xargs -r kubectl delete || true

echo "[4/5] Deleting Argo CD ClusterRoles..."

kubectl get clusterrole -o name 2>/dev/null \
  | grep -i argocd \
  | xargs -r kubectl delete || true

echo "[5/5] Deleting Argo CD ClusterRoleBindings..."

kubectl get clusterrolebinding -o name 2>/dev/null \
  | grep -i argocd \
  | xargs -r kubectl delete || true

echo ""
echo "========================================="
echo "   VERIFICATION"
echo "========================================="

echo ""
echo "--- Namespace ---"
kubectl get namespace argocd 2>/dev/null || echo "OK: argocd namespace removed"

echo ""
echo "--- CRDs ---"
kubectl get crd 2>/dev/null | grep 'argoproj.io' || echo "OK: Argo CD CRDs removed"

echo ""
echo "--- ClusterRoles ---"
kubectl get clusterrole 2>/dev/null | grep -i argocd || echo "OK: Argo CD ClusterRoles removed"

echo ""
echo "--- ClusterRoleBindings ---"
kubectl get clusterrolebinding 2>/dev/null | grep -i argocd || echo "OK: Argo CD ClusterRoleBindings removed"

echo ""
echo "========================================="
echo "   ARGO CD CLEANUP COMPLETED"
echo "========================================="
