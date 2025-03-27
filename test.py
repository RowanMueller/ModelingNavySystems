def read_sysml(file, encoding="utf-8"): # writes sysml file to pandas dataframe 
    """Parses a .sysml file-like object and returns a pandas DataFrame."""
    try:
        data = file.read().decode('utf-8') # Important: Read the file content
        # Extract all device data blocks using regular expressions
        device_blocks = re.findall(r"part instance (\w+) {\s*(.*?)\s*}", data, re.DOTALL)

        if not device_blocks:
            print("Error: No 'part instance' blocks found in the file.")
            return pd.DataFrame()

        dataframes = []  # Store DataFrames for each device
        for device_name, attributes_block in device_blocks:
            attributes = {}
            for line in attributes_block.strip().split(";\n"):
                line = line.strip()
                if not line or line.startswith("//"):  # Skip empty lines and comments
                    continue

                # Handle connections specially
                if "connections = [" in line:
                    match_connection = re.search(r"connections = \[(.*?)\]", line)
                    if match_connection:
                        attributes["connections"] = match_connection.group(1).strip()
                    continue

                # Regular attribute-value pairs
                parts = line.split("=", 1)
                if len(parts) == 2:
                    attribute = parts[0].strip()
                    value = parts[1].strip().replace('"', '')  # remove quotes
                    attributes[attribute] = value
                else:
                    print(f"Warning: Could not parse line: {line}")

            # Create a DataFrame for the current device
            df = pd.DataFrame([attributes])
            df['device_name'] = device_name  # Add device_name as column
            dataframes.append(df)

        # Concatenate all DataFrames into a single DataFrame
        if dataframes:
            final_df = pd.concat(dataframes, ignore_index=True)
            return final_df
        else:
            return pd.DataFrame()

    except Exception as e:
        print(f"An error occurred during parsing: {e}")
        raise e  # Re-raise the exception to be caught in the API view