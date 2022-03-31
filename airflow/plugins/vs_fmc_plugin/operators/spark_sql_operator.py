from airflow.models import BaseOperator
from airflow.utils.decorators import apply_defaults
from vs_fmc_plugin.hooks.spark_sql_hook import SparkSqlHook


class SparkSqlOperator(BaseOperator):
    """
    Execute Spark SQL query

    :param sql: The SQL query to execute. (templated)
    :type sql: str
    :param conn_id: connection_id string
    :type conn_id: str
    :param name: Name of the job
    :type name: str
    :param verbose: Whether to pass the verbose flag to spark-sql
    :type verbose: bool
    """

    template_fields = ["_sql"]

    template_ext = [".sql", ".hql"]

    @apply_defaults
    def __init__(self,
                 sql,
                 spark_conn_id='spark_sql_default',
                 name=None,
                 verbose=True,
                 *args,
                 **kwargs):
        super(SparkSqlOperator, self).__init__(*args, **kwargs)
        self._sql = sql
        self._conn_id = spark_conn_id
        self._name = name or self.task_id
        self._verbose = verbose
        self._hook = None

    def execute(self, context):
        """
        Call the SparkSqlHook to run the provided sql query
        """
        self._hook = SparkSqlHook(sql=self._sql,
                                  conn_id=self._conn_id,
                                  name=self._name,
                                  verbose=self._verbose
                                  )
        self._hook.run()

    def on_kill(self):
        self._hook.kill()
