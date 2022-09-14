"""
    covdiff(xm, xd; include_diagonal=false)

Error of the covariance matrix.
"""
function covdiff(xm::AbstractArray, xd::AbstractArray; include_diagonal::Bool=false)
    @assert ndims(xm) == ndims(xd)
    @assert size(xm)[1:(end - 1)] == size(xd)[1:(end - 1)]
    Cm = cov(reshape(xm, :, size(xm)[end]); dims=2)
    Cd = cov(reshape(xd, :, size(xd)[end]); dims=2)
    if include_diagonal
        return norm(Cm - Cd) / length(Cm)
    else
        return norm(Cm - Diagonal(diag(Cm)) - Cd + Diagonal(diag(Cd))) / (length(Cm) - size(Cm, 1))
    end
end

function covdiff(xm::AbstractMatrix, xd::AbstractMatrix; include_diagonal::Bool=false)
    @assert size(xm, 1) == size(xd, 1)
    Cm = cov(xm; dims=2)
    Cd = cov(xd; dims=2)
    if include_diagonal
        return norm(Cm - Cd) / length(Cm)
    else
        return norm(Cm - Diagonal(diag(Cm)) - Cd + Diagonal(diag(Cd))) / (length(Cm) - size(Cm, 1))
    end
end

"""
    adversarial_accuracy(xm, xd)

Adversarial accuracy indicator.
As defined in https://arxiv.org/abs/2105.13889.
"""
function adversarial_accuracy(xm::AbstractMatrix, xd::AbstractMatrix)

end
