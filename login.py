import json

def get_db_credentials(config_file="config.json"):
    """
    Load database credentials from a JSON configuration file.
    """
    try:
        with open(config_file, "r") as file:
            config = json.load(file)
            return (
                config["DB_USERNAME"],
                config["DB_PASSWORD"],
                config["DB_HOST"],
                config["DB_NAME"],
                config["DB_TYPE"]
            )
    except Exception as e:
        raise Exception(f"Error loading database config: {e}")
