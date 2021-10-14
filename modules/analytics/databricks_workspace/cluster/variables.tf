variable "settings" {}
variable "global_settings" {
  description = "Global settings object (see module README.md)"
}
variable "tags" {
  description = "(Required) Map of tags to be applied to the resource"
  type        = map(any)
}