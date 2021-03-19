[app:main]
use = egg:ckan
## Database Settings
sqlalchemy.url = postgresql://ckan_user:ckan_password@postgres_host/ckan_database

## Site Settings
ckan.site_url = http://ckan.site.url

ckan.storage_path = /var/lib/ckan
