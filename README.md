# CHEME7770-HW-3 Abhinav Adhikari

**Part a**
`data_dictionary.jl` file has the stoichiometric matrix

**Part b**
`Atom_balance.jl` has the atomic balance calculations and the elemental array.

**Part c**
`run.jl` file has the results tuple.


| Filename | Description |
| ------------- | ------------- |
| `run.jl`  | **Main Run file.** This includes calculations and commands to retrieve and update flux array, objective function, and run the function `calculate_optimal_flux_distribution`. Output of this file gives the required flux values. Note that it also retrieves the stoichiometric matrix, species bounds array from the `data_dictionary.jl` file and creates local variables for the parameters to be used with the function `calculate_optimal_flux_distribution`. |
| `data_dictionary.jl`  | Julia dictionary file that contains the list of metabolites, stoichiometric matrix, default flux bounds array for each reaction, species balance array, objective function array (set as 0 for all in this file).  |
| `calculate_optimal_flux_distribution.jl`  | Function provided by Dr. Varner  |
| `Atom_balance.jl`  | Code to check if elements are balanced.  |
| `Pathway_NEW.pdf` | Schematic of reaction system. Includes reactions and exchange fluxes.  |
| `Enzyme Km.pdf`  | Enzyme Km values based on Park et al. paper |
| `List_of_Reactions_and_Metabolites.txt`  | Contains ordered list of intracellular and exchange reactions, and the list of metabolites. |

