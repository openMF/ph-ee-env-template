#!/usr/bin/env python3
"""
Import Kibana Saved Objects (Dashboards, Visualizations, etc.)

This script imports all .ndjson files from the Kibana Visualisations directory
into your running Kibana instance.

Usage:
    python import-saved-objects.py

Environment Variables:
    KIBANA_URL: URL of your Kibana instance (default: https://kibana.mifos.gazelle.localhost)
    KIBANA_USERNAME: Username for Kibana (optional, for basic auth)
    KIBANA_PASSWORD: Password for Kibana (optional, for basic auth)
"""

import requests
import logging
import os
import sys
import glob
from pathlib import Path

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Configuration
KIBANA_URL = os.environ.get("KIBANA_URL", "https://kibana.mifos.gazelle.localhost")
KIBANA_USERNAME = os.environ.get("KIBANA_USERNAME", "")
KIBANA_PASSWORD = os.environ.get("KIBANA_PASSWORD", "")
VERIFY_SSL = False  # Set to True if using valid SSL certificates

# Ensure KIBANA_URL ends with /
if not KIBANA_URL.endswith('/'):
    KIBANA_URL += '/'

# Import order matters - index patterns must be imported first
IMPORT_ORDER = [
    "index-pattern",
    "search",
    "visualization",
    "lens",
    "dashboard",
]


def import_ndjson_file(file_path):
    """
    Import a single .ndjson file to Kibana

    Args:
        file_path: Path to the .ndjson file

    Returns:
        Response object from Kibana API
    """
    url = f"{KIBANA_URL}api/saved_objects/_import"

    headers = {
        "kbn-xsrf": "true",
    }

    # Add basic auth if credentials provided
    auth = None
    if KIBANA_USERNAME and KIBANA_PASSWORD:
        auth = (KIBANA_USERNAME, KIBANA_PASSWORD)

    try:
        with open(file_path, 'rb') as f:
            files = {'file': (os.path.basename(file_path), f, 'application/ndjson')}

            # Use overwrite=true to replace existing objects
            params = {'overwrite': 'true'}

            response = requests.post(
                url,
                headers=headers,
                files=files,
                params=params,
                auth=auth,
                verify=VERIFY_SSL
            )

            return response

    except FileNotFoundError:
        logger.error(f"File not found: {file_path}")
        return None
    except Exception as e:
        logger.error(f"Error importing {file_path}: {e}")
        return None


def import_all_visualizations(base_dir):
    """
    Import all visualization files in the correct order

    Args:
        base_dir: Base directory containing visualization folders
    """
    base_path = Path(base_dir)

    if not base_path.exists():
        logger.error(f"Directory not found: {base_dir}")
        return False

    success_count = 0
    error_count = 0

    logger.info(f"Starting import from: {base_dir}")
    logger.info(f"Target Kibana: {KIBANA_URL}")
    logger.info("=" * 70)

    # Import in specific order
    for obj_type in IMPORT_ORDER:
        type_dir = base_path / obj_type

        if type_dir.exists() and type_dir.is_dir():
            logger.info(f"\n📁 Importing {obj_type}...")

            ndjson_files = sorted(type_dir.glob("*.ndjson"))

            for ndjson_file in ndjson_files:
                logger.info(f"  ⏳ Importing: {ndjson_file.name}")

                response = import_ndjson_file(str(ndjson_file))

                if response and response.status_code == 200:
                    result = response.json()
                    if result.get('success'):
                        logger.info(f"  ✅ Success: {ndjson_file.name}")
                        success_count += 1
                    else:
                        logger.warning(f"  ⚠️  Partial success: {ndjson_file.name}")
                        logger.warning(f"     Response: {result}")
                        success_count += 1
                else:
                    logger.error(f"  ❌ Failed: {ndjson_file.name}")
                    if response:
                        logger.error(f"     Status: {response.status_code}")
                        logger.error(f"     Response: {response.text}")
                    error_count += 1

    # Import root-level .ndjson files
    logger.info(f"\n📁 Importing root-level objects...")
    root_ndjson_files = sorted(base_path.glob("*.ndjson"))

    for ndjson_file in root_ndjson_files:
        logger.info(f"  ⏳ Importing: {ndjson_file.name}")

        response = import_ndjson_file(str(ndjson_file))

        if response and response.status_code == 200:
            result = response.json()
            if result.get('success'):
                logger.info(f"  ✅ Success: {ndjson_file.name}")
                success_count += 1
            else:
                logger.warning(f"  ⚠️  Partial success: {ndjson_file.name}")
                success_count += 1
        else:
            logger.error(f"  ❌ Failed: {ndjson_file.name}")
            if response:
                logger.error(f"     Status: {response.status_code}")
            error_count += 1

    logger.info("\n" + "=" * 70)
    logger.info(f"Import complete!")
    logger.info(f"✅ Successful: {success_count}")
    logger.info(f"❌ Failed: {error_count}")

    return error_count == 0


def test_kibana_connection():
    """Test if Kibana is accessible"""
    try:
        auth = None
        if KIBANA_USERNAME and KIBANA_PASSWORD:
            auth = (KIBANA_USERNAME, KIBANA_PASSWORD)

        response = requests.get(
            f"{KIBANA_URL}api/status",
            verify=VERIFY_SSL,
            auth=auth,
            timeout=10
        )

        if response.status_code == 200:
            logger.info(f"✅ Kibana is accessible at {KIBANA_URL}")
            return True
        else:
            logger.error(f"❌ Kibana returned status code: {response.status_code}")
            return False

    except requests.exceptions.ConnectionError:
        logger.error(f"❌ Cannot connect to Kibana at {KIBANA_URL}")
        logger.error("   Make sure Kibana is running and accessible")
        return False
    except Exception as e:
        logger.error(f"❌ Error connecting to Kibana: {e}")
        return False


if __name__ == "__main__":
    # Get the directory where this script is located
    script_dir = Path(__file__).parent

    logger.info("Kibana Saved Objects Import Tool")
    logger.info("=" * 70)

    # Test connection first
    if not test_kibana_connection():
        logger.error("\nPlease check your Kibana URL and try again.")
        logger.error("Set KIBANA_URL environment variable if needed:")
        logger.error("  export KIBANA_URL=https://kibana.mifos.gazelle.localhost")
        sys.exit(1)

    # Import visualizations
    success = import_all_visualizations(script_dir)

    if success:
        logger.info("\n🎉 All visualizations imported successfully!")
        logger.info(f"📊 Access Kibana at: {KIBANA_URL}")
        sys.exit(0)
    else:
        logger.warning("\n⚠️  Some visualizations failed to import. Check the logs above.")
        sys.exit(1)
