include("calculate_optimal_flux_distribution.jl")
include("data_dictionary.jl")

#get stoichiometric matrix, flux bounds, species bounds, etc from data dictionary and store in local variables.
stoichiometric_matrix_local = data["stoichiometric_matrix"];
default_bounds_array_local = data["default_flux_bounds_array"];
species_bounds_array_local = data["species_bounds_array"];
objective_coefficient_array_local = data["objective_coefficient_array"];


#Change Objective function to Urea Production
objective_coefficient_array_local[9]=1.0;

#Change Flux Bounds.
    # Calculate V_max
    # V_max = k_cat * [E]        units of V_max = mmol/g-DW-h

    # To convert from μmol/g-DW-s to mmol/g-DW-h, conversion factor = 3.6
    V_max_1 = 203 * 0.01 * 3.6     # mmol/g-DW-h
    V_max_2 = 34.5 * 0.01 * 3.6    # mmol/g-DW-h
    V_max_3 = 249 * 0.01 * 3.6     # mmol/g-DW-h
    V_max_4 = 88.1 * 0.01 * 3.6    # mmol/g-DW-h
    V_max_5 = 13.7 * 0.01 * 3.6    # mmol/g-DW-h

    # Given upper limit rate of exchange fluxes
    b_i = 10 # mmol/g-DW-h

#set flux bounds for reactions v1 to v5
default_bounds_array_local[1,2] = V_max_1*0.92254*0.98977; # v1
default_bounds_array_local[2,2] = V_max_2; # v2
default_bounds_array_local[3,2] = V_max_3*0.14180; # v3
default_bounds_array_local[4,2] = V_max_4*0.73725; # v4
default_bounds_array_local[5,2] = V_max_5*0.98650; # v5
default_bounds_array_local[5,1] = -V_max_5*0.98650; # REVERSE v5

#set flux bounds for exchange reactions b1 to b15
default_bounds_array_local[6:end,2] .= b_i; # b6 to b15 upper bound
default_bounds_array_local[14:19,1] .= -b_i; # v5 is reversible so make exchange flux bounds reversible as well for b9 to b14

#Run calculate_optimal_flux_distribution function
(objective_value, calculated_flux_array, dual_value_array, uptake_array, exit_flag, status_flag) = calculate_optimal_flux_distribution(stoichiometric_matrix_local,default_bounds_array_local,species_bounds_array_local,objective_coefficient_array_local,min_flag= false)
