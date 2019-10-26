function saddle_points(matrix::Array{Int64,2})
    R = size(matrix, 1)
    C = size(matrix, 2)

    result = Tuple[]
    # Test row and column candidates
    for rₜ = 1 : R
        for cₜ = 1 : C
            greater_found = false
            c = 1
            while !greater_found  &&  c ≤ C

                if matrix[rₜ, c] > matrix[rₜ, cₜ]
                    greater_found = true
                end

                c += 1
            end


            if !greater_found
                lesser_found = false
                r = 1
                while !lesser_found  &&  r ≤ R

                    if matrix[r, cₜ] < matrix[rₜ, cₜ]
                        lesser_found = true
                    end

                    r += 1
                end



                if !greater_found  &&  !lesser_found
                    push!(result, ("row" => rₜ, "column" => cₜ))
                end

            end
        end
    end

    result
end
