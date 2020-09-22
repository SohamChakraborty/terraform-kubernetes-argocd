resource "kubernetes_config_map" "argocd_redis_ha_configmap" {
  metadata {
    name = "argocd-redis-ha-configmap"
    labels = merge({
      "app.kubernetes.io/name" : "argocd-redis-ha"
      "app.kubernetes.io/component" : "redis"
      "app.kubernetes.io/part-of" : "argocd"
    }, var.labels)
  }
  data = {
    haproxy.cfg     = templatefile(file("${path.module}/configuration-files/haproxy.cfg"), {})
    haproxy_init.sh = templatefile(file("${path.module}/configuration-files/haproxy_init.sh"), {})
    init.sh         = templatefile(file("${path.module}/configuration-files/init.sh"), {})
    redis.conf      = templatefile(file("${path.module}/configuration-files/redis.conf"), {})
    sentinel.conf   = templatefile(file("${path.module}/configuration-files/sentinel.conf"), {})
  }
}

resource "kubernetes_config_map" "argocd_cm" {
  metadata {
    name = "argocd-cm"
    labels = merge({
      "app.kubernetes.io/name" : "argocd-cm"
      "app.kubernetes.io/part-of" : "argocd"
    }, var.labels)
  }
}

resource "kubernetes_config_map" "argocd_gpg_keys_cm" {
  metadata {
    name = "argocd-gpg-keys-cm"
    labels = merge({
      "app.kubernetes.io/name" : "argocd-gpg-keys-cm"
      "app.kubernetes.io/part-of" : "argocd"
    }, var.labels)
  }
}

resource "kubernetes_config_map" "argocd_rbac_cm" {
  metadata {
    name = "argocd-rbac-cm"
    labels = merge({
      "app.kubernetes.io/name" : "argocd-rbac-cm"
      "app.kubernetes.io/part-of" : "argocd"
    }, var.labels)
  }
}

resource "kubernetes_config_map" "argocd_ssh_known_hosts_cm" {
  metadata {
    name = "argocd-ssh-known-hosts-cm"
    labels = merge({
      "app.kubernetes.io/name" : "argocd-ssh-known-hosts-cm"
      "app.kubernetes.io/part-of" : "argocd"
    }, var.labels)
  }
  data = {
    ssh_known_hosts = templatefile(file("${path.module}/configuration-files/ssh_known_hosts"), {})
  }
}

resource "kubernetes_config_map" "argocd_tls_certs_cm" {
  metadata {
    name = "argocd-tls-certs-cm"
    labels = merge({
      "app.kubernetes.io/name" : "argocd-tls-certs-cm"
      "app.kubernetes.io/part-of" : "argocd"
    }, var.labels)
  }
  data = null
}