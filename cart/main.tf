terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}


data "kubectl_file_documents" "cart" {
  content = file("pod.yaml")
}

#resource "kubectl_manifest" "test" {
#  for_each  = data.kubectl_file_documents.cart.manifests
#  yaml_body = each.value
#}

resource "null_resource" "name" {
  count = length(data.kubectl_file_documents.cart.manifests)
}