
    #Reactants in order of appearance in reactions starting with v1
    list_of_reactants=[

    "1. ATP"
    "2. L-Citrulline"
    "3. L-Aspartate"
    "4. AMP"
    "5. Diphosphate"
    "6. N-(L-Arginino)succinate"
    #N-(L-Arginino)succinate
    "7. Fumarate"
    "8. L-Arginine"
    #L-Arginine
    "9. H2O"
    "10. L-Ornithine"
    "11. Urea"
    #L-Arginine
    "12. Oxygen"
    "13. NADPH"
    "14. H+"
    "15. Nitric oxide"
    #L-Citrulline
    "16. NADP+"
    #H2O
    "17. Carbamoyl phosphate"
    #L-Ornithine
    "18. Orthophosphate"
    #L-Citrulline
    ];

    #Stoichiometric Matrix
    stoichiometric_matrix=Array{Float64}([

       -1  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0;
       -1  0  0  1  2  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0;
       -1  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0;
        1  0  0  0  0  0  0  0  0  0 -1  0  0  0  0  0  0  0  0  0;
        1  0  0  0  0  0  0  0  0  0  0 -1  0  0  0  0  0  0  0  0;
        1 -1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0;
        0  1  0  0  0  0  0 -1  0  0  0  0  0  0  0  0  0  0  0  0;
        0  1 -1  0 -2  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0;
        0  0 -1  0  4  0  0  0  0  0  0  0  1  0  0 -1  0  0  0  0;
        0  0  1 -1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0;
        0  0  1  0  0  0  0  0 -1  0  0  0  0  0  0  0  0  0  0  0;
        0  0  0  0 -4  0  0  0  0  0  0  0  0  0  0  0  0  0  1  0;
        0  0  0  0 -3  0  0  0  0  0  0  0  0  0  0  0  0  1  0  0;
        0  0  0  0 -3  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0;
        0  0  0  0  2  0  0  0  0  0  0  0  0 -1  0  0  0  0  0  0;
        0  0  0  0  3  0  0  0  0  0  0  0  0  0 -1  0  0  0  0  0;
        0  0  0 -1  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0;
        0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0 -1;
    ]);

    # Setup default flux bounds array -
    default_bounds_array = Array{Float64}([

    	0	100	;	# v1      ATP + L-Citrulline + L-Aspartate  => AMP + Diphosphate + N-(L-Arginino)succinate
    	0	100	;	# v2      N-(L-Arginino)succinate  => Fumarate + L-Arginine
    	0	100	;	# v3      L-Arginine + H2O  => L-Ornithine + Urea
    	0	100	;	# v4      Carbamoyl phosphate + L-Ornithine  => Orthophosphate + L-Citrulline
        0	100	;	# v5      2 L-Arginine + 4 Oxygen + 3 NADPH + 3 H+ <=> 2 Nitric oxide + 2 L-Citrulline + 3 NADP+ + 4 H2O
        0	100	;	# b1      Carbamoyl phosphate (External)  => Carbamoyl phosphate
        0	100	;	# b2      L-Aspartate (External)  => L-Aspartate
        0	100	;	# b3      Fumarate  => Fumarate (External)
        0	100	;	# b4      Urea  => Urea (External)
        0	100	;	# b5      ATP (External)  => ATP
        0	100	;	# b6      AMP  => AMP (External)
        0	100	;	# b7      Diphosphate  => Diphosphate (External)
        0	100	;	# b8      H2O (External)  => H2O
        0	100	;	# b9      Nitric Oxide  => Nitric Oxide (External)
        0	100	;	# b10     NADP  => NADP (External)
        0	100	;	# b11     H2O  => H2O (External)
        0	100	;	# b12     H+ (External)  => Urea
        0	100	;	# b13     NADPH (External)  => Urea
        0	100	;	# b14     Oxygen (External)  => Urea
        0	100	;	# b15     Orthophosphate   => Orthophosphate (External)
    ]);

    species_bounds_array = Array{Float64}([

         0	  0	;	# 1 ATP
         0	  0	;	# 2 L-Citrulline
         0	  0	;   # 3 L-Aspartate
         0	  0	;	# 4 AMP
         0	  0	;	# 5 Diphosphate
         0	  0	;   # 6 N-(L-Arginino)succinate
         0	  0	;   # 7 Fumarate
         0	  0	;   # 8 L-Arginine
         0	  0	;	# 9 H2O
         0	  0	;   # 10 L-Ornithine
         0	  0	;   # 11 Urea
         0	  0	;   # 12 Oxygen
         0	  0	;   # 13 NADPH
         0	  0	;	# 14 H+
         0	  0	;   # 15 Nitric oxide
         0	  0	;   # 16 NADP+
         0	  0	;   # 17 Carbamoyl phosphate
         0	  0	;   # 18 Orthophosphate
    ]);

    # Setup the objective coefficient array. Urea production = 1.0
    objective_coefficient_array = Array{Float64}([

    	0	;	# v1      ATP + L-Citrulline + L-Aspartate  => AMP + Diphosphate + N-(L-Arginino)succinate
    	0	;	# v2      N-(L-Arginino)succinate  => Fumarate + L-Arginine
    	0	;	# v3      L-Arginine + H2O  => L-Ornithine + Urea
    	0	;	# v4      Carbamoyl phosphate + L-Ornithine  => Orthophosphate + L-Citrulline
        0	;	# v5      2 L-Arginine + 4 Oxygen + 3 NADPH + 3 H+ <=> 2 Nitric oxide + 2 L-Citrulline + 3 NADP+ + 4 H2O
        0	;	# b1      Carbamoyl phosphate (External)  => Carbamoyl phosphate
        0	;	# b2      L-Aspartate (External)  => L-Aspartate
        0	;	# b3      Fumarate  => Fumarate (External)
        0	;	# b4      Urea  => Urea (External)
        0	;	# b5      ATP (External)  => ATP
        0	;	# b6      AMP  => AMP (External)
        0	;	# b7      Diphosphate  => Diphosphate (External)
        0	;	# b8      H2O (External)  => H2O
        0	;	# b9      Nitric Oxide  => Nitric Oxide (External)
        0	;	# b10     NADP  => NADP (External)
        0	;	# b11     H2O  => H2O (External)
        0	;	# b12     H+ (External)  => Urea
        0	;	# b13     NADPH (External)  => Urea
        0	;	# b14     Oxygen (External)  => Urea
        0	;	# b15     Orthophosphate   => Orthophosphate (External)
    ]);

    #Data Dictionary

    data=Dict{AbstractString,Any}();
    data["stoichiometric_matrix"] = stoichiometric_matrix;
    data["objective_coefficient_array"] = objective_coefficient_array;
    data["default_flux_bounds_array"] = default_bounds_array;
    data["species_bounds_array"] = species_bounds_array;
    data["reactants"]=list_of_reactants;

    #return data
