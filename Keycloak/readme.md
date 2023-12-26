# Initial Setup/ User creation
* Step 1: Open the keycloak administration console in browser and click `Administration Console` as shown in below snippet.<br>
<img width="500" alt="Screenshot 2023-11-23 at 2 26 39 PM" src="https://github.com/fynarfin/ph-ee-env-template/assets/31315800/6d24b6a0-f98a-4298-87c3-0db6b2e1789a"><br><br>

* Step 2: Enter the admin username/email and password. Then click on `Sign In` button,  as shown in below snippet.<br>
<img width="500" alt="Screenshot 2023-11-23 at 2 26 50 PM" src="https://github.com/fynarfin/ph-ee-env-template/assets/31315800/064d6bb9-b5f4-456a-b5a3-57f4b30a6575"><br><br>

* Step 3: On successful login below screen will open, with list of all the realms. Click on the realm which you wnat to use.<br>
<img width="500" alt="Screenshot 2023-11-23 at 2 32 16 PM" src="https://github.com/fynarfin/ph-ee-env-template/assets/31315800/833171cf-b769-4c22-acc4-c0a6979b55d7"><br><br>

* Step 4: Click on `Add user` by navigating to the `Users` section from left menu. As shown in below snippet.<br>
<img width="500" alt="Screenshot 2023-12-12 at 8 56 00 PM" src="https://github.com/openMF/ph-ee-env-template/assets/31315800/de356bf3-e856-42ad-b1d9-f54864e98e4f"><br><br>

* Step 5: Enter the username and relevant information as per the need adn click on the `Save` button, as shown in the below snippet.<br>
<img width="500" alt="Screenshot 2023-12-12 at 9 00 51 PM" src="https://github.com/openMF/ph-ee-env-template/assets/31315800/ea7be48a-f726-45ee-8ebd-61103552b481"><br><br>

* Step 6: Once user is created navigate to `Credential/Role Mapping` tabs for updating relevant information, as shown in below screenshot.<br>
<img width="500" alt="Screenshot 2023-12-12 at 9 04 38 PM" src="https://github.com/openMF/ph-ee-env-template/assets/31315800/148288f9-eb3a-4633-820c-28268157efa3"><br><br>

# How to export realm configuration
* Step 1: Open the keycloak administration console in browser and click `Administration Console` as shown in below snippet.<br>
<img width="500" alt="Screenshot 2023-11-23 at 2 26 39 PM" src="https://github.com/fynarfin/ph-ee-env-template/assets/31315800/6d24b6a0-f98a-4298-87c3-0db6b2e1789a"><br><br>

* Step 2: Enter the admin username/email and password. Then click on `Sign In` button,  as shown in below snippet.<br>
<img width="500" alt="Screenshot 2023-11-23 at 2 26 50 PM" src="https://github.com/fynarfin/ph-ee-env-template/assets/31315800/064d6bb9-b5f4-456a-b5a3-57f4b30a6575"><br><br>

* Step 3: On successful login below screen will open, with list of all the realms. Click on the realm you want to export.<br>
<img width="500" alt="Screenshot 2023-11-23 at 2 32 16 PM" src="https://github.com/fynarfin/ph-ee-env-template/assets/31315800/833171cf-b769-4c22-acc4-c0a6979b55d7"><br><br>

* Step 4: In the left menu panel, select `Export` under the manage section. Refer below snippet.<br>
<img width="500" alt="Screenshot 2023-11-23 at 2 33 45 PM" src="https://github.com/fynarfin/ph-ee-env-template/assets/31315800/342dce17-e364-41fd-be99-e80e808e4058"><br><br>

* Step 5: In the `Partial Export` section enable both the toggle i.e. `Export groups and roles` and `Export clients`, then click on the `Export` button, as shown in the below snippet.<br>
<img width="500" alt="Screenshot 2023-11-23 at 2 38 08 PM" src="https://github.com/fynarfin/ph-ee-env-template/assets/31315800/1a315cdb-a690-475a-9749-066336ad78a5"><br><br>

* Step 6: Once clicked on the `Export` in previous step a popup window will open as shown in below snippet, read the instruction and click on the `Export` button.<br>
<img width="500" alt="Screenshot 2023-11-23 at 2 41 50 PM" src="https://github.com/fynarfin/ph-ee-env-template/assets/31315800/7124de04-36fe-438b-96ca-83dd66bf23e8"><br><br>


# How to import realm configuration

* Step 1: Open the keycloak administration console in browser and click `Administration Console` as shown in below snippet.<br>
<img width="500" alt="Screenshot 2023-11-23 at 2 26 39 PM" src="https://github.com/fynarfin/ph-ee-env-template/assets/31315800/6d24b6a0-f98a-4298-87c3-0db6b2e1789a"><br><br>

