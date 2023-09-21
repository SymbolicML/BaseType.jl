var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = BaseType","category":"page"},{"location":"#BaseType","page":"Home","title":"BaseType","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for BaseType.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [BaseType]","category":"page"},{"location":"#BaseType.base_numeric_type-Union{Tuple{Type{T}}, Tuple{T}} where T","page":"Home","title":"BaseType.base_numeric_type","text":"base_numeric_type(::Type{T}) where {T}\nbase_numeric_type(x::T)\n\nExtract the base numeric type from a possible container type T.\n\nFor example,\n\nInput Type Output Type\nFloat32 Float32\nComplexF32 Float32\nArray{ComplexF32,1} ComplexF32\nSet{Float32} Float32\nMeasurement{Float32} Float32\nRational{Int8} Int8\nDict{Int64,Float64} Int64\nDual{BigFloat} BigFloat\nQuantity{Float32,Dimensions} Float32\n\n\n\n\n\n","category":"method"}]
}
