# IT-Garage - Install PrusaSlicer
Deze code gaat Prusa installeren op een Chromebook waarop je dit lanceert. 
Je gaat natuurlijk wel eerst Linux moeten laten activeren op elke computer want anders zal het niet mogelijk zijn.
Hieronder vind je een stappenplan om alles correct te kunnen doen.


## Op de Chromebook waarop je Prusa wil installeren:
1. **Internet verbinding:**
  
   *Check of jouw computer met internet verbonden is.*
2. **Linux activeren:**
  
   *Ga naar Instellingen > Over ChromeOS > Linux-ontwikkelomgeving, activeer linux en wacht een beetje terwijl het bezig is.*
3. **Systeem updaten**:
  
    *Open Terminal in jouw applicaties.*

    *Als je geen "bash" code ziet zoals ```naamvanjouwcomputer@penguin:~$``` moet je op "penguin" klikken.*

    *Om zeker te zijn dat het systeem andere apps mag installeren schrijf deze code in de terminal en druk enter:*

    ```bash
   sudo apt update && sudo apt upgrade -y ```
4. (nog steeds in terminal)**Prusa installeren**: 

  ```bash
  curl -L https://raw.githubusercontent.com/TheBloodyDahlia/IT-Garage/main/install_prusa.sh | bash```
