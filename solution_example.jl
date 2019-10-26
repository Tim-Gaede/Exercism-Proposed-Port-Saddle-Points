function saddle_points(matrix::Array{Array{Int64,1},1})
    R = length(matrix) # matrix is an array of arrays

    if R > 1
        r = 1
        while r < R
            if length(matrix[r]) != length(matrix[r + 1])
                throw(ArgumentError("Matrix rows are not equal in length."))
            else
             r += 1
            end
        end
    end

    C = length(matrix[1])

    result = Tuple[]
    # Test row and column candidates
    for rₜ = 1 : R
        for cₜ = 1 : C
            greater_found = false
            c = 1
            while !greater_found  &&  c ≤ C

                if matrix[rₜ][c] > matrix[rₜ][cₜ]
                    greater_found = true
                end

                c += 1
            end


            if !greater_found
                lesser_found = false
                r = 1
                while !lesser_found  &&  r ≤ R

                    if matrix[r][cₜ] < matrix[rₜ][cₜ]
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
