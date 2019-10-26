#=
Tests for the saddle-points exercise

Implementation note:
The saddle_points function must validate the input matrix and raise a
ValueError with a meaningful error message if the matrix turns out to be
irregular.
=#
using Test

include("saddle_points_2D.jl")


# Tests adapted from `problem-specifications//canonical-data.json` @ v1.5.0

println("\n"^2, "-"^60, "\n"^3)

@testset "Identify single saddle point." begin
    matrix = [[9  8  7]; [5  3  2]; [6  6  7]]
    @test saddle_points(matrix) == [("row" => 2, "column" => 1)]
end
println()

@testset "Identify lack of saddle points when there are none." begin
    matrix = [[1  2  3]; [3  1  2]; [2  3  1]]
    @test saddle_points(matrix) == Tuple[]
end
println()

@testset "Identify multiple saddle points in column." begin
    matrix = [[4  5  4]; [3  5  5]; [1  5  4]]
    expected = [("row" => 1, "column" => 2), ("row" => 2, "column" => 2),
                ("row" => 3, "column" => 2)]
    @test saddle_points(matrix) == expected
end
println()

@testset "Identify multiple saddle points in row." begin
    matrix = [[6  7  8]; [5  5  5]; [7  5  6]]
    expected = [("row" => 2, "column" => 1), ("row" => 2, "column" => 2),
                ("row" => 2, "column" => 3)]
    @test saddle_points(matrix) == expected
end
println()

@testset "Identify saddle point in bottom right corner." begin
    matrix = [[8  7  9]; [6  7  6]; [3  2  5]]
    expected = [("row" => 3, "column" => 3)]
    @test saddle_points(matrix) == expected
end
println()

@testset "Non-square matrix with two saddle points." begin
    matrix = [[3  1  3]; [3  2  4]]
    @test saddle_points(matrix) == [("row" => 1, "column" => 1),
                                    ("row" => 1, "column" => 3)]
end
println()
