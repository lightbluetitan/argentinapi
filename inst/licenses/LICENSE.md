# License for `ArgentinAPI`

This package, `ArgentinAPI`, is licensed under the **GNU General Public License Version 3 (GPL-3)**.

You are free to:

- Use, modify, and distribute the package, as long as any modifications or derived works also comply with the GPL-3.
- Distribute copies of this package with attribution, keeping this license intact.

## License Text

The full text of the GNU General Public License Version 3 (GPL-3) can be found [here](https://www.gnu.org/licenses/gpl-3.0.txt).

## Note on ArgentinaDatos and REST Countries

The `ArgentinAPI` package depends on two public RESTful APIs for accessing Argentine and global data:

1. **ArgentinaDatos API**  
   A community-driven open API that provides access to economic indicators, political data, holidays, inflation, and other public information specific to Argentina.  
   The API is publicly accessible, does not require authentication, and is intended for educational and analytical purposes.  
   Official site: [https://argentinadatos.com/](https://argentinadatos.com/)

2. **REST Countries API**  
   An open-source project that offers information about countries worldwide, including demographics, geography, and regional groupings.  
   This API is also publicly accessible and does not require authentication.  
   Website: [https://restcountries.com/](https://restcountries.com/)
   
3. **World Bank Open Data API**

The **World Bank Open Data API** is a RESTful web service that provides access to a vast collection of international development indicators. It allows for real-time retrieval of economic, social, and environmental data, including metrics such as GDP, population, education, and poverty levels.

This API is publicly accessible, requires **no authentication**, and returns results in either **JSON** or **XML** format. It supports filtering by country, indicator code, and year. It is widely used in data science, research, and educational contexts.

In the `MexicoDataAPI` package, the API is used to **dynamically retrieve and display real-time indicators for Mexico**. 
Data is accessed live via HTTP requests to the API and shown directly in the R console. **No data is stored or redistributed** by this package.

- **API documentation**: [https://datahelpdesk.worldbank.org/knowledgebase/articles/889392](https://datahelpdesk.worldbank.org/knowledgebase/articles/889392)
- **License**: [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)   

As per the maintainers of both APIs, **no attribution is required** for using or distributing the data.  
However, we recommend reviewing the official documentation and usage terms on their respective websites to ensure proper understanding and responsible use.
 

## Note

The `ArgentinAPI` package, including all its data files (.rda) and code files, is licensed under the GNU General Public License, version 3 or later (GPL-3).

## Copyright Notice

© 2025 Renzo Caceres Rossi. All rights reserved under the GPL-3.
