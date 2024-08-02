data "kubectl_file_documents" "cart" {
  content = file("pod.yaml")
}

resource "kubectl_manifest" "test" {
  for_each  = data.kubectl_file_documents.cart.manifests
  yaml_body = each.value
}