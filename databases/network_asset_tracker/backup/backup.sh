#!/bin/bash
pg_dump -U postgres asset_db > backups/asset_backup_$(date +%F).sql