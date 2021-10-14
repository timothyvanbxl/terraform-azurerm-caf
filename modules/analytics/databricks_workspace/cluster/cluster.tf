resource "databricks_cluster" "cluster" {
  cluster_name            = var.settings.cluster_name
  spark_version           = var.settings.spark_version                    #"8.2.x-scala2.12"
  node_type_id            = var.settings.node_type_id                     #"Standard_DS3_v2"
  autotermination_minutes = try(var.settings.autotermination_minutes, 30) # 30
  is_pinned               = try(var.settings.is_pinned, true)
  num_workers             = try(var.settings.num_workers, 2)
  spark_conf = {
    "spark.master"                           = "local[*]"
    "spark.databricks.cluster.profile"       = "serverless"
    "spark.databricks.repl.allowedLanguages" = "sql,python,r,scala"
    "spark.databricks.cluster.profile"       = "singleNode"
  }
  spark_env_vars = {
    "env" = var.settings.environment
  }
}