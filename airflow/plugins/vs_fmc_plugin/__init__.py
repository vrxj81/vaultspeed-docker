from airflow.plugins_manager import AirflowPlugin
from flask_admin.base import MenuLink

vaultspeed_menu_item = {"name": "Generate code with Vaultspeed",
                        "category": "Vaultspeed",
                        "category_icon": "fa-th",
                        "href": "https://app.vaultspeed.com/flow-management-control"}

docs_menu_item = {"name": "Vaultspeed Documentation",
                  "category": "Vaultspeed",
                  "category_icon": "fa-th",
                  "href": "https://vaultspeed.atlassian.net/l/c/XRsJz0Vx"}

vaultspeed_menu_link = MenuLink(
    category='Vaultspeed',
    name='Generate code with Vaultspeed',
    url='https://app.vaultspeed.com/flow-management-control'
)
docs_menu_link = MenuLink(
    category='Vaultspeed',
    name='Vaultspeed Documentation',
    url='https://vaultspeed.atlassian.net/l/c/XRsJz0Vx'
)


class VsFmcPlugin(AirflowPlugin):
    name = "vs_fmc_plugin"
    appbuilder_menu_items = [vaultspeed_menu_item, docs_menu_item]
    menu_links = [vaultspeed_menu_link, docs_menu_link]


def get_provider_info():
    return {
        "package-name": "airflow-provider-vaultspeed",
        "name": "Vaultspeed Provider",
        "description": "A Vaultspeed provider for Apache Airflow.",
        "hook-class-names": ["vs_fmc_plugin.hooks.odi_hook.OdiHook", "vs_fmc_plugin.hooks.talend_hook.TalendHook",
                             "vs_fmc_plugin.hooks.kafka_hook.KafkaHook", "vs_fmc_plugin.hooks.spark_sql_hook.SparkSqlHook",
                             "vs_fmc_plugin.hooks.matillion_hook.MatillionHook"],
        "versions": ["4.2.6.0"]
    }