* Step 2: Enter the admin username/email and password. Then click on `Sign In` button,  as shown in below snippet.<br>
<img width="500" alt="Screenshot 2023-11-23 at 2 26 50 PM" src="https://github.com/fynarfin/ph-ee-env-template/assets/31315800/064d6bb9-b5f4-456a-b5a3-57f4b30a6575"><br><br>

* Step 3: On successful login below screen will open, with list of all the realms. Click on the `master` realm.<br>
<img width="500" alt="Screenshot 2023-11-23 at 2 32 16 PM" src="https://github.com/fynarfin/ph-ee-env-template/assets/31315800/833171cf-b769-4c22-acc4-c0a6979b55d7"><br><br>

* Step 4: In the left menu panel, select `Import` under the manage section. Refer below snippet.<br>
<img width="500" alt="Screenshot 2023-11-23 at 2 53 49 PM" src="https://github.com/danishjamal104/ph-ee-env-template/assets/31315800/62d3d4cf-fac0-4ec0-9e30-f5ec4cffbd6d"><br><br>

* Step 5: In the `Partial Export` section click on the `Select file` button, as shown in below snipper. A system file selector window will open, select the configuration by navigating into the system files.<br>
<img width="500" alt="Screenshot 2023-11-23 at 2 55 55 PM" src="https://github.com/danishjamal104/ph-ee-env-template/assets/31315800/49a396aa-73a2-4df9-9e55-67733fd9e470"><br><br>

* Step 6: Once valid configuration file in submited, a below screen will open. 
    * Use `View details` button to see the raw configuration file.
    * Use the toggle buttons to import selectively or enable all the toggle button to import everything.
    * In the `If a resource exists` dropdown, click on the dropdown and select `Skip`, this will make sure the resources which are already present are skipped while importing the realm. or you can choose from `Fail`, `Skip` and `Overwrite` based on your requirements <br>
<img width="500" alt="Screenshot 2023-11-23 at 3 00 25 PM" src="https://github.com/danishjamal104/ph-ee-env-template/assets/31315800/d225fd85-6a04-4dbb-a258-acc9a8034ddb"><br><br>

# How to see/generate client secret
* Step 1: Open the keycloak administration console in browser and click `Administration Console` as shown in below snippet.<br>
<img width="500" alt="Screenshot 2023-11-23 at 2 26 39 PM" src="https://github.com/fynarfin/ph-ee-env-template/assets/31315800/6d24b6a0-f98a-4298-87c3-0db6b2e1789a"><br><br>

* Step 2: Enter the admin username/email and password. Then click on `Sign In` button,  as shown in below snippet.<br>
<img width="500" alt="Screenshot 2023-11-23 at 2 26 50 PM" src="https://github.com/fynarfin/ph-ee-env-template/assets/31315800/064d6bb9-b5f4-456a-b5a3-57f4b30a6575"><br><br>

* Step 3: On successful login below screen will open, with list of all the realms. Click on the realm which you wnat to use.<br>
<img width="500" alt="Screenshot 2023-11-23 at 2 32 16 PM" src="https://github.com/fynarfin/ph-ee-env-template/assets/31315800/833171cf-b769-4c22-acc4-c0a6979b55d7"><br><br>

* Step 4: Navigate to clients section by clicking on the `Clients`, in the the left menu panel under the configure section. Then click on the client you want to see/generate the secret for. Refer the below snippet.<br>
<img width="500" alt="Screenshot 2023-11-23 at 3 19 22 PM" src="https://github.com/danishjamal104/ph-ee-env-template/assets/31315800/60acf312-4b4e-431e-a745-5ad4d04ff386"><br><br>

* Step 5: A new screen will open with the multiple information about the client you selected. In the top bar click on the `Credentials` tab, as shown in the below snippet.<br>
<img width="500" alt="Screenshot 2023-11-23 at 3 23 06 PM" src="https://github.com/danishjamal104/ph-ee-env-template/assets/31315800/70982373-f310-4178-ad76-3f65b0eb5b0f"><br><br>

* Step 6: In the credentials tab you can see the mulitple information regarding the client secret and its type.
    * Use the `Client Authenticator` drop down to select the type of secret you want to generate(for exsiting secret the drop down will be autopopulated with the secret type).
    * Use the `Regenerate Secret` button to generate the secret.
    * A text box present just beside the `Regenerate Secret` will contain the latest generated secret.<br>
   <img width="500" alt="Screenshot 2023-11-23 at 3 26 46 PM" src="https://github.com/danishjamal104/ph-ee-env-template/assets/31315800/602a472d-fb09-463b-8201-723e5a89c15a">
<br><br>

Add a role with name admin
select realm-management in the Roles select box and add user-management role to this role.
create an admin user with username as 'admin' and password as 'admin' in the realm paymenthub.
